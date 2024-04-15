; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111656 () Bool)

(assert start!111656)

(declare-fun b_free!30313 () Bool)

(declare-fun b_next!30313 () Bool)

(assert (=> start!111656 (= b_free!30313 (not b_next!30313))))

(declare-fun tp!106415 () Bool)

(declare-fun b_and!48767 () Bool)

(assert (=> start!111656 (= tp!106415 b_and!48767)))

(declare-fun b!1322625 () Bool)

(declare-fun res!877907 () Bool)

(declare-fun e!754155 () Bool)

(assert (=> b!1322625 (=> (not res!877907) (not e!754155))))

(declare-datatypes ((array!89119 0))(
  ( (array!89120 (arr!43034 (Array (_ BitVec 32) (_ BitVec 64))) (size!43586 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89119)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322625 (= res!877907 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43586 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322626 () Bool)

(declare-fun res!877911 () Bool)

(assert (=> b!1322626 (=> (not res!877911) (not e!754155))))

(assert (=> b!1322626 (= res!877911 (not (= (select (arr!43034 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55847 () Bool)

(declare-fun mapRes!55847 () Bool)

(declare-fun tp!106416 () Bool)

(declare-fun e!754152 () Bool)

(assert (=> mapNonEmpty!55847 (= mapRes!55847 (and tp!106416 e!754152))))

(declare-datatypes ((V!53281 0))(
  ( (V!53282 (val!18141 Int)) )
))
(declare-datatypes ((ValueCell!17168 0))(
  ( (ValueCellFull!17168 (v!20770 V!53281)) (EmptyCell!17168) )
))
(declare-datatypes ((array!89121 0))(
  ( (array!89122 (arr!43035 (Array (_ BitVec 32) ValueCell!17168)) (size!43587 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89121)

(declare-fun mapKey!55847 () (_ BitVec 32))

(declare-fun mapValue!55847 () ValueCell!17168)

(declare-fun mapRest!55847 () (Array (_ BitVec 32) ValueCell!17168))

(assert (=> mapNonEmpty!55847 (= (arr!43035 _values!1337) (store mapRest!55847 mapKey!55847 mapValue!55847))))

(declare-fun b!1322627 () Bool)

(declare-fun res!877906 () Bool)

(assert (=> b!1322627 (=> (not res!877906) (not e!754155))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1322627 (= res!877906 (and (= (size!43587 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43586 _keys!1609) (size!43587 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322628 () Bool)

(declare-fun tp_is_empty!36133 () Bool)

(assert (=> b!1322628 (= e!754152 tp_is_empty!36133)))

(declare-fun b!1322629 () Bool)

(declare-fun res!877904 () Bool)

(assert (=> b!1322629 (=> (not res!877904) (not e!754155))))

(declare-fun zeroValue!1279 () V!53281)

(declare-fun minValue!1279 () V!53281)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23450 0))(
  ( (tuple2!23451 (_1!11736 (_ BitVec 64)) (_2!11736 V!53281)) )
))
(declare-datatypes ((List!30585 0))(
  ( (Nil!30582) (Cons!30581 (h!31790 tuple2!23450) (t!44439 List!30585)) )
))
(declare-datatypes ((ListLongMap!21107 0))(
  ( (ListLongMap!21108 (toList!10569 List!30585)) )
))
(declare-fun contains!8652 (ListLongMap!21107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5452 (array!89119 array!89121 (_ BitVec 32) (_ BitVec 32) V!53281 V!53281 (_ BitVec 32) Int) ListLongMap!21107)

(assert (=> b!1322629 (= res!877904 (contains!8652 (getCurrentListMap!5452 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55847 () Bool)

(assert (=> mapIsEmpty!55847 mapRes!55847))

(declare-fun b!1322630 () Bool)

(declare-fun res!877909 () Bool)

(assert (=> b!1322630 (=> (not res!877909) (not e!754155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89119 (_ BitVec 32)) Bool)

(assert (=> b!1322630 (= res!877909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322631 () Bool)

(declare-fun res!877905 () Bool)

(assert (=> b!1322631 (=> (not res!877905) (not e!754155))))

(declare-datatypes ((List!30586 0))(
  ( (Nil!30583) (Cons!30582 (h!31791 (_ BitVec 64)) (t!44440 List!30586)) )
))
(declare-fun arrayNoDuplicates!0 (array!89119 (_ BitVec 32) List!30586) Bool)

(assert (=> b!1322631 (= res!877905 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30583))))

(declare-fun b!1322633 () Bool)

(declare-fun e!754154 () Bool)

(declare-fun e!754153 () Bool)

(assert (=> b!1322633 (= e!754154 (and e!754153 mapRes!55847))))

(declare-fun condMapEmpty!55847 () Bool)

(declare-fun mapDefault!55847 () ValueCell!17168)

(assert (=> b!1322633 (= condMapEmpty!55847 (= (arr!43035 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17168)) mapDefault!55847)))))

(declare-fun b!1322632 () Bool)

(assert (=> b!1322632 (= e!754153 tp_is_empty!36133)))

(declare-fun res!877910 () Bool)

(assert (=> start!111656 (=> (not res!877910) (not e!754155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111656 (= res!877910 (validMask!0 mask!2019))))

(assert (=> start!111656 e!754155))

(declare-fun array_inv!32673 (array!89119) Bool)

(assert (=> start!111656 (array_inv!32673 _keys!1609)))

(assert (=> start!111656 true))

(assert (=> start!111656 tp_is_empty!36133))

(declare-fun array_inv!32674 (array!89121) Bool)

(assert (=> start!111656 (and (array_inv!32674 _values!1337) e!754154)))

(assert (=> start!111656 tp!106415))

(declare-fun b!1322634 () Bool)

(declare-fun res!877908 () Bool)

(assert (=> b!1322634 (=> (not res!877908) (not e!754155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322634 (= res!877908 (validKeyInArray!0 (select (arr!43034 _keys!1609) from!2000)))))

(declare-fun b!1322635 () Bool)

(assert (=> b!1322635 (= e!754155 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!588180 () ListLongMap!21107)

(declare-fun lt!588183 () tuple2!23450)

(declare-fun +!4608 (ListLongMap!21107 tuple2!23450) ListLongMap!21107)

(assert (=> b!1322635 (contains!8652 (+!4608 lt!588180 lt!588183) k0!1164)))

(declare-datatypes ((Unit!43399 0))(
  ( (Unit!43400) )
))
(declare-fun lt!588184 () Unit!43399)

(declare-fun addStillContains!1132 (ListLongMap!21107 (_ BitVec 64) V!53281 (_ BitVec 64)) Unit!43399)

(assert (=> b!1322635 (= lt!588184 (addStillContains!1132 lt!588180 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322635 (contains!8652 lt!588180 k0!1164)))

(declare-fun lt!588185 () V!53281)

(declare-fun lt!588178 () Unit!43399)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!173 ((_ BitVec 64) (_ BitVec 64) V!53281 ListLongMap!21107) Unit!43399)

(assert (=> b!1322635 (= lt!588178 (lemmaInListMapAfterAddingDiffThenInBefore!173 k0!1164 (select (arr!43034 _keys!1609) from!2000) lt!588185 lt!588180))))

(declare-fun lt!588186 () ListLongMap!21107)

(assert (=> b!1322635 (contains!8652 lt!588186 k0!1164)))

(declare-fun lt!588179 () Unit!43399)

(assert (=> b!1322635 (= lt!588179 (lemmaInListMapAfterAddingDiffThenInBefore!173 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588186))))

(declare-fun lt!588181 () ListLongMap!21107)

(assert (=> b!1322635 (contains!8652 lt!588181 k0!1164)))

(declare-fun lt!588182 () Unit!43399)

(assert (=> b!1322635 (= lt!588182 (lemmaInListMapAfterAddingDiffThenInBefore!173 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588181))))

(assert (=> b!1322635 (= lt!588181 (+!4608 lt!588186 lt!588183))))

(assert (=> b!1322635 (= lt!588183 (tuple2!23451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322635 (= lt!588186 (+!4608 lt!588180 (tuple2!23451 (select (arr!43034 _keys!1609) from!2000) lt!588185)))))

(declare-fun get!21671 (ValueCell!17168 V!53281) V!53281)

(declare-fun dynLambda!3538 (Int (_ BitVec 64)) V!53281)

(assert (=> b!1322635 (= lt!588185 (get!21671 (select (arr!43035 _values!1337) from!2000) (dynLambda!3538 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6241 (array!89119 array!89121 (_ BitVec 32) (_ BitVec 32) V!53281 V!53281 (_ BitVec 32) Int) ListLongMap!21107)

(assert (=> b!1322635 (= lt!588180 (getCurrentListMapNoExtraKeys!6241 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(assert (= (and start!111656 res!877910) b!1322627))

(assert (= (and b!1322627 res!877906) b!1322630))

(assert (= (and b!1322630 res!877909) b!1322631))

(assert (= (and b!1322631 res!877905) b!1322625))

(assert (= (and b!1322625 res!877907) b!1322629))

(assert (= (and b!1322629 res!877904) b!1322626))

(assert (= (and b!1322626 res!877911) b!1322634))

(assert (= (and b!1322634 res!877908) b!1322635))

(assert (= (and b!1322633 condMapEmpty!55847) mapIsEmpty!55847))

(assert (= (and b!1322633 (not condMapEmpty!55847)) mapNonEmpty!55847))

(get-info :version)

(assert (= (and mapNonEmpty!55847 ((_ is ValueCellFull!17168) mapValue!55847)) b!1322628))

(assert (= (and b!1322633 ((_ is ValueCellFull!17168) mapDefault!55847)) b!1322632))

(assert (= start!111656 b!1322633))

(declare-fun b_lambda!23629 () Bool)

(assert (=> (not b_lambda!23629) (not b!1322635)))

(declare-fun t!44438 () Bool)

(declare-fun tb!11657 () Bool)

(assert (=> (and start!111656 (= defaultEntry!1340 defaultEntry!1340) t!44438) tb!11657))

(declare-fun result!24377 () Bool)

(assert (=> tb!11657 (= result!24377 tp_is_empty!36133)))

(assert (=> b!1322635 t!44438))

(declare-fun b_and!48769 () Bool)

(assert (= b_and!48767 (and (=> t!44438 result!24377) b_and!48769)))

(declare-fun m!1210575 () Bool)

(assert (=> mapNonEmpty!55847 m!1210575))

(declare-fun m!1210577 () Bool)

(assert (=> b!1322635 m!1210577))

(declare-fun m!1210579 () Bool)

(assert (=> b!1322635 m!1210579))

(declare-fun m!1210581 () Bool)

(assert (=> b!1322635 m!1210581))

(declare-fun m!1210583 () Bool)

(assert (=> b!1322635 m!1210583))

(declare-fun m!1210585 () Bool)

(assert (=> b!1322635 m!1210585))

(declare-fun m!1210587 () Bool)

(assert (=> b!1322635 m!1210587))

(declare-fun m!1210589 () Bool)

(assert (=> b!1322635 m!1210589))

(declare-fun m!1210591 () Bool)

(assert (=> b!1322635 m!1210591))

(declare-fun m!1210593 () Bool)

(assert (=> b!1322635 m!1210593))

(assert (=> b!1322635 m!1210581))

(declare-fun m!1210595 () Bool)

(assert (=> b!1322635 m!1210595))

(assert (=> b!1322635 m!1210591))

(declare-fun m!1210597 () Bool)

(assert (=> b!1322635 m!1210597))

(declare-fun m!1210599 () Bool)

(assert (=> b!1322635 m!1210599))

(declare-fun m!1210601 () Bool)

(assert (=> b!1322635 m!1210601))

(declare-fun m!1210603 () Bool)

(assert (=> b!1322635 m!1210603))

(declare-fun m!1210605 () Bool)

(assert (=> b!1322635 m!1210605))

(assert (=> b!1322635 m!1210601))

(assert (=> b!1322635 m!1210585))

(declare-fun m!1210607 () Bool)

(assert (=> b!1322635 m!1210607))

(assert (=> b!1322626 m!1210591))

(declare-fun m!1210609 () Bool)

(assert (=> b!1322629 m!1210609))

(assert (=> b!1322629 m!1210609))

(declare-fun m!1210611 () Bool)

(assert (=> b!1322629 m!1210611))

(declare-fun m!1210613 () Bool)

(assert (=> start!111656 m!1210613))

(declare-fun m!1210615 () Bool)

(assert (=> start!111656 m!1210615))

(declare-fun m!1210617 () Bool)

(assert (=> start!111656 m!1210617))

(declare-fun m!1210619 () Bool)

(assert (=> b!1322630 m!1210619))

(assert (=> b!1322634 m!1210591))

(assert (=> b!1322634 m!1210591))

(declare-fun m!1210621 () Bool)

(assert (=> b!1322634 m!1210621))

(declare-fun m!1210623 () Bool)

(assert (=> b!1322631 m!1210623))

(check-sat (not b_next!30313) (not b!1322629) (not b!1322631) (not mapNonEmpty!55847) b_and!48769 (not b_lambda!23629) (not b!1322630) tp_is_empty!36133 (not b!1322634) (not start!111656) (not b!1322635))
(check-sat b_and!48769 (not b_next!30313))
