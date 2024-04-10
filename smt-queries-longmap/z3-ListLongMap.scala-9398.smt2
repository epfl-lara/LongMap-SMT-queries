; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111884 () Bool)

(assert start!111884)

(declare-fun b_free!30483 () Bool)

(declare-fun b_next!30483 () Bool)

(assert (=> start!111884 (= b_free!30483 (not b_next!30483))))

(declare-fun tp!106929 () Bool)

(declare-fun b_and!49061 () Bool)

(assert (=> start!111884 (= tp!106929 b_and!49061)))

(declare-fun b!1325733 () Bool)

(declare-fun e!755722 () Bool)

(declare-fun tp_is_empty!36303 () Bool)

(assert (=> b!1325733 (= e!755722 tp_is_empty!36303)))

(declare-fun b!1325734 () Bool)

(declare-fun res!879878 () Bool)

(declare-fun e!755718 () Bool)

(assert (=> b!1325734 (=> (not res!879878) (not e!755718))))

(declare-datatypes ((array!89514 0))(
  ( (array!89515 (arr!43230 (Array (_ BitVec 32) (_ BitVec 64))) (size!43780 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89514)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89514 (_ BitVec 32)) Bool)

(assert (=> b!1325734 (= res!879878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325735 () Bool)

(declare-fun e!755720 () Bool)

(assert (=> b!1325735 (= e!755720 tp_is_empty!36303)))

(declare-fun b!1325736 () Bool)

(assert (=> b!1325736 (= e!755718 (not true))))

(declare-datatypes ((V!53507 0))(
  ( (V!53508 (val!18226 Int)) )
))
(declare-datatypes ((tuple2!23508 0))(
  ( (tuple2!23509 (_1!11765 (_ BitVec 64)) (_2!11765 V!53507)) )
))
(declare-datatypes ((List!30648 0))(
  ( (Nil!30645) (Cons!30644 (h!31853 tuple2!23508) (t!44602 List!30648)) )
))
(declare-datatypes ((ListLongMap!21165 0))(
  ( (ListLongMap!21166 (toList!10598 List!30648)) )
))
(declare-fun lt!589832 () ListLongMap!21165)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8755 (ListLongMap!21165 (_ BitVec 64)) Bool)

(assert (=> b!1325736 (contains!8755 lt!589832 k0!1164)))

(declare-datatypes ((Unit!43670 0))(
  ( (Unit!43671) )
))
(declare-fun lt!589833 () Unit!43670)

(declare-fun minValue!1279 () V!53507)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!213 ((_ BitVec 64) (_ BitVec 64) V!53507 ListLongMap!21165) Unit!43670)

(assert (=> b!1325736 (= lt!589833 (lemmaInListMapAfterAddingDiffThenInBefore!213 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589832))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53507)

(declare-datatypes ((ValueCell!17253 0))(
  ( (ValueCellFull!17253 (v!20859 V!53507)) (EmptyCell!17253) )
))
(declare-datatypes ((array!89516 0))(
  ( (array!89517 (arr!43231 (Array (_ BitVec 32) ValueCell!17253)) (size!43781 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89516)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4621 (ListLongMap!21165 tuple2!23508) ListLongMap!21165)

(declare-fun getCurrentListMapNoExtraKeys!6259 (array!89514 array!89516 (_ BitVec 32) (_ BitVec 32) V!53507 V!53507 (_ BitVec 32) Int) ListLongMap!21165)

(declare-fun get!21776 (ValueCell!17253 V!53507) V!53507)

(declare-fun dynLambda!3560 (Int (_ BitVec 64)) V!53507)

(assert (=> b!1325736 (= lt!589832 (+!4621 (+!4621 (getCurrentListMapNoExtraKeys!6259 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23509 (select (arr!43230 _keys!1609) from!2000) (get!21776 (select (arr!43231 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun res!879879 () Bool)

(assert (=> start!111884 (=> (not res!879879) (not e!755718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111884 (= res!879879 (validMask!0 mask!2019))))

(assert (=> start!111884 e!755718))

(declare-fun array_inv!32631 (array!89514) Bool)

(assert (=> start!111884 (array_inv!32631 _keys!1609)))

(assert (=> start!111884 true))

(assert (=> start!111884 tp_is_empty!36303))

(declare-fun e!755719 () Bool)

(declare-fun array_inv!32632 (array!89516) Bool)

(assert (=> start!111884 (and (array_inv!32632 _values!1337) e!755719)))

(assert (=> start!111884 tp!106929))

(declare-fun b!1325737 () Bool)

(declare-fun res!879873 () Bool)

(assert (=> b!1325737 (=> (not res!879873) (not e!755718))))

(assert (=> b!1325737 (= res!879873 (not (= (select (arr!43230 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325738 () Bool)

(declare-fun mapRes!56106 () Bool)

(assert (=> b!1325738 (= e!755719 (and e!755720 mapRes!56106))))

(declare-fun condMapEmpty!56106 () Bool)

(declare-fun mapDefault!56106 () ValueCell!17253)

(assert (=> b!1325738 (= condMapEmpty!56106 (= (arr!43231 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17253)) mapDefault!56106)))))

(declare-fun mapNonEmpty!56106 () Bool)

(declare-fun tp!106928 () Bool)

(assert (=> mapNonEmpty!56106 (= mapRes!56106 (and tp!106928 e!755722))))

(declare-fun mapRest!56106 () (Array (_ BitVec 32) ValueCell!17253))

(declare-fun mapKey!56106 () (_ BitVec 32))

(declare-fun mapValue!56106 () ValueCell!17253)

(assert (=> mapNonEmpty!56106 (= (arr!43231 _values!1337) (store mapRest!56106 mapKey!56106 mapValue!56106))))

(declare-fun b!1325739 () Bool)

(declare-fun res!879874 () Bool)

(assert (=> b!1325739 (=> (not res!879874) (not e!755718))))

(declare-datatypes ((List!30649 0))(
  ( (Nil!30646) (Cons!30645 (h!31854 (_ BitVec 64)) (t!44603 List!30649)) )
))
(declare-fun arrayNoDuplicates!0 (array!89514 (_ BitVec 32) List!30649) Bool)

(assert (=> b!1325739 (= res!879874 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30646))))

(declare-fun b!1325740 () Bool)

(declare-fun res!879877 () Bool)

(assert (=> b!1325740 (=> (not res!879877) (not e!755718))))

(assert (=> b!1325740 (= res!879877 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43780 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325741 () Bool)

(declare-fun res!879880 () Bool)

(assert (=> b!1325741 (=> (not res!879880) (not e!755718))))

(assert (=> b!1325741 (= res!879880 (and (= (size!43781 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43780 _keys!1609) (size!43781 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325742 () Bool)

(declare-fun res!879876 () Bool)

(assert (=> b!1325742 (=> (not res!879876) (not e!755718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325742 (= res!879876 (validKeyInArray!0 (select (arr!43230 _keys!1609) from!2000)))))

(declare-fun b!1325743 () Bool)

(declare-fun res!879875 () Bool)

(assert (=> b!1325743 (=> (not res!879875) (not e!755718))))

(declare-fun getCurrentListMap!5592 (array!89514 array!89516 (_ BitVec 32) (_ BitVec 32) V!53507 V!53507 (_ BitVec 32) Int) ListLongMap!21165)

(assert (=> b!1325743 (= res!879875 (contains!8755 (getCurrentListMap!5592 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56106 () Bool)

(assert (=> mapIsEmpty!56106 mapRes!56106))

(assert (= (and start!111884 res!879879) b!1325741))

(assert (= (and b!1325741 res!879880) b!1325734))

(assert (= (and b!1325734 res!879878) b!1325739))

(assert (= (and b!1325739 res!879874) b!1325740))

(assert (= (and b!1325740 res!879877) b!1325743))

(assert (= (and b!1325743 res!879875) b!1325737))

(assert (= (and b!1325737 res!879873) b!1325742))

(assert (= (and b!1325742 res!879876) b!1325736))

(assert (= (and b!1325738 condMapEmpty!56106) mapIsEmpty!56106))

(assert (= (and b!1325738 (not condMapEmpty!56106)) mapNonEmpty!56106))

(get-info :version)

(assert (= (and mapNonEmpty!56106 ((_ is ValueCellFull!17253) mapValue!56106)) b!1325733))

(assert (= (and b!1325738 ((_ is ValueCellFull!17253) mapDefault!56106)) b!1325735))

(assert (= start!111884 b!1325738))

(declare-fun b_lambda!23761 () Bool)

(assert (=> (not b_lambda!23761) (not b!1325736)))

(declare-fun t!44601 () Bool)

(declare-fun tb!11757 () Bool)

(assert (=> (and start!111884 (= defaultEntry!1340 defaultEntry!1340) t!44601) tb!11757))

(declare-fun result!24571 () Bool)

(assert (=> tb!11757 (= result!24571 tp_is_empty!36303)))

(assert (=> b!1325736 t!44601))

(declare-fun b_and!49063 () Bool)

(assert (= b_and!49061 (and (=> t!44601 result!24571) b_and!49063)))

(declare-fun m!1214629 () Bool)

(assert (=> mapNonEmpty!56106 m!1214629))

(declare-fun m!1214631 () Bool)

(assert (=> b!1325742 m!1214631))

(assert (=> b!1325742 m!1214631))

(declare-fun m!1214633 () Bool)

(assert (=> b!1325742 m!1214633))

(declare-fun m!1214635 () Bool)

(assert (=> b!1325739 m!1214635))

(declare-fun m!1214637 () Bool)

(assert (=> b!1325736 m!1214637))

(declare-fun m!1214639 () Bool)

(assert (=> b!1325736 m!1214639))

(declare-fun m!1214641 () Bool)

(assert (=> b!1325736 m!1214641))

(assert (=> b!1325736 m!1214637))

(declare-fun m!1214643 () Bool)

(assert (=> b!1325736 m!1214643))

(declare-fun m!1214645 () Bool)

(assert (=> b!1325736 m!1214645))

(assert (=> b!1325736 m!1214643))

(declare-fun m!1214647 () Bool)

(assert (=> b!1325736 m!1214647))

(assert (=> b!1325736 m!1214645))

(assert (=> b!1325736 m!1214641))

(declare-fun m!1214649 () Bool)

(assert (=> b!1325736 m!1214649))

(declare-fun m!1214651 () Bool)

(assert (=> b!1325736 m!1214651))

(assert (=> b!1325736 m!1214631))

(declare-fun m!1214653 () Bool)

(assert (=> b!1325743 m!1214653))

(assert (=> b!1325743 m!1214653))

(declare-fun m!1214655 () Bool)

(assert (=> b!1325743 m!1214655))

(declare-fun m!1214657 () Bool)

(assert (=> b!1325734 m!1214657))

(assert (=> b!1325737 m!1214631))

(declare-fun m!1214659 () Bool)

(assert (=> start!111884 m!1214659))

(declare-fun m!1214661 () Bool)

(assert (=> start!111884 m!1214661))

(declare-fun m!1214663 () Bool)

(assert (=> start!111884 m!1214663))

(check-sat b_and!49063 (not mapNonEmpty!56106) (not b!1325734) (not b!1325736) (not b_next!30483) (not start!111884) (not b_lambda!23761) (not b!1325739) (not b!1325743) (not b!1325742) tp_is_empty!36303)
(check-sat b_and!49063 (not b_next!30483))
