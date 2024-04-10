; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113092 () Bool)

(assert start!113092)

(declare-fun b_free!31143 () Bool)

(declare-fun b_next!31143 () Bool)

(assert (=> start!113092 (= b_free!31143 (not b_next!31143))))

(declare-fun tp!109234 () Bool)

(declare-fun b_and!50193 () Bool)

(assert (=> start!113092 (= tp!109234 b_and!50193)))

(declare-fun b!1340611 () Bool)

(declare-fun res!889334 () Bool)

(declare-fun e!763550 () Bool)

(assert (=> b!1340611 (=> (not res!889334) (not e!763550))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340611 (= res!889334 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57421 () Bool)

(declare-fun mapRes!57421 () Bool)

(declare-fun tp!109233 () Bool)

(declare-fun e!763552 () Bool)

(assert (=> mapNonEmpty!57421 (= mapRes!57421 (and tp!109233 e!763552))))

(declare-fun mapKey!57421 () (_ BitVec 32))

(declare-datatypes ((V!54627 0))(
  ( (V!54628 (val!18646 Int)) )
))
(declare-datatypes ((ValueCell!17673 0))(
  ( (ValueCellFull!17673 (v!21294 V!54627)) (EmptyCell!17673) )
))
(declare-fun mapRest!57421 () (Array (_ BitVec 32) ValueCell!17673))

(declare-fun mapValue!57421 () ValueCell!17673)

(declare-datatypes ((array!91138 0))(
  ( (array!91139 (arr!44025 (Array (_ BitVec 32) ValueCell!17673)) (size!44575 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91138)

(assert (=> mapNonEmpty!57421 (= (arr!44025 _values!1303) (store mapRest!57421 mapKey!57421 mapValue!57421))))

(declare-fun b!1340612 () Bool)

(declare-fun res!889327 () Bool)

(assert (=> b!1340612 (=> (not res!889327) (not e!763550))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91140 0))(
  ( (array!91141 (arr!44026 (Array (_ BitVec 32) (_ BitVec 64))) (size!44576 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91140)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340612 (= res!889327 (not (= (select (arr!44026 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!889329 () Bool)

(assert (=> start!113092 (=> (not res!889329) (not e!763550))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113092 (= res!889329 (validMask!0 mask!1977))))

(assert (=> start!113092 e!763550))

(declare-fun tp_is_empty!37143 () Bool)

(assert (=> start!113092 tp_is_empty!37143))

(assert (=> start!113092 true))

(declare-fun array_inv!33195 (array!91140) Bool)

(assert (=> start!113092 (array_inv!33195 _keys!1571)))

(declare-fun e!763553 () Bool)

(declare-fun array_inv!33196 (array!91138) Bool)

(assert (=> start!113092 (and (array_inv!33196 _values!1303) e!763553)))

(assert (=> start!113092 tp!109234))

(declare-fun b!1340613 () Bool)

(declare-fun res!889328 () Bool)

(assert (=> b!1340613 (=> (not res!889328) (not e!763550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340613 (= res!889328 (validKeyInArray!0 (select (arr!44026 _keys!1571) from!1960)))))

(declare-fun b!1340614 () Bool)

(declare-fun res!889335 () Bool)

(assert (=> b!1340614 (=> (not res!889335) (not e!763550))))

(assert (=> b!1340614 (= res!889335 (and (= (size!44575 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44576 _keys!1571) (size!44575 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340615 () Bool)

(declare-fun res!889333 () Bool)

(assert (=> b!1340615 (=> (not res!889333) (not e!763550))))

(declare-fun minValue!1245 () V!54627)

(declare-fun zeroValue!1245 () V!54627)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24000 0))(
  ( (tuple2!24001 (_1!12011 (_ BitVec 64)) (_2!12011 V!54627)) )
))
(declare-datatypes ((List!31162 0))(
  ( (Nil!31159) (Cons!31158 (h!32367 tuple2!24000) (t!45516 List!31162)) )
))
(declare-datatypes ((ListLongMap!21657 0))(
  ( (ListLongMap!21658 (toList!10844 List!31162)) )
))
(declare-fun contains!9020 (ListLongMap!21657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5812 (array!91140 array!91138 (_ BitVec 32) (_ BitVec 32) V!54627 V!54627 (_ BitVec 32) Int) ListLongMap!21657)

(assert (=> b!1340615 (= res!889333 (contains!9020 (getCurrentListMap!5812 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340616 () Bool)

(assert (=> b!1340616 (= e!763550 (not true))))

(declare-fun lt!594014 () ListLongMap!21657)

(assert (=> b!1340616 (contains!9020 lt!594014 k0!1142)))

(declare-datatypes ((Unit!43997 0))(
  ( (Unit!43998) )
))
(declare-fun lt!594015 () Unit!43997)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!329 ((_ BitVec 64) (_ BitVec 64) V!54627 ListLongMap!21657) Unit!43997)

(assert (=> b!1340616 (= lt!594015 (lemmaInListMapAfterAddingDiffThenInBefore!329 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594014))))

(declare-fun +!4760 (ListLongMap!21657 tuple2!24000) ListLongMap!21657)

(declare-fun getCurrentListMapNoExtraKeys!6402 (array!91140 array!91138 (_ BitVec 32) (_ BitVec 32) V!54627 V!54627 (_ BitVec 32) Int) ListLongMap!21657)

(declare-fun get!22213 (ValueCell!17673 V!54627) V!54627)

(declare-fun dynLambda!3699 (Int (_ BitVec 64)) V!54627)

(assert (=> b!1340616 (= lt!594014 (+!4760 (getCurrentListMapNoExtraKeys!6402 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24001 (select (arr!44026 _keys!1571) from!1960) (get!22213 (select (arr!44025 _values!1303) from!1960) (dynLambda!3699 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340617 () Bool)

(assert (=> b!1340617 (= e!763552 tp_is_empty!37143)))

(declare-fun mapIsEmpty!57421 () Bool)

(assert (=> mapIsEmpty!57421 mapRes!57421))

(declare-fun b!1340618 () Bool)

(declare-fun e!763549 () Bool)

(assert (=> b!1340618 (= e!763553 (and e!763549 mapRes!57421))))

(declare-fun condMapEmpty!57421 () Bool)

(declare-fun mapDefault!57421 () ValueCell!17673)

(assert (=> b!1340618 (= condMapEmpty!57421 (= (arr!44025 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17673)) mapDefault!57421)))))

(declare-fun b!1340619 () Bool)

(declare-fun res!889332 () Bool)

(assert (=> b!1340619 (=> (not res!889332) (not e!763550))))

(declare-datatypes ((List!31163 0))(
  ( (Nil!31160) (Cons!31159 (h!32368 (_ BitVec 64)) (t!45517 List!31163)) )
))
(declare-fun arrayNoDuplicates!0 (array!91140 (_ BitVec 32) List!31163) Bool)

(assert (=> b!1340619 (= res!889332 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31160))))

(declare-fun b!1340620 () Bool)

(declare-fun res!889331 () Bool)

(assert (=> b!1340620 (=> (not res!889331) (not e!763550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91140 (_ BitVec 32)) Bool)

(assert (=> b!1340620 (= res!889331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340621 () Bool)

(declare-fun res!889330 () Bool)

(assert (=> b!1340621 (=> (not res!889330) (not e!763550))))

(assert (=> b!1340621 (= res!889330 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44576 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340622 () Bool)

(assert (=> b!1340622 (= e!763549 tp_is_empty!37143)))

(assert (= (and start!113092 res!889329) b!1340614))

(assert (= (and b!1340614 res!889335) b!1340620))

(assert (= (and b!1340620 res!889331) b!1340619))

(assert (= (and b!1340619 res!889332) b!1340621))

(assert (= (and b!1340621 res!889330) b!1340615))

(assert (= (and b!1340615 res!889333) b!1340612))

(assert (= (and b!1340612 res!889327) b!1340613))

(assert (= (and b!1340613 res!889328) b!1340611))

(assert (= (and b!1340611 res!889334) b!1340616))

(assert (= (and b!1340618 condMapEmpty!57421) mapIsEmpty!57421))

(assert (= (and b!1340618 (not condMapEmpty!57421)) mapNonEmpty!57421))

(get-info :version)

(assert (= (and mapNonEmpty!57421 ((_ is ValueCellFull!17673) mapValue!57421)) b!1340617))

(assert (= (and b!1340618 ((_ is ValueCellFull!17673) mapDefault!57421)) b!1340622))

(assert (= start!113092 b!1340618))

(declare-fun b_lambda!24319 () Bool)

(assert (=> (not b_lambda!24319) (not b!1340616)))

(declare-fun t!45515 () Bool)

(declare-fun tb!12157 () Bool)

(assert (=> (and start!113092 (= defaultEntry!1306 defaultEntry!1306) t!45515) tb!12157))

(declare-fun result!25405 () Bool)

(assert (=> tb!12157 (= result!25405 tp_is_empty!37143)))

(assert (=> b!1340616 t!45515))

(declare-fun b_and!50195 () Bool)

(assert (= b_and!50193 (and (=> t!45515 result!25405) b_and!50195)))

(declare-fun m!1228349 () Bool)

(assert (=> b!1340619 m!1228349))

(declare-fun m!1228351 () Bool)

(assert (=> b!1340620 m!1228351))

(declare-fun m!1228353 () Bool)

(assert (=> start!113092 m!1228353))

(declare-fun m!1228355 () Bool)

(assert (=> start!113092 m!1228355))

(declare-fun m!1228357 () Bool)

(assert (=> start!113092 m!1228357))

(declare-fun m!1228359 () Bool)

(assert (=> b!1340613 m!1228359))

(assert (=> b!1340613 m!1228359))

(declare-fun m!1228361 () Bool)

(assert (=> b!1340613 m!1228361))

(declare-fun m!1228363 () Bool)

(assert (=> b!1340615 m!1228363))

(assert (=> b!1340615 m!1228363))

(declare-fun m!1228365 () Bool)

(assert (=> b!1340615 m!1228365))

(declare-fun m!1228367 () Bool)

(assert (=> b!1340616 m!1228367))

(declare-fun m!1228369 () Bool)

(assert (=> b!1340616 m!1228369))

(declare-fun m!1228371 () Bool)

(assert (=> b!1340616 m!1228371))

(declare-fun m!1228373 () Bool)

(assert (=> b!1340616 m!1228373))

(declare-fun m!1228375 () Bool)

(assert (=> b!1340616 m!1228375))

(assert (=> b!1340616 m!1228369))

(declare-fun m!1228377 () Bool)

(assert (=> b!1340616 m!1228377))

(assert (=> b!1340616 m!1228371))

(assert (=> b!1340616 m!1228373))

(assert (=> b!1340616 m!1228359))

(declare-fun m!1228379 () Bool)

(assert (=> b!1340616 m!1228379))

(assert (=> b!1340612 m!1228359))

(declare-fun m!1228381 () Bool)

(assert (=> mapNonEmpty!57421 m!1228381))

(check-sat tp_is_empty!37143 (not b!1340620) (not b!1340615) (not b!1340616) b_and!50195 (not b!1340613) (not mapNonEmpty!57421) (not b_next!31143) (not start!113092) (not b_lambda!24319) (not b!1340619))
(check-sat b_and!50195 (not b_next!31143))
