; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113098 () Bool)

(assert start!113098)

(declare-fun b_free!31149 () Bool)

(declare-fun b_next!31149 () Bool)

(assert (=> start!113098 (= b_free!31149 (not b_next!31149))))

(declare-fun tp!109252 () Bool)

(declare-fun b_and!50205 () Bool)

(assert (=> start!113098 (= tp!109252 b_and!50205)))

(declare-fun b!1340725 () Bool)

(declare-fun e!763595 () Bool)

(declare-fun tp_is_empty!37149 () Bool)

(assert (=> b!1340725 (= e!763595 tp_is_empty!37149)))

(declare-fun b!1340726 () Bool)

(declare-fun res!889413 () Bool)

(declare-fun e!763594 () Bool)

(assert (=> b!1340726 (=> (not res!889413) (not e!763594))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340726 (= res!889413 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340727 () Bool)

(assert (=> b!1340727 (= e!763594 (not true))))

(declare-datatypes ((V!54635 0))(
  ( (V!54636 (val!18649 Int)) )
))
(declare-datatypes ((tuple2!24006 0))(
  ( (tuple2!24007 (_1!12014 (_ BitVec 64)) (_2!12014 V!54635)) )
))
(declare-datatypes ((List!31168 0))(
  ( (Nil!31165) (Cons!31164 (h!32373 tuple2!24006) (t!45528 List!31168)) )
))
(declare-datatypes ((ListLongMap!21663 0))(
  ( (ListLongMap!21664 (toList!10847 List!31168)) )
))
(declare-fun lt!594033 () ListLongMap!21663)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9023 (ListLongMap!21663 (_ BitVec 64)) Bool)

(assert (=> b!1340727 (contains!9023 lt!594033 k0!1142)))

(declare-datatypes ((Unit!44001 0))(
  ( (Unit!44002) )
))
(declare-fun lt!594032 () Unit!44001)

(declare-fun zeroValue!1245 () V!54635)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!331 ((_ BitVec 64) (_ BitVec 64) V!54635 ListLongMap!21663) Unit!44001)

(assert (=> b!1340727 (= lt!594032 (lemmaInListMapAfterAddingDiffThenInBefore!331 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594033))))

