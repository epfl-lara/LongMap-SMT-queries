; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112890 () Bool)

(assert start!112890)

(declare-fun b_free!31003 () Bool)

(declare-fun b_next!31003 () Bool)

(assert (=> start!112890 (= b_free!31003 (not b_next!31003))))

(declare-fun tp!108650 () Bool)

(declare-fun b_and!49945 () Bool)

(assert (=> start!112890 (= tp!108650 b_and!49945)))

(declare-fun res!887374 () Bool)

(declare-fun e!761892 () Bool)

(assert (=> start!112890 (=> (not res!887374) (not e!761892))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112890 (= res!887374 (validMask!0 mask!1998))))

(assert (=> start!112890 e!761892))

(declare-datatypes ((V!54321 0))(
  ( (V!54322 (val!18531 Int)) )
))
(declare-datatypes ((ValueCell!17558 0))(
  ( (ValueCellFull!17558 (v!21166 V!54321)) (EmptyCell!17558) )
))
(declare-datatypes ((array!90799 0))(
  ( (array!90800 (arr!43860 (Array (_ BitVec 32) ValueCell!17558)) (size!44411 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90799)

(declare-fun e!761891 () Bool)

(declare-fun array_inv!33345 (array!90799) Bool)

(assert (=> start!112890 (and (array_inv!33345 _values!1320) e!761891)))

(assert (=> start!112890 true))

(declare-datatypes ((array!90801 0))(
  ( (array!90802 (arr!43861 (Array (_ BitVec 32) (_ BitVec 64))) (size!44412 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90801)

(declare-fun array_inv!33346 (array!90801) Bool)

(assert (=> start!112890 (array_inv!33346 _keys!1590)))

(assert (=> start!112890 tp!108650))

(declare-fun tp_is_empty!36913 () Bool)

(assert (=> start!112890 tp_is_empty!36913))

(declare-fun b!1337666 () Bool)

(declare-fun res!887372 () Bool)

(assert (=> b!1337666 (=> (not res!887372) (not e!761892))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337666 (= res!887372 (validKeyInArray!0 (select (arr!43861 _keys!1590) from!1980)))))

(declare-fun b!1337667 () Bool)

(declare-fun e!761893 () Bool)

(assert (=> b!1337667 (= e!761893 tp_is_empty!36913)))

(declare-fun b!1337668 () Bool)

(declare-fun res!887377 () Bool)

(assert (=> b!1337668 (=> (not res!887377) (not e!761892))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337668 (= res!887377 (and (= (size!44411 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44412 _keys!1590) (size!44411 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337669 () Bool)

(declare-fun res!887376 () Bool)

(assert (=> b!1337669 (=> (not res!887376) (not e!761892))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54321)

(declare-fun zeroValue!1262 () V!54321)

(declare-datatypes ((tuple2!23938 0))(
  ( (tuple2!23939 (_1!11980 (_ BitVec 64)) (_2!11980 V!54321)) )
))
(declare-datatypes ((List!31083 0))(
  ( (Nil!31080) (Cons!31079 (h!32297 tuple2!23938) (t!45359 List!31083)) )
))
(declare-datatypes ((ListLongMap!21603 0))(
  ( (ListLongMap!21604 (toList!10817 List!31083)) )
))
(declare-fun contains!8994 (ListLongMap!21603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5774 (array!90801 array!90799 (_ BitVec 32) (_ BitVec 32) V!54321 V!54321 (_ BitVec 32) Int) ListLongMap!21603)

(assert (=> b!1337669 (= res!887376 (contains!8994 (getCurrentListMap!5774 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337670 () Bool)

(declare-fun res!887378 () Bool)

(assert (=> b!1337670 (=> (not res!887378) (not e!761892))))

(declare-datatypes ((List!31084 0))(
  ( (Nil!31081) (Cons!31080 (h!32298 (_ BitVec 64)) (t!45360 List!31084)) )
))
(declare-fun arrayNoDuplicates!0 (array!90801 (_ BitVec 32) List!31084) Bool)

(assert (=> b!1337670 (= res!887378 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31081))))

(declare-fun b!1337671 () Bool)

(declare-fun res!887379 () Bool)

(assert (=> b!1337671 (=> (not res!887379) (not e!761892))))

(assert (=> b!1337671 (= res!887379 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44412 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337672 () Bool)

(declare-fun mapRes!57047 () Bool)

(assert (=> b!1337672 (= e!761891 (and e!761893 mapRes!57047))))

(declare-fun condMapEmpty!57047 () Bool)

(declare-fun mapDefault!57047 () ValueCell!17558)

(assert (=> b!1337672 (= condMapEmpty!57047 (= (arr!43860 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17558)) mapDefault!57047)))))

(declare-fun b!1337673 () Bool)

(declare-fun e!761890 () Bool)

(assert (=> b!1337673 (= e!761890 tp_is_empty!36913)))

(declare-fun mapIsEmpty!57047 () Bool)

(assert (=> mapIsEmpty!57047 mapRes!57047))

(declare-fun b!1337674 () Bool)

(declare-fun res!887380 () Bool)

(assert (=> b!1337674 (=> (not res!887380) (not e!761892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90801 (_ BitVec 32)) Bool)

(assert (=> b!1337674 (= res!887380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337675 () Bool)

(declare-fun res!887375 () Bool)

(assert (=> b!1337675 (=> (not res!887375) (not e!761892))))

(assert (=> b!1337675 (= res!887375 (not (= (select (arr!43861 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337676 () Bool)

(assert (=> b!1337676 (= e!761892 (not (bvslt from!1980 (size!44411 _values!1320))))))

(declare-fun lt!593238 () ListLongMap!21603)

(assert (=> b!1337676 (contains!8994 lt!593238 k0!1153)))

(declare-datatypes ((Unit!43847 0))(
  ( (Unit!43848) )
))
(declare-fun lt!593239 () Unit!43847)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!304 ((_ BitVec 64) (_ BitVec 64) V!54321 ListLongMap!21603) Unit!43847)

(assert (=> b!1337676 (= lt!593239 (lemmaInListMapAfterAddingDiffThenInBefore!304 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593238))))

(declare-fun +!4769 (ListLongMap!21603 tuple2!23938) ListLongMap!21603)

(declare-fun getCurrentListMapNoExtraKeys!6418 (array!90801 array!90799 (_ BitVec 32) (_ BitVec 32) V!54321 V!54321 (_ BitVec 32) Int) ListLongMap!21603)

(declare-fun get!22139 (ValueCell!17558 V!54321) V!54321)

(declare-fun dynLambda!3723 (Int (_ BitVec 64)) V!54321)

(assert (=> b!1337676 (= lt!593238 (+!4769 (getCurrentListMapNoExtraKeys!6418 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23939 (select (arr!43861 _keys!1590) from!1980) (get!22139 (select (arr!43860 _values!1320) from!1980) (dynLambda!3723 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!57047 () Bool)

(declare-fun tp!108649 () Bool)

(assert (=> mapNonEmpty!57047 (= mapRes!57047 (and tp!108649 e!761890))))

(declare-fun mapRest!57047 () (Array (_ BitVec 32) ValueCell!17558))

(declare-fun mapValue!57047 () ValueCell!17558)

(declare-fun mapKey!57047 () (_ BitVec 32))

(assert (=> mapNonEmpty!57047 (= (arr!43860 _values!1320) (store mapRest!57047 mapKey!57047 mapValue!57047))))

(declare-fun b!1337677 () Bool)

(declare-fun res!887373 () Bool)

(assert (=> b!1337677 (=> (not res!887373) (not e!761892))))

(assert (=> b!1337677 (= res!887373 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112890 res!887374) b!1337668))

(assert (= (and b!1337668 res!887377) b!1337674))

(assert (= (and b!1337674 res!887380) b!1337670))

(assert (= (and b!1337670 res!887378) b!1337671))

(assert (= (and b!1337671 res!887379) b!1337669))

(assert (= (and b!1337669 res!887376) b!1337675))

(assert (= (and b!1337675 res!887375) b!1337666))

(assert (= (and b!1337666 res!887372) b!1337677))

(assert (= (and b!1337677 res!887373) b!1337676))

(assert (= (and b!1337672 condMapEmpty!57047) mapIsEmpty!57047))

(assert (= (and b!1337672 (not condMapEmpty!57047)) mapNonEmpty!57047))

(get-info :version)

(assert (= (and mapNonEmpty!57047 ((_ is ValueCellFull!17558) mapValue!57047)) b!1337673))

(assert (= (and b!1337672 ((_ is ValueCellFull!17558) mapDefault!57047)) b!1337667))

(assert (= start!112890 b!1337672))

(declare-fun b_lambda!24155 () Bool)

(assert (=> (not b_lambda!24155) (not b!1337676)))

(declare-fun t!45358 () Bool)

(declare-fun tb!12079 () Bool)

(assert (=> (and start!112890 (= defaultEntry!1323 defaultEntry!1323) t!45358) tb!12079))

(declare-fun result!25239 () Bool)

(assert (=> tb!12079 (= result!25239 tp_is_empty!36913)))

(assert (=> b!1337676 t!45358))

(declare-fun b_and!49947 () Bool)

(assert (= b_and!49945 (and (=> t!45358 result!25239) b_and!49947)))

(declare-fun m!1226061 () Bool)

(assert (=> b!1337666 m!1226061))

(assert (=> b!1337666 m!1226061))

(declare-fun m!1226063 () Bool)

(assert (=> b!1337666 m!1226063))

(assert (=> b!1337675 m!1226061))

(declare-fun m!1226065 () Bool)

(assert (=> b!1337674 m!1226065))

(declare-fun m!1226067 () Bool)

(assert (=> mapNonEmpty!57047 m!1226067))

(declare-fun m!1226069 () Bool)

(assert (=> start!112890 m!1226069))

(declare-fun m!1226071 () Bool)

(assert (=> start!112890 m!1226071))

(declare-fun m!1226073 () Bool)

(assert (=> start!112890 m!1226073))

(declare-fun m!1226075 () Bool)

(assert (=> b!1337670 m!1226075))

(declare-fun m!1226077 () Bool)

(assert (=> b!1337676 m!1226077))

(declare-fun m!1226079 () Bool)

(assert (=> b!1337676 m!1226079))

(declare-fun m!1226081 () Bool)

(assert (=> b!1337676 m!1226081))

(declare-fun m!1226083 () Bool)

(assert (=> b!1337676 m!1226083))

(assert (=> b!1337676 m!1226077))

(declare-fun m!1226085 () Bool)

(assert (=> b!1337676 m!1226085))

(declare-fun m!1226087 () Bool)

(assert (=> b!1337676 m!1226087))

(assert (=> b!1337676 m!1226079))

(assert (=> b!1337676 m!1226083))

(declare-fun m!1226089 () Bool)

(assert (=> b!1337676 m!1226089))

(assert (=> b!1337676 m!1226061))

(declare-fun m!1226091 () Bool)

(assert (=> b!1337669 m!1226091))

(assert (=> b!1337669 m!1226091))

(declare-fun m!1226093 () Bool)

(assert (=> b!1337669 m!1226093))

(check-sat (not b!1337674) (not b_next!31003) (not b!1337666) (not b!1337676) (not b!1337670) (not mapNonEmpty!57047) tp_is_empty!36913 (not b_lambda!24155) (not b!1337669) b_and!49947 (not start!112890))
(check-sat b_and!49947 (not b_next!31003))
