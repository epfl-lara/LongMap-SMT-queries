; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113194 () Bool)

(assert start!113194)

(declare-fun b_free!31245 () Bool)

(declare-fun b_next!31245 () Bool)

(assert (=> start!113194 (= b_free!31245 (not b_next!31245))))

(declare-fun tp!109539 () Bool)

(declare-fun b_and!50397 () Bool)

(assert (=> start!113194 (= tp!109539 b_and!50397)))

(declare-fun b!1342550 () Bool)

(declare-fun res!890704 () Bool)

(declare-fun e!764316 () Bool)

(assert (=> b!1342550 (=> (not res!890704) (not e!764316))))

(declare-datatypes ((array!91338 0))(
  ( (array!91339 (arr!44125 (Array (_ BitVec 32) (_ BitVec 64))) (size!44675 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91338)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91338 (_ BitVec 32)) Bool)

(assert (=> b!1342550 (= res!890704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342551 () Bool)

(declare-fun res!890706 () Bool)

(assert (=> b!1342551 (=> (not res!890706) (not e!764316))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342551 (= res!890706 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44675 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57574 () Bool)

(declare-fun mapRes!57574 () Bool)

(assert (=> mapIsEmpty!57574 mapRes!57574))

(declare-fun b!1342552 () Bool)

(declare-fun res!890709 () Bool)

(assert (=> b!1342552 (=> (not res!890709) (not e!764316))))

(assert (=> b!1342552 (= res!890709 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342553 () Bool)

(declare-fun e!764315 () Bool)

(declare-fun e!764314 () Bool)

(assert (=> b!1342553 (= e!764315 (and e!764314 mapRes!57574))))

(declare-fun condMapEmpty!57574 () Bool)

(declare-datatypes ((V!54763 0))(
  ( (V!54764 (val!18697 Int)) )
))
(declare-datatypes ((ValueCell!17724 0))(
  ( (ValueCellFull!17724 (v!21345 V!54763)) (EmptyCell!17724) )
))
(declare-datatypes ((array!91340 0))(
  ( (array!91341 (arr!44126 (Array (_ BitVec 32) ValueCell!17724)) (size!44676 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91340)

(declare-fun mapDefault!57574 () ValueCell!17724)

(assert (=> b!1342553 (= condMapEmpty!57574 (= (arr!44126 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17724)) mapDefault!57574)))))

(declare-fun res!890710 () Bool)

(assert (=> start!113194 (=> (not res!890710) (not e!764316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113194 (= res!890710 (validMask!0 mask!1977))))

(assert (=> start!113194 e!764316))

(declare-fun tp_is_empty!37245 () Bool)

(assert (=> start!113194 tp_is_empty!37245))

(assert (=> start!113194 true))

(declare-fun array_inv!33257 (array!91338) Bool)

(assert (=> start!113194 (array_inv!33257 _keys!1571)))

(declare-fun array_inv!33258 (array!91340) Bool)

(assert (=> start!113194 (and (array_inv!33258 _values!1303) e!764315)))

(assert (=> start!113194 tp!109539))

(declare-fun b!1342549 () Bool)

(declare-fun res!890707 () Bool)

(assert (=> b!1342549 (=> (not res!890707) (not e!764316))))

(assert (=> b!1342549 (= res!890707 (and (= (size!44676 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44675 _keys!1571) (size!44676 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342554 () Bool)

(declare-fun res!890712 () Bool)

(assert (=> b!1342554 (=> (not res!890712) (not e!764316))))

(assert (=> b!1342554 (= res!890712 (not (= (select (arr!44125 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342555 () Bool)

(declare-fun e!764318 () Bool)

(assert (=> b!1342555 (= e!764318 tp_is_empty!37245)))

(declare-fun b!1342556 () Bool)

(declare-fun res!890708 () Bool)

(assert (=> b!1342556 (=> (not res!890708) (not e!764316))))

(declare-datatypes ((List!31237 0))(
  ( (Nil!31234) (Cons!31233 (h!32442 (_ BitVec 64)) (t!45693 List!31237)) )
))
(declare-fun arrayNoDuplicates!0 (array!91338 (_ BitVec 32) List!31237) Bool)

(assert (=> b!1342556 (= res!890708 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31234))))

(declare-fun b!1342557 () Bool)

(assert (=> b!1342557 (= e!764316 (not true))))

(declare-datatypes ((tuple2!24080 0))(
  ( (tuple2!24081 (_1!12051 (_ BitVec 64)) (_2!12051 V!54763)) )
))
(declare-datatypes ((List!31238 0))(
  ( (Nil!31235) (Cons!31234 (h!32443 tuple2!24080) (t!45694 List!31238)) )
))
(declare-datatypes ((ListLongMap!21737 0))(
  ( (ListLongMap!21738 (toList!10884 List!31238)) )
))
(declare-fun lt!594525 () ListLongMap!21737)

(declare-fun contains!9060 (ListLongMap!21737 (_ BitVec 64)) Bool)

(assert (=> b!1342557 (contains!9060 lt!594525 k0!1142)))

(declare-datatypes ((Unit!44067 0))(
  ( (Unit!44068) )
))
(declare-fun lt!594527 () Unit!44067)

(declare-fun lt!594524 () V!54763)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!364 ((_ BitVec 64) (_ BitVec 64) V!54763 ListLongMap!21737) Unit!44067)

(assert (=> b!1342557 (= lt!594527 (lemmaInListMapAfterAddingDiffThenInBefore!364 k0!1142 (select (arr!44125 _keys!1571) from!1960) lt!594524 lt!594525))))

(declare-fun lt!594528 () ListLongMap!21737)

(assert (=> b!1342557 (contains!9060 lt!594528 k0!1142)))

(declare-fun zeroValue!1245 () V!54763)

(declare-fun lt!594526 () Unit!44067)

(assert (=> b!1342557 (= lt!594526 (lemmaInListMapAfterAddingDiffThenInBefore!364 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594528))))

(declare-fun +!4795 (ListLongMap!21737 tuple2!24080) ListLongMap!21737)

(assert (=> b!1342557 (= lt!594528 (+!4795 lt!594525 (tuple2!24081 (select (arr!44125 _keys!1571) from!1960) lt!594524)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22282 (ValueCell!17724 V!54763) V!54763)

(declare-fun dynLambda!3734 (Int (_ BitVec 64)) V!54763)

(assert (=> b!1342557 (= lt!594524 (get!22282 (select (arr!44126 _values!1303) from!1960) (dynLambda!3734 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54763)

(declare-fun getCurrentListMapNoExtraKeys!6437 (array!91338 array!91340 (_ BitVec 32) (_ BitVec 32) V!54763 V!54763 (_ BitVec 32) Int) ListLongMap!21737)

(assert (=> b!1342557 (= lt!594525 (getCurrentListMapNoExtraKeys!6437 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342558 () Bool)

(assert (=> b!1342558 (= e!764314 tp_is_empty!37245)))

(declare-fun b!1342559 () Bool)

(declare-fun res!890711 () Bool)

(assert (=> b!1342559 (=> (not res!890711) (not e!764316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342559 (= res!890711 (validKeyInArray!0 (select (arr!44125 _keys!1571) from!1960)))))

(declare-fun b!1342560 () Bool)

(declare-fun res!890705 () Bool)

(assert (=> b!1342560 (=> (not res!890705) (not e!764316))))

(declare-fun getCurrentListMap!5847 (array!91338 array!91340 (_ BitVec 32) (_ BitVec 32) V!54763 V!54763 (_ BitVec 32) Int) ListLongMap!21737)

(assert (=> b!1342560 (= res!890705 (contains!9060 (getCurrentListMap!5847 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57574 () Bool)

(declare-fun tp!109540 () Bool)

(assert (=> mapNonEmpty!57574 (= mapRes!57574 (and tp!109540 e!764318))))

(declare-fun mapValue!57574 () ValueCell!17724)

(declare-fun mapRest!57574 () (Array (_ BitVec 32) ValueCell!17724))

(declare-fun mapKey!57574 () (_ BitVec 32))

(assert (=> mapNonEmpty!57574 (= (arr!44126 _values!1303) (store mapRest!57574 mapKey!57574 mapValue!57574))))

(assert (= (and start!113194 res!890710) b!1342549))

(assert (= (and b!1342549 res!890707) b!1342550))

(assert (= (and b!1342550 res!890704) b!1342556))

(assert (= (and b!1342556 res!890708) b!1342551))

(assert (= (and b!1342551 res!890706) b!1342560))

(assert (= (and b!1342560 res!890705) b!1342554))

(assert (= (and b!1342554 res!890712) b!1342559))

(assert (= (and b!1342559 res!890711) b!1342552))

(assert (= (and b!1342552 res!890709) b!1342557))

(assert (= (and b!1342553 condMapEmpty!57574) mapIsEmpty!57574))

(assert (= (and b!1342553 (not condMapEmpty!57574)) mapNonEmpty!57574))

(get-info :version)

(assert (= (and mapNonEmpty!57574 ((_ is ValueCellFull!17724) mapValue!57574)) b!1342555))

(assert (= (and b!1342553 ((_ is ValueCellFull!17724) mapDefault!57574)) b!1342558))

(assert (= start!113194 b!1342553))

(declare-fun b_lambda!24421 () Bool)

(assert (=> (not b_lambda!24421) (not b!1342557)))

(declare-fun t!45692 () Bool)

(declare-fun tb!12259 () Bool)

(assert (=> (and start!113194 (= defaultEntry!1306 defaultEntry!1306) t!45692) tb!12259))

(declare-fun result!25609 () Bool)

(assert (=> tb!12259 (= result!25609 tp_is_empty!37245)))

(assert (=> b!1342557 t!45692))

(declare-fun b_and!50399 () Bool)

(assert (= b_and!50397 (and (=> t!45692 result!25609) b_and!50399)))

(declare-fun m!1230171 () Bool)

(assert (=> b!1342557 m!1230171))

(declare-fun m!1230173 () Bool)

(assert (=> b!1342557 m!1230173))

(declare-fun m!1230175 () Bool)

(assert (=> b!1342557 m!1230175))

(declare-fun m!1230177 () Bool)

(assert (=> b!1342557 m!1230177))

(assert (=> b!1342557 m!1230173))

(declare-fun m!1230179 () Bool)

(assert (=> b!1342557 m!1230179))

(assert (=> b!1342557 m!1230175))

(declare-fun m!1230181 () Bool)

(assert (=> b!1342557 m!1230181))

(declare-fun m!1230183 () Bool)

(assert (=> b!1342557 m!1230183))

(declare-fun m!1230185 () Bool)

(assert (=> b!1342557 m!1230185))

(declare-fun m!1230187 () Bool)

(assert (=> b!1342557 m!1230187))

(declare-fun m!1230189 () Bool)

(assert (=> b!1342557 m!1230189))

(assert (=> b!1342557 m!1230185))

(declare-fun m!1230191 () Bool)

(assert (=> b!1342560 m!1230191))

(assert (=> b!1342560 m!1230191))

(declare-fun m!1230193 () Bool)

(assert (=> b!1342560 m!1230193))

(declare-fun m!1230195 () Bool)

(assert (=> start!113194 m!1230195))

(declare-fun m!1230197 () Bool)

(assert (=> start!113194 m!1230197))

(declare-fun m!1230199 () Bool)

(assert (=> start!113194 m!1230199))

(declare-fun m!1230201 () Bool)

(assert (=> b!1342556 m!1230201))

(declare-fun m!1230203 () Bool)

(assert (=> mapNonEmpty!57574 m!1230203))

(assert (=> b!1342559 m!1230185))

(assert (=> b!1342559 m!1230185))

(declare-fun m!1230205 () Bool)

(assert (=> b!1342559 m!1230205))

(assert (=> b!1342554 m!1230185))

(declare-fun m!1230207 () Bool)

(assert (=> b!1342550 m!1230207))

(check-sat (not b!1342556) (not b_next!31245) tp_is_empty!37245 (not b!1342559) b_and!50399 (not b_lambda!24421) (not start!113194) (not b!1342550) (not b!1342560) (not mapNonEmpty!57574) (not b!1342557))
(check-sat b_and!50399 (not b_next!31245))
