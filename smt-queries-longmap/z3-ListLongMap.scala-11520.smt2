; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134112 () Bool)

(assert start!134112)

(declare-fun b_free!32223 () Bool)

(declare-fun b_next!32223 () Bool)

(assert (=> start!134112 (= b_free!32223 (not b_next!32223))))

(declare-fun tp!113990 () Bool)

(declare-fun b_and!51871 () Bool)

(assert (=> start!134112 (= tp!113990 b_and!51871)))

(declare-fun b!1567397 () Bool)

(declare-fun res!1071231 () Bool)

(declare-fun e!873715 () Bool)

(assert (=> b!1567397 (=> (not res!1071231) (not e!873715))))

(declare-datatypes ((array!104696 0))(
  ( (array!104697 (arr!50532 (Array (_ BitVec 32) (_ BitVec 64))) (size!51082 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104696)

(declare-datatypes ((V!60211 0))(
  ( (V!60212 (val!19585 Int)) )
))
(declare-datatypes ((ValueCell!18471 0))(
  ( (ValueCellFull!18471 (v!22345 V!60211)) (EmptyCell!18471) )
))
(declare-datatypes ((array!104698 0))(
  ( (array!104699 (arr!50533 (Array (_ BitVec 32) ValueCell!18471)) (size!51083 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104698)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1567397 (= res!1071231 (and (= (size!51083 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51082 _keys!637) (size!51083 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1071232 () Bool)

(assert (=> start!134112 (=> (not res!1071232) (not e!873715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134112 (= res!1071232 (validMask!0 mask!947))))

(assert (=> start!134112 e!873715))

(assert (=> start!134112 tp!113990))

(declare-fun tp_is_empty!39003 () Bool)

(assert (=> start!134112 tp_is_empty!39003))

(assert (=> start!134112 true))

(declare-fun array_inv!39259 (array!104696) Bool)

(assert (=> start!134112 (array_inv!39259 _keys!637)))

(declare-fun e!873714 () Bool)

(declare-fun array_inv!39260 (array!104698) Bool)

(assert (=> start!134112 (and (array_inv!39260 _values!487) e!873714)))

(declare-fun mapNonEmpty!59907 () Bool)

(declare-fun mapRes!59907 () Bool)

(declare-fun tp!113991 () Bool)

(declare-fun e!873713 () Bool)

(assert (=> mapNonEmpty!59907 (= mapRes!59907 (and tp!113991 e!873713))))

(declare-fun mapKey!59907 () (_ BitVec 32))

(declare-fun mapValue!59907 () ValueCell!18471)

(declare-fun mapRest!59907 () (Array (_ BitVec 32) ValueCell!18471))

(assert (=> mapNonEmpty!59907 (= (arr!50533 _values!487) (store mapRest!59907 mapKey!59907 mapValue!59907))))

(declare-fun b!1567398 () Bool)

(declare-fun e!873716 () Bool)

(declare-datatypes ((tuple2!25272 0))(
  ( (tuple2!25273 (_1!12647 (_ BitVec 64)) (_2!12647 V!60211)) )
))
(declare-datatypes ((List!36658 0))(
  ( (Nil!36655) (Cons!36654 (h!38101 tuple2!25272) (t!51564 List!36658)) )
))
(declare-datatypes ((ListLongMap!22707 0))(
  ( (ListLongMap!22708 (toList!11369 List!36658)) )
))
(declare-fun lt!672936 () ListLongMap!22707)

(declare-fun contains!10364 (ListLongMap!22707 (_ BitVec 64)) Bool)

(assert (=> b!1567398 (= e!873716 (contains!10364 lt!672936 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567399 () Bool)

(assert (=> b!1567399 (= e!873713 tp_is_empty!39003)))

(declare-fun b!1567400 () Bool)

(declare-fun res!1071233 () Bool)

(assert (=> b!1567400 (=> (not res!1071233) (not e!873715))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1567400 (= res!1071233 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51082 _keys!637)) (bvslt from!782 (size!51082 _keys!637))))))

(declare-fun b!1567401 () Bool)

(assert (=> b!1567401 (= e!873715 e!873716)))

(declare-fun res!1071229 () Bool)

(assert (=> b!1567401 (=> res!1071229 e!873716)))

(assert (=> b!1567401 (= res!1071229 (contains!10364 lt!672936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60211)

(declare-fun minValue!453 () V!60211)

(declare-fun getCurrentListMapNoExtraKeys!6734 (array!104696 array!104698 (_ BitVec 32) (_ BitVec 32) V!60211 V!60211 (_ BitVec 32) Int) ListLongMap!22707)

(assert (=> b!1567401 (= lt!672936 (getCurrentListMapNoExtraKeys!6734 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567402 () Bool)

(declare-fun e!873717 () Bool)

(assert (=> b!1567402 (= e!873717 tp_is_empty!39003)))

(declare-fun b!1567403 () Bool)

(declare-fun res!1071228 () Bool)

(assert (=> b!1567403 (=> (not res!1071228) (not e!873715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567403 (= res!1071228 (not (validKeyInArray!0 (select (arr!50532 _keys!637) from!782))))))

(declare-fun mapIsEmpty!59907 () Bool)

(assert (=> mapIsEmpty!59907 mapRes!59907))

(declare-fun b!1567404 () Bool)

(declare-fun res!1071227 () Bool)

(assert (=> b!1567404 (=> (not res!1071227) (not e!873715))))

(declare-datatypes ((List!36659 0))(
  ( (Nil!36656) (Cons!36655 (h!38102 (_ BitVec 64)) (t!51565 List!36659)) )
))
(declare-fun arrayNoDuplicates!0 (array!104696 (_ BitVec 32) List!36659) Bool)

(assert (=> b!1567404 (= res!1071227 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36656))))

(declare-fun b!1567405 () Bool)

(declare-fun res!1071230 () Bool)

(assert (=> b!1567405 (=> (not res!1071230) (not e!873715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104696 (_ BitVec 32)) Bool)

(assert (=> b!1567405 (= res!1071230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567406 () Bool)

(assert (=> b!1567406 (= e!873714 (and e!873717 mapRes!59907))))

(declare-fun condMapEmpty!59907 () Bool)

(declare-fun mapDefault!59907 () ValueCell!18471)

(assert (=> b!1567406 (= condMapEmpty!59907 (= (arr!50533 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18471)) mapDefault!59907)))))

(assert (= (and start!134112 res!1071232) b!1567397))

(assert (= (and b!1567397 res!1071231) b!1567405))

(assert (= (and b!1567405 res!1071230) b!1567404))

(assert (= (and b!1567404 res!1071227) b!1567400))

(assert (= (and b!1567400 res!1071233) b!1567403))

(assert (= (and b!1567403 res!1071228) b!1567401))

(assert (= (and b!1567401 (not res!1071229)) b!1567398))

(assert (= (and b!1567406 condMapEmpty!59907) mapIsEmpty!59907))

(assert (= (and b!1567406 (not condMapEmpty!59907)) mapNonEmpty!59907))

(get-info :version)

(assert (= (and mapNonEmpty!59907 ((_ is ValueCellFull!18471) mapValue!59907)) b!1567399))

(assert (= (and b!1567406 ((_ is ValueCellFull!18471) mapDefault!59907)) b!1567402))

(assert (= start!134112 b!1567406))

(declare-fun m!1442263 () Bool)

(assert (=> b!1567398 m!1442263))

(declare-fun m!1442265 () Bool)

(assert (=> b!1567403 m!1442265))

(assert (=> b!1567403 m!1442265))

(declare-fun m!1442267 () Bool)

(assert (=> b!1567403 m!1442267))

(declare-fun m!1442269 () Bool)

(assert (=> b!1567404 m!1442269))

(declare-fun m!1442271 () Bool)

(assert (=> mapNonEmpty!59907 m!1442271))

(declare-fun m!1442273 () Bool)

(assert (=> b!1567401 m!1442273))

(declare-fun m!1442275 () Bool)

(assert (=> b!1567401 m!1442275))

(declare-fun m!1442277 () Bool)

(assert (=> b!1567405 m!1442277))

(declare-fun m!1442279 () Bool)

(assert (=> start!134112 m!1442279))

(declare-fun m!1442281 () Bool)

(assert (=> start!134112 m!1442281))

(declare-fun m!1442283 () Bool)

(assert (=> start!134112 m!1442283))

(check-sat b_and!51871 (not start!134112) (not b!1567401) (not b!1567398) (not mapNonEmpty!59907) (not b!1567404) (not b_next!32223) (not b!1567405) (not b!1567403) tp_is_empty!39003)
(check-sat b_and!51871 (not b_next!32223))
(get-model)

(declare-fun d!163569 () Bool)

(declare-fun e!873741 () Bool)

(assert (=> d!163569 e!873741))

(declare-fun res!1071257 () Bool)

(assert (=> d!163569 (=> res!1071257 e!873741)))

(declare-fun lt!672949 () Bool)

(assert (=> d!163569 (= res!1071257 (not lt!672949))))

(declare-fun lt!672951 () Bool)

(assert (=> d!163569 (= lt!672949 lt!672951)))

(declare-datatypes ((Unit!52059 0))(
  ( (Unit!52060) )
))
(declare-fun lt!672948 () Unit!52059)

(declare-fun e!873740 () Unit!52059)

(assert (=> d!163569 (= lt!672948 e!873740)))

(declare-fun c!144488 () Bool)

(assert (=> d!163569 (= c!144488 lt!672951)))

(declare-fun containsKey!853 (List!36658 (_ BitVec 64)) Bool)

(assert (=> d!163569 (= lt!672951 (containsKey!853 (toList!11369 lt!672936) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163569 (= (contains!10364 lt!672936 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672949)))

(declare-fun b!1567443 () Bool)

(declare-fun lt!672950 () Unit!52059)

(assert (=> b!1567443 (= e!873740 lt!672950)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!536 (List!36658 (_ BitVec 64)) Unit!52059)

(assert (=> b!1567443 (= lt!672950 (lemmaContainsKeyImpliesGetValueByKeyDefined!536 (toList!11369 lt!672936) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!871 0))(
  ( (Some!870 (v!22347 V!60211)) (None!869) )
))
(declare-fun isDefined!584 (Option!871) Bool)

(declare-fun getValueByKey!795 (List!36658 (_ BitVec 64)) Option!871)

(assert (=> b!1567443 (isDefined!584 (getValueByKey!795 (toList!11369 lt!672936) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567444 () Bool)

(declare-fun Unit!52061 () Unit!52059)

(assert (=> b!1567444 (= e!873740 Unit!52061)))

(declare-fun b!1567445 () Bool)

(assert (=> b!1567445 (= e!873741 (isDefined!584 (getValueByKey!795 (toList!11369 lt!672936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163569 c!144488) b!1567443))

(assert (= (and d!163569 (not c!144488)) b!1567444))

(assert (= (and d!163569 (not res!1071257)) b!1567445))

(declare-fun m!1442307 () Bool)

(assert (=> d!163569 m!1442307))

(declare-fun m!1442309 () Bool)

(assert (=> b!1567443 m!1442309))

(declare-fun m!1442311 () Bool)

(assert (=> b!1567443 m!1442311))

(assert (=> b!1567443 m!1442311))

(declare-fun m!1442313 () Bool)

(assert (=> b!1567443 m!1442313))

(assert (=> b!1567445 m!1442311))

(assert (=> b!1567445 m!1442311))

(assert (=> b!1567445 m!1442313))

(assert (=> b!1567398 d!163569))

(declare-fun d!163571 () Bool)

(assert (=> d!163571 (= (validKeyInArray!0 (select (arr!50532 _keys!637) from!782)) (and (not (= (select (arr!50532 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50532 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567403 d!163571))

(declare-fun b!1567456 () Bool)

(declare-fun e!873753 () Bool)

(declare-fun contains!10366 (List!36659 (_ BitVec 64)) Bool)

(assert (=> b!1567456 (= e!873753 (contains!10366 Nil!36656 (select (arr!50532 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567458 () Bool)

(declare-fun e!873750 () Bool)

(declare-fun e!873752 () Bool)

(assert (=> b!1567458 (= e!873750 e!873752)))

(declare-fun res!1071264 () Bool)

(assert (=> b!1567458 (=> (not res!1071264) (not e!873752))))

(assert (=> b!1567458 (= res!1071264 (not e!873753))))

(declare-fun res!1071265 () Bool)

(assert (=> b!1567458 (=> (not res!1071265) (not e!873753))))

(assert (=> b!1567458 (= res!1071265 (validKeyInArray!0 (select (arr!50532 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567459 () Bool)

(declare-fun e!873751 () Bool)

(assert (=> b!1567459 (= e!873752 e!873751)))

(declare-fun c!144491 () Bool)

(assert (=> b!1567459 (= c!144491 (validKeyInArray!0 (select (arr!50532 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567460 () Bool)

(declare-fun call!71933 () Bool)

(assert (=> b!1567460 (= e!873751 call!71933)))

(declare-fun bm!71930 () Bool)

(assert (=> bm!71930 (= call!71933 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144491 (Cons!36655 (select (arr!50532 _keys!637) #b00000000000000000000000000000000) Nil!36656) Nil!36656)))))

(declare-fun d!163573 () Bool)

(declare-fun res!1071266 () Bool)

(assert (=> d!163573 (=> res!1071266 e!873750)))

(assert (=> d!163573 (= res!1071266 (bvsge #b00000000000000000000000000000000 (size!51082 _keys!637)))))

(assert (=> d!163573 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36656) e!873750)))

(declare-fun b!1567457 () Bool)

(assert (=> b!1567457 (= e!873751 call!71933)))

(assert (= (and d!163573 (not res!1071266)) b!1567458))

(assert (= (and b!1567458 res!1071265) b!1567456))

(assert (= (and b!1567458 res!1071264) b!1567459))

(assert (= (and b!1567459 c!144491) b!1567460))

(assert (= (and b!1567459 (not c!144491)) b!1567457))

(assert (= (or b!1567460 b!1567457) bm!71930))

(declare-fun m!1442315 () Bool)

(assert (=> b!1567456 m!1442315))

(assert (=> b!1567456 m!1442315))

(declare-fun m!1442317 () Bool)

(assert (=> b!1567456 m!1442317))

(assert (=> b!1567458 m!1442315))

(assert (=> b!1567458 m!1442315))

(declare-fun m!1442319 () Bool)

(assert (=> b!1567458 m!1442319))

(assert (=> b!1567459 m!1442315))

(assert (=> b!1567459 m!1442315))

(assert (=> b!1567459 m!1442319))

(assert (=> bm!71930 m!1442315))

(declare-fun m!1442321 () Bool)

(assert (=> bm!71930 m!1442321))

(assert (=> b!1567404 d!163573))

(declare-fun d!163575 () Bool)

(declare-fun e!873755 () Bool)

(assert (=> d!163575 e!873755))

(declare-fun res!1071267 () Bool)

(assert (=> d!163575 (=> res!1071267 e!873755)))

(declare-fun lt!672953 () Bool)

(assert (=> d!163575 (= res!1071267 (not lt!672953))))

(declare-fun lt!672955 () Bool)

(assert (=> d!163575 (= lt!672953 lt!672955)))

(declare-fun lt!672952 () Unit!52059)

(declare-fun e!873754 () Unit!52059)

(assert (=> d!163575 (= lt!672952 e!873754)))

(declare-fun c!144492 () Bool)

(assert (=> d!163575 (= c!144492 lt!672955)))

(assert (=> d!163575 (= lt!672955 (containsKey!853 (toList!11369 lt!672936) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163575 (= (contains!10364 lt!672936 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672953)))

(declare-fun b!1567461 () Bool)

(declare-fun lt!672954 () Unit!52059)

(assert (=> b!1567461 (= e!873754 lt!672954)))

(assert (=> b!1567461 (= lt!672954 (lemmaContainsKeyImpliesGetValueByKeyDefined!536 (toList!11369 lt!672936) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1567461 (isDefined!584 (getValueByKey!795 (toList!11369 lt!672936) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567462 () Bool)

(declare-fun Unit!52062 () Unit!52059)

(assert (=> b!1567462 (= e!873754 Unit!52062)))

(declare-fun b!1567463 () Bool)

(assert (=> b!1567463 (= e!873755 (isDefined!584 (getValueByKey!795 (toList!11369 lt!672936) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163575 c!144492) b!1567461))

(assert (= (and d!163575 (not c!144492)) b!1567462))

(assert (= (and d!163575 (not res!1071267)) b!1567463))

(declare-fun m!1442323 () Bool)

(assert (=> d!163575 m!1442323))

(declare-fun m!1442325 () Bool)

(assert (=> b!1567461 m!1442325))

(declare-fun m!1442327 () Bool)

(assert (=> b!1567461 m!1442327))

(assert (=> b!1567461 m!1442327))

(declare-fun m!1442329 () Bool)

(assert (=> b!1567461 m!1442329))

(assert (=> b!1567463 m!1442327))

(assert (=> b!1567463 m!1442327))

(assert (=> b!1567463 m!1442329))

(assert (=> b!1567401 d!163575))

(declare-fun b!1567488 () Bool)

(declare-fun e!873774 () Bool)

(assert (=> b!1567488 (= e!873774 (validKeyInArray!0 (select (arr!50532 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567488 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(declare-fun d!163577 () Bool)

(declare-fun e!873773 () Bool)

(assert (=> d!163577 e!873773))

(declare-fun res!1071276 () Bool)

(assert (=> d!163577 (=> (not res!1071276) (not e!873773))))

(declare-fun lt!672971 () ListLongMap!22707)

(assert (=> d!163577 (= res!1071276 (not (contains!10364 lt!672971 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!873770 () ListLongMap!22707)

(assert (=> d!163577 (= lt!672971 e!873770)))

(declare-fun c!144502 () Bool)

(assert (=> d!163577 (= c!144502 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!51082 _keys!637)))))

(assert (=> d!163577 (validMask!0 mask!947)))

(assert (=> d!163577 (= (getCurrentListMapNoExtraKeys!6734 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!672971)))

(declare-fun b!1567489 () Bool)

(assert (=> b!1567489 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51082 _keys!637)))))

(assert (=> b!1567489 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51083 _values!487)))))

(declare-fun e!873771 () Bool)

(declare-fun apply!1121 (ListLongMap!22707 (_ BitVec 64)) V!60211)

(declare-fun get!26381 (ValueCell!18471 V!60211) V!60211)

(declare-fun dynLambda!3871 (Int (_ BitVec 64)) V!60211)

(assert (=> b!1567489 (= e!873771 (= (apply!1121 lt!672971 (select (arr!50532 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26381 (select (arr!50533 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3871 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1567490 () Bool)

(declare-fun res!1071277 () Bool)

(assert (=> b!1567490 (=> (not res!1071277) (not e!873773))))

(assert (=> b!1567490 (= res!1071277 (not (contains!10364 lt!672971 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567491 () Bool)

(declare-fun e!873772 () Bool)

(declare-fun isEmpty!1150 (ListLongMap!22707) Bool)

(assert (=> b!1567491 (= e!873772 (isEmpty!1150 lt!672971))))

(declare-fun b!1567492 () Bool)

(declare-fun e!873775 () Bool)

(assert (=> b!1567492 (= e!873773 e!873775)))

(declare-fun c!144501 () Bool)

(assert (=> b!1567492 (= c!144501 e!873774)))

(declare-fun res!1071278 () Bool)

(assert (=> b!1567492 (=> (not res!1071278) (not e!873774))))

(assert (=> b!1567492 (= res!1071278 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51082 _keys!637)))))

(declare-fun b!1567493 () Bool)

(declare-fun e!873776 () ListLongMap!22707)

(declare-fun call!71936 () ListLongMap!22707)

(assert (=> b!1567493 (= e!873776 call!71936)))

(declare-fun b!1567494 () Bool)

(declare-fun lt!672970 () Unit!52059)

(declare-fun lt!672973 () Unit!52059)

(assert (=> b!1567494 (= lt!672970 lt!672973)))

(declare-fun lt!672975 () (_ BitVec 64))

(declare-fun lt!672976 () V!60211)

(declare-fun lt!672972 () ListLongMap!22707)

(declare-fun lt!672974 () (_ BitVec 64))

(declare-fun +!5087 (ListLongMap!22707 tuple2!25272) ListLongMap!22707)

(assert (=> b!1567494 (not (contains!10364 (+!5087 lt!672972 (tuple2!25273 lt!672974 lt!672976)) lt!672975))))

(declare-fun addStillNotContains!577 (ListLongMap!22707 (_ BitVec 64) V!60211 (_ BitVec 64)) Unit!52059)

(assert (=> b!1567494 (= lt!672973 (addStillNotContains!577 lt!672972 lt!672974 lt!672976 lt!672975))))

(assert (=> b!1567494 (= lt!672975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1567494 (= lt!672976 (get!26381 (select (arr!50533 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3871 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1567494 (= lt!672974 (select (arr!50532 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1567494 (= lt!672972 call!71936)))

(assert (=> b!1567494 (= e!873776 (+!5087 call!71936 (tuple2!25273 (select (arr!50532 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26381 (select (arr!50533 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3871 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1567495 () Bool)

(assert (=> b!1567495 (= e!873772 (= lt!672971 (getCurrentListMapNoExtraKeys!6734 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun bm!71933 () Bool)

(assert (=> bm!71933 (= call!71936 (getCurrentListMapNoExtraKeys!6734 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1567496 () Bool)

(assert (=> b!1567496 (= e!873770 (ListLongMap!22708 Nil!36655))))

(declare-fun b!1567497 () Bool)

(assert (=> b!1567497 (= e!873775 e!873772)))

(declare-fun c!144503 () Bool)

(assert (=> b!1567497 (= c!144503 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51082 _keys!637)))))

(declare-fun b!1567498 () Bool)

(assert (=> b!1567498 (= e!873775 e!873771)))

(assert (=> b!1567498 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!51082 _keys!637)))))

(declare-fun res!1071279 () Bool)

(assert (=> b!1567498 (= res!1071279 (contains!10364 lt!672971 (select (arr!50532 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1567498 (=> (not res!1071279) (not e!873771))))

(declare-fun b!1567499 () Bool)

(assert (=> b!1567499 (= e!873770 e!873776)))

(declare-fun c!144504 () Bool)

(assert (=> b!1567499 (= c!144504 (validKeyInArray!0 (select (arr!50532 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (= (and d!163577 c!144502) b!1567496))

(assert (= (and d!163577 (not c!144502)) b!1567499))

(assert (= (and b!1567499 c!144504) b!1567494))

(assert (= (and b!1567499 (not c!144504)) b!1567493))

(assert (= (or b!1567494 b!1567493) bm!71933))

(assert (= (and d!163577 res!1071276) b!1567490))

(assert (= (and b!1567490 res!1071277) b!1567492))

(assert (= (and b!1567492 res!1071278) b!1567488))

(assert (= (and b!1567492 c!144501) b!1567498))

(assert (= (and b!1567492 (not c!144501)) b!1567497))

(assert (= (and b!1567498 res!1071279) b!1567489))

(assert (= (and b!1567497 c!144503) b!1567495))

(assert (= (and b!1567497 (not c!144503)) b!1567491))

(declare-fun b_lambda!25039 () Bool)

(assert (=> (not b_lambda!25039) (not b!1567489)))

(declare-fun t!51569 () Bool)

(declare-fun tb!12661 () Bool)

(assert (=> (and start!134112 (= defaultEntry!495 defaultEntry!495) t!51569) tb!12661))

(declare-fun result!26619 () Bool)

(assert (=> tb!12661 (= result!26619 tp_is_empty!39003)))

(assert (=> b!1567489 t!51569))

(declare-fun b_and!51875 () Bool)

(assert (= b_and!51871 (and (=> t!51569 result!26619) b_and!51875)))

(declare-fun b_lambda!25041 () Bool)

(assert (=> (not b_lambda!25041) (not b!1567494)))

(assert (=> b!1567494 t!51569))

(declare-fun b_and!51877 () Bool)

(assert (= b_and!51875 (and (=> t!51569 result!26619) b_and!51877)))

(declare-fun m!1442331 () Bool)

(assert (=> b!1567490 m!1442331))

(declare-fun m!1442333 () Bool)

(assert (=> b!1567495 m!1442333))

(declare-fun m!1442335 () Bool)

(assert (=> b!1567488 m!1442335))

(assert (=> b!1567488 m!1442335))

(declare-fun m!1442337 () Bool)

(assert (=> b!1567488 m!1442337))

(assert (=> bm!71933 m!1442333))

(declare-fun m!1442339 () Bool)

(assert (=> b!1567491 m!1442339))

(declare-fun m!1442341 () Bool)

(assert (=> b!1567489 m!1442341))

(declare-fun m!1442343 () Bool)

(assert (=> b!1567489 m!1442343))

(declare-fun m!1442345 () Bool)

(assert (=> b!1567489 m!1442345))

(assert (=> b!1567489 m!1442335))

(assert (=> b!1567489 m!1442343))

(assert (=> b!1567489 m!1442341))

(assert (=> b!1567489 m!1442335))

(declare-fun m!1442347 () Bool)

(assert (=> b!1567489 m!1442347))

(assert (=> b!1567499 m!1442335))

(assert (=> b!1567499 m!1442335))

(assert (=> b!1567499 m!1442337))

(assert (=> b!1567498 m!1442335))

(assert (=> b!1567498 m!1442335))

(declare-fun m!1442349 () Bool)

(assert (=> b!1567498 m!1442349))

(declare-fun m!1442351 () Bool)

(assert (=> d!163577 m!1442351))

(assert (=> d!163577 m!1442279))

(assert (=> b!1567494 m!1442341))

(assert (=> b!1567494 m!1442343))

(assert (=> b!1567494 m!1442345))

(assert (=> b!1567494 m!1442335))

(assert (=> b!1567494 m!1442343))

(assert (=> b!1567494 m!1442341))

(declare-fun m!1442353 () Bool)

(assert (=> b!1567494 m!1442353))

(declare-fun m!1442355 () Bool)

(assert (=> b!1567494 m!1442355))

(declare-fun m!1442357 () Bool)

(assert (=> b!1567494 m!1442357))

(assert (=> b!1567494 m!1442353))

(declare-fun m!1442359 () Bool)

(assert (=> b!1567494 m!1442359))

(assert (=> b!1567401 d!163577))

(declare-fun d!163579 () Bool)

(assert (=> d!163579 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134112 d!163579))

(declare-fun d!163581 () Bool)

(assert (=> d!163581 (= (array_inv!39259 _keys!637) (bvsge (size!51082 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134112 d!163581))

(declare-fun d!163583 () Bool)

(assert (=> d!163583 (= (array_inv!39260 _values!487) (bvsge (size!51083 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134112 d!163583))

(declare-fun bm!71936 () Bool)

(declare-fun call!71939 () Bool)

(assert (=> bm!71936 (= call!71939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567510 () Bool)

(declare-fun e!873783 () Bool)

(declare-fun e!873784 () Bool)

(assert (=> b!1567510 (= e!873783 e!873784)))

(declare-fun lt!672983 () (_ BitVec 64))

(assert (=> b!1567510 (= lt!672983 (select (arr!50532 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672984 () Unit!52059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104696 (_ BitVec 64) (_ BitVec 32)) Unit!52059)

(assert (=> b!1567510 (= lt!672984 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672983 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567510 (arrayContainsKey!0 _keys!637 lt!672983 #b00000000000000000000000000000000)))

(declare-fun lt!672985 () Unit!52059)

(assert (=> b!1567510 (= lt!672985 lt!672984)))

(declare-fun res!1071284 () Bool)

(declare-datatypes ((SeekEntryResult!13529 0))(
  ( (MissingZero!13529 (index!56514 (_ BitVec 32))) (Found!13529 (index!56515 (_ BitVec 32))) (Intermediate!13529 (undefined!14341 Bool) (index!56516 (_ BitVec 32)) (x!140843 (_ BitVec 32))) (Undefined!13529) (MissingVacant!13529 (index!56517 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104696 (_ BitVec 32)) SeekEntryResult!13529)

(assert (=> b!1567510 (= res!1071284 (= (seekEntryOrOpen!0 (select (arr!50532 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13529 #b00000000000000000000000000000000)))))

(assert (=> b!1567510 (=> (not res!1071284) (not e!873784))))

(declare-fun b!1567512 () Bool)

(assert (=> b!1567512 (= e!873783 call!71939)))

(declare-fun b!1567513 () Bool)

(declare-fun e!873785 () Bool)

(assert (=> b!1567513 (= e!873785 e!873783)))

(declare-fun c!144507 () Bool)

(assert (=> b!1567513 (= c!144507 (validKeyInArray!0 (select (arr!50532 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163585 () Bool)

(declare-fun res!1071285 () Bool)

(assert (=> d!163585 (=> res!1071285 e!873785)))

(assert (=> d!163585 (= res!1071285 (bvsge #b00000000000000000000000000000000 (size!51082 _keys!637)))))

(assert (=> d!163585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873785)))

(declare-fun b!1567511 () Bool)

(assert (=> b!1567511 (= e!873784 call!71939)))

(assert (= (and d!163585 (not res!1071285)) b!1567513))

(assert (= (and b!1567513 c!144507) b!1567510))

(assert (= (and b!1567513 (not c!144507)) b!1567512))

(assert (= (and b!1567510 res!1071284) b!1567511))

(assert (= (or b!1567511 b!1567512) bm!71936))

(declare-fun m!1442361 () Bool)

(assert (=> bm!71936 m!1442361))

(assert (=> b!1567510 m!1442315))

(declare-fun m!1442363 () Bool)

(assert (=> b!1567510 m!1442363))

(declare-fun m!1442365 () Bool)

(assert (=> b!1567510 m!1442365))

(assert (=> b!1567510 m!1442315))

(declare-fun m!1442367 () Bool)

(assert (=> b!1567510 m!1442367))

(assert (=> b!1567513 m!1442315))

(assert (=> b!1567513 m!1442315))

(assert (=> b!1567513 m!1442319))

(assert (=> b!1567405 d!163585))

(declare-fun b!1567521 () Bool)

(declare-fun e!873791 () Bool)

(assert (=> b!1567521 (= e!873791 tp_is_empty!39003)))

(declare-fun condMapEmpty!59913 () Bool)

(declare-fun mapDefault!59913 () ValueCell!18471)

(assert (=> mapNonEmpty!59907 (= condMapEmpty!59913 (= mapRest!59907 ((as const (Array (_ BitVec 32) ValueCell!18471)) mapDefault!59913)))))

(declare-fun mapRes!59913 () Bool)

(assert (=> mapNonEmpty!59907 (= tp!113991 (and e!873791 mapRes!59913))))

(declare-fun mapIsEmpty!59913 () Bool)

(assert (=> mapIsEmpty!59913 mapRes!59913))

(declare-fun b!1567520 () Bool)

(declare-fun e!873790 () Bool)

(assert (=> b!1567520 (= e!873790 tp_is_empty!39003)))

(declare-fun mapNonEmpty!59913 () Bool)

(declare-fun tp!114000 () Bool)

(assert (=> mapNonEmpty!59913 (= mapRes!59913 (and tp!114000 e!873790))))

(declare-fun mapRest!59913 () (Array (_ BitVec 32) ValueCell!18471))

(declare-fun mapValue!59913 () ValueCell!18471)

(declare-fun mapKey!59913 () (_ BitVec 32))

(assert (=> mapNonEmpty!59913 (= mapRest!59907 (store mapRest!59913 mapKey!59913 mapValue!59913))))

(assert (= (and mapNonEmpty!59907 condMapEmpty!59913) mapIsEmpty!59913))

(assert (= (and mapNonEmpty!59907 (not condMapEmpty!59913)) mapNonEmpty!59913))

(assert (= (and mapNonEmpty!59913 ((_ is ValueCellFull!18471) mapValue!59913)) b!1567520))

(assert (= (and mapNonEmpty!59907 ((_ is ValueCellFull!18471) mapDefault!59913)) b!1567521))

(declare-fun m!1442369 () Bool)

(assert (=> mapNonEmpty!59913 m!1442369))

(declare-fun b_lambda!25043 () Bool)

(assert (= b_lambda!25041 (or (and start!134112 b_free!32223) b_lambda!25043)))

(declare-fun b_lambda!25045 () Bool)

(assert (= b_lambda!25039 (or (and start!134112 b_free!32223) b_lambda!25045)))

(check-sat b_and!51877 (not b_next!32223) (not b!1567490) (not b!1567499) (not b!1567458) (not b!1567445) (not bm!71930) (not b_lambda!25043) (not b!1567498) (not b!1567510) (not b!1567495) (not b!1567494) (not b!1567459) (not b!1567463) tp_is_empty!39003 (not mapNonEmpty!59913) (not b!1567513) (not b_lambda!25045) (not d!163569) (not b!1567491) (not b!1567489) (not b!1567456) (not bm!71936) (not b!1567488) (not d!163577) (not bm!71933) (not d!163575) (not b!1567443) (not b!1567461))
(check-sat b_and!51877 (not b_next!32223))
