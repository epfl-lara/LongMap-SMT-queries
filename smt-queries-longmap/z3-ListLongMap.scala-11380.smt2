; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132248 () Bool)

(assert start!132248)

(declare-fun b_free!31899 () Bool)

(declare-fun b_next!31899 () Bool)

(assert (=> start!132248 (= b_free!31899 (not b_next!31899))))

(declare-fun tp!111957 () Bool)

(declare-fun b_and!51333 () Bool)

(assert (=> start!132248 (= tp!111957 b_and!51333)))

(declare-fun bm!71003 () Bool)

(declare-datatypes ((V!59343 0))(
  ( (V!59344 (val!19165 Int)) )
))
(declare-datatypes ((tuple2!24708 0))(
  ( (tuple2!24709 (_1!12365 (_ BitVec 64)) (_2!12365 V!59343)) )
))
(declare-datatypes ((List!36185 0))(
  ( (Nil!36182) (Cons!36181 (h!37626 tuple2!24708) (t!50897 List!36185)) )
))
(declare-datatypes ((ListLongMap!22317 0))(
  ( (ListLongMap!22318 (toList!11174 List!36185)) )
))
(declare-fun call!71006 () ListLongMap!22317)

(declare-fun call!71007 () ListLongMap!22317)

(assert (=> bm!71003 (= call!71006 call!71007)))

(declare-fun res!1062447 () Bool)

(declare-fun e!863663 () Bool)

(assert (=> start!132248 (=> (not res!1062447) (not e!863663))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132248 (= res!1062447 (validMask!0 mask!926))))

(assert (=> start!132248 e!863663))

