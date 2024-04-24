; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112018 () Bool)

(assert start!112018)

(declare-fun b_free!30451 () Bool)

(declare-fun b_next!30451 () Bool)

(assert (=> start!112018 (= b_free!30451 (not b_next!30451))))

(declare-fun tp!106829 () Bool)

(declare-fun b_and!48991 () Bool)

(assert (=> start!112018 (= tp!106829 b_and!48991)))

(declare-fun b!1326067 () Bool)

(declare-fun res!879842 () Bool)

(declare-fun e!756063 () Bool)

(assert (=> b!1326067 (=> (not res!879842) (not e!756063))))

(declare-datatypes ((array!89541 0))(
  ( (array!89542 (arr!43240 (Array (_ BitVec 32) (_ BitVec 64))) (size!43791 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89541)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89541 (_ BitVec 32)) Bool)

(assert (=> b!1326067 (= res!879842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326068 () Bool)

(declare-fun res!879839 () Bool)

(assert (=> b!1326068 (=> (not res!879839) (not e!756063))))

(declare-datatypes ((List!30668 0))(
  ( (Nil!30665) (Cons!30664 (h!31882 (_ BitVec 64)) (t!44586 List!30668)) )
))
(declare-fun arrayNoDuplicates!0 (array!89541 (_ BitVec 32) List!30668) Bool)

(assert (=> b!1326068 (= res!879839 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30665))))

(declare-fun b!1326069 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53465 0))(
  ( (V!53466 (val!18210 Int)) )
))
(declare-datatypes ((ValueCell!17237 0))(
  ( (ValueCellFull!17237 (v!20835 V!53465)) (EmptyCell!17237) )
))
(declare-datatypes ((array!89543 0))(
  ( (array!89544 (arr!43241 (Array (_ BitVec 32) ValueCell!17237)) (size!43792 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89543)

(assert (=> b!1326069 (= e!756063 (bvsge from!2000 (size!43792 _values!1337)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53465)

(declare-datatypes ((tuple2!23516 0))(
  ( (tuple2!23517 (_1!11769 (_ BitVec 64)) (_2!11769 V!53465)) )
))
(declare-datatypes ((List!30669 0))(
  ( (Nil!30666) (Cons!30665 (h!31883 tuple2!23516) (t!44587 List!30669)) )
))
(declare-datatypes ((ListLongMap!21181 0))(
  ( (ListLongMap!21182 (toList!10606 List!30669)) )
))
(declare-fun lt!589976 () ListLongMap!21181)

(declare-fun minValue!1279 () V!53465)

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6297 (array!89541 array!89543 (_ BitVec 32) (_ BitVec 32) V!53465 V!53465 (_ BitVec 32) Int) ListLongMap!21181)

(assert (=> b!1326069 (= lt!589976 (getCurrentListMapNoExtraKeys!6297 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326070 () Bool)

(declare-fun res!879841 () Bool)

(assert (=> b!1326070 (=> (not res!879841) (not e!756063))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326070 (= res!879841 (not (= (select (arr!43240 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326071 () Bool)

(declare-fun res!879844 () Bool)

(assert (=> b!1326071 (=> (not res!879844) (not e!756063))))

(assert (=> b!1326071 (= res!879844 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43791 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326072 () Bool)

(declare-fun res!879838 () Bool)

(assert (=> b!1326072 (=> (not res!879838) (not e!756063))))

(assert (=> b!1326072 (= res!879838 (and (= (size!43792 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43791 _keys!1609) (size!43792 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326073 () Bool)

(declare-fun e!756066 () Bool)

(declare-fun tp_is_empty!36271 () Bool)

(assert (=> b!1326073 (= e!756066 tp_is_empty!36271)))

(declare-fun b!1326074 () Bool)

(declare-fun res!879837 () Bool)

(assert (=> b!1326074 (=> (not res!879837) (not e!756063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326074 (= res!879837 (validKeyInArray!0 (select (arr!43240 _keys!1609) from!2000)))))

(declare-fun b!1326075 () Bool)

(declare-fun res!879840 () Bool)

(assert (=> b!1326075 (=> (not res!879840) (not e!756063))))

(declare-fun contains!8772 (ListLongMap!21181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5588 (array!89541 array!89543 (_ BitVec 32) (_ BitVec 32) V!53465 V!53465 (_ BitVec 32) Int) ListLongMap!21181)

(assert (=> b!1326075 (= res!879840 (contains!8772 (getCurrentListMap!5588 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326076 () Bool)

(declare-fun e!756067 () Bool)

(declare-fun e!756064 () Bool)

(declare-fun mapRes!56054 () Bool)

(assert (=> b!1326076 (= e!756067 (and e!756064 mapRes!56054))))

(declare-fun condMapEmpty!56054 () Bool)

(declare-fun mapDefault!56054 () ValueCell!17237)

(assert (=> b!1326076 (= condMapEmpty!56054 (= (arr!43241 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17237)) mapDefault!56054)))))

(declare-fun res!879843 () Bool)

(assert (=> start!112018 (=> (not res!879843) (not e!756063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112018 (= res!879843 (validMask!0 mask!2019))))

(assert (=> start!112018 e!756063))

(declare-fun array_inv!32909 (array!89541) Bool)

(assert (=> start!112018 (array_inv!32909 _keys!1609)))

(assert (=> start!112018 true))

(assert (=> start!112018 tp_is_empty!36271))

(declare-fun array_inv!32910 (array!89543) Bool)

(assert (=> start!112018 (and (array_inv!32910 _values!1337) e!756067)))

(assert (=> start!112018 tp!106829))

(declare-fun mapNonEmpty!56054 () Bool)

(declare-fun tp!106828 () Bool)

(assert (=> mapNonEmpty!56054 (= mapRes!56054 (and tp!106828 e!756066))))

(declare-fun mapKey!56054 () (_ BitVec 32))

(declare-fun mapRest!56054 () (Array (_ BitVec 32) ValueCell!17237))

(declare-fun mapValue!56054 () ValueCell!17237)

(assert (=> mapNonEmpty!56054 (= (arr!43241 _values!1337) (store mapRest!56054 mapKey!56054 mapValue!56054))))

(declare-fun b!1326077 () Bool)

(assert (=> b!1326077 (= e!756064 tp_is_empty!36271)))

(declare-fun mapIsEmpty!56054 () Bool)

(assert (=> mapIsEmpty!56054 mapRes!56054))

(assert (= (and start!112018 res!879843) b!1326072))

(assert (= (and b!1326072 res!879838) b!1326067))

(assert (= (and b!1326067 res!879842) b!1326068))

(assert (= (and b!1326068 res!879839) b!1326071))

(assert (= (and b!1326071 res!879844) b!1326075))

(assert (= (and b!1326075 res!879840) b!1326070))

(assert (= (and b!1326070 res!879841) b!1326074))

(assert (= (and b!1326074 res!879837) b!1326069))

(assert (= (and b!1326076 condMapEmpty!56054) mapIsEmpty!56054))

(assert (= (and b!1326076 (not condMapEmpty!56054)) mapNonEmpty!56054))

(get-info :version)

(assert (= (and mapNonEmpty!56054 ((_ is ValueCellFull!17237) mapValue!56054)) b!1326073))

(assert (= (and b!1326076 ((_ is ValueCellFull!17237) mapDefault!56054)) b!1326077))

(assert (= start!112018 b!1326076))

(declare-fun m!1215107 () Bool)

(assert (=> b!1326070 m!1215107))

(declare-fun m!1215109 () Bool)

(assert (=> start!112018 m!1215109))

(declare-fun m!1215111 () Bool)

(assert (=> start!112018 m!1215111))

(declare-fun m!1215113 () Bool)

(assert (=> start!112018 m!1215113))

(declare-fun m!1215115 () Bool)

(assert (=> b!1326067 m!1215115))

(declare-fun m!1215117 () Bool)

(assert (=> mapNonEmpty!56054 m!1215117))

(assert (=> b!1326074 m!1215107))

(assert (=> b!1326074 m!1215107))

(declare-fun m!1215119 () Bool)

(assert (=> b!1326074 m!1215119))

(declare-fun m!1215121 () Bool)

(assert (=> b!1326075 m!1215121))

(assert (=> b!1326075 m!1215121))

(declare-fun m!1215123 () Bool)

(assert (=> b!1326075 m!1215123))

(declare-fun m!1215125 () Bool)

(assert (=> b!1326068 m!1215125))

(declare-fun m!1215127 () Bool)

(assert (=> b!1326069 m!1215127))

(check-sat (not b!1326075) (not mapNonEmpty!56054) (not b!1326068) (not b!1326074) (not b!1326067) (not b!1326069) tp_is_empty!36271 (not start!112018) (not b_next!30451) b_and!48991)
(check-sat b_and!48991 (not b_next!30451))
