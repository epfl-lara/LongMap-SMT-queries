; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111794 () Bool)

(assert start!111794)

(declare-fun b_free!30451 () Bool)

(declare-fun b_next!30451 () Bool)

(assert (=> start!111794 (= b_free!30451 (not b_next!30451))))

(declare-fun tp!106830 () Bool)

(declare-fun b_and!48971 () Bool)

(assert (=> start!111794 (= tp!106830 b_and!48971)))

(declare-fun b!1324698 () Bool)

(declare-fun res!879295 () Bool)

(declare-fun e!755188 () Bool)

(assert (=> b!1324698 (=> (not res!879295) (not e!755188))))

(declare-datatypes ((array!89385 0))(
  ( (array!89386 (arr!43167 (Array (_ BitVec 32) (_ BitVec 64))) (size!43719 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89385)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53465 0))(
  ( (V!53466 (val!18210 Int)) )
))
(declare-datatypes ((ValueCell!17237 0))(
  ( (ValueCellFull!17237 (v!20839 V!53465)) (EmptyCell!17237) )
))
(declare-datatypes ((array!89387 0))(
  ( (array!89388 (arr!43168 (Array (_ BitVec 32) ValueCell!17237)) (size!43720 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89387)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324698 (= res!879295 (and (= (size!43720 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43719 _keys!1609) (size!43720 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56054 () Bool)

(declare-fun mapRes!56054 () Bool)

(declare-fun tp!106829 () Bool)

(declare-fun e!755189 () Bool)

(assert (=> mapNonEmpty!56054 (= mapRes!56054 (and tp!106829 e!755189))))

(declare-fun mapKey!56054 () (_ BitVec 32))

(declare-fun mapValue!56054 () ValueCell!17237)

(declare-fun mapRest!56054 () (Array (_ BitVec 32) ValueCell!17237))

(assert (=> mapNonEmpty!56054 (= (arr!43168 _values!1337) (store mapRest!56054 mapKey!56054 mapValue!56054))))

(declare-fun b!1324699 () Bool)

(declare-fun res!879291 () Bool)

(assert (=> b!1324699 (=> (not res!879291) (not e!755188))))

(declare-fun zeroValue!1279 () V!53465)

(declare-fun minValue!1279 () V!53465)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23552 0))(
  ( (tuple2!23553 (_1!11787 (_ BitVec 64)) (_2!11787 V!53465)) )
))
(declare-datatypes ((List!30681 0))(
  ( (Nil!30678) (Cons!30677 (h!31886 tuple2!23552) (t!44599 List!30681)) )
))
(declare-datatypes ((ListLongMap!21209 0))(
  ( (ListLongMap!21210 (toList!10620 List!30681)) )
))
(declare-fun contains!8703 (ListLongMap!21209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5499 (array!89385 array!89387 (_ BitVec 32) (_ BitVec 32) V!53465 V!53465 (_ BitVec 32) Int) ListLongMap!21209)

(assert (=> b!1324699 (= res!879291 (contains!8703 (getCurrentListMap!5499 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324700 () Bool)

(declare-fun e!755191 () Bool)

(declare-fun e!755187 () Bool)

(assert (=> b!1324700 (= e!755191 (and e!755187 mapRes!56054))))

(declare-fun condMapEmpty!56054 () Bool)

(declare-fun mapDefault!56054 () ValueCell!17237)

(assert (=> b!1324700 (= condMapEmpty!56054 (= (arr!43168 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17237)) mapDefault!56054)))))

(declare-fun b!1324701 () Bool)

(declare-fun res!879293 () Bool)

(assert (=> b!1324701 (=> (not res!879293) (not e!755188))))

(assert (=> b!1324701 (= res!879293 (not (= (select (arr!43167 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324702 () Bool)

(declare-fun res!879290 () Bool)

(assert (=> b!1324702 (=> (not res!879290) (not e!755188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89385 (_ BitVec 32)) Bool)

(assert (=> b!1324702 (= res!879290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324703 () Bool)

(assert (=> b!1324703 (= e!755188 (bvsge from!2000 (size!43720 _values!1337)))))

(declare-fun lt!589314 () ListLongMap!21209)

(declare-fun getCurrentListMapNoExtraKeys!6266 (array!89385 array!89387 (_ BitVec 32) (_ BitVec 32) V!53465 V!53465 (_ BitVec 32) Int) ListLongMap!21209)

(assert (=> b!1324703 (= lt!589314 (getCurrentListMapNoExtraKeys!6266 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!56054 () Bool)

(assert (=> mapIsEmpty!56054 mapRes!56054))

(declare-fun b!1324704 () Bool)

(declare-fun res!879296 () Bool)

(assert (=> b!1324704 (=> (not res!879296) (not e!755188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324704 (= res!879296 (validKeyInArray!0 (select (arr!43167 _keys!1609) from!2000)))))

(declare-fun b!1324705 () Bool)

(declare-fun res!879292 () Bool)

(assert (=> b!1324705 (=> (not res!879292) (not e!755188))))

(assert (=> b!1324705 (= res!879292 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43719 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324706 () Bool)

(declare-fun res!879294 () Bool)

(assert (=> b!1324706 (=> (not res!879294) (not e!755188))))

(declare-datatypes ((List!30682 0))(
  ( (Nil!30679) (Cons!30678 (h!31887 (_ BitVec 64)) (t!44600 List!30682)) )
))
(declare-fun arrayNoDuplicates!0 (array!89385 (_ BitVec 32) List!30682) Bool)

(assert (=> b!1324706 (= res!879294 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30679))))

(declare-fun res!879297 () Bool)

(assert (=> start!111794 (=> (not res!879297) (not e!755188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111794 (= res!879297 (validMask!0 mask!2019))))

(assert (=> start!111794 e!755188))

(declare-fun array_inv!32771 (array!89385) Bool)

(assert (=> start!111794 (array_inv!32771 _keys!1609)))

(assert (=> start!111794 true))

(declare-fun tp_is_empty!36271 () Bool)

(assert (=> start!111794 tp_is_empty!36271))

(declare-fun array_inv!32772 (array!89387) Bool)

(assert (=> start!111794 (and (array_inv!32772 _values!1337) e!755191)))

(assert (=> start!111794 tp!106830))

(declare-fun b!1324707 () Bool)

(assert (=> b!1324707 (= e!755187 tp_is_empty!36271)))

(declare-fun b!1324708 () Bool)

(assert (=> b!1324708 (= e!755189 tp_is_empty!36271)))

(assert (= (and start!111794 res!879297) b!1324698))

(assert (= (and b!1324698 res!879295) b!1324702))

(assert (= (and b!1324702 res!879290) b!1324706))

(assert (= (and b!1324706 res!879294) b!1324705))

(assert (= (and b!1324705 res!879292) b!1324699))

(assert (= (and b!1324699 res!879291) b!1324701))

(assert (= (and b!1324701 res!879293) b!1324704))

(assert (= (and b!1324704 res!879296) b!1324703))

(assert (= (and b!1324700 condMapEmpty!56054) mapIsEmpty!56054))

(assert (= (and b!1324700 (not condMapEmpty!56054)) mapNonEmpty!56054))

(get-info :version)

(assert (= (and mapNonEmpty!56054 ((_ is ValueCellFull!17237) mapValue!56054)) b!1324708))

(assert (= (and b!1324700 ((_ is ValueCellFull!17237) mapDefault!56054)) b!1324707))

(assert (= start!111794 b!1324700))

(declare-fun m!1212993 () Bool)

(assert (=> b!1324706 m!1212993))

(declare-fun m!1212995 () Bool)

(assert (=> b!1324704 m!1212995))

(assert (=> b!1324704 m!1212995))

(declare-fun m!1212997 () Bool)

(assert (=> b!1324704 m!1212997))

(declare-fun m!1212999 () Bool)

(assert (=> mapNonEmpty!56054 m!1212999))

(declare-fun m!1213001 () Bool)

(assert (=> b!1324699 m!1213001))

(assert (=> b!1324699 m!1213001))

(declare-fun m!1213003 () Bool)

(assert (=> b!1324699 m!1213003))

(declare-fun m!1213005 () Bool)

(assert (=> b!1324702 m!1213005))

(assert (=> b!1324701 m!1212995))

(declare-fun m!1213007 () Bool)

(assert (=> start!111794 m!1213007))

(declare-fun m!1213009 () Bool)

(assert (=> start!111794 m!1213009))

(declare-fun m!1213011 () Bool)

(assert (=> start!111794 m!1213011))

(declare-fun m!1213013 () Bool)

(assert (=> b!1324703 m!1213013))

(check-sat b_and!48971 tp_is_empty!36271 (not b_next!30451) (not b!1324704) (not start!111794) (not b!1324703) (not b!1324702) (not mapNonEmpty!56054) (not b!1324706) (not b!1324699))
(check-sat b_and!48971 (not b_next!30451))