(declare-datatypes ((array!103552 0))(
  ( (array!103553 (arr!49975 (Array (_ BitVec 32) (_ BitVec 64))) (size!50525 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103552)

(declare-fun array_inv!38853 (array!103552) Bool)

(assert (=> start!132248 (array_inv!38853 _keys!618)))

(declare-fun tp_is_empty!38175 () Bool)

(assert (=> start!132248 tp_is_empty!38175))

(assert (=> start!132248 true))

(assert (=> start!132248 tp!111957))

(declare-datatypes ((ValueCell!18177 0))(
  ( (ValueCellFull!18177 (v!21969 V!59343)) (EmptyCell!18177) )
))
(declare-datatypes ((array!103554 0))(
  ( (array!103555 (arr!49976 (Array (_ BitVec 32) ValueCell!18177)) (size!50526 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103554)

(declare-fun e!863661 () Bool)

(declare-fun array_inv!38854 (array!103554) Bool)

(assert (=> start!132248 (and (array_inv!38854 _values!470) e!863661)))

(declare-fun b!1551461 () Bool)

(declare-fun e!863660 () Bool)

(declare-fun mapRes!58975 () Bool)

(assert (=> b!1551461 (= e!863661 (and e!863660 mapRes!58975))))

(declare-fun condMapEmpty!58975 () Bool)

(declare-fun mapDefault!58975 () ValueCell!18177)

(assert (=> b!1551461 (= condMapEmpty!58975 (= (arr!49976 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18177)) mapDefault!58975)))))

(declare-fun b!1551462 () Bool)

(declare-fun res!1062449 () Bool)

(assert (=> b!1551462 (=> (not res!1062449) (not e!863663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103552 (_ BitVec 32)) Bool)

(assert (=> b!1551462 (= res!1062449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551463 () Bool)

(declare-fun e!863665 () ListLongMap!22317)

(declare-fun call!71009 () ListLongMap!22317)

(assert (=> b!1551463 (= e!863665 call!71009)))

(declare-fun b!1551464 () Bool)

(declare-fun e!863662 () ListLongMap!22317)

(assert (=> b!1551464 (= e!863662 call!71006)))

(declare-fun b!1551465 () Bool)

(declare-fun res!1062445 () Bool)

(declare-fun e!863667 () Bool)

(assert (=> b!1551465 (=> (not res!1062445) (not e!863667))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551465 (= res!1062445 (validKeyInArray!0 (select (arr!49975 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58975 () Bool)

(assert (=> mapIsEmpty!58975 mapRes!58975))

(declare-fun bm!71004 () Bool)

(declare-fun call!71010 () ListLongMap!22317)

(declare-fun call!71008 () ListLongMap!22317)

(assert (=> bm!71004 (= call!71010 call!71008)))

(declare-fun bm!71005 () Bool)

(assert (=> bm!71005 (= call!71009 call!71010)))

(declare-fun b!1551466 () Bool)

(declare-fun e!863666 () ListLongMap!22317)

(declare-fun minValue!436 () V!59343)

(declare-fun +!4995 (ListLongMap!22317 tuple2!24708) ListLongMap!22317)

(assert (=> b!1551466 (= e!863666 (+!4995 call!71007 (tuple2!24709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551467 () Bool)

(declare-fun e!863668 () Bool)

(assert (=> b!1551467 (= e!863668 tp_is_empty!38175)))

(declare-fun b!1551468 () Bool)

(assert (=> b!1551468 (= e!863663 e!863667)))

(declare-fun res!1062448 () Bool)

(assert (=> b!1551468 (=> (not res!1062448) (not e!863667))))

(assert (=> b!1551468 (= res!1062448 (bvslt from!762 (size!50525 _keys!618)))))

(declare-fun lt!668698 () ListLongMap!22317)

(assert (=> b!1551468 (= lt!668698 e!863666)))

(declare-fun c!142775 () Bool)

(declare-fun lt!668700 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551468 (= c!142775 (and (not lt!668700) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551468 (= lt!668700 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!71006 () Bool)

(declare-fun c!142776 () Bool)

(declare-fun zeroValue!436 () V!59343)

(assert (=> bm!71006 (= call!71007 (+!4995 (ite c!142775 call!71008 (ite c!142776 call!71010 call!71009)) (ite (or c!142775 c!142776) (tuple2!24709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551469 () Bool)

(assert (=> b!1551469 (= e!863666 e!863662)))

(assert (=> b!1551469 (= c!142776 (and (not lt!668700) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58975 () Bool)

(declare-fun tp!111958 () Bool)

(assert (=> mapNonEmpty!58975 (= mapRes!58975 (and tp!111958 e!863668))))

(declare-fun mapRest!58975 () (Array (_ BitVec 32) ValueCell!18177))

(declare-fun mapKey!58975 () (_ BitVec 32))

(declare-fun mapValue!58975 () ValueCell!18177)

(assert (=> mapNonEmpty!58975 (= (arr!49976 _values!470) (store mapRest!58975 mapKey!58975 mapValue!58975))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!71007 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6621 (array!103552 array!103554 (_ BitVec 32) (_ BitVec 32) V!59343 V!59343 (_ BitVec 32) Int) ListLongMap!22317)

(assert (=> bm!71007 (= call!71008 (getCurrentListMapNoExtraKeys!6621 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551470 () Bool)

(assert (=> b!1551470 (= e!863667 (not true))))

(declare-fun lt!668694 () ListLongMap!22317)

(declare-fun lt!668695 () V!59343)

(declare-fun apply!1098 (ListLongMap!22317 (_ BitVec 64)) V!59343)

(assert (=> b!1551470 (= (apply!1098 lt!668694 (select (arr!49975 _keys!618) from!762)) lt!668695)))

(declare-datatypes ((Unit!51670 0))(
  ( (Unit!51671) )
))
(declare-fun lt!668697 () Unit!51670)

(declare-fun lt!668696 () ListLongMap!22317)

(declare-fun addApplyDifferent!636 (ListLongMap!22317 (_ BitVec 64) V!59343 (_ BitVec 64)) Unit!51670)

(assert (=> b!1551470 (= lt!668697 (addApplyDifferent!636 lt!668696 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49975 _keys!618) from!762)))))

(declare-fun lt!668699 () V!59343)

(assert (=> b!1551470 (= lt!668699 lt!668695)))

(assert (=> b!1551470 (= lt!668695 (apply!1098 lt!668696 (select (arr!49975 _keys!618) from!762)))))

(assert (=> b!1551470 (= lt!668699 (apply!1098 (+!4995 lt!668696 (tuple2!24709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49975 _keys!618) from!762)))))

(declare-fun lt!668693 () Unit!51670)

(assert (=> b!1551470 (= lt!668693 (addApplyDifferent!636 lt!668696 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49975 _keys!618) from!762)))))

(declare-fun contains!10116 (ListLongMap!22317 (_ BitVec 64)) Bool)

(assert (=> b!1551470 (contains!10116 lt!668694 (select (arr!49975 _keys!618) from!762))))

(assert (=> b!1551470 (= lt!668694 (+!4995 lt!668696 (tuple2!24709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668701 () Unit!51670)

(declare-fun addStillContains!1294 (ListLongMap!22317 (_ BitVec 64) V!59343 (_ BitVec 64)) Unit!51670)

(assert (=> b!1551470 (= lt!668701 (addStillContains!1294 lt!668696 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49975 _keys!618) from!762)))))

(assert (=> b!1551470 (= lt!668696 (getCurrentListMapNoExtraKeys!6621 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551471 () Bool)

(assert (=> b!1551471 (= e!863660 tp_is_empty!38175)))

(declare-fun b!1551472 () Bool)

(assert (=> b!1551472 (= e!863665 call!71006)))

(declare-fun b!1551473 () Bool)

(declare-fun res!1062443 () Bool)

(assert (=> b!1551473 (=> (not res!1062443) (not e!863663))))

(assert (=> b!1551473 (= res!1062443 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50525 _keys!618))))))

(declare-fun b!1551474 () Bool)

(declare-fun c!142777 () Bool)

(assert (=> b!1551474 (= c!142777 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668700))))

(assert (=> b!1551474 (= e!863662 e!863665)))

(declare-fun b!1551475 () Bool)

(declare-fun res!1062446 () Bool)

(assert (=> b!1551475 (=> (not res!1062446) (not e!863663))))

(declare-datatypes ((List!36186 0))(
  ( (Nil!36183) (Cons!36182 (h!37627 (_ BitVec 64)) (t!50898 List!36186)) )
))
(declare-fun arrayNoDuplicates!0 (array!103552 (_ BitVec 32) List!36186) Bool)

(assert (=> b!1551475 (= res!1062446 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36183))))

(declare-fun b!1551476 () Bool)

(declare-fun res!1062444 () Bool)

(assert (=> b!1551476 (=> (not res!1062444) (not e!863663))))

(assert (=> b!1551476 (= res!1062444 (and (= (size!50526 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50525 _keys!618) (size!50526 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132248 res!1062447) b!1551476))

(assert (= (and b!1551476 res!1062444) b!1551462))

(assert (= (and b!1551462 res!1062449) b!1551475))

(assert (= (and b!1551475 res!1062446) b!1551473))

(assert (= (and b!1551473 res!1062443) b!1551468))

(assert (= (and b!1551468 c!142775) b!1551466))

(assert (= (and b!1551468 (not c!142775)) b!1551469))

(assert (= (and b!1551469 c!142776) b!1551464))

(assert (= (and b!1551469 (not c!142776)) b!1551474))

(assert (= (and b!1551474 c!142777) b!1551472))

(assert (= (and b!1551474 (not c!142777)) b!1551463))

(assert (= (or b!1551472 b!1551463) bm!71005))

(assert (= (or b!1551464 bm!71005) bm!71004))

(assert (= (or b!1551464 b!1551472) bm!71003))

(assert (= (or b!1551466 bm!71004) bm!71007))

(assert (= (or b!1551466 bm!71003) bm!71006))

(assert (= (and b!1551468 res!1062448) b!1551465))

(assert (= (and b!1551465 res!1062445) b!1551470))

(assert (= (and b!1551461 condMapEmpty!58975) mapIsEmpty!58975))

(assert (= (and b!1551461 (not condMapEmpty!58975)) mapNonEmpty!58975))

(get-info :version)

(assert (= (and mapNonEmpty!58975 ((_ is ValueCellFull!18177) mapValue!58975)) b!1551467))

(assert (= (and b!1551461 ((_ is ValueCellFull!18177) mapDefault!58975)) b!1551471))

(assert (= start!132248 b!1551461))

(declare-fun m!1430127 () Bool)

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430129 () Bool)

(assert (=> b!1551470 m!1430129))

(declare-fun m!1430131 () Bool)

(assert (=> b!1551470 m!1430131))

(declare-fun m!1430133 () Bool)

(assert (=> b!1551470 m!1430133))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430135 () Bool)

(assert (=> b!1551470 m!1430135))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430137 () Bool)

(assert (=> b!1551470 m!1430137))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430139 () Bool)

(assert (=> b!1551470 m!1430139))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430141 () Bool)

(assert (=> b!1551470 m!1430141))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430143 () Bool)

(assert (=> b!1551470 m!1430143))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430145 () Bool)

(assert (=> b!1551470 m!1430145))

(assert (=> b!1551470 m!1430135))

(assert (=> b!1551470 m!1430127))

(declare-fun m!1430147 () Bool)

(assert (=> b!1551470 m!1430147))

(declare-fun m!1430149 () Bool)

(assert (=> bm!71006 m!1430149))

(declare-fun m!1430151 () Bool)

(assert (=> b!1551466 m!1430151))

(declare-fun m!1430153 () Bool)

(assert (=> b!1551475 m!1430153))

(declare-fun m!1430155 () Bool)

(assert (=> mapNonEmpty!58975 m!1430155))

(declare-fun m!1430157 () Bool)

(assert (=> b!1551462 m!1430157))

(declare-fun m!1430159 () Bool)

(assert (=> start!132248 m!1430159))

(declare-fun m!1430161 () Bool)

(assert (=> start!132248 m!1430161))

(declare-fun m!1430163 () Bool)

(assert (=> start!132248 m!1430163))

(assert (=> bm!71007 m!1430133))

(assert (=> b!1551465 m!1430127))

(assert (=> b!1551465 m!1430127))

(declare-fun m!1430165 () Bool)

(assert (=> b!1551465 m!1430165))

(check-sat (not bm!71007) (not bm!71006) b_and!51333 (not b_next!31899) (not b!1551465) tp_is_empty!38175 (not mapNonEmpty!58975) (not b!1551462) (not b!1551475) (not start!132248) (not b!1551466) (not b!1551470))
(check-sat b_and!51333 (not b_next!31899))
