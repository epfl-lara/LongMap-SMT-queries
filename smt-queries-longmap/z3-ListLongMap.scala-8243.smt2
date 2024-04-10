; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100408 () Bool)

(assert start!100408)

(declare-fun b_free!25731 () Bool)

(declare-fun b_next!25731 () Bool)

(assert (=> start!100408 (= b_free!25731 (not b_next!25731))))

(declare-fun tp!90183 () Bool)

(declare-fun b_and!42349 () Bool)

(assert (=> start!100408 (= tp!90183 b_and!42349)))

(declare-fun b!1198484 () Bool)

(declare-fun res!797644 () Bool)

(declare-fun e!680794 () Bool)

(assert (=> b!1198484 (=> (not res!797644) (not e!680794))))

(declare-datatypes ((array!77649 0))(
  ( (array!77650 (arr!37469 (Array (_ BitVec 32) (_ BitVec 64))) (size!38005 (_ BitVec 32))) )
))
(declare-fun lt!543508 () array!77649)

(declare-datatypes ((List!26359 0))(
  ( (Nil!26356) (Cons!26355 (h!27564 (_ BitVec 64)) (t!39070 List!26359)) )
))
(declare-fun arrayNoDuplicates!0 (array!77649 (_ BitVec 32) List!26359) Bool)

