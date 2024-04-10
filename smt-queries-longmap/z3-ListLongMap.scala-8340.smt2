; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101526 () Bool)

(assert start!101526)

(declare-fun b_free!26313 () Bool)

(declare-fun b_next!26313 () Bool)

(assert (=> start!101526 (= b_free!26313 (not b_next!26313))))

(declare-fun tp!91976 () Bool)

(declare-fun b_and!43833 () Bool)

(assert (=> start!101526 (= tp!91976 b_and!43833)))

(declare-fun b!1220583 () Bool)

(declare-fun e!693099 () Bool)

(declare-fun e!693106 () Bool)

(assert (=> b!1220583 (= e!693099 e!693106)))

(declare-fun res!810800 () Bool)

(assert (=> b!1220583 (=> res!810800 e!693106)))

(declare-datatypes ((array!78813 0))(
  ( (array!78814 (arr!38036 (Array (_ BitVec 32) (_ BitVec 64))) (size!38572 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78813)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220583 (= res!810800 (not (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455))))))

(declare-datatypes ((V!46483 0))(
  ( (V!46484 (val!15565 Int)) )
))
(declare-datatypes ((tuple2!20040 0))(
  ( (tuple2!20041 (_1!10031 (_ BitVec 64)) (_2!10031 V!46483)) )
))
(declare-datatypes ((List!26840 0))(
  ( (Nil!26837) (Cons!26836 (h!28045 tuple2!20040) (t!40133 List!26840)) )
))
(declare-datatypes ((ListLongMap!18009 0))(
  ( (ListLongMap!18010 (toList!9020 List!26840)) )
))
(declare-fun lt!555090 () ListLongMap!18009)

(declare-fun lt!555095 () ListLongMap!18009)

(assert (=> b!1220583 (= lt!555090 lt!555095)))

(declare-fun lt!555089 () ListLongMap!18009)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1929 (ListLongMap!18009 (_ BitVec 64)) ListLongMap!18009)

(assert (=> b!1220583 (= lt!555095 (-!1929 lt!555089 k0!934))))

(declare-fun zeroValue!944 () V!46483)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14799 0))(
  ( (ValueCellFull!14799 (v!18223 V!46483)) (EmptyCell!14799) )
))
(declare-datatypes ((array!78815 0))(
  ( (array!78816 (arr!38037 (Array (_ BitVec 32) ValueCell!14799)) (size!38573 (_ BitVec 32))) )
))
(declare-fun lt!555098 () array!78815)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555096 () array!78813)

(declare-fun minValue!944 () V!46483)

(declare-fun getCurrentListMapNoExtraKeys!5443 (array!78813 array!78815 (_ BitVec 32) (_ BitVec 32) V!46483 V!46483 (_ BitVec 32) Int) ListLongMap!18009)

