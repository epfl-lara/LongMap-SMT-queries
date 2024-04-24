; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101718 () Bool)

(assert start!101718)

(declare-fun b_free!26299 () Bool)

(declare-fun b_next!26299 () Bool)

(assert (=> start!101718 (= b_free!26299 (not b_next!26299))))

(declare-fun tp!91930 () Bool)

(declare-fun b_and!43789 () Bool)

(assert (=> start!101718 (= tp!91930 b_and!43789)))

(declare-fun res!810908 () Bool)

(declare-fun e!693578 () Bool)

(assert (=> start!101718 (=> (not res!810908) (not e!693578))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78823 0))(
  ( (array!78824 (arr!38036 (Array (_ BitVec 32) (_ BitVec 64))) (size!38573 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78823)

(assert (=> start!101718 (= res!810908 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38573 _keys!1208))))))

(assert (=> start!101718 e!693578))

(declare-fun tp_is_empty!31003 () Bool)

(assert (=> start!101718 tp_is_empty!31003))

(declare-fun array_inv!29020 (array!78823) Bool)

(assert (=> start!101718 (array_inv!29020 _keys!1208)))

(assert (=> start!101718 true))

(assert (=> start!101718 tp!91930))

(declare-datatypes ((V!46465 0))(
  ( (V!46466 (val!15558 Int)) )
))
(declare-datatypes ((ValueCell!14792 0))(
  ( (ValueCellFull!14792 (v!18211 V!46465)) (EmptyCell!14792) )
))
(declare-datatypes ((array!78825 0))(
  ( (array!78826 (arr!38037 (Array (_ BitVec 32) ValueCell!14792)) (size!38574 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78825)

(declare-fun e!693577 () Bool)

(declare-fun array_inv!29021 (array!78825) Bool)

(assert (=> start!101718 (and (array_inv!29021 _values!996) e!693577)))

(declare-fun b!1221305 () Bool)

(declare-fun res!810914 () Bool)

(assert (=> b!1221305 (=> (not res!810914) (not e!693578))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1221305 (= res!810914 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38573 _keys!1208))))))

(declare-fun b!1221306 () Bool)

(declare-fun e!693582 () Bool)

(declare-fun e!693574 () Bool)

(assert (=> b!1221306 (= e!693582 e!693574)))

(declare-fun res!810909 () Bool)

(assert (=> b!1221306 (=> res!810909 e!693574)))

(assert (=> b!1221306 (= res!810909 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46465)

(declare-fun lt!555237 () array!78825)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46465)

(declare-fun lt!555241 () array!78823)

(declare-datatypes ((tuple2!20038 0))(
  ( (tuple2!20039 (_1!10030 (_ BitVec 64)) (_2!10030 V!46465)) )
))
(declare-datatypes ((List!26848 0))(
  ( (Nil!26845) (Cons!26844 (h!28062 tuple2!20038) (t!40119 List!26848)) )
))
(declare-datatypes ((ListLongMap!18015 0))(
  ( (ListLongMap!18016 (toList!9023 List!26848)) )
))
(declare-fun lt!555239 () ListLongMap!18015)

(declare-fun getCurrentListMapNoExtraKeys!5478 (array!78823 array!78825 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) Int) ListLongMap!18015)

(assert (=> b!1221306 (= lt!555239 (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555245 () V!46465)

(assert (=> b!1221306 (= lt!555237 (array!78826 (store (arr!38037 _values!996) i!673 (ValueCellFull!14792 lt!555245)) (size!38574 _values!996)))))

(declare-fun dynLambda!3379 (Int (_ BitVec 64)) V!46465)

(assert (=> b!1221306 (= lt!555245 (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555243 () ListLongMap!18015)

(assert (=> b!1221306 (= lt!555243 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221307 () Bool)

(declare-fun e!693581 () Bool)

(declare-fun mapRes!48391 () Bool)

(assert (=> b!1221307 (= e!693577 (and e!693581 mapRes!48391))))

(declare-fun condMapEmpty!48391 () Bool)

(declare-fun mapDefault!48391 () ValueCell!14792)

(assert (=> b!1221307 (= condMapEmpty!48391 (= (arr!38037 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14792)) mapDefault!48391)))))

(declare-fun mapIsEmpty!48391 () Bool)

(assert (=> mapIsEmpty!48391 mapRes!48391))

(declare-fun b!1221308 () Bool)

(declare-fun res!810907 () Bool)

(declare-fun e!693572 () Bool)

(assert (=> b!1221308 (=> (not res!810907) (not e!693572))))

(declare-datatypes ((List!26849 0))(
  ( (Nil!26846) (Cons!26845 (h!28063 (_ BitVec 64)) (t!40120 List!26849)) )
))
(declare-fun arrayNoDuplicates!0 (array!78823 (_ BitVec 32) List!26849) Bool)

(assert (=> b!1221308 (= res!810907 (arrayNoDuplicates!0 lt!555241 #b00000000000000000000000000000000 Nil!26846))))

(declare-fun b!1221309 () Bool)

(declare-fun e!693580 () Bool)

(assert (=> b!1221309 (= e!693574 e!693580)))

(declare-fun res!810911 () Bool)

(assert (=> b!1221309 (=> res!810911 e!693580)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221309 (= res!810911 (not (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455))))))

(declare-fun lt!555244 () ListLongMap!18015)

(declare-fun lt!555236 () ListLongMap!18015)

(assert (=> b!1221309 (= lt!555244 lt!555236)))

(declare-fun lt!555238 () ListLongMap!18015)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1909 (ListLongMap!18015 (_ BitVec 64)) ListLongMap!18015)

(assert (=> b!1221309 (= lt!555236 (-!1909 lt!555238 k0!934))))

(assert (=> b!1221309 (= lt!555244 (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221309 (= lt!555238 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40404 0))(
  ( (Unit!40405) )
))
(declare-fun lt!555242 () Unit!40404)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1124 (array!78823 array!78825 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40404)

(assert (=> b!1221309 (= lt!555242 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1124 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221310 () Bool)

(declare-fun res!810903 () Bool)

(assert (=> b!1221310 (=> (not res!810903) (not e!693578))))

(assert (=> b!1221310 (= res!810903 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26846))))

(declare-fun b!1221311 () Bool)

(declare-fun e!693573 () Bool)

(declare-fun e!693579 () Bool)

(assert (=> b!1221311 (= e!693573 e!693579)))

(declare-fun res!810913 () Bool)

(assert (=> b!1221311 (=> res!810913 e!693579)))

(assert (=> b!1221311 (= res!810913 (not (= (select (arr!38036 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!48391 () Bool)

(declare-fun tp!91931 () Bool)

(declare-fun e!693576 () Bool)

(assert (=> mapNonEmpty!48391 (= mapRes!48391 (and tp!91931 e!693576))))

(declare-fun mapRest!48391 () (Array (_ BitVec 32) ValueCell!14792))

(declare-fun mapKey!48391 () (_ BitVec 32))

(declare-fun mapValue!48391 () ValueCell!14792)

(assert (=> mapNonEmpty!48391 (= (arr!38037 _values!996) (store mapRest!48391 mapKey!48391 mapValue!48391))))

(declare-fun b!1221312 () Bool)

(declare-fun res!810904 () Bool)

(assert (=> b!1221312 (=> (not res!810904) (not e!693578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78823 (_ BitVec 32)) Bool)

(assert (=> b!1221312 (= res!810904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221313 () Bool)

(declare-fun res!810910 () Bool)

(assert (=> b!1221313 (=> (not res!810910) (not e!693578))))

(assert (=> b!1221313 (= res!810910 (= (select (arr!38036 _keys!1208) i!673) k0!934))))

(declare-fun b!1221314 () Bool)

(declare-fun e!693575 () Bool)

(assert (=> b!1221314 (= e!693575 (bvslt (size!38573 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1221314 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26846)))

(declare-fun lt!555246 () Unit!40404)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78823 (_ BitVec 32) (_ BitVec 32)) Unit!40404)

(assert (=> b!1221314 (= lt!555246 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221314 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555240 () Unit!40404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78823 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40404)

(assert (=> b!1221314 (= lt!555240 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221315 () Bool)

(assert (=> b!1221315 (= e!693580 e!693575)))

(declare-fun res!810912 () Bool)

(assert (=> b!1221315 (=> res!810912 e!693575)))

(assert (=> b!1221315 (= res!810912 (not (= (select (arr!38036 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221315 e!693573))

(declare-fun res!810902 () Bool)

(assert (=> b!1221315 (=> (not res!810902) (not e!693573))))

(declare-fun +!4132 (ListLongMap!18015 tuple2!20038) ListLongMap!18015)

(declare-fun get!19444 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1221315 (= res!810902 (= lt!555239 (+!4132 lt!555236 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))))))

(declare-fun b!1221316 () Bool)

(assert (=> b!1221316 (= e!693572 (not e!693582))))

(declare-fun res!810905 () Bool)

(assert (=> b!1221316 (=> res!810905 e!693582)))

(assert (=> b!1221316 (= res!810905 (bvsgt from!1455 i!673))))

(assert (=> b!1221316 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555235 () Unit!40404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78823 (_ BitVec 64) (_ BitVec 32)) Unit!40404)

(assert (=> b!1221316 (= lt!555235 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221317 () Bool)

(declare-fun res!810906 () Bool)

(assert (=> b!1221317 (=> (not res!810906) (not e!693578))))

(assert (=> b!1221317 (= res!810906 (and (= (size!38574 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38573 _keys!1208) (size!38574 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221318 () Bool)

(assert (=> b!1221318 (= e!693581 tp_is_empty!31003)))

(declare-fun b!1221319 () Bool)

(assert (=> b!1221319 (= e!693579 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221320 () Bool)

(declare-fun res!810900 () Bool)

(assert (=> b!1221320 (=> (not res!810900) (not e!693578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221320 (= res!810900 (validMask!0 mask!1564))))

(declare-fun b!1221321 () Bool)

(declare-fun res!810899 () Bool)

(assert (=> b!1221321 (=> (not res!810899) (not e!693578))))

(assert (=> b!1221321 (= res!810899 (validKeyInArray!0 k0!934))))

(declare-fun b!1221322 () Bool)

(assert (=> b!1221322 (= e!693576 tp_is_empty!31003)))

(declare-fun b!1221323 () Bool)

(assert (=> b!1221323 (= e!693578 e!693572)))

(declare-fun res!810901 () Bool)

(assert (=> b!1221323 (=> (not res!810901) (not e!693572))))

(assert (=> b!1221323 (= res!810901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555241 mask!1564))))

(assert (=> b!1221323 (= lt!555241 (array!78824 (store (arr!38036 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38573 _keys!1208)))))

(assert (= (and start!101718 res!810908) b!1221320))

(assert (= (and b!1221320 res!810900) b!1221317))

(assert (= (and b!1221317 res!810906) b!1221312))

(assert (= (and b!1221312 res!810904) b!1221310))

(assert (= (and b!1221310 res!810903) b!1221305))

(assert (= (and b!1221305 res!810914) b!1221321))

(assert (= (and b!1221321 res!810899) b!1221313))

(assert (= (and b!1221313 res!810910) b!1221323))

(assert (= (and b!1221323 res!810901) b!1221308))

(assert (= (and b!1221308 res!810907) b!1221316))

(assert (= (and b!1221316 (not res!810905)) b!1221306))

(assert (= (and b!1221306 (not res!810909)) b!1221309))

(assert (= (and b!1221309 (not res!810911)) b!1221315))

(assert (= (and b!1221315 res!810902) b!1221311))

(assert (= (and b!1221311 (not res!810913)) b!1221319))

(assert (= (and b!1221315 (not res!810912)) b!1221314))

(assert (= (and b!1221307 condMapEmpty!48391) mapIsEmpty!48391))

(assert (= (and b!1221307 (not condMapEmpty!48391)) mapNonEmpty!48391))

(get-info :version)

(assert (= (and mapNonEmpty!48391 ((_ is ValueCellFull!14792) mapValue!48391)) b!1221322))

(assert (= (and b!1221307 ((_ is ValueCellFull!14792) mapDefault!48391)) b!1221318))

(assert (= start!101718 b!1221307))

(declare-fun b_lambda!22121 () Bool)

(assert (=> (not b_lambda!22121) (not b!1221306)))

(declare-fun t!40118 () Bool)

(declare-fun tb!11091 () Bool)

(assert (=> (and start!101718 (= defaultEntry!1004 defaultEntry!1004) t!40118) tb!11091))

(declare-fun result!22795 () Bool)

(assert (=> tb!11091 (= result!22795 tp_is_empty!31003)))

(assert (=> b!1221306 t!40118))

(declare-fun b_and!43791 () Bool)

(assert (= b_and!43789 (and (=> t!40118 result!22795) b_and!43791)))

(declare-fun m!1126379 () Bool)

(assert (=> b!1221323 m!1126379))

(declare-fun m!1126381 () Bool)

(assert (=> b!1221323 m!1126381))

(declare-fun m!1126383 () Bool)

(assert (=> b!1221306 m!1126383))

(declare-fun m!1126385 () Bool)

(assert (=> b!1221306 m!1126385))

(declare-fun m!1126387 () Bool)

(assert (=> b!1221306 m!1126387))

(declare-fun m!1126389 () Bool)

(assert (=> b!1221306 m!1126389))

(declare-fun m!1126391 () Bool)

(assert (=> b!1221311 m!1126391))

(declare-fun m!1126393 () Bool)

(assert (=> b!1221321 m!1126393))

(declare-fun m!1126395 () Bool)

(assert (=> b!1221320 m!1126395))

(declare-fun m!1126397 () Bool)

(assert (=> mapNonEmpty!48391 m!1126397))

(declare-fun m!1126399 () Bool)

(assert (=> start!101718 m!1126399))

(declare-fun m!1126401 () Bool)

(assert (=> start!101718 m!1126401))

(declare-fun m!1126403 () Bool)

(assert (=> b!1221308 m!1126403))

(assert (=> b!1221315 m!1126391))

(declare-fun m!1126405 () Bool)

(assert (=> b!1221315 m!1126405))

(assert (=> b!1221315 m!1126405))

(declare-fun m!1126407 () Bool)

(assert (=> b!1221315 m!1126407))

(declare-fun m!1126409 () Bool)

(assert (=> b!1221315 m!1126409))

(declare-fun m!1126411 () Bool)

(assert (=> b!1221319 m!1126411))

(declare-fun m!1126413 () Bool)

(assert (=> b!1221316 m!1126413))

(declare-fun m!1126415 () Bool)

(assert (=> b!1221316 m!1126415))

(declare-fun m!1126417 () Bool)

(assert (=> b!1221310 m!1126417))

(declare-fun m!1126419 () Bool)

(assert (=> b!1221312 m!1126419))

(declare-fun m!1126421 () Bool)

(assert (=> b!1221309 m!1126421))

(declare-fun m!1126423 () Bool)

(assert (=> b!1221309 m!1126423))

(assert (=> b!1221309 m!1126391))

(declare-fun m!1126425 () Bool)

(assert (=> b!1221309 m!1126425))

(assert (=> b!1221309 m!1126391))

(declare-fun m!1126427 () Bool)

(assert (=> b!1221309 m!1126427))

(declare-fun m!1126429 () Bool)

(assert (=> b!1221309 m!1126429))

(declare-fun m!1126431 () Bool)

(assert (=> b!1221313 m!1126431))

(declare-fun m!1126433 () Bool)

(assert (=> b!1221314 m!1126433))

(declare-fun m!1126435 () Bool)

(assert (=> b!1221314 m!1126435))

(declare-fun m!1126437 () Bool)

(assert (=> b!1221314 m!1126437))

(declare-fun m!1126439 () Bool)

(assert (=> b!1221314 m!1126439))

(check-sat (not b!1221314) (not b!1221315) (not b!1221316) (not b_next!26299) (not start!101718) (not b!1221319) (not b!1221306) (not b!1221320) (not b_lambda!22121) tp_is_empty!31003 (not b!1221321) (not mapNonEmpty!48391) (not b!1221323) (not b!1221312) (not b!1221309) (not b!1221310) b_and!43791 (not b!1221308))
(check-sat b_and!43791 (not b_next!26299))
(get-model)

(declare-fun b_lambda!22127 () Bool)

(assert (= b_lambda!22121 (or (and start!101718 b_free!26299) b_lambda!22127)))

(check-sat (not b!1221314) (not b!1221315) (not b!1221316) (not b_next!26299) (not start!101718) (not b!1221319) (not b!1221306) (not b!1221320) tp_is_empty!31003 (not mapNonEmpty!48391) (not b!1221323) (not b!1221312) (not b!1221309) (not b!1221310) b_and!43791 (not b!1221308) (not b_lambda!22127) (not b!1221321))
(check-sat b_and!43791 (not b_next!26299))
(get-model)

(declare-fun d!134179 () Bool)

(assert (=> d!134179 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221321 d!134179))

(declare-fun b!1221452 () Bool)

(declare-fun e!693664 () Bool)

(declare-fun call!60754 () Bool)

(assert (=> b!1221452 (= e!693664 call!60754)))

(declare-fun b!1221453 () Bool)

(declare-fun e!693662 () Bool)

(assert (=> b!1221453 (= e!693664 e!693662)))

(declare-fun lt!555326 () (_ BitVec 64))

(assert (=> b!1221453 (= lt!555326 (select (arr!38036 lt!555241) #b00000000000000000000000000000000))))

(declare-fun lt!555327 () Unit!40404)

(assert (=> b!1221453 (= lt!555327 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!555241 lt!555326 #b00000000000000000000000000000000))))

(assert (=> b!1221453 (arrayContainsKey!0 lt!555241 lt!555326 #b00000000000000000000000000000000)))

(declare-fun lt!555325 () Unit!40404)

(assert (=> b!1221453 (= lt!555325 lt!555327)))

(declare-fun res!811015 () Bool)

(declare-datatypes ((SeekEntryResult!9903 0))(
  ( (MissingZero!9903 (index!41983 (_ BitVec 32))) (Found!9903 (index!41984 (_ BitVec 32))) (Intermediate!9903 (undefined!10715 Bool) (index!41985 (_ BitVec 32)) (x!107454 (_ BitVec 32))) (Undefined!9903) (MissingVacant!9903 (index!41986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78823 (_ BitVec 32)) SeekEntryResult!9903)

(assert (=> b!1221453 (= res!811015 (= (seekEntryOrOpen!0 (select (arr!38036 lt!555241) #b00000000000000000000000000000000) lt!555241 mask!1564) (Found!9903 #b00000000000000000000000000000000)))))

(assert (=> b!1221453 (=> (not res!811015) (not e!693662))))

(declare-fun bm!60751 () Bool)

(assert (=> bm!60751 (= call!60754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!555241 mask!1564))))

(declare-fun b!1221454 () Bool)

(declare-fun e!693663 () Bool)

(assert (=> b!1221454 (= e!693663 e!693664)))

(declare-fun c!120601 () Bool)

(assert (=> b!1221454 (= c!120601 (validKeyInArray!0 (select (arr!38036 lt!555241) #b00000000000000000000000000000000)))))

(declare-fun d!134181 () Bool)

(declare-fun res!811016 () Bool)

(assert (=> d!134181 (=> res!811016 e!693663)))

(assert (=> d!134181 (= res!811016 (bvsge #b00000000000000000000000000000000 (size!38573 lt!555241)))))

(assert (=> d!134181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555241 mask!1564) e!693663)))

(declare-fun b!1221455 () Bool)

(assert (=> b!1221455 (= e!693662 call!60754)))

(assert (= (and d!134181 (not res!811016)) b!1221454))

(assert (= (and b!1221454 c!120601) b!1221453))

(assert (= (and b!1221454 (not c!120601)) b!1221452))

(assert (= (and b!1221453 res!811015) b!1221455))

(assert (= (or b!1221455 b!1221452) bm!60751))

(declare-fun m!1126565 () Bool)

(assert (=> b!1221453 m!1126565))

(declare-fun m!1126567 () Bool)

(assert (=> b!1221453 m!1126567))

(declare-fun m!1126569 () Bool)

(assert (=> b!1221453 m!1126569))

(assert (=> b!1221453 m!1126565))

(declare-fun m!1126571 () Bool)

(assert (=> b!1221453 m!1126571))

(declare-fun m!1126573 () Bool)

(assert (=> bm!60751 m!1126573))

(assert (=> b!1221454 m!1126565))

(assert (=> b!1221454 m!1126565))

(declare-fun m!1126575 () Bool)

(assert (=> b!1221454 m!1126575))

(assert (=> b!1221323 d!134181))

(declare-fun b!1221456 () Bool)

(declare-fun e!693667 () Bool)

(declare-fun call!60755 () Bool)

(assert (=> b!1221456 (= e!693667 call!60755)))

(declare-fun b!1221457 () Bool)

(declare-fun e!693665 () Bool)

(assert (=> b!1221457 (= e!693667 e!693665)))

(declare-fun lt!555329 () (_ BitVec 64))

(assert (=> b!1221457 (= lt!555329 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!555330 () Unit!40404)

(assert (=> b!1221457 (= lt!555330 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!555329 #b00000000000000000000000000000000))))

(assert (=> b!1221457 (arrayContainsKey!0 _keys!1208 lt!555329 #b00000000000000000000000000000000)))

(declare-fun lt!555328 () Unit!40404)

(assert (=> b!1221457 (= lt!555328 lt!555330)))

(declare-fun res!811017 () Bool)

(assert (=> b!1221457 (= res!811017 (= (seekEntryOrOpen!0 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9903 #b00000000000000000000000000000000)))))

(assert (=> b!1221457 (=> (not res!811017) (not e!693665))))

(declare-fun bm!60752 () Bool)

(assert (=> bm!60752 (= call!60755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1221458 () Bool)

(declare-fun e!693666 () Bool)

(assert (=> b!1221458 (= e!693666 e!693667)))

(declare-fun c!120602 () Bool)

(assert (=> b!1221458 (= c!120602 (validKeyInArray!0 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!134183 () Bool)

(declare-fun res!811018 () Bool)

(assert (=> d!134183 (=> res!811018 e!693666)))

(assert (=> d!134183 (= res!811018 (bvsge #b00000000000000000000000000000000 (size!38573 _keys!1208)))))

(assert (=> d!134183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!693666)))

(declare-fun b!1221459 () Bool)

(assert (=> b!1221459 (= e!693665 call!60755)))

(assert (= (and d!134183 (not res!811018)) b!1221458))

(assert (= (and b!1221458 c!120602) b!1221457))

(assert (= (and b!1221458 (not c!120602)) b!1221456))

(assert (= (and b!1221457 res!811017) b!1221459))

(assert (= (or b!1221459 b!1221456) bm!60752))

(declare-fun m!1126577 () Bool)

(assert (=> b!1221457 m!1126577))

(declare-fun m!1126579 () Bool)

(assert (=> b!1221457 m!1126579))

(declare-fun m!1126581 () Bool)

(assert (=> b!1221457 m!1126581))

(assert (=> b!1221457 m!1126577))

(declare-fun m!1126583 () Bool)

(assert (=> b!1221457 m!1126583))

(declare-fun m!1126585 () Bool)

(assert (=> bm!60752 m!1126585))

(assert (=> b!1221458 m!1126577))

(assert (=> b!1221458 m!1126577))

(declare-fun m!1126587 () Bool)

(assert (=> b!1221458 m!1126587))

(assert (=> b!1221312 d!134183))

(declare-fun bm!60755 () Bool)

(declare-fun call!60758 () Bool)

(declare-fun c!120605 () Bool)

(assert (=> bm!60755 (= call!60758 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120605 (Cons!26845 (select (arr!38036 _keys!1208) from!1455) Nil!26846) Nil!26846)))))

(declare-fun d!134185 () Bool)

(declare-fun res!811025 () Bool)

(declare-fun e!693676 () Bool)

(assert (=> d!134185 (=> res!811025 e!693676)))

(assert (=> d!134185 (= res!811025 (bvsge from!1455 (size!38573 _keys!1208)))))

(assert (=> d!134185 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26846) e!693676)))

(declare-fun b!1221470 () Bool)

(declare-fun e!693677 () Bool)

(declare-fun e!693679 () Bool)

(assert (=> b!1221470 (= e!693677 e!693679)))

(assert (=> b!1221470 (= c!120605 (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455)))))

(declare-fun b!1221471 () Bool)

(assert (=> b!1221471 (= e!693676 e!693677)))

(declare-fun res!811027 () Bool)

(assert (=> b!1221471 (=> (not res!811027) (not e!693677))))

(declare-fun e!693678 () Bool)

(assert (=> b!1221471 (= res!811027 (not e!693678))))

(declare-fun res!811026 () Bool)

(assert (=> b!1221471 (=> (not res!811026) (not e!693678))))

(assert (=> b!1221471 (= res!811026 (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455)))))

(declare-fun b!1221472 () Bool)

(assert (=> b!1221472 (= e!693679 call!60758)))

(declare-fun b!1221473 () Bool)

(declare-fun contains!7052 (List!26849 (_ BitVec 64)) Bool)

(assert (=> b!1221473 (= e!693678 (contains!7052 Nil!26846 (select (arr!38036 _keys!1208) from!1455)))))

(declare-fun b!1221474 () Bool)

(assert (=> b!1221474 (= e!693679 call!60758)))

(assert (= (and d!134185 (not res!811025)) b!1221471))

(assert (= (and b!1221471 res!811026) b!1221473))

(assert (= (and b!1221471 res!811027) b!1221470))

(assert (= (and b!1221470 c!120605) b!1221474))

(assert (= (and b!1221470 (not c!120605)) b!1221472))

(assert (= (or b!1221474 b!1221472) bm!60755))

(assert (=> bm!60755 m!1126391))

(declare-fun m!1126589 () Bool)

(assert (=> bm!60755 m!1126589))

(assert (=> b!1221470 m!1126391))

(assert (=> b!1221470 m!1126391))

(assert (=> b!1221470 m!1126425))

(assert (=> b!1221471 m!1126391))

(assert (=> b!1221471 m!1126391))

(assert (=> b!1221471 m!1126425))

(assert (=> b!1221473 m!1126391))

(assert (=> b!1221473 m!1126391))

(declare-fun m!1126591 () Bool)

(assert (=> b!1221473 m!1126591))

(assert (=> b!1221314 d!134185))

(declare-fun d!134187 () Bool)

(assert (=> d!134187 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26846)))

(declare-fun lt!555333 () Unit!40404)

(declare-fun choose!39 (array!78823 (_ BitVec 32) (_ BitVec 32)) Unit!40404)

(assert (=> d!134187 (= lt!555333 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!134187 (bvslt (size!38573 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!134187 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!555333)))

(declare-fun bs!34375 () Bool)

(assert (= bs!34375 d!134187))

(assert (=> bs!34375 m!1126433))

(declare-fun m!1126593 () Bool)

(assert (=> bs!34375 m!1126593))

(assert (=> b!1221314 d!134187))

(declare-fun d!134189 () Bool)

(declare-fun res!811032 () Bool)

(declare-fun e!693684 () Bool)

(assert (=> d!134189 (=> res!811032 e!693684)))

(assert (=> d!134189 (= res!811032 (= (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!134189 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!693684)))

(declare-fun b!1221479 () Bool)

(declare-fun e!693685 () Bool)

(assert (=> b!1221479 (= e!693684 e!693685)))

(declare-fun res!811033 () Bool)

(assert (=> b!1221479 (=> (not res!811033) (not e!693685))))

(assert (=> b!1221479 (= res!811033 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38573 _keys!1208)))))

(declare-fun b!1221480 () Bool)

(assert (=> b!1221480 (= e!693685 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!134189 (not res!811032)) b!1221479))

(assert (= (and b!1221479 res!811033) b!1221480))

(declare-fun m!1126595 () Bool)

(assert (=> d!134189 m!1126595))

(declare-fun m!1126597 () Bool)

(assert (=> b!1221480 m!1126597))

(assert (=> b!1221314 d!134189))

(declare-fun d!134191 () Bool)

(assert (=> d!134191 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555336 () Unit!40404)

(declare-fun choose!114 (array!78823 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40404)

(assert (=> d!134191 (= lt!555336 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!134191 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134191 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!555336)))

(declare-fun bs!34376 () Bool)

(assert (= bs!34376 d!134191))

(assert (=> bs!34376 m!1126437))

(declare-fun m!1126599 () Bool)

(assert (=> bs!34376 m!1126599))

(assert (=> b!1221314 d!134191))

(declare-fun d!134193 () Bool)

(declare-fun e!693688 () Bool)

(assert (=> d!134193 e!693688))

(declare-fun res!811038 () Bool)

(assert (=> d!134193 (=> (not res!811038) (not e!693688))))

(declare-fun lt!555346 () ListLongMap!18015)

(declare-fun contains!7053 (ListLongMap!18015 (_ BitVec 64)) Bool)

(assert (=> d!134193 (= res!811038 (contains!7053 lt!555346 (_1!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))))))

(declare-fun lt!555348 () List!26848)

(assert (=> d!134193 (= lt!555346 (ListLongMap!18016 lt!555348))))

(declare-fun lt!555347 () Unit!40404)

(declare-fun lt!555345 () Unit!40404)

(assert (=> d!134193 (= lt!555347 lt!555345)))

(declare-datatypes ((Option!692 0))(
  ( (Some!691 (v!18214 V!46465)) (None!690) )
))
(declare-fun getValueByKey!641 (List!26848 (_ BitVec 64)) Option!692)

(assert (=> d!134193 (= (getValueByKey!641 lt!555348 (_1!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))) (Some!691 (_2!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!323 (List!26848 (_ BitVec 64) V!46465) Unit!40404)

(assert (=> d!134193 (= lt!555345 (lemmaContainsTupThenGetReturnValue!323 lt!555348 (_1!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245))) (_2!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))))))

(declare-fun insertStrictlySorted!416 (List!26848 (_ BitVec 64) V!46465) List!26848)

(assert (=> d!134193 (= lt!555348 (insertStrictlySorted!416 (toList!9023 lt!555236) (_1!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245))) (_2!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))))))

(assert (=> d!134193 (= (+!4132 lt!555236 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245))) lt!555346)))

(declare-fun b!1221485 () Bool)

(declare-fun res!811039 () Bool)

(assert (=> b!1221485 (=> (not res!811039) (not e!693688))))

(assert (=> b!1221485 (= res!811039 (= (getValueByKey!641 (toList!9023 lt!555346) (_1!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245)))) (Some!691 (_2!10030 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245))))))))

(declare-fun b!1221486 () Bool)

(declare-fun contains!7054 (List!26848 tuple2!20038) Bool)

(assert (=> b!1221486 (= e!693688 (contains!7054 (toList!9023 lt!555346) (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245))))))

(assert (= (and d!134193 res!811038) b!1221485))

(assert (= (and b!1221485 res!811039) b!1221486))

(declare-fun m!1126601 () Bool)

(assert (=> d!134193 m!1126601))

(declare-fun m!1126603 () Bool)

(assert (=> d!134193 m!1126603))

(declare-fun m!1126605 () Bool)

(assert (=> d!134193 m!1126605))

(declare-fun m!1126607 () Bool)

(assert (=> d!134193 m!1126607))

(declare-fun m!1126609 () Bool)

(assert (=> b!1221485 m!1126609))

(declare-fun m!1126611 () Bool)

(assert (=> b!1221486 m!1126611))

(assert (=> b!1221315 d!134193))

(declare-fun d!134195 () Bool)

(declare-fun c!120608 () Bool)

(assert (=> d!134195 (= c!120608 ((_ is ValueCellFull!14792) (select (arr!38037 _values!996) from!1455)))))

(declare-fun e!693691 () V!46465)

(assert (=> d!134195 (= (get!19444 (select (arr!38037 _values!996) from!1455) lt!555245) e!693691)))

(declare-fun b!1221491 () Bool)

(declare-fun get!19445 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1221491 (= e!693691 (get!19445 (select (arr!38037 _values!996) from!1455) lt!555245))))

(declare-fun b!1221492 () Bool)

(declare-fun get!19446 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1221492 (= e!693691 (get!19446 (select (arr!38037 _values!996) from!1455) lt!555245))))

(assert (= (and d!134195 c!120608) b!1221491))

(assert (= (and d!134195 (not c!120608)) b!1221492))

(assert (=> b!1221491 m!1126405))

(declare-fun m!1126613 () Bool)

(assert (=> b!1221491 m!1126613))

(assert (=> b!1221492 m!1126405))

(declare-fun m!1126615 () Bool)

(assert (=> b!1221492 m!1126615))

(assert (=> b!1221315 d!134195))

(declare-fun b!1221517 () Bool)

(declare-fun e!693706 () Bool)

(declare-fun e!693710 () Bool)

(assert (=> b!1221517 (= e!693706 e!693710)))

(declare-fun c!120617 () Bool)

(assert (=> b!1221517 (= c!120617 (bvslt from!1455 (size!38573 lt!555241)))))

(declare-fun d!134197 () Bool)

(declare-fun e!693707 () Bool)

(assert (=> d!134197 e!693707))

(declare-fun res!811049 () Bool)

(assert (=> d!134197 (=> (not res!811049) (not e!693707))))

(declare-fun lt!555365 () ListLongMap!18015)

(assert (=> d!134197 (= res!811049 (not (contains!7053 lt!555365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!693708 () ListLongMap!18015)

(assert (=> d!134197 (= lt!555365 e!693708)))

(declare-fun c!120620 () Bool)

(assert (=> d!134197 (= c!120620 (bvsge from!1455 (size!38573 lt!555241)))))

(assert (=> d!134197 (validMask!0 mask!1564)))

(assert (=> d!134197 (= (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555365)))

(declare-fun b!1221518 () Bool)

(declare-fun lt!555369 () Unit!40404)

(declare-fun lt!555364 () Unit!40404)

(assert (=> b!1221518 (= lt!555369 lt!555364)))

(declare-fun lt!555366 () V!46465)

(declare-fun lt!555363 () ListLongMap!18015)

(declare-fun lt!555367 () (_ BitVec 64))

(declare-fun lt!555368 () (_ BitVec 64))

(assert (=> b!1221518 (not (contains!7053 (+!4132 lt!555363 (tuple2!20039 lt!555367 lt!555366)) lt!555368))))

(declare-fun addStillNotContains!304 (ListLongMap!18015 (_ BitVec 64) V!46465 (_ BitVec 64)) Unit!40404)

(assert (=> b!1221518 (= lt!555364 (addStillNotContains!304 lt!555363 lt!555367 lt!555366 lt!555368))))

(assert (=> b!1221518 (= lt!555368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221518 (= lt!555366 (get!19444 (select (arr!38037 lt!555237) from!1455) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221518 (= lt!555367 (select (arr!38036 lt!555241) from!1455))))

(declare-fun call!60761 () ListLongMap!18015)

(assert (=> b!1221518 (= lt!555363 call!60761)))

(declare-fun e!693712 () ListLongMap!18015)

(assert (=> b!1221518 (= e!693712 (+!4132 call!60761 (tuple2!20039 (select (arr!38036 lt!555241) from!1455) (get!19444 (select (arr!38037 lt!555237) from!1455) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221519 () Bool)

(assert (=> b!1221519 (= e!693710 (= lt!555365 (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221520 () Bool)

(declare-fun res!811050 () Bool)

(assert (=> b!1221520 (=> (not res!811050) (not e!693707))))

(assert (=> b!1221520 (= res!811050 (not (contains!7053 lt!555365 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221521 () Bool)

(assert (=> b!1221521 (= e!693708 (ListLongMap!18016 Nil!26845))))

(declare-fun b!1221522 () Bool)

(assert (=> b!1221522 (= e!693708 e!693712)))

(declare-fun c!120618 () Bool)

(assert (=> b!1221522 (= c!120618 (validKeyInArray!0 (select (arr!38036 lt!555241) from!1455)))))

(declare-fun b!1221523 () Bool)

(declare-fun e!693711 () Bool)

(assert (=> b!1221523 (= e!693706 e!693711)))

(assert (=> b!1221523 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38573 lt!555241)))))

(declare-fun res!811048 () Bool)

(assert (=> b!1221523 (= res!811048 (contains!7053 lt!555365 (select (arr!38036 lt!555241) from!1455)))))

(assert (=> b!1221523 (=> (not res!811048) (not e!693711))))

(declare-fun b!1221524 () Bool)

(assert (=> b!1221524 (= e!693712 call!60761)))

(declare-fun b!1221525 () Bool)

(assert (=> b!1221525 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38573 lt!555241)))))

(assert (=> b!1221525 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38574 lt!555237)))))

(declare-fun apply!983 (ListLongMap!18015 (_ BitVec 64)) V!46465)

(assert (=> b!1221525 (= e!693711 (= (apply!983 lt!555365 (select (arr!38036 lt!555241) from!1455)) (get!19444 (select (arr!38037 lt!555237) from!1455) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221526 () Bool)

(declare-fun isEmpty!1002 (ListLongMap!18015) Bool)

(assert (=> b!1221526 (= e!693710 (isEmpty!1002 lt!555365))))

(declare-fun b!1221527 () Bool)

(assert (=> b!1221527 (= e!693707 e!693706)))

(declare-fun c!120619 () Bool)

(declare-fun e!693709 () Bool)

(assert (=> b!1221527 (= c!120619 e!693709)))

(declare-fun res!811051 () Bool)

(assert (=> b!1221527 (=> (not res!811051) (not e!693709))))

(assert (=> b!1221527 (= res!811051 (bvslt from!1455 (size!38573 lt!555241)))))

(declare-fun bm!60758 () Bool)

(assert (=> bm!60758 (= call!60761 (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221528 () Bool)

(assert (=> b!1221528 (= e!693709 (validKeyInArray!0 (select (arr!38036 lt!555241) from!1455)))))

(assert (=> b!1221528 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!134197 c!120620) b!1221521))

(assert (= (and d!134197 (not c!120620)) b!1221522))

(assert (= (and b!1221522 c!120618) b!1221518))

(assert (= (and b!1221522 (not c!120618)) b!1221524))

(assert (= (or b!1221518 b!1221524) bm!60758))

(assert (= (and d!134197 res!811049) b!1221520))

(assert (= (and b!1221520 res!811050) b!1221527))

(assert (= (and b!1221527 res!811051) b!1221528))

(assert (= (and b!1221527 c!120619) b!1221523))

(assert (= (and b!1221527 (not c!120619)) b!1221517))

(assert (= (and b!1221523 res!811048) b!1221525))

(assert (= (and b!1221517 c!120617) b!1221519))

(assert (= (and b!1221517 (not c!120617)) b!1221526))

(declare-fun b_lambda!22129 () Bool)

(assert (=> (not b_lambda!22129) (not b!1221518)))

(assert (=> b!1221518 t!40118))

(declare-fun b_and!43801 () Bool)

(assert (= b_and!43791 (and (=> t!40118 result!22795) b_and!43801)))

(declare-fun b_lambda!22131 () Bool)

(assert (=> (not b_lambda!22131) (not b!1221525)))

(assert (=> b!1221525 t!40118))

(declare-fun b_and!43803 () Bool)

(assert (= b_and!43801 (and (=> t!40118 result!22795) b_and!43803)))

(declare-fun m!1126617 () Bool)

(assert (=> b!1221518 m!1126617))

(declare-fun m!1126619 () Bool)

(assert (=> b!1221518 m!1126619))

(assert (=> b!1221518 m!1126387))

(declare-fun m!1126621 () Bool)

(assert (=> b!1221518 m!1126621))

(declare-fun m!1126623 () Bool)

(assert (=> b!1221518 m!1126623))

(declare-fun m!1126625 () Bool)

(assert (=> b!1221518 m!1126625))

(assert (=> b!1221518 m!1126619))

(declare-fun m!1126627 () Bool)

(assert (=> b!1221518 m!1126627))

(assert (=> b!1221518 m!1126625))

(declare-fun m!1126629 () Bool)

(assert (=> b!1221518 m!1126629))

(assert (=> b!1221518 m!1126387))

(assert (=> b!1221525 m!1126619))

(assert (=> b!1221525 m!1126387))

(assert (=> b!1221525 m!1126621))

(assert (=> b!1221525 m!1126619))

(assert (=> b!1221525 m!1126627))

(assert (=> b!1221525 m!1126627))

(declare-fun m!1126631 () Bool)

(assert (=> b!1221525 m!1126631))

(assert (=> b!1221525 m!1126387))

(assert (=> b!1221528 m!1126627))

(assert (=> b!1221528 m!1126627))

(declare-fun m!1126633 () Bool)

(assert (=> b!1221528 m!1126633))

(declare-fun m!1126635 () Bool)

(assert (=> d!134197 m!1126635))

(assert (=> d!134197 m!1126395))

(assert (=> b!1221522 m!1126627))

(assert (=> b!1221522 m!1126627))

(assert (=> b!1221522 m!1126633))

(declare-fun m!1126637 () Bool)

(assert (=> b!1221520 m!1126637))

(declare-fun m!1126639 () Bool)

(assert (=> bm!60758 m!1126639))

(assert (=> b!1221523 m!1126627))

(assert (=> b!1221523 m!1126627))

(declare-fun m!1126641 () Bool)

(assert (=> b!1221523 m!1126641))

(assert (=> b!1221519 m!1126639))

(declare-fun m!1126643 () Bool)

(assert (=> b!1221526 m!1126643))

(assert (=> b!1221306 d!134197))

(declare-fun b!1221529 () Bool)

(declare-fun e!693713 () Bool)

(declare-fun e!693717 () Bool)

(assert (=> b!1221529 (= e!693713 e!693717)))

(declare-fun c!120621 () Bool)

(assert (=> b!1221529 (= c!120621 (bvslt from!1455 (size!38573 _keys!1208)))))

(declare-fun d!134199 () Bool)

(declare-fun e!693714 () Bool)

(assert (=> d!134199 e!693714))

(declare-fun res!811053 () Bool)

(assert (=> d!134199 (=> (not res!811053) (not e!693714))))

(declare-fun lt!555372 () ListLongMap!18015)

(assert (=> d!134199 (= res!811053 (not (contains!7053 lt!555372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!693715 () ListLongMap!18015)

(assert (=> d!134199 (= lt!555372 e!693715)))

(declare-fun c!120624 () Bool)

(assert (=> d!134199 (= c!120624 (bvsge from!1455 (size!38573 _keys!1208)))))

(assert (=> d!134199 (validMask!0 mask!1564)))

(assert (=> d!134199 (= (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555372)))

(declare-fun b!1221530 () Bool)

(declare-fun lt!555376 () Unit!40404)

(declare-fun lt!555371 () Unit!40404)

(assert (=> b!1221530 (= lt!555376 lt!555371)))

(declare-fun lt!555374 () (_ BitVec 64))

(declare-fun lt!555375 () (_ BitVec 64))

(declare-fun lt!555373 () V!46465)

(declare-fun lt!555370 () ListLongMap!18015)

(assert (=> b!1221530 (not (contains!7053 (+!4132 lt!555370 (tuple2!20039 lt!555374 lt!555373)) lt!555375))))

(assert (=> b!1221530 (= lt!555371 (addStillNotContains!304 lt!555370 lt!555374 lt!555373 lt!555375))))

(assert (=> b!1221530 (= lt!555375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221530 (= lt!555373 (get!19444 (select (arr!38037 _values!996) from!1455) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221530 (= lt!555374 (select (arr!38036 _keys!1208) from!1455))))

(declare-fun call!60762 () ListLongMap!18015)

(assert (=> b!1221530 (= lt!555370 call!60762)))

(declare-fun e!693719 () ListLongMap!18015)

(assert (=> b!1221530 (= e!693719 (+!4132 call!60762 (tuple2!20039 (select (arr!38036 _keys!1208) from!1455) (get!19444 (select (arr!38037 _values!996) from!1455) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221531 () Bool)

(assert (=> b!1221531 (= e!693717 (= lt!555372 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221532 () Bool)

(declare-fun res!811054 () Bool)

(assert (=> b!1221532 (=> (not res!811054) (not e!693714))))

(assert (=> b!1221532 (= res!811054 (not (contains!7053 lt!555372 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221533 () Bool)

(assert (=> b!1221533 (= e!693715 (ListLongMap!18016 Nil!26845))))

(declare-fun b!1221534 () Bool)

(assert (=> b!1221534 (= e!693715 e!693719)))

(declare-fun c!120622 () Bool)

(assert (=> b!1221534 (= c!120622 (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455)))))

(declare-fun b!1221535 () Bool)

(declare-fun e!693718 () Bool)

(assert (=> b!1221535 (= e!693713 e!693718)))

(assert (=> b!1221535 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38573 _keys!1208)))))

(declare-fun res!811052 () Bool)

(assert (=> b!1221535 (= res!811052 (contains!7053 lt!555372 (select (arr!38036 _keys!1208) from!1455)))))

(assert (=> b!1221535 (=> (not res!811052) (not e!693718))))

(declare-fun b!1221536 () Bool)

(assert (=> b!1221536 (= e!693719 call!60762)))

(declare-fun b!1221537 () Bool)

(assert (=> b!1221537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38573 _keys!1208)))))

(assert (=> b!1221537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38574 _values!996)))))

(assert (=> b!1221537 (= e!693718 (= (apply!983 lt!555372 (select (arr!38036 _keys!1208) from!1455)) (get!19444 (select (arr!38037 _values!996) from!1455) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221538 () Bool)

(assert (=> b!1221538 (= e!693717 (isEmpty!1002 lt!555372))))

(declare-fun b!1221539 () Bool)

(assert (=> b!1221539 (= e!693714 e!693713)))

(declare-fun c!120623 () Bool)

(declare-fun e!693716 () Bool)

(assert (=> b!1221539 (= c!120623 e!693716)))

(declare-fun res!811055 () Bool)

(assert (=> b!1221539 (=> (not res!811055) (not e!693716))))

(assert (=> b!1221539 (= res!811055 (bvslt from!1455 (size!38573 _keys!1208)))))

(declare-fun bm!60759 () Bool)

(assert (=> bm!60759 (= call!60762 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221540 () Bool)

(assert (=> b!1221540 (= e!693716 (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455)))))

(assert (=> b!1221540 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!134199 c!120624) b!1221533))

(assert (= (and d!134199 (not c!120624)) b!1221534))

(assert (= (and b!1221534 c!120622) b!1221530))

(assert (= (and b!1221534 (not c!120622)) b!1221536))

(assert (= (or b!1221530 b!1221536) bm!60759))

(assert (= (and d!134199 res!811053) b!1221532))

(assert (= (and b!1221532 res!811054) b!1221539))

(assert (= (and b!1221539 res!811055) b!1221540))

(assert (= (and b!1221539 c!120623) b!1221535))

(assert (= (and b!1221539 (not c!120623)) b!1221529))

(assert (= (and b!1221535 res!811052) b!1221537))

(assert (= (and b!1221529 c!120621) b!1221531))

(assert (= (and b!1221529 (not c!120621)) b!1221538))

(declare-fun b_lambda!22133 () Bool)

(assert (=> (not b_lambda!22133) (not b!1221530)))

(assert (=> b!1221530 t!40118))

(declare-fun b_and!43805 () Bool)

(assert (= b_and!43803 (and (=> t!40118 result!22795) b_and!43805)))

(declare-fun b_lambda!22135 () Bool)

(assert (=> (not b_lambda!22135) (not b!1221537)))

(assert (=> b!1221537 t!40118))

(declare-fun b_and!43807 () Bool)

(assert (= b_and!43805 (and (=> t!40118 result!22795) b_and!43807)))

(declare-fun m!1126645 () Bool)

(assert (=> b!1221530 m!1126645))

(assert (=> b!1221530 m!1126405))

(assert (=> b!1221530 m!1126387))

(declare-fun m!1126647 () Bool)

(assert (=> b!1221530 m!1126647))

(declare-fun m!1126649 () Bool)

(assert (=> b!1221530 m!1126649))

(declare-fun m!1126651 () Bool)

(assert (=> b!1221530 m!1126651))

(assert (=> b!1221530 m!1126405))

(assert (=> b!1221530 m!1126391))

(assert (=> b!1221530 m!1126651))

(declare-fun m!1126653 () Bool)

(assert (=> b!1221530 m!1126653))

(assert (=> b!1221530 m!1126387))

(assert (=> b!1221537 m!1126405))

(assert (=> b!1221537 m!1126387))

(assert (=> b!1221537 m!1126647))

(assert (=> b!1221537 m!1126405))

(assert (=> b!1221537 m!1126391))

(assert (=> b!1221537 m!1126391))

(declare-fun m!1126655 () Bool)

(assert (=> b!1221537 m!1126655))

(assert (=> b!1221537 m!1126387))

(assert (=> b!1221540 m!1126391))

(assert (=> b!1221540 m!1126391))

(assert (=> b!1221540 m!1126425))

(declare-fun m!1126657 () Bool)

(assert (=> d!134199 m!1126657))

(assert (=> d!134199 m!1126395))

(assert (=> b!1221534 m!1126391))

(assert (=> b!1221534 m!1126391))

(assert (=> b!1221534 m!1126425))

(declare-fun m!1126659 () Bool)

(assert (=> b!1221532 m!1126659))

(declare-fun m!1126661 () Bool)

(assert (=> bm!60759 m!1126661))

(assert (=> b!1221535 m!1126391))

(assert (=> b!1221535 m!1126391))

(declare-fun m!1126663 () Bool)

(assert (=> b!1221535 m!1126663))

(assert (=> b!1221531 m!1126661))

(declare-fun m!1126665 () Bool)

(assert (=> b!1221538 m!1126665))

(assert (=> b!1221306 d!134199))

(declare-fun d!134201 () Bool)

(declare-fun res!811056 () Bool)

(declare-fun e!693720 () Bool)

(assert (=> d!134201 (=> res!811056 e!693720)))

(assert (=> d!134201 (= res!811056 (= (select (arr!38036 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134201 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!693720)))

(declare-fun b!1221541 () Bool)

(declare-fun e!693721 () Bool)

(assert (=> b!1221541 (= e!693720 e!693721)))

(declare-fun res!811057 () Bool)

(assert (=> b!1221541 (=> (not res!811057) (not e!693721))))

(assert (=> b!1221541 (= res!811057 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38573 _keys!1208)))))

(declare-fun b!1221542 () Bool)

(assert (=> b!1221542 (= e!693721 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134201 (not res!811056)) b!1221541))

(assert (= (and b!1221541 res!811057) b!1221542))

(assert (=> d!134201 m!1126577))

(declare-fun m!1126667 () Bool)

(assert (=> b!1221542 m!1126667))

(assert (=> b!1221316 d!134201))

(declare-fun d!134203 () Bool)

(assert (=> d!134203 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555379 () Unit!40404)

(declare-fun choose!13 (array!78823 (_ BitVec 64) (_ BitVec 32)) Unit!40404)

(assert (=> d!134203 (= lt!555379 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134203 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134203 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!555379)))

(declare-fun bs!34377 () Bool)

(assert (= bs!34377 d!134203))

(assert (=> bs!34377 m!1126413))

(declare-fun m!1126669 () Bool)

(assert (=> bs!34377 m!1126669))

(assert (=> b!1221316 d!134203))

(declare-fun d!134205 () Bool)

(assert (=> d!134205 (= (array_inv!29020 _keys!1208) (bvsge (size!38573 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101718 d!134205))

(declare-fun d!134207 () Bool)

(assert (=> d!134207 (= (array_inv!29021 _values!996) (bvsge (size!38574 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101718 d!134207))

(declare-fun bm!60760 () Bool)

(declare-fun call!60763 () Bool)

(declare-fun c!120625 () Bool)

(assert (=> bm!60760 (= call!60763 (arrayNoDuplicates!0 lt!555241 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120625 (Cons!26845 (select (arr!38036 lt!555241) #b00000000000000000000000000000000) Nil!26846) Nil!26846)))))

(declare-fun d!134209 () Bool)

(declare-fun res!811058 () Bool)

(declare-fun e!693722 () Bool)

(assert (=> d!134209 (=> res!811058 e!693722)))

(assert (=> d!134209 (= res!811058 (bvsge #b00000000000000000000000000000000 (size!38573 lt!555241)))))

(assert (=> d!134209 (= (arrayNoDuplicates!0 lt!555241 #b00000000000000000000000000000000 Nil!26846) e!693722)))

(declare-fun b!1221543 () Bool)

(declare-fun e!693723 () Bool)

(declare-fun e!693725 () Bool)

(assert (=> b!1221543 (= e!693723 e!693725)))

(assert (=> b!1221543 (= c!120625 (validKeyInArray!0 (select (arr!38036 lt!555241) #b00000000000000000000000000000000)))))

(declare-fun b!1221544 () Bool)

(assert (=> b!1221544 (= e!693722 e!693723)))

(declare-fun res!811060 () Bool)

(assert (=> b!1221544 (=> (not res!811060) (not e!693723))))

(declare-fun e!693724 () Bool)

(assert (=> b!1221544 (= res!811060 (not e!693724))))

(declare-fun res!811059 () Bool)

(assert (=> b!1221544 (=> (not res!811059) (not e!693724))))

(assert (=> b!1221544 (= res!811059 (validKeyInArray!0 (select (arr!38036 lt!555241) #b00000000000000000000000000000000)))))

(declare-fun b!1221545 () Bool)

(assert (=> b!1221545 (= e!693725 call!60763)))

(declare-fun b!1221546 () Bool)

(assert (=> b!1221546 (= e!693724 (contains!7052 Nil!26846 (select (arr!38036 lt!555241) #b00000000000000000000000000000000)))))

(declare-fun b!1221547 () Bool)

(assert (=> b!1221547 (= e!693725 call!60763)))

(assert (= (and d!134209 (not res!811058)) b!1221544))

(assert (= (and b!1221544 res!811059) b!1221546))

(assert (= (and b!1221544 res!811060) b!1221543))

(assert (= (and b!1221543 c!120625) b!1221547))

(assert (= (and b!1221543 (not c!120625)) b!1221545))

(assert (= (or b!1221547 b!1221545) bm!60760))

(assert (=> bm!60760 m!1126565))

(declare-fun m!1126671 () Bool)

(assert (=> bm!60760 m!1126671))

(assert (=> b!1221543 m!1126565))

(assert (=> b!1221543 m!1126565))

(assert (=> b!1221543 m!1126575))

(assert (=> b!1221544 m!1126565))

(assert (=> b!1221544 m!1126565))

(assert (=> b!1221544 m!1126575))

(assert (=> b!1221546 m!1126565))

(assert (=> b!1221546 m!1126565))

(declare-fun m!1126673 () Bool)

(assert (=> b!1221546 m!1126673))

(assert (=> b!1221308 d!134209))

(declare-fun d!134211 () Bool)

(declare-fun res!811061 () Bool)

(declare-fun e!693726 () Bool)

(assert (=> d!134211 (=> res!811061 e!693726)))

(assert (=> d!134211 (= res!811061 (= (select (arr!38036 _keys!1208) i!673) k0!934))))

(assert (=> d!134211 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!693726)))

(declare-fun b!1221548 () Bool)

(declare-fun e!693727 () Bool)

(assert (=> b!1221548 (= e!693726 e!693727)))

(declare-fun res!811062 () Bool)

(assert (=> b!1221548 (=> (not res!811062) (not e!693727))))

(assert (=> b!1221548 (= res!811062 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38573 _keys!1208)))))

(declare-fun b!1221549 () Bool)

(assert (=> b!1221549 (= e!693727 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134211 (not res!811061)) b!1221548))

(assert (= (and b!1221548 res!811062) b!1221549))

(assert (=> d!134211 m!1126431))

(declare-fun m!1126675 () Bool)

(assert (=> b!1221549 m!1126675))

(assert (=> b!1221319 d!134211))

(declare-fun d!134213 () Bool)

(declare-fun lt!555382 () ListLongMap!18015)

(assert (=> d!134213 (not (contains!7053 lt!555382 k0!934))))

(declare-fun removeStrictlySorted!106 (List!26848 (_ BitVec 64)) List!26848)

(assert (=> d!134213 (= lt!555382 (ListLongMap!18016 (removeStrictlySorted!106 (toList!9023 lt!555238) k0!934)))))

(assert (=> d!134213 (= (-!1909 lt!555238 k0!934) lt!555382)))

(declare-fun bs!34378 () Bool)

(assert (= bs!34378 d!134213))

(declare-fun m!1126677 () Bool)

(assert (=> bs!34378 m!1126677))

(declare-fun m!1126679 () Bool)

(assert (=> bs!34378 m!1126679))

(assert (=> b!1221309 d!134213))

(declare-fun d!134215 () Bool)

(assert (=> d!134215 (= (validKeyInArray!0 (select (arr!38036 _keys!1208) from!1455)) (and (not (= (select (arr!38036 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38036 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221309 d!134215))

(declare-fun bm!60765 () Bool)

(declare-fun call!60769 () ListLongMap!18015)

(assert (=> bm!60765 (= call!60769 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221556 () Bool)

(declare-fun e!693732 () Bool)

(declare-fun call!60768 () ListLongMap!18015)

(assert (=> b!1221556 (= e!693732 (= call!60768 call!60769))))

(assert (=> b!1221556 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38574 _values!996)))))

(declare-fun b!1221557 () Bool)

(assert (=> b!1221557 (= e!693732 (= call!60768 (-!1909 call!60769 k0!934)))))

(assert (=> b!1221557 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38574 _values!996)))))

(declare-fun bm!60766 () Bool)

(assert (=> bm!60766 (= call!60768 (getCurrentListMapNoExtraKeys!5478 (array!78824 (store (arr!38036 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38573 _keys!1208)) (array!78826 (store (arr!38037 _values!996) i!673 (ValueCellFull!14792 (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38574 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221558 () Bool)

(declare-fun e!693733 () Bool)

(assert (=> b!1221558 (= e!693733 e!693732)))

(declare-fun c!120628 () Bool)

(assert (=> b!1221558 (= c!120628 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!134217 () Bool)

(assert (=> d!134217 e!693733))

(declare-fun res!811065 () Bool)

(assert (=> d!134217 (=> (not res!811065) (not e!693733))))

(assert (=> d!134217 (= res!811065 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38573 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38573 _keys!1208))))))))

(declare-fun lt!555385 () Unit!40404)

(declare-fun choose!1830 (array!78823 array!78825 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40404)

(assert (=> d!134217 (= lt!555385 (choose!1830 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134217 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 _keys!1208)))))

(assert (=> d!134217 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1124 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555385)))

(assert (= (and d!134217 res!811065) b!1221558))

(assert (= (and b!1221558 c!120628) b!1221557))

(assert (= (and b!1221558 (not c!120628)) b!1221556))

(assert (= (or b!1221557 b!1221556) bm!60765))

(assert (= (or b!1221557 b!1221556) bm!60766))

(declare-fun b_lambda!22137 () Bool)

(assert (=> (not b_lambda!22137) (not bm!60766)))

(assert (=> bm!60766 t!40118))

(declare-fun b_and!43809 () Bool)

(assert (= b_and!43807 (and (=> t!40118 result!22795) b_and!43809)))

(assert (=> bm!60765 m!1126421))

(declare-fun m!1126681 () Bool)

(assert (=> b!1221557 m!1126681))

(assert (=> bm!60766 m!1126381))

(assert (=> bm!60766 m!1126387))

(declare-fun m!1126683 () Bool)

(assert (=> bm!60766 m!1126683))

(declare-fun m!1126685 () Bool)

(assert (=> bm!60766 m!1126685))

(declare-fun m!1126687 () Bool)

(assert (=> d!134217 m!1126687))

(assert (=> b!1221309 d!134217))

(declare-fun b!1221559 () Bool)

(declare-fun e!693734 () Bool)

(declare-fun e!693738 () Bool)

(assert (=> b!1221559 (= e!693734 e!693738)))

(declare-fun c!120629 () Bool)

(assert (=> b!1221559 (= c!120629 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 _keys!1208)))))

(declare-fun d!134219 () Bool)

(declare-fun e!693735 () Bool)

(assert (=> d!134219 e!693735))

(declare-fun res!811067 () Bool)

(assert (=> d!134219 (=> (not res!811067) (not e!693735))))

(declare-fun lt!555388 () ListLongMap!18015)

(assert (=> d!134219 (= res!811067 (not (contains!7053 lt!555388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!693736 () ListLongMap!18015)

(assert (=> d!134219 (= lt!555388 e!693736)))

(declare-fun c!120632 () Bool)

(assert (=> d!134219 (= c!120632 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 _keys!1208)))))

(assert (=> d!134219 (validMask!0 mask!1564)))

(assert (=> d!134219 (= (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555388)))

(declare-fun b!1221560 () Bool)

(declare-fun lt!555392 () Unit!40404)

(declare-fun lt!555387 () Unit!40404)

(assert (=> b!1221560 (= lt!555392 lt!555387)))

(declare-fun lt!555386 () ListLongMap!18015)

(declare-fun lt!555390 () (_ BitVec 64))

(declare-fun lt!555389 () V!46465)

(declare-fun lt!555391 () (_ BitVec 64))

(assert (=> b!1221560 (not (contains!7053 (+!4132 lt!555386 (tuple2!20039 lt!555390 lt!555389)) lt!555391))))

(assert (=> b!1221560 (= lt!555387 (addStillNotContains!304 lt!555386 lt!555390 lt!555389 lt!555391))))

(assert (=> b!1221560 (= lt!555391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221560 (= lt!555389 (get!19444 (select (arr!38037 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221560 (= lt!555390 (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60770 () ListLongMap!18015)

(assert (=> b!1221560 (= lt!555386 call!60770)))

(declare-fun e!693740 () ListLongMap!18015)

(assert (=> b!1221560 (= e!693740 (+!4132 call!60770 (tuple2!20039 (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19444 (select (arr!38037 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221561 () Bool)

(assert (=> b!1221561 (= e!693738 (= lt!555388 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221562 () Bool)

(declare-fun res!811068 () Bool)

(assert (=> b!1221562 (=> (not res!811068) (not e!693735))))

(assert (=> b!1221562 (= res!811068 (not (contains!7053 lt!555388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221563 () Bool)

(assert (=> b!1221563 (= e!693736 (ListLongMap!18016 Nil!26845))))

(declare-fun b!1221564 () Bool)

(assert (=> b!1221564 (= e!693736 e!693740)))

(declare-fun c!120630 () Bool)

(assert (=> b!1221564 (= c!120630 (validKeyInArray!0 (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1221565 () Bool)

(declare-fun e!693739 () Bool)

(assert (=> b!1221565 (= e!693734 e!693739)))

(assert (=> b!1221565 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 _keys!1208)))))

(declare-fun res!811066 () Bool)

(assert (=> b!1221565 (= res!811066 (contains!7053 lt!555388 (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221565 (=> (not res!811066) (not e!693739))))

(declare-fun b!1221566 () Bool)

(assert (=> b!1221566 (= e!693740 call!60770)))

(declare-fun b!1221567 () Bool)

(assert (=> b!1221567 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 _keys!1208)))))

(assert (=> b!1221567 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38574 _values!996)))))

(assert (=> b!1221567 (= e!693739 (= (apply!983 lt!555388 (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19444 (select (arr!38037 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221568 () Bool)

(assert (=> b!1221568 (= e!693738 (isEmpty!1002 lt!555388))))

(declare-fun b!1221569 () Bool)

(assert (=> b!1221569 (= e!693735 e!693734)))

(declare-fun c!120631 () Bool)

(declare-fun e!693737 () Bool)

(assert (=> b!1221569 (= c!120631 e!693737)))

(declare-fun res!811069 () Bool)

(assert (=> b!1221569 (=> (not res!811069) (not e!693737))))

(assert (=> b!1221569 (= res!811069 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 _keys!1208)))))

(declare-fun bm!60767 () Bool)

(assert (=> bm!60767 (= call!60770 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221570 () Bool)

(assert (=> b!1221570 (= e!693737 (validKeyInArray!0 (select (arr!38036 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221570 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!134219 c!120632) b!1221563))

(assert (= (and d!134219 (not c!120632)) b!1221564))

(assert (= (and b!1221564 c!120630) b!1221560))

(assert (= (and b!1221564 (not c!120630)) b!1221566))

(assert (= (or b!1221560 b!1221566) bm!60767))

(assert (= (and d!134219 res!811067) b!1221562))

(assert (= (and b!1221562 res!811068) b!1221569))

(assert (= (and b!1221569 res!811069) b!1221570))

(assert (= (and b!1221569 c!120631) b!1221565))

(assert (= (and b!1221569 (not c!120631)) b!1221559))

(assert (= (and b!1221565 res!811066) b!1221567))

(assert (= (and b!1221559 c!120629) b!1221561))

(assert (= (and b!1221559 (not c!120629)) b!1221568))

(declare-fun b_lambda!22139 () Bool)

(assert (=> (not b_lambda!22139) (not b!1221560)))

(assert (=> b!1221560 t!40118))

(declare-fun b_and!43811 () Bool)

(assert (= b_and!43809 (and (=> t!40118 result!22795) b_and!43811)))

(declare-fun b_lambda!22141 () Bool)

(assert (=> (not b_lambda!22141) (not b!1221567)))

(assert (=> b!1221567 t!40118))

(declare-fun b_and!43813 () Bool)

(assert (= b_and!43811 (and (=> t!40118 result!22795) b_and!43813)))

(declare-fun m!1126689 () Bool)

(assert (=> b!1221560 m!1126689))

(declare-fun m!1126691 () Bool)

(assert (=> b!1221560 m!1126691))

(assert (=> b!1221560 m!1126387))

(declare-fun m!1126693 () Bool)

(assert (=> b!1221560 m!1126693))

(declare-fun m!1126695 () Bool)

(assert (=> b!1221560 m!1126695))

(declare-fun m!1126697 () Bool)

(assert (=> b!1221560 m!1126697))

(assert (=> b!1221560 m!1126691))

(assert (=> b!1221560 m!1126595))

(assert (=> b!1221560 m!1126697))

(declare-fun m!1126699 () Bool)

(assert (=> b!1221560 m!1126699))

(assert (=> b!1221560 m!1126387))

(assert (=> b!1221567 m!1126691))

(assert (=> b!1221567 m!1126387))

(assert (=> b!1221567 m!1126693))

(assert (=> b!1221567 m!1126691))

(assert (=> b!1221567 m!1126595))

(assert (=> b!1221567 m!1126595))

(declare-fun m!1126701 () Bool)

(assert (=> b!1221567 m!1126701))

(assert (=> b!1221567 m!1126387))

(assert (=> b!1221570 m!1126595))

(assert (=> b!1221570 m!1126595))

(declare-fun m!1126703 () Bool)

(assert (=> b!1221570 m!1126703))

(declare-fun m!1126705 () Bool)

(assert (=> d!134219 m!1126705))

(assert (=> d!134219 m!1126395))

(assert (=> b!1221564 m!1126595))

(assert (=> b!1221564 m!1126595))

(assert (=> b!1221564 m!1126703))

(declare-fun m!1126707 () Bool)

(assert (=> b!1221562 m!1126707))

(declare-fun m!1126709 () Bool)

(assert (=> bm!60767 m!1126709))

(assert (=> b!1221565 m!1126595))

(assert (=> b!1221565 m!1126595))

(declare-fun m!1126711 () Bool)

(assert (=> b!1221565 m!1126711))

(assert (=> b!1221561 m!1126709))

(declare-fun m!1126713 () Bool)

(assert (=> b!1221568 m!1126713))

(assert (=> b!1221309 d!134219))

(declare-fun b!1221571 () Bool)

(declare-fun e!693741 () Bool)

(declare-fun e!693745 () Bool)

(assert (=> b!1221571 (= e!693741 e!693745)))

(declare-fun c!120633 () Bool)

(assert (=> b!1221571 (= c!120633 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 lt!555241)))))

(declare-fun d!134221 () Bool)

(declare-fun e!693742 () Bool)

(assert (=> d!134221 e!693742))

(declare-fun res!811071 () Bool)

(assert (=> d!134221 (=> (not res!811071) (not e!693742))))

(declare-fun lt!555395 () ListLongMap!18015)

(assert (=> d!134221 (= res!811071 (not (contains!7053 lt!555395 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!693743 () ListLongMap!18015)

(assert (=> d!134221 (= lt!555395 e!693743)))

(declare-fun c!120636 () Bool)

(assert (=> d!134221 (= c!120636 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 lt!555241)))))

(assert (=> d!134221 (validMask!0 mask!1564)))

(assert (=> d!134221 (= (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555395)))

(declare-fun b!1221572 () Bool)

(declare-fun lt!555399 () Unit!40404)

(declare-fun lt!555394 () Unit!40404)

(assert (=> b!1221572 (= lt!555399 lt!555394)))

(declare-fun lt!555398 () (_ BitVec 64))

(declare-fun lt!555396 () V!46465)

(declare-fun lt!555397 () (_ BitVec 64))

(declare-fun lt!555393 () ListLongMap!18015)

(assert (=> b!1221572 (not (contains!7053 (+!4132 lt!555393 (tuple2!20039 lt!555397 lt!555396)) lt!555398))))

(assert (=> b!1221572 (= lt!555394 (addStillNotContains!304 lt!555393 lt!555397 lt!555396 lt!555398))))

(assert (=> b!1221572 (= lt!555398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221572 (= lt!555396 (get!19444 (select (arr!38037 lt!555237) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221572 (= lt!555397 (select (arr!38036 lt!555241) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60771 () ListLongMap!18015)

(assert (=> b!1221572 (= lt!555393 call!60771)))

(declare-fun e!693747 () ListLongMap!18015)

(assert (=> b!1221572 (= e!693747 (+!4132 call!60771 (tuple2!20039 (select (arr!38036 lt!555241) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19444 (select (arr!38037 lt!555237) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221573 () Bool)

(assert (=> b!1221573 (= e!693745 (= lt!555395 (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221574 () Bool)

(declare-fun res!811072 () Bool)

(assert (=> b!1221574 (=> (not res!811072) (not e!693742))))

(assert (=> b!1221574 (= res!811072 (not (contains!7053 lt!555395 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221575 () Bool)

(assert (=> b!1221575 (= e!693743 (ListLongMap!18016 Nil!26845))))

(declare-fun b!1221576 () Bool)

(assert (=> b!1221576 (= e!693743 e!693747)))

(declare-fun c!120634 () Bool)

(assert (=> b!1221576 (= c!120634 (validKeyInArray!0 (select (arr!38036 lt!555241) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1221577 () Bool)

(declare-fun e!693746 () Bool)

(assert (=> b!1221577 (= e!693741 e!693746)))

(assert (=> b!1221577 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 lt!555241)))))

(declare-fun res!811070 () Bool)

(assert (=> b!1221577 (= res!811070 (contains!7053 lt!555395 (select (arr!38036 lt!555241) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221577 (=> (not res!811070) (not e!693746))))

(declare-fun b!1221578 () Bool)

(assert (=> b!1221578 (= e!693747 call!60771)))

(declare-fun b!1221579 () Bool)

(assert (=> b!1221579 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 lt!555241)))))

(assert (=> b!1221579 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38574 lt!555237)))))

(assert (=> b!1221579 (= e!693746 (= (apply!983 lt!555395 (select (arr!38036 lt!555241) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19444 (select (arr!38037 lt!555237) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221580 () Bool)

(assert (=> b!1221580 (= e!693745 (isEmpty!1002 lt!555395))))

(declare-fun b!1221581 () Bool)

(assert (=> b!1221581 (= e!693742 e!693741)))

(declare-fun c!120635 () Bool)

(declare-fun e!693744 () Bool)

(assert (=> b!1221581 (= c!120635 e!693744)))

(declare-fun res!811073 () Bool)

(assert (=> b!1221581 (=> (not res!811073) (not e!693744))))

(assert (=> b!1221581 (= res!811073 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38573 lt!555241)))))

(declare-fun bm!60768 () Bool)

(assert (=> bm!60768 (= call!60771 (getCurrentListMapNoExtraKeys!5478 lt!555241 lt!555237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221582 () Bool)

(assert (=> b!1221582 (= e!693744 (validKeyInArray!0 (select (arr!38036 lt!555241) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221582 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!134221 c!120636) b!1221575))

(assert (= (and d!134221 (not c!120636)) b!1221576))

(assert (= (and b!1221576 c!120634) b!1221572))

(assert (= (and b!1221576 (not c!120634)) b!1221578))

(assert (= (or b!1221572 b!1221578) bm!60768))

(assert (= (and d!134221 res!811071) b!1221574))

(assert (= (and b!1221574 res!811072) b!1221581))

(assert (= (and b!1221581 res!811073) b!1221582))

(assert (= (and b!1221581 c!120635) b!1221577))

(assert (= (and b!1221581 (not c!120635)) b!1221571))

(assert (= (and b!1221577 res!811070) b!1221579))

(assert (= (and b!1221571 c!120633) b!1221573))

(assert (= (and b!1221571 (not c!120633)) b!1221580))

(declare-fun b_lambda!22143 () Bool)

(assert (=> (not b_lambda!22143) (not b!1221572)))

(assert (=> b!1221572 t!40118))

(declare-fun b_and!43815 () Bool)

(assert (= b_and!43813 (and (=> t!40118 result!22795) b_and!43815)))

(declare-fun b_lambda!22145 () Bool)

(assert (=> (not b_lambda!22145) (not b!1221579)))

(assert (=> b!1221579 t!40118))

(declare-fun b_and!43817 () Bool)

(assert (= b_and!43815 (and (=> t!40118 result!22795) b_and!43817)))

(declare-fun m!1126715 () Bool)

(assert (=> b!1221572 m!1126715))

(declare-fun m!1126717 () Bool)

(assert (=> b!1221572 m!1126717))

(assert (=> b!1221572 m!1126387))

(declare-fun m!1126719 () Bool)

(assert (=> b!1221572 m!1126719))

(declare-fun m!1126721 () Bool)

(assert (=> b!1221572 m!1126721))

(declare-fun m!1126723 () Bool)

(assert (=> b!1221572 m!1126723))

(assert (=> b!1221572 m!1126717))

(declare-fun m!1126725 () Bool)

(assert (=> b!1221572 m!1126725))

(assert (=> b!1221572 m!1126723))

(declare-fun m!1126727 () Bool)

(assert (=> b!1221572 m!1126727))

(assert (=> b!1221572 m!1126387))

(assert (=> b!1221579 m!1126717))

(assert (=> b!1221579 m!1126387))

(assert (=> b!1221579 m!1126719))

(assert (=> b!1221579 m!1126717))

(assert (=> b!1221579 m!1126725))

(assert (=> b!1221579 m!1126725))

(declare-fun m!1126729 () Bool)

(assert (=> b!1221579 m!1126729))

(assert (=> b!1221579 m!1126387))

(assert (=> b!1221582 m!1126725))

(assert (=> b!1221582 m!1126725))

(declare-fun m!1126731 () Bool)

(assert (=> b!1221582 m!1126731))

(declare-fun m!1126733 () Bool)

(assert (=> d!134221 m!1126733))

(assert (=> d!134221 m!1126395))

(assert (=> b!1221576 m!1126725))

(assert (=> b!1221576 m!1126725))

(assert (=> b!1221576 m!1126731))

(declare-fun m!1126735 () Bool)

(assert (=> b!1221574 m!1126735))

(declare-fun m!1126737 () Bool)

(assert (=> bm!60768 m!1126737))

(assert (=> b!1221577 m!1126725))

(assert (=> b!1221577 m!1126725))

(declare-fun m!1126739 () Bool)

(assert (=> b!1221577 m!1126739))

(assert (=> b!1221573 m!1126737))

(declare-fun m!1126741 () Bool)

(assert (=> b!1221580 m!1126741))

(assert (=> b!1221309 d!134221))

(declare-fun bm!60769 () Bool)

(declare-fun call!60772 () Bool)

(declare-fun c!120637 () Bool)

(assert (=> bm!60769 (= call!60772 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120637 (Cons!26845 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000) Nil!26846) Nil!26846)))))

(declare-fun d!134223 () Bool)

(declare-fun res!811074 () Bool)

(declare-fun e!693748 () Bool)

(assert (=> d!134223 (=> res!811074 e!693748)))

(assert (=> d!134223 (= res!811074 (bvsge #b00000000000000000000000000000000 (size!38573 _keys!1208)))))

(assert (=> d!134223 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26846) e!693748)))

(declare-fun b!1221583 () Bool)

(declare-fun e!693749 () Bool)

(declare-fun e!693751 () Bool)

(assert (=> b!1221583 (= e!693749 e!693751)))

(assert (=> b!1221583 (= c!120637 (validKeyInArray!0 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221584 () Bool)

(assert (=> b!1221584 (= e!693748 e!693749)))

(declare-fun res!811076 () Bool)

(assert (=> b!1221584 (=> (not res!811076) (not e!693749))))

(declare-fun e!693750 () Bool)

(assert (=> b!1221584 (= res!811076 (not e!693750))))

(declare-fun res!811075 () Bool)

(assert (=> b!1221584 (=> (not res!811075) (not e!693750))))

(assert (=> b!1221584 (= res!811075 (validKeyInArray!0 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221585 () Bool)

(assert (=> b!1221585 (= e!693751 call!60772)))

(declare-fun b!1221586 () Bool)

(assert (=> b!1221586 (= e!693750 (contains!7052 Nil!26846 (select (arr!38036 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221587 () Bool)

(assert (=> b!1221587 (= e!693751 call!60772)))

(assert (= (and d!134223 (not res!811074)) b!1221584))

(assert (= (and b!1221584 res!811075) b!1221586))

(assert (= (and b!1221584 res!811076) b!1221583))

(assert (= (and b!1221583 c!120637) b!1221587))

(assert (= (and b!1221583 (not c!120637)) b!1221585))

(assert (= (or b!1221587 b!1221585) bm!60769))

(assert (=> bm!60769 m!1126577))

(declare-fun m!1126743 () Bool)

(assert (=> bm!60769 m!1126743))

(assert (=> b!1221583 m!1126577))

(assert (=> b!1221583 m!1126577))

(assert (=> b!1221583 m!1126587))

(assert (=> b!1221584 m!1126577))

(assert (=> b!1221584 m!1126577))

(assert (=> b!1221584 m!1126587))

(assert (=> b!1221586 m!1126577))

(assert (=> b!1221586 m!1126577))

(declare-fun m!1126745 () Bool)

(assert (=> b!1221586 m!1126745))

(assert (=> b!1221310 d!134223))

(declare-fun d!134225 () Bool)

(assert (=> d!134225 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1221320 d!134225))

(declare-fun b!1221594 () Bool)

(declare-fun e!693757 () Bool)

(assert (=> b!1221594 (= e!693757 tp_is_empty!31003)))

(declare-fun b!1221595 () Bool)

(declare-fun e!693756 () Bool)

(assert (=> b!1221595 (= e!693756 tp_is_empty!31003)))

(declare-fun condMapEmpty!48400 () Bool)

(declare-fun mapDefault!48400 () ValueCell!14792)

(assert (=> mapNonEmpty!48391 (= condMapEmpty!48400 (= mapRest!48391 ((as const (Array (_ BitVec 32) ValueCell!14792)) mapDefault!48400)))))

(declare-fun mapRes!48400 () Bool)

(assert (=> mapNonEmpty!48391 (= tp!91931 (and e!693756 mapRes!48400))))

(declare-fun mapNonEmpty!48400 () Bool)

(declare-fun tp!91946 () Bool)

(assert (=> mapNonEmpty!48400 (= mapRes!48400 (and tp!91946 e!693757))))

(declare-fun mapValue!48400 () ValueCell!14792)

(declare-fun mapKey!48400 () (_ BitVec 32))

(declare-fun mapRest!48400 () (Array (_ BitVec 32) ValueCell!14792))

(assert (=> mapNonEmpty!48400 (= mapRest!48391 (store mapRest!48400 mapKey!48400 mapValue!48400))))

(declare-fun mapIsEmpty!48400 () Bool)

(assert (=> mapIsEmpty!48400 mapRes!48400))

(assert (= (and mapNonEmpty!48391 condMapEmpty!48400) mapIsEmpty!48400))

(assert (= (and mapNonEmpty!48391 (not condMapEmpty!48400)) mapNonEmpty!48400))

(assert (= (and mapNonEmpty!48400 ((_ is ValueCellFull!14792) mapValue!48400)) b!1221594))

(assert (= (and mapNonEmpty!48391 ((_ is ValueCellFull!14792) mapDefault!48400)) b!1221595))

(declare-fun m!1126747 () Bool)

(assert (=> mapNonEmpty!48400 m!1126747))

(declare-fun b_lambda!22147 () Bool)

(assert (= b_lambda!22145 (or (and start!101718 b_free!26299) b_lambda!22147)))

(declare-fun b_lambda!22149 () Bool)

(assert (= b_lambda!22139 (or (and start!101718 b_free!26299) b_lambda!22149)))

(declare-fun b_lambda!22151 () Bool)

(assert (= b_lambda!22135 (or (and start!101718 b_free!26299) b_lambda!22151)))

(declare-fun b_lambda!22153 () Bool)

(assert (= b_lambda!22129 (or (and start!101718 b_free!26299) b_lambda!22153)))

(declare-fun b_lambda!22155 () Bool)

(assert (= b_lambda!22133 (or (and start!101718 b_free!26299) b_lambda!22155)))

(declare-fun b_lambda!22157 () Bool)

(assert (= b_lambda!22143 (or (and start!101718 b_free!26299) b_lambda!22157)))

(declare-fun b_lambda!22159 () Bool)

(assert (= b_lambda!22131 (or (and start!101718 b_free!26299) b_lambda!22159)))

(declare-fun b_lambda!22161 () Bool)

(assert (= b_lambda!22141 (or (and start!101718 b_free!26299) b_lambda!22161)))

(declare-fun b_lambda!22163 () Bool)

(assert (= b_lambda!22137 (or (and start!101718 b_free!26299) b_lambda!22163)))

(check-sat (not b!1221582) b_and!43817 (not b!1221580) (not bm!60752) (not bm!60758) (not bm!60765) (not b!1221573) (not b!1221549) (not b!1221546) (not b!1221565) (not b!1221574) (not b!1221485) (not b!1221577) (not b!1221531) (not d!134191) (not bm!60751) (not d!134193) (not b!1221538) (not b!1221537) (not b_lambda!22149) (not b!1221567) (not d!134213) (not d!134221) (not b!1221534) (not mapNonEmpty!48400) (not b!1221526) (not b_lambda!22163) (not b!1221522) (not bm!60768) (not b_lambda!22161) (not b!1221572) (not b!1221562) (not b_next!26299) (not b!1221470) (not b_lambda!22157) (not b!1221579) (not b!1221486) (not b!1221520) (not b!1221540) (not b!1221480) (not d!134197) (not b!1221471) (not b!1221564) (not b!1221458) (not d!134187) (not b_lambda!22159) (not bm!60769) (not b!1221544) (not b!1221518) (not b_lambda!22147) (not b!1221560) (not b_lambda!22153) (not b!1221568) (not b!1221584) (not b!1221525) (not d!134217) (not b!1221561) (not b!1221491) (not b!1221542) (not bm!60766) (not b!1221543) (not b!1221570) (not b!1221492) (not b!1221583) (not b!1221557) (not b!1221473) (not bm!60755) (not b!1221576) (not bm!60759) (not b_lambda!22155) (not b!1221532) (not b!1221523) (not d!134219) (not b!1221519) (not b!1221528) (not b_lambda!22151) tp_is_empty!31003 (not b_lambda!22127) (not d!134203) (not bm!60760) (not b!1221535) (not b!1221457) (not b!1221453) (not d!134199) (not b!1221586) (not b!1221530) (not b!1221454) (not bm!60767))
(check-sat b_and!43817 (not b_next!26299))