(assert (=> b!1198484 (= res!797644 (arrayNoDuplicates!0 lt!543508 #b00000000000000000000000000000000 Nil!26356))))

(declare-fun b!1198485 () Bool)

(declare-fun e!680791 () Bool)

(assert (=> b!1198485 (= e!680794 (not e!680791))))

(declare-fun res!797646 () Bool)

(assert (=> b!1198485 (=> res!797646 e!680791)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198485 (= res!797646 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!77649)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198485 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39736 0))(
  ( (Unit!39737) )
))
(declare-fun lt!543511 () Unit!39736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77649 (_ BitVec 64) (_ BitVec 32)) Unit!39736)

(assert (=> b!1198485 (= lt!543511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198486 () Bool)

(declare-fun res!797642 () Bool)

(declare-fun e!680788 () Bool)

(assert (=> b!1198486 (=> (not res!797642) (not e!680788))))

(assert (=> b!1198486 (= res!797642 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38005 _keys!1208))))))

(declare-fun b!1198487 () Bool)

(declare-fun res!797641 () Bool)

(assert (=> b!1198487 (=> (not res!797641) (not e!680788))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77649 (_ BitVec 32)) Bool)

(assert (=> b!1198487 (= res!797641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198488 () Bool)

(declare-fun res!797648 () Bool)

(assert (=> b!1198488 (=> (not res!797648) (not e!680788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198488 (= res!797648 (validMask!0 mask!1564))))

(declare-fun b!1198489 () Bool)

(declare-fun res!797645 () Bool)

(assert (=> b!1198489 (=> (not res!797645) (not e!680788))))

(assert (=> b!1198489 (= res!797645 (= (select (arr!37469 _keys!1208) i!673) k0!934))))

(declare-fun b!1198490 () Bool)

(declare-fun e!680792 () Bool)

(declare-fun tp_is_empty!30435 () Bool)

(assert (=> b!1198490 (= e!680792 tp_is_empty!30435)))

(declare-fun b!1198491 () Bool)

(declare-fun res!797640 () Bool)

(assert (=> b!1198491 (=> (not res!797640) (not e!680788))))

(declare-datatypes ((V!45707 0))(
  ( (V!45708 (val!15274 Int)) )
))
(declare-datatypes ((ValueCell!14508 0))(
  ( (ValueCellFull!14508 (v!17912 V!45707)) (EmptyCell!14508) )
))
(declare-datatypes ((array!77651 0))(
  ( (array!77652 (arr!37470 (Array (_ BitVec 32) ValueCell!14508)) (size!38006 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77651)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198491 (= res!797640 (and (= (size!38006 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38005 _keys!1208) (size!38006 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47495 () Bool)

(declare-fun mapRes!47495 () Bool)

(declare-fun tp!90182 () Bool)

(declare-fun e!680789 () Bool)

(assert (=> mapNonEmpty!47495 (= mapRes!47495 (and tp!90182 e!680789))))

(declare-fun mapValue!47495 () ValueCell!14508)

(declare-fun mapRest!47495 () (Array (_ BitVec 32) ValueCell!14508))

(declare-fun mapKey!47495 () (_ BitVec 32))

(assert (=> mapNonEmpty!47495 (= (arr!37470 _values!996) (store mapRest!47495 mapKey!47495 mapValue!47495))))

(declare-fun res!797649 () Bool)

(assert (=> start!100408 (=> (not res!797649) (not e!680788))))

(assert (=> start!100408 (= res!797649 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38005 _keys!1208))))))

(assert (=> start!100408 e!680788))

(assert (=> start!100408 tp_is_empty!30435))

(declare-fun array_inv!28556 (array!77649) Bool)

(assert (=> start!100408 (array_inv!28556 _keys!1208)))

(assert (=> start!100408 true))

(assert (=> start!100408 tp!90183))

(declare-fun e!680790 () Bool)

(declare-fun array_inv!28557 (array!77651) Bool)

(assert (=> start!100408 (and (array_inv!28557 _values!996) e!680790)))

(declare-fun mapIsEmpty!47495 () Bool)

(assert (=> mapIsEmpty!47495 mapRes!47495))

(declare-fun b!1198492 () Bool)

(declare-fun res!797643 () Bool)

(assert (=> b!1198492 (=> (not res!797643) (not e!680788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198492 (= res!797643 (validKeyInArray!0 k0!934))))

(declare-fun b!1198493 () Bool)

(assert (=> b!1198493 (= e!680790 (and e!680792 mapRes!47495))))

(declare-fun condMapEmpty!47495 () Bool)

(declare-fun mapDefault!47495 () ValueCell!14508)

(assert (=> b!1198493 (= condMapEmpty!47495 (= (arr!37470 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14508)) mapDefault!47495)))))

(declare-fun b!1198494 () Bool)

(assert (=> b!1198494 (= e!680788 e!680794)))

(declare-fun res!797647 () Bool)

(assert (=> b!1198494 (=> (not res!797647) (not e!680794))))

(assert (=> b!1198494 (= res!797647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543508 mask!1564))))

(assert (=> b!1198494 (= lt!543508 (array!77650 (store (arr!37469 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38005 _keys!1208)))))

(declare-fun b!1198495 () Bool)

(declare-fun res!797639 () Bool)

(assert (=> b!1198495 (=> (not res!797639) (not e!680788))))

(assert (=> b!1198495 (= res!797639 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26356))))

(declare-fun b!1198496 () Bool)

(assert (=> b!1198496 (= e!680791 (or (not (= from!1455 i!673)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38005 _keys!1208)))))))

(declare-fun zeroValue!944 () V!45707)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45707)

(declare-datatypes ((tuple2!19542 0))(
  ( (tuple2!19543 (_1!9782 (_ BitVec 64)) (_2!9782 V!45707)) )
))
(declare-datatypes ((List!26360 0))(
  ( (Nil!26357) (Cons!26356 (h!27565 tuple2!19542) (t!39071 List!26360)) )
))
(declare-datatypes ((ListLongMap!17511 0))(
  ( (ListLongMap!17512 (toList!8771 List!26360)) )
))
(declare-fun lt!543510 () ListLongMap!17511)

(declare-fun getCurrentListMapNoExtraKeys!5210 (array!77649 array!77651 (_ BitVec 32) (_ BitVec 32) V!45707 V!45707 (_ BitVec 32) Int) ListLongMap!17511)

(declare-fun dynLambda!3130 (Int (_ BitVec 64)) V!45707)

(assert (=> b!1198496 (= lt!543510 (getCurrentListMapNoExtraKeys!5210 lt!543508 (array!77652 (store (arr!37470 _values!996) i!673 (ValueCellFull!14508 (dynLambda!3130 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38006 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543509 () ListLongMap!17511)

(assert (=> b!1198496 (= lt!543509 (getCurrentListMapNoExtraKeys!5210 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198497 () Bool)

(assert (=> b!1198497 (= e!680789 tp_is_empty!30435)))

(assert (= (and start!100408 res!797649) b!1198488))

(assert (= (and b!1198488 res!797648) b!1198491))

(assert (= (and b!1198491 res!797640) b!1198487))

(assert (= (and b!1198487 res!797641) b!1198495))

(assert (= (and b!1198495 res!797639) b!1198486))

(assert (= (and b!1198486 res!797642) b!1198492))

(assert (= (and b!1198492 res!797643) b!1198489))

(assert (= (and b!1198489 res!797645) b!1198494))

(assert (= (and b!1198494 res!797647) b!1198484))

(assert (= (and b!1198484 res!797644) b!1198485))

(assert (= (and b!1198485 (not res!797646)) b!1198496))

(assert (= (and b!1198493 condMapEmpty!47495) mapIsEmpty!47495))

(assert (= (and b!1198493 (not condMapEmpty!47495)) mapNonEmpty!47495))

(get-info :version)

(assert (= (and mapNonEmpty!47495 ((_ is ValueCellFull!14508) mapValue!47495)) b!1198497))

(assert (= (and b!1198493 ((_ is ValueCellFull!14508) mapDefault!47495)) b!1198490))

(assert (= start!100408 b!1198493))

(declare-fun b_lambda!20927 () Bool)

(assert (=> (not b_lambda!20927) (not b!1198496)))

(declare-fun t!39069 () Bool)

(declare-fun tb!10531 () Bool)

(assert (=> (and start!100408 (= defaultEntry!1004 defaultEntry!1004) t!39069) tb!10531))

(declare-fun result!21639 () Bool)

(assert (=> tb!10531 (= result!21639 tp_is_empty!30435)))

(assert (=> b!1198496 t!39069))

(declare-fun b_and!42351 () Bool)

(assert (= b_and!42349 (and (=> t!39069 result!21639) b_and!42351)))

(declare-fun m!1105239 () Bool)

(assert (=> b!1198484 m!1105239))

(declare-fun m!1105241 () Bool)

(assert (=> b!1198485 m!1105241))

(declare-fun m!1105243 () Bool)

(assert (=> b!1198485 m!1105243))

(declare-fun m!1105245 () Bool)

(assert (=> b!1198487 m!1105245))

(declare-fun m!1105247 () Bool)

(assert (=> b!1198495 m!1105247))

(declare-fun m!1105249 () Bool)

(assert (=> b!1198489 m!1105249))

(declare-fun m!1105251 () Bool)

(assert (=> b!1198496 m!1105251))

(declare-fun m!1105253 () Bool)

(assert (=> b!1198496 m!1105253))

(declare-fun m!1105255 () Bool)

(assert (=> b!1198496 m!1105255))

(declare-fun m!1105257 () Bool)

(assert (=> b!1198496 m!1105257))

(declare-fun m!1105259 () Bool)

(assert (=> b!1198494 m!1105259))

(declare-fun m!1105261 () Bool)

(assert (=> b!1198494 m!1105261))

(declare-fun m!1105263 () Bool)

(assert (=> start!100408 m!1105263))

(declare-fun m!1105265 () Bool)

(assert (=> start!100408 m!1105265))

(declare-fun m!1105267 () Bool)

(assert (=> mapNonEmpty!47495 m!1105267))

(declare-fun m!1105269 () Bool)

(assert (=> b!1198488 m!1105269))

(declare-fun m!1105271 () Bool)

(assert (=> b!1198492 m!1105271))

(check-sat (not b_lambda!20927) (not b_next!25731) (not b!1198488) tp_is_empty!30435 b_and!42351 (not mapNonEmpty!47495) (not b!1198484) (not b!1198494) (not b!1198495) (not b!1198496) (not b!1198485) (not b!1198492) (not start!100408) (not b!1198487))
(check-sat b_and!42351 (not b_next!25731))
