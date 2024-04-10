; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111878 () Bool)

(assert start!111878)

(declare-fun b_free!30477 () Bool)

(declare-fun b_next!30477 () Bool)

(assert (=> start!111878 (= b_free!30477 (not b_next!30477))))

(declare-fun tp!106911 () Bool)

(declare-fun b_and!49049 () Bool)

(assert (=> start!111878 (= tp!106911 b_and!49049)))

(declare-fun res!879804 () Bool)

(declare-fun e!755675 () Bool)

(assert (=> start!111878 (=> (not res!879804) (not e!755675))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111878 (= res!879804 (validMask!0 mask!2019))))

(assert (=> start!111878 e!755675))

(declare-datatypes ((array!89502 0))(
  ( (array!89503 (arr!43224 (Array (_ BitVec 32) (_ BitVec 64))) (size!43774 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89502)

(declare-fun array_inv!32625 (array!89502) Bool)

(assert (=> start!111878 (array_inv!32625 _keys!1609)))

(assert (=> start!111878 true))

(declare-fun tp_is_empty!36297 () Bool)

(assert (=> start!111878 tp_is_empty!36297))

(declare-datatypes ((V!53499 0))(
  ( (V!53500 (val!18223 Int)) )
))
(declare-datatypes ((ValueCell!17250 0))(
  ( (ValueCellFull!17250 (v!20856 V!53499)) (EmptyCell!17250) )
))
(declare-datatypes ((array!89504 0))(
  ( (array!89505 (arr!43225 (Array (_ BitVec 32) ValueCell!17250)) (size!43775 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89504)

(declare-fun e!755674 () Bool)

(declare-fun array_inv!32626 (array!89504) Bool)

(assert (=> start!111878 (and (array_inv!32626 _values!1337) e!755674)))

(assert (=> start!111878 tp!106911))

(declare-fun b!1325628 () Bool)

(declare-fun res!879802 () Bool)

(assert (=> b!1325628 (=> (not res!879802) (not e!755675))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325628 (= res!879802 (not (= (select (arr!43224 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325629 () Bool)

(declare-fun res!879807 () Bool)

(assert (=> b!1325629 (=> (not res!879807) (not e!755675))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1325629 (= res!879807 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43774 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325630 () Bool)

(declare-fun res!879806 () Bool)

(assert (=> b!1325630 (=> (not res!879806) (not e!755675))))

(declare-fun zeroValue!1279 () V!53499)

(declare-fun minValue!1279 () V!53499)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23504 0))(
  ( (tuple2!23505 (_1!11763 (_ BitVec 64)) (_2!11763 V!53499)) )
))
(declare-datatypes ((List!30644 0))(
  ( (Nil!30641) (Cons!30640 (h!31849 tuple2!23504) (t!44592 List!30644)) )
))
(declare-datatypes ((ListLongMap!21161 0))(
  ( (ListLongMap!21162 (toList!10596 List!30644)) )
))
(declare-fun contains!8753 (ListLongMap!21161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5590 (array!89502 array!89504 (_ BitVec 32) (_ BitVec 32) V!53499 V!53499 (_ BitVec 32) Int) ListLongMap!21161)

(assert (=> b!1325630 (= res!879806 (contains!8753 (getCurrentListMap!5590 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325631 () Bool)

(declare-fun res!879805 () Bool)

(assert (=> b!1325631 (=> (not res!879805) (not e!755675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89502 (_ BitVec 32)) Bool)

(assert (=> b!1325631 (= res!879805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!56097 () Bool)

(declare-fun mapRes!56097 () Bool)

(assert (=> mapIsEmpty!56097 mapRes!56097))

(declare-fun b!1325632 () Bool)

(declare-fun e!755676 () Bool)

(assert (=> b!1325632 (= e!755676 tp_is_empty!36297)))

(declare-fun b!1325633 () Bool)

(declare-fun e!755673 () Bool)

(assert (=> b!1325633 (= e!755673 tp_is_empty!36297)))

(declare-fun b!1325634 () Bool)

(declare-fun res!879808 () Bool)

(assert (=> b!1325634 (=> (not res!879808) (not e!755675))))

(declare-datatypes ((List!30645 0))(
  ( (Nil!30642) (Cons!30641 (h!31850 (_ BitVec 64)) (t!44593 List!30645)) )
))
(declare-fun arrayNoDuplicates!0 (array!89502 (_ BitVec 32) List!30645) Bool)

(assert (=> b!1325634 (= res!879808 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30642))))

(declare-fun b!1325635 () Bool)

(assert (=> b!1325635 (= e!755674 (and e!755673 mapRes!56097))))

(declare-fun condMapEmpty!56097 () Bool)

(declare-fun mapDefault!56097 () ValueCell!17250)

(assert (=> b!1325635 (= condMapEmpty!56097 (= (arr!43225 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17250)) mapDefault!56097)))))

(declare-fun b!1325636 () Bool)

(declare-fun res!879801 () Bool)

(assert (=> b!1325636 (=> (not res!879801) (not e!755675))))

(assert (=> b!1325636 (= res!879801 (and (= (size!43775 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43774 _keys!1609) (size!43775 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325637 () Bool)

(assert (=> b!1325637 (= e!755675 (not (bvslt from!2000 (size!43775 _values!1337))))))

(declare-fun lt!589814 () ListLongMap!21161)

(assert (=> b!1325637 (contains!8753 lt!589814 k0!1164)))

(declare-datatypes ((Unit!43666 0))(
  ( (Unit!43667) )
))
(declare-fun lt!589815 () Unit!43666)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!211 ((_ BitVec 64) (_ BitVec 64) V!53499 ListLongMap!21161) Unit!43666)

(assert (=> b!1325637 (= lt!589815 (lemmaInListMapAfterAddingDiffThenInBefore!211 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589814))))

(declare-fun +!4619 (ListLongMap!21161 tuple2!23504) ListLongMap!21161)

(declare-fun getCurrentListMapNoExtraKeys!6257 (array!89502 array!89504 (_ BitVec 32) (_ BitVec 32) V!53499 V!53499 (_ BitVec 32) Int) ListLongMap!21161)

(declare-fun get!21772 (ValueCell!17250 V!53499) V!53499)

(declare-fun dynLambda!3558 (Int (_ BitVec 64)) V!53499)

(assert (=> b!1325637 (= lt!589814 (+!4619 (+!4619 (getCurrentListMapNoExtraKeys!6257 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23505 (select (arr!43224 _keys!1609) from!2000) (get!21772 (select (arr!43225 _values!1337) from!2000) (dynLambda!3558 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!56097 () Bool)

(declare-fun tp!106910 () Bool)

(assert (=> mapNonEmpty!56097 (= mapRes!56097 (and tp!106910 e!755676))))

(declare-fun mapKey!56097 () (_ BitVec 32))

(declare-fun mapRest!56097 () (Array (_ BitVec 32) ValueCell!17250))

(declare-fun mapValue!56097 () ValueCell!17250)

(assert (=> mapNonEmpty!56097 (= (arr!43225 _values!1337) (store mapRest!56097 mapKey!56097 mapValue!56097))))

(declare-fun b!1325638 () Bool)

(declare-fun res!879803 () Bool)

(assert (=> b!1325638 (=> (not res!879803) (not e!755675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325638 (= res!879803 (validKeyInArray!0 (select (arr!43224 _keys!1609) from!2000)))))

(assert (= (and start!111878 res!879804) b!1325636))

(assert (= (and b!1325636 res!879801) b!1325631))

(assert (= (and b!1325631 res!879805) b!1325634))

(assert (= (and b!1325634 res!879808) b!1325629))

(assert (= (and b!1325629 res!879807) b!1325630))

(assert (= (and b!1325630 res!879806) b!1325628))

(assert (= (and b!1325628 res!879802) b!1325638))

(assert (= (and b!1325638 res!879803) b!1325637))

(assert (= (and b!1325635 condMapEmpty!56097) mapIsEmpty!56097))

(assert (= (and b!1325635 (not condMapEmpty!56097)) mapNonEmpty!56097))

(get-info :version)

(assert (= (and mapNonEmpty!56097 ((_ is ValueCellFull!17250) mapValue!56097)) b!1325632))

(assert (= (and b!1325635 ((_ is ValueCellFull!17250) mapDefault!56097)) b!1325633))

(assert (= start!111878 b!1325635))

(declare-fun b_lambda!23755 () Bool)

(assert (=> (not b_lambda!23755) (not b!1325637)))

(declare-fun t!44591 () Bool)

(declare-fun tb!11751 () Bool)

(assert (=> (and start!111878 (= defaultEntry!1340 defaultEntry!1340) t!44591) tb!11751))

(declare-fun result!24559 () Bool)

(assert (=> tb!11751 (= result!24559 tp_is_empty!36297)))

(assert (=> b!1325637 t!44591))

(declare-fun b_and!49051 () Bool)

(assert (= b_and!49049 (and (=> t!44591 result!24559) b_and!49051)))

(declare-fun m!1214521 () Bool)

(assert (=> b!1325631 m!1214521))

(declare-fun m!1214523 () Bool)

(assert (=> b!1325630 m!1214523))

(assert (=> b!1325630 m!1214523))

(declare-fun m!1214525 () Bool)

(assert (=> b!1325630 m!1214525))

(declare-fun m!1214527 () Bool)

(assert (=> start!111878 m!1214527))

(declare-fun m!1214529 () Bool)

(assert (=> start!111878 m!1214529))

(declare-fun m!1214531 () Bool)

(assert (=> start!111878 m!1214531))

(declare-fun m!1214533 () Bool)

(assert (=> mapNonEmpty!56097 m!1214533))

(declare-fun m!1214535 () Bool)

(assert (=> b!1325638 m!1214535))

(assert (=> b!1325638 m!1214535))

(declare-fun m!1214537 () Bool)

(assert (=> b!1325638 m!1214537))

(declare-fun m!1214539 () Bool)

(assert (=> b!1325637 m!1214539))

(declare-fun m!1214541 () Bool)

(assert (=> b!1325637 m!1214541))

(assert (=> b!1325637 m!1214539))

(declare-fun m!1214543 () Bool)

(assert (=> b!1325637 m!1214543))

(declare-fun m!1214545 () Bool)

(assert (=> b!1325637 m!1214545))

(declare-fun m!1214547 () Bool)

(assert (=> b!1325637 m!1214547))

(declare-fun m!1214549 () Bool)

(assert (=> b!1325637 m!1214549))

(assert (=> b!1325637 m!1214543))

(declare-fun m!1214551 () Bool)

(assert (=> b!1325637 m!1214551))

(assert (=> b!1325637 m!1214549))

(assert (=> b!1325637 m!1214541))

(declare-fun m!1214553 () Bool)

(assert (=> b!1325637 m!1214553))

(assert (=> b!1325637 m!1214535))

(assert (=> b!1325628 m!1214535))

(declare-fun m!1214555 () Bool)

(assert (=> b!1325634 m!1214555))

(check-sat (not b!1325637) (not b!1325630) tp_is_empty!36297 (not start!111878) (not b_next!30477) b_and!49051 (not b!1325631) (not b!1325638) (not b!1325634) (not b_lambda!23755) (not mapNonEmpty!56097))
(check-sat b_and!49051 (not b_next!30477))
