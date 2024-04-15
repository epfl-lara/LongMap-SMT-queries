; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111888 () Bool)

(assert start!111888)

(declare-fun b_free!30487 () Bool)

(declare-fun b_next!30487 () Bool)

(assert (=> start!111888 (= b_free!30487 (not b_next!30487))))

(declare-fun tp!106942 () Bool)

(declare-fun b_and!49051 () Bool)

(assert (=> start!111888 (= tp!106942 b_and!49051)))

(declare-fun b!1325733 () Bool)

(declare-fun e!755718 () Bool)

(declare-fun tp_is_empty!36307 () Bool)

(assert (=> b!1325733 (= e!755718 tp_is_empty!36307)))

(declare-fun b!1325734 () Bool)

(declare-fun e!755716 () Bool)

(assert (=> b!1325734 (= e!755716 tp_is_empty!36307)))

(declare-fun b!1325735 () Bool)

(declare-fun res!879896 () Bool)

(declare-fun e!755719 () Bool)

(assert (=> b!1325735 (=> (not res!879896) (not e!755719))))

(declare-datatypes ((array!89455 0))(
  ( (array!89456 (arr!43201 (Array (_ BitVec 32) (_ BitVec 64))) (size!43753 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89455)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53513 0))(
  ( (V!53514 (val!18228 Int)) )
))
(declare-fun zeroValue!1279 () V!53513)

(declare-datatypes ((ValueCell!17255 0))(
  ( (ValueCellFull!17255 (v!20860 V!53513)) (EmptyCell!17255) )
))
(declare-datatypes ((array!89457 0))(
  ( (array!89458 (arr!43202 (Array (_ BitVec 32) ValueCell!17255)) (size!43754 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89457)

(declare-fun minValue!1279 () V!53513)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23578 0))(
  ( (tuple2!23579 (_1!11800 (_ BitVec 64)) (_2!11800 V!53513)) )
))
(declare-datatypes ((List!30704 0))(
  ( (Nil!30701) (Cons!30700 (h!31909 tuple2!23578) (t!44654 List!30704)) )
))
(declare-datatypes ((ListLongMap!21235 0))(
  ( (ListLongMap!21236 (toList!10633 List!30704)) )
))
(declare-fun contains!8717 (ListLongMap!21235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5509 (array!89455 array!89457 (_ BitVec 32) (_ BitVec 32) V!53513 V!53513 (_ BitVec 32) Int) ListLongMap!21235)

(assert (=> b!1325735 (= res!879896 (contains!8717 (getCurrentListMap!5509 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325736 () Bool)

(declare-fun res!879898 () Bool)

(assert (=> b!1325736 (=> (not res!879898) (not e!755719))))

(assert (=> b!1325736 (= res!879898 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43753 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325737 () Bool)

(assert (=> b!1325737 (= e!755719 (not true))))

(declare-fun lt!589659 () ListLongMap!21235)

(assert (=> b!1325737 (contains!8717 lt!589659 k0!1164)))

(declare-datatypes ((Unit!43473 0))(
  ( (Unit!43474) )
))
(declare-fun lt!589658 () Unit!43473)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!202 ((_ BitVec 64) (_ BitVec 64) V!53513 ListLongMap!21235) Unit!43473)

(assert (=> b!1325737 (= lt!589658 (lemmaInListMapAfterAddingDiffThenInBefore!202 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589659))))

(declare-fun +!4640 (ListLongMap!21235 tuple2!23578) ListLongMap!21235)

(declare-fun getCurrentListMapNoExtraKeys!6278 (array!89455 array!89457 (_ BitVec 32) (_ BitVec 32) V!53513 V!53513 (_ BitVec 32) Int) ListLongMap!21235)

(declare-fun get!21764 (ValueCell!17255 V!53513) V!53513)

(declare-fun dynLambda!3570 (Int (_ BitVec 64)) V!53513)

(assert (=> b!1325737 (= lt!589659 (+!4640 (+!4640 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23579 (select (arr!43201 _keys!1609) from!2000) (get!21764 (select (arr!43202 _values!1337) from!2000) (dynLambda!3570 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325738 () Bool)

(declare-fun res!879894 () Bool)

(assert (=> b!1325738 (=> (not res!879894) (not e!755719))))

(declare-datatypes ((List!30705 0))(
  ( (Nil!30702) (Cons!30701 (h!31910 (_ BitVec 64)) (t!44655 List!30705)) )
))
(declare-fun arrayNoDuplicates!0 (array!89455 (_ BitVec 32) List!30705) Bool)

(assert (=> b!1325738 (= res!879894 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30702))))

(declare-fun res!879895 () Bool)

(assert (=> start!111888 (=> (not res!879895) (not e!755719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111888 (= res!879895 (validMask!0 mask!2019))))

(assert (=> start!111888 e!755719))

(declare-fun array_inv!32791 (array!89455) Bool)

(assert (=> start!111888 (array_inv!32791 _keys!1609)))

(assert (=> start!111888 true))

(assert (=> start!111888 tp_is_empty!36307))

(declare-fun e!755717 () Bool)

(declare-fun array_inv!32792 (array!89457) Bool)

(assert (=> start!111888 (and (array_inv!32792 _values!1337) e!755717)))

(assert (=> start!111888 tp!106942))

(declare-fun b!1325739 () Bool)

(declare-fun res!879897 () Bool)

(assert (=> b!1325739 (=> (not res!879897) (not e!755719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89455 (_ BitVec 32)) Bool)

(assert (=> b!1325739 (= res!879897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325740 () Bool)

(declare-fun res!879893 () Bool)

(assert (=> b!1325740 (=> (not res!879893) (not e!755719))))

(assert (=> b!1325740 (= res!879893 (and (= (size!43754 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43753 _keys!1609) (size!43754 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56112 () Bool)

(declare-fun mapRes!56112 () Bool)

(declare-fun tp!106941 () Bool)

(assert (=> mapNonEmpty!56112 (= mapRes!56112 (and tp!106941 e!755716))))

(declare-fun mapKey!56112 () (_ BitVec 32))

(declare-fun mapRest!56112 () (Array (_ BitVec 32) ValueCell!17255))

(declare-fun mapValue!56112 () ValueCell!17255)

(assert (=> mapNonEmpty!56112 (= (arr!43202 _values!1337) (store mapRest!56112 mapKey!56112 mapValue!56112))))

(declare-fun mapIsEmpty!56112 () Bool)

(assert (=> mapIsEmpty!56112 mapRes!56112))

(declare-fun b!1325741 () Bool)

(assert (=> b!1325741 (= e!755717 (and e!755718 mapRes!56112))))

(declare-fun condMapEmpty!56112 () Bool)

(declare-fun mapDefault!56112 () ValueCell!17255)

(assert (=> b!1325741 (= condMapEmpty!56112 (= (arr!43202 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17255)) mapDefault!56112)))))

(declare-fun b!1325742 () Bool)

(declare-fun res!879892 () Bool)

(assert (=> b!1325742 (=> (not res!879892) (not e!755719))))

(assert (=> b!1325742 (= res!879892 (not (= (select (arr!43201 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325743 () Bool)

(declare-fun res!879899 () Bool)

(assert (=> b!1325743 (=> (not res!879899) (not e!755719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325743 (= res!879899 (validKeyInArray!0 (select (arr!43201 _keys!1609) from!2000)))))

(assert (= (and start!111888 res!879895) b!1325740))

(assert (= (and b!1325740 res!879893) b!1325739))

(assert (= (and b!1325739 res!879897) b!1325738))

(assert (= (and b!1325738 res!879894) b!1325736))

(assert (= (and b!1325736 res!879898) b!1325735))

(assert (= (and b!1325735 res!879896) b!1325742))

(assert (= (and b!1325742 res!879892) b!1325743))

(assert (= (and b!1325743 res!879899) b!1325737))

(assert (= (and b!1325741 condMapEmpty!56112) mapIsEmpty!56112))

(assert (= (and b!1325741 (not condMapEmpty!56112)) mapNonEmpty!56112))

(get-info :version)

(assert (= (and mapNonEmpty!56112 ((_ is ValueCellFull!17255) mapValue!56112)) b!1325734))

(assert (= (and b!1325741 ((_ is ValueCellFull!17255) mapDefault!56112)) b!1325733))

(assert (= start!111888 b!1325741))

(declare-fun b_lambda!23755 () Bool)

(assert (=> (not b_lambda!23755) (not b!1325737)))

(declare-fun t!44653 () Bool)

(declare-fun tb!11753 () Bool)

(assert (=> (and start!111888 (= defaultEntry!1340 defaultEntry!1340) t!44653) tb!11753))

(declare-fun result!24571 () Bool)

(assert (=> tb!11753 (= result!24571 tp_is_empty!36307)))

(assert (=> b!1325737 t!44653))

(declare-fun b_and!49053 () Bool)

(assert (= b_and!49051 (and (=> t!44653 result!24571) b_and!49053)))

(declare-fun m!1214185 () Bool)

(assert (=> b!1325737 m!1214185))

(declare-fun m!1214187 () Bool)

(assert (=> b!1325737 m!1214187))

(assert (=> b!1325737 m!1214185))

(declare-fun m!1214189 () Bool)

(assert (=> b!1325737 m!1214189))

(declare-fun m!1214191 () Bool)

(assert (=> b!1325737 m!1214191))

(declare-fun m!1214193 () Bool)

(assert (=> b!1325737 m!1214193))

(assert (=> b!1325737 m!1214189))

(declare-fun m!1214195 () Bool)

(assert (=> b!1325737 m!1214195))

(declare-fun m!1214197 () Bool)

(assert (=> b!1325737 m!1214197))

(assert (=> b!1325737 m!1214193))

(assert (=> b!1325737 m!1214187))

(declare-fun m!1214199 () Bool)

(assert (=> b!1325737 m!1214199))

(declare-fun m!1214201 () Bool)

(assert (=> b!1325737 m!1214201))

(declare-fun m!1214203 () Bool)

(assert (=> b!1325735 m!1214203))

(assert (=> b!1325735 m!1214203))

(declare-fun m!1214205 () Bool)

(assert (=> b!1325735 m!1214205))

(declare-fun m!1214207 () Bool)

(assert (=> b!1325738 m!1214207))

(assert (=> b!1325743 m!1214201))

(assert (=> b!1325743 m!1214201))

(declare-fun m!1214209 () Bool)

(assert (=> b!1325743 m!1214209))

(declare-fun m!1214211 () Bool)

(assert (=> start!111888 m!1214211))

(declare-fun m!1214213 () Bool)

(assert (=> start!111888 m!1214213))

(declare-fun m!1214215 () Bool)

(assert (=> start!111888 m!1214215))

(declare-fun m!1214217 () Bool)

(assert (=> b!1325739 m!1214217))

(declare-fun m!1214219 () Bool)

(assert (=> mapNonEmpty!56112 m!1214219))

(assert (=> b!1325742 m!1214201))

(check-sat (not mapNonEmpty!56112) (not b!1325739) (not start!111888) (not b!1325738) tp_is_empty!36307 (not b!1325737) (not b!1325743) (not b_lambda!23755) (not b_next!30487) b_and!49053 (not b!1325735))
(check-sat b_and!49053 (not b_next!30487))
