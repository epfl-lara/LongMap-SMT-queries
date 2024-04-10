; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111890 () Bool)

(assert start!111890)

(declare-fun b_free!30489 () Bool)

(declare-fun b_next!30489 () Bool)

(assert (=> start!111890 (= b_free!30489 (not b_next!30489))))

(declare-fun tp!106947 () Bool)

(declare-fun b_and!49073 () Bool)

(assert (=> start!111890 (= tp!106947 b_and!49073)))

(declare-fun b!1325838 () Bool)

(declare-fun e!755763 () Bool)

(declare-fun tp_is_empty!36309 () Bool)

(assert (=> b!1325838 (= e!755763 tp_is_empty!36309)))

(declare-fun b!1325839 () Bool)

(declare-fun res!879949 () Bool)

(declare-fun e!755765 () Bool)

(assert (=> b!1325839 (=> (not res!879949) (not e!755765))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53515 0))(
  ( (V!53516 (val!18229 Int)) )
))
(declare-fun zeroValue!1279 () V!53515)

(declare-datatypes ((ValueCell!17256 0))(
  ( (ValueCellFull!17256 (v!20862 V!53515)) (EmptyCell!17256) )
))
(declare-datatypes ((array!89524 0))(
  ( (array!89525 (arr!43235 (Array (_ BitVec 32) ValueCell!17256)) (size!43785 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89524)

(declare-fun minValue!1279 () V!53515)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89526 0))(
  ( (array!89527 (arr!43236 (Array (_ BitVec 32) (_ BitVec 64))) (size!43786 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89526)

(declare-datatypes ((tuple2!23512 0))(
  ( (tuple2!23513 (_1!11767 (_ BitVec 64)) (_2!11767 V!53515)) )
))
(declare-datatypes ((List!30652 0))(
  ( (Nil!30649) (Cons!30648 (h!31857 tuple2!23512) (t!44612 List!30652)) )
))
(declare-datatypes ((ListLongMap!21169 0))(
  ( (ListLongMap!21170 (toList!10600 List!30652)) )
))
(declare-fun contains!8757 (ListLongMap!21169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5593 (array!89526 array!89524 (_ BitVec 32) (_ BitVec 32) V!53515 V!53515 (_ BitVec 32) Int) ListLongMap!21169)

(assert (=> b!1325839 (= res!879949 (contains!8757 (getCurrentListMap!5593 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325840 () Bool)

(assert (=> b!1325840 (= e!755765 (not true))))

(declare-fun lt!589851 () ListLongMap!21169)

(assert (=> b!1325840 (contains!8757 lt!589851 k0!1164)))

(declare-datatypes ((Unit!43674 0))(
  ( (Unit!43675) )
))
(declare-fun lt!589850 () Unit!43674)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!215 ((_ BitVec 64) (_ BitVec 64) V!53515 ListLongMap!21169) Unit!43674)

(assert (=> b!1325840 (= lt!589850 (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589851))))

(declare-fun +!4623 (ListLongMap!21169 tuple2!23512) ListLongMap!21169)

(declare-fun getCurrentListMapNoExtraKeys!6261 (array!89526 array!89524 (_ BitVec 32) (_ BitVec 32) V!53515 V!53515 (_ BitVec 32) Int) ListLongMap!21169)

(declare-fun get!21780 (ValueCell!17256 V!53515) V!53515)

(declare-fun dynLambda!3562 (Int (_ BitVec 64)) V!53515)

(assert (=> b!1325840 (= lt!589851 (+!4623 (+!4623 (getCurrentListMapNoExtraKeys!6261 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23513 (select (arr!43236 _keys!1609) from!2000) (get!21780 (select (arr!43235 _values!1337) from!2000) (dynLambda!3562 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325841 () Bool)

(declare-fun e!755766 () Bool)

(assert (=> b!1325841 (= e!755766 tp_is_empty!36309)))

(declare-fun mapNonEmpty!56115 () Bool)

(declare-fun mapRes!56115 () Bool)

(declare-fun tp!106946 () Bool)

(assert (=> mapNonEmpty!56115 (= mapRes!56115 (and tp!106946 e!755766))))

(declare-fun mapKey!56115 () (_ BitVec 32))

(declare-fun mapValue!56115 () ValueCell!17256)

(declare-fun mapRest!56115 () (Array (_ BitVec 32) ValueCell!17256))

(assert (=> mapNonEmpty!56115 (= (arr!43235 _values!1337) (store mapRest!56115 mapKey!56115 mapValue!56115))))

(declare-fun b!1325842 () Bool)

(declare-fun res!879950 () Bool)

(assert (=> b!1325842 (=> (not res!879950) (not e!755765))))

(assert (=> b!1325842 (= res!879950 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43786 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325843 () Bool)

(declare-fun res!879946 () Bool)

(assert (=> b!1325843 (=> (not res!879946) (not e!755765))))

(declare-datatypes ((List!30653 0))(
  ( (Nil!30650) (Cons!30649 (h!31858 (_ BitVec 64)) (t!44613 List!30653)) )
))
(declare-fun arrayNoDuplicates!0 (array!89526 (_ BitVec 32) List!30653) Bool)

(assert (=> b!1325843 (= res!879946 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30650))))

(declare-fun b!1325844 () Bool)

(declare-fun res!879952 () Bool)

(assert (=> b!1325844 (=> (not res!879952) (not e!755765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325844 (= res!879952 (validKeyInArray!0 (select (arr!43236 _keys!1609) from!2000)))))

(declare-fun res!879951 () Bool)

(assert (=> start!111890 (=> (not res!879951) (not e!755765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111890 (= res!879951 (validMask!0 mask!2019))))

(assert (=> start!111890 e!755765))

(declare-fun array_inv!32635 (array!89526) Bool)

(assert (=> start!111890 (array_inv!32635 _keys!1609)))

(assert (=> start!111890 true))

(assert (=> start!111890 tp_is_empty!36309))

(declare-fun e!755767 () Bool)

(declare-fun array_inv!32636 (array!89524) Bool)

(assert (=> start!111890 (and (array_inv!32636 _values!1337) e!755767)))

(assert (=> start!111890 tp!106947))

(declare-fun mapIsEmpty!56115 () Bool)

(assert (=> mapIsEmpty!56115 mapRes!56115))

(declare-fun b!1325845 () Bool)

(declare-fun res!879945 () Bool)

(assert (=> b!1325845 (=> (not res!879945) (not e!755765))))

(assert (=> b!1325845 (= res!879945 (and (= (size!43785 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43786 _keys!1609) (size!43785 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325846 () Bool)

(assert (=> b!1325846 (= e!755767 (and e!755763 mapRes!56115))))

(declare-fun condMapEmpty!56115 () Bool)

(declare-fun mapDefault!56115 () ValueCell!17256)

(assert (=> b!1325846 (= condMapEmpty!56115 (= (arr!43235 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17256)) mapDefault!56115)))))

(declare-fun b!1325847 () Bool)

(declare-fun res!879948 () Bool)

(assert (=> b!1325847 (=> (not res!879948) (not e!755765))))

(assert (=> b!1325847 (= res!879948 (not (= (select (arr!43236 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325848 () Bool)

(declare-fun res!879947 () Bool)

(assert (=> b!1325848 (=> (not res!879947) (not e!755765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89526 (_ BitVec 32)) Bool)

(assert (=> b!1325848 (= res!879947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111890 res!879951) b!1325845))

(assert (= (and b!1325845 res!879945) b!1325848))

(assert (= (and b!1325848 res!879947) b!1325843))

(assert (= (and b!1325843 res!879946) b!1325842))

(assert (= (and b!1325842 res!879950) b!1325839))

(assert (= (and b!1325839 res!879949) b!1325847))

(assert (= (and b!1325847 res!879948) b!1325844))

(assert (= (and b!1325844 res!879952) b!1325840))

(assert (= (and b!1325846 condMapEmpty!56115) mapIsEmpty!56115))

(assert (= (and b!1325846 (not condMapEmpty!56115)) mapNonEmpty!56115))

(get-info :version)

(assert (= (and mapNonEmpty!56115 ((_ is ValueCellFull!17256) mapValue!56115)) b!1325841))

(assert (= (and b!1325846 ((_ is ValueCellFull!17256) mapDefault!56115)) b!1325838))

(assert (= start!111890 b!1325846))

(declare-fun b_lambda!23767 () Bool)

(assert (=> (not b_lambda!23767) (not b!1325840)))

(declare-fun t!44611 () Bool)

(declare-fun tb!11763 () Bool)

(assert (=> (and start!111890 (= defaultEntry!1340 defaultEntry!1340) t!44611) tb!11763))

(declare-fun result!24583 () Bool)

(assert (=> tb!11763 (= result!24583 tp_is_empty!36309)))

(assert (=> b!1325840 t!44611))

(declare-fun b_and!49075 () Bool)

(assert (= b_and!49073 (and (=> t!44611 result!24583) b_and!49075)))

(declare-fun m!1214737 () Bool)

(assert (=> b!1325844 m!1214737))

(assert (=> b!1325844 m!1214737))

(declare-fun m!1214739 () Bool)

(assert (=> b!1325844 m!1214739))

(declare-fun m!1214741 () Bool)

(assert (=> start!111890 m!1214741))

(declare-fun m!1214743 () Bool)

(assert (=> start!111890 m!1214743))

(declare-fun m!1214745 () Bool)

(assert (=> start!111890 m!1214745))

(declare-fun m!1214747 () Bool)

(assert (=> mapNonEmpty!56115 m!1214747))

(declare-fun m!1214749 () Bool)

(assert (=> b!1325843 m!1214749))

(declare-fun m!1214751 () Bool)

(assert (=> b!1325839 m!1214751))

(assert (=> b!1325839 m!1214751))

(declare-fun m!1214753 () Bool)

(assert (=> b!1325839 m!1214753))

(assert (=> b!1325847 m!1214737))

(declare-fun m!1214755 () Bool)

(assert (=> b!1325840 m!1214755))

(declare-fun m!1214757 () Bool)

(assert (=> b!1325840 m!1214757))

(declare-fun m!1214759 () Bool)

(assert (=> b!1325840 m!1214759))

(assert (=> b!1325840 m!1214757))

(declare-fun m!1214761 () Bool)

(assert (=> b!1325840 m!1214761))

(declare-fun m!1214763 () Bool)

(assert (=> b!1325840 m!1214763))

(assert (=> b!1325840 m!1214761))

(declare-fun m!1214765 () Bool)

(assert (=> b!1325840 m!1214765))

(assert (=> b!1325840 m!1214763))

(assert (=> b!1325840 m!1214759))

(declare-fun m!1214767 () Bool)

(assert (=> b!1325840 m!1214767))

(assert (=> b!1325840 m!1214737))

(declare-fun m!1214769 () Bool)

(assert (=> b!1325840 m!1214769))

(declare-fun m!1214771 () Bool)

(assert (=> b!1325848 m!1214771))

(check-sat (not mapNonEmpty!56115) (not b!1325848) (not b_lambda!23767) b_and!49075 (not b!1325843) (not b_next!30489) (not b!1325844) (not b!1325839) (not start!111890) (not b!1325840) tp_is_empty!36309)
(check-sat b_and!49075 (not b_next!30489))