(declare-fun minValue!1245 () V!54635)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91150 0))(
  ( (array!91151 (arr!44031 (Array (_ BitVec 32) (_ BitVec 64))) (size!44581 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91150)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17676 0))(
  ( (ValueCellFull!17676 (v!21297 V!54635)) (EmptyCell!17676) )
))
(declare-datatypes ((array!91152 0))(
  ( (array!91153 (arr!44032 (Array (_ BitVec 32) ValueCell!17676)) (size!44582 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91152)

(declare-fun +!4762 (ListLongMap!21663 tuple2!24006) ListLongMap!21663)

(declare-fun getCurrentListMapNoExtraKeys!6404 (array!91150 array!91152 (_ BitVec 32) (_ BitVec 32) V!54635 V!54635 (_ BitVec 32) Int) ListLongMap!21663)

(declare-fun get!22217 (ValueCell!17676 V!54635) V!54635)

(declare-fun dynLambda!3701 (Int (_ BitVec 64)) V!54635)

(assert (=> b!1340727 (= lt!594033 (+!4762 (getCurrentListMapNoExtraKeys!6404 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24007 (select (arr!44031 _keys!1571) from!1960) (get!22217 (select (arr!44032 _values!1303) from!1960) (dynLambda!3701 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340728 () Bool)

(declare-fun res!889410 () Bool)

(assert (=> b!1340728 (=> (not res!889410) (not e!763594))))

(assert (=> b!1340728 (= res!889410 (and (= (size!44582 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44581 _keys!1571) (size!44582 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340729 () Bool)

(declare-fun res!889408 () Bool)

(assert (=> b!1340729 (=> (not res!889408) (not e!763594))))

(declare-datatypes ((List!31169 0))(
  ( (Nil!31166) (Cons!31165 (h!32374 (_ BitVec 64)) (t!45529 List!31169)) )
))
(declare-fun arrayNoDuplicates!0 (array!91150 (_ BitVec 32) List!31169) Bool)

(assert (=> b!1340729 (= res!889408 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31166))))

(declare-fun b!1340730 () Bool)

(declare-fun e!763598 () Bool)

(declare-fun e!763597 () Bool)

(declare-fun mapRes!57430 () Bool)

(assert (=> b!1340730 (= e!763598 (and e!763597 mapRes!57430))))

(declare-fun condMapEmpty!57430 () Bool)

(declare-fun mapDefault!57430 () ValueCell!17676)

(assert (=> b!1340730 (= condMapEmpty!57430 (= (arr!44032 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17676)) mapDefault!57430)))))

(declare-fun b!1340731 () Bool)

(declare-fun res!889414 () Bool)

(assert (=> b!1340731 (=> (not res!889414) (not e!763594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91150 (_ BitVec 32)) Bool)

(assert (=> b!1340731 (= res!889414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!889415 () Bool)

(assert (=> start!113098 (=> (not res!889415) (not e!763594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113098 (= res!889415 (validMask!0 mask!1977))))

(assert (=> start!113098 e!763594))

(assert (=> start!113098 tp_is_empty!37149))

(assert (=> start!113098 true))

(declare-fun array_inv!33199 (array!91150) Bool)

(assert (=> start!113098 (array_inv!33199 _keys!1571)))

(declare-fun array_inv!33200 (array!91152) Bool)

(assert (=> start!113098 (and (array_inv!33200 _values!1303) e!763598)))

(assert (=> start!113098 tp!109252))

(declare-fun b!1340732 () Bool)

(declare-fun res!889409 () Bool)

(assert (=> b!1340732 (=> (not res!889409) (not e!763594))))

(assert (=> b!1340732 (= res!889409 (not (= (select (arr!44031 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340733 () Bool)

(declare-fun res!889416 () Bool)

(assert (=> b!1340733 (=> (not res!889416) (not e!763594))))

(declare-fun getCurrentListMap!5815 (array!91150 array!91152 (_ BitVec 32) (_ BitVec 32) V!54635 V!54635 (_ BitVec 32) Int) ListLongMap!21663)

(assert (=> b!1340733 (= res!889416 (contains!9023 (getCurrentListMap!5815 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57430 () Bool)

(assert (=> mapIsEmpty!57430 mapRes!57430))

(declare-fun b!1340734 () Bool)

(assert (=> b!1340734 (= e!763597 tp_is_empty!37149)))

(declare-fun mapNonEmpty!57430 () Bool)

(declare-fun tp!109251 () Bool)

(assert (=> mapNonEmpty!57430 (= mapRes!57430 (and tp!109251 e!763595))))

(declare-fun mapValue!57430 () ValueCell!17676)

(declare-fun mapKey!57430 () (_ BitVec 32))

(declare-fun mapRest!57430 () (Array (_ BitVec 32) ValueCell!17676))

(assert (=> mapNonEmpty!57430 (= (arr!44032 _values!1303) (store mapRest!57430 mapKey!57430 mapValue!57430))))

(declare-fun b!1340735 () Bool)

(declare-fun res!889411 () Bool)

(assert (=> b!1340735 (=> (not res!889411) (not e!763594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340735 (= res!889411 (validKeyInArray!0 (select (arr!44031 _keys!1571) from!1960)))))

(declare-fun b!1340736 () Bool)

(declare-fun res!889412 () Bool)

(assert (=> b!1340736 (=> (not res!889412) (not e!763594))))

(assert (=> b!1340736 (= res!889412 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44581 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113098 res!889415) b!1340728))

(assert (= (and b!1340728 res!889410) b!1340731))

(assert (= (and b!1340731 res!889414) b!1340729))

(assert (= (and b!1340729 res!889408) b!1340736))

(assert (= (and b!1340736 res!889412) b!1340733))

(assert (= (and b!1340733 res!889416) b!1340732))

(assert (= (and b!1340732 res!889409) b!1340735))

(assert (= (and b!1340735 res!889411) b!1340726))

(assert (= (and b!1340726 res!889413) b!1340727))

(assert (= (and b!1340730 condMapEmpty!57430) mapIsEmpty!57430))

(assert (= (and b!1340730 (not condMapEmpty!57430)) mapNonEmpty!57430))

(get-info :version)

(assert (= (and mapNonEmpty!57430 ((_ is ValueCellFull!17676) mapValue!57430)) b!1340725))

(assert (= (and b!1340730 ((_ is ValueCellFull!17676) mapDefault!57430)) b!1340734))

(assert (= start!113098 b!1340730))

(declare-fun b_lambda!24325 () Bool)

(assert (=> (not b_lambda!24325) (not b!1340727)))

(declare-fun t!45527 () Bool)

(declare-fun tb!12163 () Bool)

(assert (=> (and start!113098 (= defaultEntry!1306 defaultEntry!1306) t!45527) tb!12163))

(declare-fun result!25417 () Bool)

(assert (=> tb!12163 (= result!25417 tp_is_empty!37149)))

(assert (=> b!1340727 t!45527))

(declare-fun b_and!50207 () Bool)

(assert (= b_and!50205 (and (=> t!45527 result!25417) b_and!50207)))

(declare-fun m!1228451 () Bool)

(assert (=> b!1340731 m!1228451))

(declare-fun m!1228453 () Bool)

(assert (=> b!1340733 m!1228453))

(assert (=> b!1340733 m!1228453))

(declare-fun m!1228455 () Bool)

(assert (=> b!1340733 m!1228455))

(declare-fun m!1228457 () Bool)

(assert (=> b!1340732 m!1228457))

(declare-fun m!1228459 () Bool)

(assert (=> b!1340729 m!1228459))

(declare-fun m!1228461 () Bool)

(assert (=> mapNonEmpty!57430 m!1228461))

(declare-fun m!1228463 () Bool)

(assert (=> b!1340727 m!1228463))

(declare-fun m!1228465 () Bool)

(assert (=> b!1340727 m!1228465))

(declare-fun m!1228467 () Bool)

(assert (=> b!1340727 m!1228467))

(declare-fun m!1228469 () Bool)

(assert (=> b!1340727 m!1228469))

(assert (=> b!1340727 m!1228463))

(declare-fun m!1228471 () Bool)

(assert (=> b!1340727 m!1228471))

(assert (=> b!1340727 m!1228465))

(declare-fun m!1228473 () Bool)

(assert (=> b!1340727 m!1228473))

(assert (=> b!1340727 m!1228457))

(assert (=> b!1340727 m!1228467))

(declare-fun m!1228475 () Bool)

(assert (=> b!1340727 m!1228475))

(declare-fun m!1228477 () Bool)

(assert (=> start!113098 m!1228477))

(declare-fun m!1228479 () Bool)

(assert (=> start!113098 m!1228479))

(declare-fun m!1228481 () Bool)

(assert (=> start!113098 m!1228481))

(assert (=> b!1340735 m!1228457))

(assert (=> b!1340735 m!1228457))

(declare-fun m!1228483 () Bool)

(assert (=> b!1340735 m!1228483))

(check-sat (not b_lambda!24325) (not b!1340735) (not b!1340729) b_and!50207 (not start!113098) (not mapNonEmpty!57430) (not b!1340733) (not b_next!31149) (not b!1340727) tp_is_empty!37149 (not b!1340731))
(check-sat b_and!50207 (not b_next!31149))