(assert (=> b!1220583 (= lt!555090 (getCurrentListMapNoExtraKeys!5443 lt!555096 lt!555098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78815)

(assert (=> b!1220583 (= lt!555089 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40442 0))(
  ( (Unit!40443) )
))
(declare-fun lt!555088 () Unit!40442)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1136 (array!78813 array!78815 (_ BitVec 32) (_ BitVec 32) V!46483 V!46483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40442)

(assert (=> b!1220583 (= lt!555088 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220584 () Bool)

(declare-fun res!810799 () Bool)

(declare-fun e!693102 () Bool)

(assert (=> b!1220584 (=> (not res!810799) (not e!693102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220584 (= res!810799 (validMask!0 mask!1564))))

(declare-fun b!1220585 () Bool)

(declare-fun res!810803 () Bool)

(assert (=> b!1220585 (=> (not res!810803) (not e!693102))))

(assert (=> b!1220585 (= res!810803 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38572 _keys!1208))))))

(declare-fun b!1220586 () Bool)

(declare-fun e!693098 () Bool)

(assert (=> b!1220586 (= e!693102 e!693098)))

(declare-fun res!810810 () Bool)

(assert (=> b!1220586 (=> (not res!810810) (not e!693098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78813 (_ BitVec 32)) Bool)

(assert (=> b!1220586 (= res!810810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555096 mask!1564))))

(assert (=> b!1220586 (= lt!555096 (array!78814 (store (arr!38036 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38572 _keys!1208)))))

(declare-fun b!1220587 () Bool)

(declare-fun res!810795 () Bool)

(assert (=> b!1220587 (=> (not res!810795) (not e!693102))))

(assert (=> b!1220587 (= res!810795 (= (select (arr!38036 _keys!1208) i!673) k0!934))))

(declare-fun b!1220588 () Bool)

(declare-fun e!693097 () Bool)

(declare-fun arrayContainsKey!0 (array!78813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220588 (= e!693097 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220589 () Bool)

(declare-fun res!810809 () Bool)

(assert (=> b!1220589 (=> (not res!810809) (not e!693102))))

(assert (=> b!1220589 (= res!810809 (validKeyInArray!0 k0!934))))

(declare-fun b!1220590 () Bool)

(declare-fun e!693100 () Bool)

(assert (=> b!1220590 (= e!693106 e!693100)))

(declare-fun res!810798 () Bool)

(assert (=> b!1220590 (=> res!810798 e!693100)))

(assert (=> b!1220590 (= res!810798 (not (= (select (arr!38036 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693103 () Bool)

(assert (=> b!1220590 e!693103))

(declare-fun res!810808 () Bool)

(assert (=> b!1220590 (=> (not res!810808) (not e!693103))))

(declare-fun lt!555091 () V!46483)

(declare-fun lt!555092 () ListLongMap!18009)

(declare-fun +!4086 (ListLongMap!18009 tuple2!20040) ListLongMap!18009)

(declare-fun get!19407 (ValueCell!14799 V!46483) V!46483)

(assert (=> b!1220590 (= res!810808 (= lt!555092 (+!4086 lt!555095 (tuple2!20041 (select (arr!38036 _keys!1208) from!1455) (get!19407 (select (arr!38037 _values!996) from!1455) lt!555091)))))))

(declare-fun b!1220591 () Bool)

(declare-fun e!693105 () Bool)

(assert (=> b!1220591 (= e!693105 e!693099)))

(declare-fun res!810797 () Bool)

(assert (=> b!1220591 (=> res!810797 e!693099)))

(assert (=> b!1220591 (= res!810797 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1220591 (= lt!555092 (getCurrentListMapNoExtraKeys!5443 lt!555096 lt!555098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220591 (= lt!555098 (array!78816 (store (arr!38037 _values!996) i!673 (ValueCellFull!14799 lt!555091)) (size!38573 _values!996)))))

(declare-fun dynLambda!3324 (Int (_ BitVec 64)) V!46483)

(assert (=> b!1220591 (= lt!555091 (dynLambda!3324 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555097 () ListLongMap!18009)

(assert (=> b!1220591 (= lt!555097 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48415 () Bool)

(declare-fun mapRes!48415 () Bool)

(declare-fun tp!91975 () Bool)

(declare-fun e!693101 () Bool)

(assert (=> mapNonEmpty!48415 (= mapRes!48415 (and tp!91975 e!693101))))

(declare-fun mapRest!48415 () (Array (_ BitVec 32) ValueCell!14799))

(declare-fun mapValue!48415 () ValueCell!14799)

(declare-fun mapKey!48415 () (_ BitVec 32))

(assert (=> mapNonEmpty!48415 (= (arr!38037 _values!996) (store mapRest!48415 mapKey!48415 mapValue!48415))))

(declare-fun b!1220592 () Bool)

(declare-fun tp_is_empty!31017 () Bool)

(assert (=> b!1220592 (= e!693101 tp_is_empty!31017)))

(declare-fun b!1220593 () Bool)

(declare-fun res!810807 () Bool)

(assert (=> b!1220593 (=> (not res!810807) (not e!693098))))

(declare-datatypes ((List!26841 0))(
  ( (Nil!26838) (Cons!26837 (h!28046 (_ BitVec 64)) (t!40134 List!26841)) )
))
(declare-fun arrayNoDuplicates!0 (array!78813 (_ BitVec 32) List!26841) Bool)

(assert (=> b!1220593 (= res!810807 (arrayNoDuplicates!0 lt!555096 #b00000000000000000000000000000000 Nil!26838))))

(declare-fun b!1220594 () Bool)

(declare-fun res!810805 () Bool)

(assert (=> b!1220594 (=> (not res!810805) (not e!693102))))

(assert (=> b!1220594 (= res!810805 (and (= (size!38573 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38572 _keys!1208) (size!38573 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220595 () Bool)

(declare-fun res!810801 () Bool)

(assert (=> b!1220595 (=> (not res!810801) (not e!693102))))

(assert (=> b!1220595 (= res!810801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220596 () Bool)

(declare-fun e!693095 () Bool)

(assert (=> b!1220596 (= e!693095 tp_is_empty!31017)))

(declare-fun b!1220597 () Bool)

(declare-fun e!693104 () Bool)

(assert (=> b!1220597 (= e!693104 (and e!693095 mapRes!48415))))

(declare-fun condMapEmpty!48415 () Bool)

(declare-fun mapDefault!48415 () ValueCell!14799)

(assert (=> b!1220597 (= condMapEmpty!48415 (= (arr!38037 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14799)) mapDefault!48415)))))

(declare-fun b!1220598 () Bool)

(declare-fun res!810796 () Bool)

(assert (=> b!1220598 (=> (not res!810796) (not e!693102))))

(assert (=> b!1220598 (= res!810796 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26838))))

(declare-fun b!1220599 () Bool)

(assert (=> b!1220599 (= e!693098 (not e!693105))))

(declare-fun res!810804 () Bool)

(assert (=> b!1220599 (=> res!810804 e!693105)))

(assert (=> b!1220599 (= res!810804 (bvsgt from!1455 i!673))))

(assert (=> b!1220599 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555093 () Unit!40442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78813 (_ BitVec 64) (_ BitVec 32)) Unit!40442)

(assert (=> b!1220599 (= lt!555093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220600 () Bool)

(assert (=> b!1220600 (= e!693100 true)))

(assert (=> b!1220600 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26838)))

(declare-fun lt!555094 () Unit!40442)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78813 (_ BitVec 32) (_ BitVec 32)) Unit!40442)

(assert (=> b!1220600 (= lt!555094 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220600 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555099 () Unit!40442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78813 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40442)

(assert (=> b!1220600 (= lt!555099 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220601 () Bool)

(assert (=> b!1220601 (= e!693103 e!693097)))

(declare-fun res!810806 () Bool)

(assert (=> b!1220601 (=> res!810806 e!693097)))

(assert (=> b!1220601 (= res!810806 (not (= (select (arr!38036 _keys!1208) from!1455) k0!934)))))

(declare-fun res!810802 () Bool)

(assert (=> start!101526 (=> (not res!810802) (not e!693102))))

(assert (=> start!101526 (= res!810802 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38572 _keys!1208))))))

(assert (=> start!101526 e!693102))

(assert (=> start!101526 tp_is_empty!31017))

(declare-fun array_inv!28944 (array!78813) Bool)

(assert (=> start!101526 (array_inv!28944 _keys!1208)))

(assert (=> start!101526 true))

(assert (=> start!101526 tp!91976))

(declare-fun array_inv!28945 (array!78815) Bool)

(assert (=> start!101526 (and (array_inv!28945 _values!996) e!693104)))

(declare-fun mapIsEmpty!48415 () Bool)

(assert (=> mapIsEmpty!48415 mapRes!48415))

(assert (= (and start!101526 res!810802) b!1220584))

(assert (= (and b!1220584 res!810799) b!1220594))

(assert (= (and b!1220594 res!810805) b!1220595))

(assert (= (and b!1220595 res!810801) b!1220598))

(assert (= (and b!1220598 res!810796) b!1220585))

(assert (= (and b!1220585 res!810803) b!1220589))

(assert (= (and b!1220589 res!810809) b!1220587))

(assert (= (and b!1220587 res!810795) b!1220586))

(assert (= (and b!1220586 res!810810) b!1220593))

(assert (= (and b!1220593 res!810807) b!1220599))

(assert (= (and b!1220599 (not res!810804)) b!1220591))

(assert (= (and b!1220591 (not res!810797)) b!1220583))

(assert (= (and b!1220583 (not res!810800)) b!1220590))

(assert (= (and b!1220590 res!810808) b!1220601))

(assert (= (and b!1220601 (not res!810806)) b!1220588))

(assert (= (and b!1220590 (not res!810798)) b!1220600))

(assert (= (and b!1220597 condMapEmpty!48415) mapIsEmpty!48415))

(assert (= (and b!1220597 (not condMapEmpty!48415)) mapNonEmpty!48415))

(get-info :version)

(assert (= (and mapNonEmpty!48415 ((_ is ValueCellFull!14799) mapValue!48415)) b!1220592))

(assert (= (and b!1220597 ((_ is ValueCellFull!14799) mapDefault!48415)) b!1220596))

(assert (= start!101526 b!1220597))

(declare-fun b_lambda!22179 () Bool)

(assert (=> (not b_lambda!22179) (not b!1220591)))

(declare-fun t!40132 () Bool)

(declare-fun tb!11113 () Bool)

(assert (=> (and start!101526 (= defaultEntry!1004 defaultEntry!1004) t!40132) tb!11113))

(declare-fun result!22833 () Bool)

(assert (=> tb!11113 (= result!22833 tp_is_empty!31017)))

(assert (=> b!1220591 t!40132))

(declare-fun b_and!43835 () Bool)

(assert (= b_and!43833 (and (=> t!40132 result!22833) b_and!43835)))

(declare-fun m!1125407 () Bool)

(assert (=> b!1220593 m!1125407))

(declare-fun m!1125409 () Bool)

(assert (=> b!1220601 m!1125409))

(declare-fun m!1125411 () Bool)

(assert (=> b!1220584 m!1125411))

(declare-fun m!1125413 () Bool)

(assert (=> mapNonEmpty!48415 m!1125413))

(declare-fun m!1125415 () Bool)

(assert (=> b!1220589 m!1125415))

(declare-fun m!1125417 () Bool)

(assert (=> start!101526 m!1125417))

(declare-fun m!1125419 () Bool)

(assert (=> start!101526 m!1125419))

(declare-fun m!1125421 () Bool)

(assert (=> b!1220595 m!1125421))

(declare-fun m!1125423 () Bool)

(assert (=> b!1220598 m!1125423))

(declare-fun m!1125425 () Bool)

(assert (=> b!1220587 m!1125425))

(declare-fun m!1125427 () Bool)

(assert (=> b!1220599 m!1125427))

(declare-fun m!1125429 () Bool)

(assert (=> b!1220599 m!1125429))

(declare-fun m!1125431 () Bool)

(assert (=> b!1220591 m!1125431))

(declare-fun m!1125433 () Bool)

(assert (=> b!1220591 m!1125433))

(declare-fun m!1125435 () Bool)

(assert (=> b!1220591 m!1125435))

(declare-fun m!1125437 () Bool)

(assert (=> b!1220591 m!1125437))

(declare-fun m!1125439 () Bool)

(assert (=> b!1220586 m!1125439))

(declare-fun m!1125441 () Bool)

(assert (=> b!1220586 m!1125441))

(assert (=> b!1220590 m!1125409))

(declare-fun m!1125443 () Bool)

(assert (=> b!1220590 m!1125443))

(assert (=> b!1220590 m!1125443))

(declare-fun m!1125445 () Bool)

(assert (=> b!1220590 m!1125445))

(declare-fun m!1125447 () Bool)

(assert (=> b!1220590 m!1125447))

(declare-fun m!1125449 () Bool)

(assert (=> b!1220583 m!1125449))

(declare-fun m!1125451 () Bool)

(assert (=> b!1220583 m!1125451))

(declare-fun m!1125453 () Bool)

(assert (=> b!1220583 m!1125453))

(declare-fun m!1125455 () Bool)

(assert (=> b!1220583 m!1125455))

(assert (=> b!1220583 m!1125409))

(declare-fun m!1125457 () Bool)

(assert (=> b!1220583 m!1125457))

(assert (=> b!1220583 m!1125409))

(declare-fun m!1125459 () Bool)

(assert (=> b!1220588 m!1125459))

(declare-fun m!1125461 () Bool)

(assert (=> b!1220600 m!1125461))

(declare-fun m!1125463 () Bool)

(assert (=> b!1220600 m!1125463))

(declare-fun m!1125465 () Bool)

(assert (=> b!1220600 m!1125465))

(declare-fun m!1125467 () Bool)

(assert (=> b!1220600 m!1125467))

(check-sat (not mapNonEmpty!48415) tp_is_empty!31017 (not b!1220586) (not b!1220590) (not b!1220583) (not b!1220598) (not b!1220599) (not b!1220589) (not b!1220591) (not b!1220593) (not b!1220588) (not start!101526) (not b_lambda!22179) (not b!1220584) (not b_next!26313) b_and!43835 (not b!1220600) (not b!1220595))
(check-sat b_and!43835 (not b_next!26313))
