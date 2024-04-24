; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113584 () Bool)

(assert start!113584)

(declare-fun b_free!31411 () Bool)

(declare-fun b_next!31411 () Bool)

(assert (=> start!113584 (= b_free!31411 (not b_next!31411))))

(declare-fun tp!110038 () Bool)

(declare-fun b_and!50677 () Bool)

(assert (=> start!113584 (= tp!110038 b_and!50677)))

(declare-fun res!893270 () Bool)

(declare-fun e!766452 () Bool)

(assert (=> start!113584 (=> (not res!893270) (not e!766452))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113584 (= res!893270 (validMask!0 mask!1977))))

(assert (=> start!113584 e!766452))

(declare-fun tp_is_empty!37411 () Bool)

(assert (=> start!113584 tp_is_empty!37411))

(assert (=> start!113584 true))

(declare-datatypes ((array!91769 0))(
  ( (array!91770 (arr!44336 (Array (_ BitVec 32) (_ BitVec 64))) (size!44887 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91769)

(declare-fun array_inv!33675 (array!91769) Bool)

(assert (=> start!113584 (array_inv!33675 _keys!1571)))

(declare-datatypes ((V!54985 0))(
  ( (V!54986 (val!18780 Int)) )
))
(declare-datatypes ((ValueCell!17807 0))(
  ( (ValueCellFull!17807 (v!21423 V!54985)) (EmptyCell!17807) )
))
(declare-datatypes ((array!91771 0))(
  ( (array!91772 (arr!44337 (Array (_ BitVec 32) ValueCell!17807)) (size!44888 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91771)

(declare-fun e!766450 () Bool)

(declare-fun array_inv!33676 (array!91771) Bool)

(assert (=> start!113584 (and (array_inv!33676 _values!1303) e!766450)))

(assert (=> start!113584 tp!110038))

(declare-fun b!1346745 () Bool)

(declare-fun res!893268 () Bool)

(assert (=> b!1346745 (=> (not res!893268) (not e!766452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91769 (_ BitVec 32)) Bool)

(assert (=> b!1346745 (= res!893268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346746 () Bool)

(declare-fun res!893263 () Bool)

(declare-fun e!766453 () Bool)

(assert (=> b!1346746 (=> (not res!893263) (not e!766453))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346746 (= res!893263 (not (= k0!1142 (select (arr!44336 _keys!1571) from!1960))))))

(declare-fun b!1346747 () Bool)

(declare-fun res!893269 () Bool)

(assert (=> b!1346747 (=> (not res!893269) (not e!766452))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346747 (= res!893269 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1346748 () Bool)

(declare-fun e!766449 () Bool)

(declare-fun mapRes!57823 () Bool)

(assert (=> b!1346748 (= e!766450 (and e!766449 mapRes!57823))))

(declare-fun condMapEmpty!57823 () Bool)

(declare-fun mapDefault!57823 () ValueCell!17807)

(assert (=> b!1346748 (= condMapEmpty!57823 (= (arr!44337 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17807)) mapDefault!57823)))))

(declare-fun b!1346749 () Bool)

(declare-fun res!893265 () Bool)

(assert (=> b!1346749 (=> (not res!893265) (not e!766452))))

(assert (=> b!1346749 (= res!893265 (and (= (size!44888 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44887 _keys!1571) (size!44888 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346750 () Bool)

(assert (=> b!1346750 (= e!766453 (not true))))

(declare-datatypes ((tuple2!24246 0))(
  ( (tuple2!24247 (_1!12134 (_ BitVec 64)) (_2!12134 V!54985)) )
))
(declare-datatypes ((List!31392 0))(
  ( (Nil!31389) (Cons!31388 (h!32606 tuple2!24246) (t!45952 List!31392)) )
))
(declare-datatypes ((ListLongMap!21911 0))(
  ( (ListLongMap!21912 (toList!10971 List!31392)) )
))
(declare-fun lt!595828 () ListLongMap!21911)

(declare-fun contains!9159 (ListLongMap!21911 (_ BitVec 64)) Bool)

(assert (=> b!1346750 (contains!9159 lt!595828 k0!1142)))

(declare-datatypes ((Unit!44060 0))(
  ( (Unit!44061) )
))
(declare-fun lt!595827 () Unit!44060)

(declare-fun lt!595829 () V!54985)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!386 ((_ BitVec 64) (_ BitVec 64) V!54985 ListLongMap!21911) Unit!44060)

(assert (=> b!1346750 (= lt!595827 (lemmaInListMapAfterAddingDiffThenInBefore!386 k0!1142 (select (arr!44336 _keys!1571) from!1960) lt!595829 lt!595828))))

(declare-fun b!1346751 () Bool)

(declare-fun e!766454 () Bool)

(assert (=> b!1346751 (= e!766454 tp_is_empty!37411)))

(declare-fun b!1346752 () Bool)

(declare-fun res!893260 () Bool)

(assert (=> b!1346752 (=> (not res!893260) (not e!766452))))

(declare-datatypes ((List!31393 0))(
  ( (Nil!31390) (Cons!31389 (h!32607 (_ BitVec 64)) (t!45953 List!31393)) )
))
(declare-fun arrayNoDuplicates!0 (array!91769 (_ BitVec 32) List!31393) Bool)

(assert (=> b!1346752 (= res!893260 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31390))))

(declare-fun b!1346753 () Bool)

(declare-fun res!893261 () Bool)

(assert (=> b!1346753 (=> (not res!893261) (not e!766452))))

(assert (=> b!1346753 (= res!893261 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44887 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57823 () Bool)

(declare-fun tp!110037 () Bool)

(assert (=> mapNonEmpty!57823 (= mapRes!57823 (and tp!110037 e!766454))))

(declare-fun mapKey!57823 () (_ BitVec 32))

(declare-fun mapRest!57823 () (Array (_ BitVec 32) ValueCell!17807))

(declare-fun mapValue!57823 () ValueCell!17807)

(assert (=> mapNonEmpty!57823 (= (arr!44337 _values!1303) (store mapRest!57823 mapKey!57823 mapValue!57823))))

(declare-fun b!1346754 () Bool)

(declare-fun res!893267 () Bool)

(assert (=> b!1346754 (=> (not res!893267) (not e!766452))))

(assert (=> b!1346754 (= res!893267 (not (= (select (arr!44336 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346755 () Bool)

(declare-fun res!893264 () Bool)

(assert (=> b!1346755 (=> (not res!893264) (not e!766452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346755 (= res!893264 (validKeyInArray!0 (select (arr!44336 _keys!1571) from!1960)))))

(declare-fun b!1346756 () Bool)

(assert (=> b!1346756 (= e!766449 tp_is_empty!37411)))

(declare-fun mapIsEmpty!57823 () Bool)

(assert (=> mapIsEmpty!57823 mapRes!57823))

(declare-fun b!1346757 () Bool)

(assert (=> b!1346757 (= e!766452 e!766453)))

(declare-fun res!893262 () Bool)

(assert (=> b!1346757 (=> (not res!893262) (not e!766453))))

(declare-fun +!4864 (ListLongMap!21911 tuple2!24246) ListLongMap!21911)

(assert (=> b!1346757 (= res!893262 (contains!9159 (+!4864 lt!595828 (tuple2!24247 (select (arr!44336 _keys!1571) from!1960) lt!595829)) k0!1142))))

(declare-fun minValue!1245 () V!54985)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54985)

(declare-fun getCurrentListMapNoExtraKeys!6513 (array!91769 array!91771 (_ BitVec 32) (_ BitVec 32) V!54985 V!54985 (_ BitVec 32) Int) ListLongMap!21911)

(assert (=> b!1346757 (= lt!595828 (getCurrentListMapNoExtraKeys!6513 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22410 (ValueCell!17807 V!54985) V!54985)

(declare-fun dynLambda!3818 (Int (_ BitVec 64)) V!54985)

(assert (=> b!1346757 (= lt!595829 (get!22410 (select (arr!44337 _values!1303) from!1960) (dynLambda!3818 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1346758 () Bool)

(declare-fun res!893266 () Bool)

(assert (=> b!1346758 (=> (not res!893266) (not e!766452))))

(declare-fun getCurrentListMap!5913 (array!91769 array!91771 (_ BitVec 32) (_ BitVec 32) V!54985 V!54985 (_ BitVec 32) Int) ListLongMap!21911)

(assert (=> b!1346758 (= res!893266 (contains!9159 (getCurrentListMap!5913 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113584 res!893270) b!1346749))

(assert (= (and b!1346749 res!893265) b!1346745))

(assert (= (and b!1346745 res!893268) b!1346752))

(assert (= (and b!1346752 res!893260) b!1346753))

(assert (= (and b!1346753 res!893261) b!1346758))

(assert (= (and b!1346758 res!893266) b!1346754))

(assert (= (and b!1346754 res!893267) b!1346755))

(assert (= (and b!1346755 res!893264) b!1346747))

(assert (= (and b!1346747 res!893269) b!1346757))

(assert (= (and b!1346757 res!893262) b!1346746))

(assert (= (and b!1346746 res!893263) b!1346750))

(assert (= (and b!1346748 condMapEmpty!57823) mapIsEmpty!57823))

(assert (= (and b!1346748 (not condMapEmpty!57823)) mapNonEmpty!57823))

(get-info :version)

(assert (= (and mapNonEmpty!57823 ((_ is ValueCellFull!17807) mapValue!57823)) b!1346751))

(assert (= (and b!1346748 ((_ is ValueCellFull!17807) mapDefault!57823)) b!1346756))

(assert (= start!113584 b!1346748))

(declare-fun b_lambda!24527 () Bool)

(assert (=> (not b_lambda!24527) (not b!1346757)))

(declare-fun t!45951 () Bool)

(declare-fun tb!12363 () Bool)

(assert (=> (and start!113584 (= defaultEntry!1306 defaultEntry!1306) t!45951) tb!12363))

(declare-fun result!25825 () Bool)

(assert (=> tb!12363 (= result!25825 tp_is_empty!37411)))

(assert (=> b!1346757 t!45951))

(declare-fun b_and!50679 () Bool)

(assert (= b_and!50677 (and (=> t!45951 result!25825) b_and!50679)))

(declare-fun m!1234437 () Bool)

(assert (=> b!1346752 m!1234437))

(declare-fun m!1234439 () Bool)

(assert (=> b!1346750 m!1234439))

(declare-fun m!1234441 () Bool)

(assert (=> b!1346750 m!1234441))

(assert (=> b!1346750 m!1234441))

(declare-fun m!1234443 () Bool)

(assert (=> b!1346750 m!1234443))

(assert (=> b!1346746 m!1234441))

(declare-fun m!1234445 () Bool)

(assert (=> b!1346758 m!1234445))

(assert (=> b!1346758 m!1234445))

(declare-fun m!1234447 () Bool)

(assert (=> b!1346758 m!1234447))

(assert (=> b!1346754 m!1234441))

(declare-fun m!1234449 () Bool)

(assert (=> b!1346757 m!1234449))

(declare-fun m!1234451 () Bool)

(assert (=> b!1346757 m!1234451))

(declare-fun m!1234453 () Bool)

(assert (=> b!1346757 m!1234453))

(declare-fun m!1234455 () Bool)

(assert (=> b!1346757 m!1234455))

(assert (=> b!1346757 m!1234451))

(declare-fun m!1234457 () Bool)

(assert (=> b!1346757 m!1234457))

(assert (=> b!1346757 m!1234441))

(assert (=> b!1346757 m!1234453))

(assert (=> b!1346757 m!1234457))

(declare-fun m!1234459 () Bool)

(assert (=> b!1346757 m!1234459))

(declare-fun m!1234461 () Bool)

(assert (=> b!1346745 m!1234461))

(assert (=> b!1346755 m!1234441))

(assert (=> b!1346755 m!1234441))

(declare-fun m!1234463 () Bool)

(assert (=> b!1346755 m!1234463))

(declare-fun m!1234465 () Bool)

(assert (=> start!113584 m!1234465))

(declare-fun m!1234467 () Bool)

(assert (=> start!113584 m!1234467))

(declare-fun m!1234469 () Bool)

(assert (=> start!113584 m!1234469))

(declare-fun m!1234471 () Bool)

(assert (=> mapNonEmpty!57823 m!1234471))

(check-sat (not b!1346755) (not start!113584) (not b_lambda!24527) (not b!1346745) (not b!1346750) (not b_next!31411) (not mapNonEmpty!57823) (not b!1346757) tp_is_empty!37411 b_and!50679 (not b!1346758) (not b!1346752))
(check-sat b_and!50679 (not b_next!31411))
