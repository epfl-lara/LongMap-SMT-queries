; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111694 () Bool)

(assert start!111694)

(declare-fun b_free!30127 () Bool)

(declare-fun b_next!30127 () Bool)

(assert (=> start!111694 (= b_free!30127 (not b_next!30127))))

(declare-fun tp!105856 () Bool)

(declare-fun b_and!48415 () Bool)

(assert (=> start!111694 (= tp!105856 b_and!48415)))

(declare-fun b!1320739 () Bool)

(declare-fun res!876224 () Bool)

(declare-fun e!753637 () Bool)

(assert (=> b!1320739 (=> (not res!876224) (not e!753637))))

(declare-datatypes ((array!88907 0))(
  ( (array!88908 (arr!42923 (Array (_ BitVec 32) (_ BitVec 64))) (size!43474 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88907)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320739 (= res!876224 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43474 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320740 () Bool)

(declare-fun res!876222 () Bool)

(assert (=> b!1320740 (=> (not res!876222) (not e!753637))))

(declare-datatypes ((List!30425 0))(
  ( (Nil!30422) (Cons!30421 (h!31639 (_ BitVec 64)) (t!44093 List!30425)) )
))
(declare-fun arrayNoDuplicates!0 (array!88907 (_ BitVec 32) List!30425) Bool)

(assert (=> b!1320740 (= res!876222 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30422))))

(declare-fun res!876221 () Bool)

(assert (=> start!111694 (=> (not res!876221) (not e!753637))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111694 (= res!876221 (validMask!0 mask!2019))))

(assert (=> start!111694 e!753637))

(declare-fun array_inv!32681 (array!88907) Bool)

(assert (=> start!111694 (array_inv!32681 _keys!1609)))

(assert (=> start!111694 true))

(declare-fun tp_is_empty!35947 () Bool)

(assert (=> start!111694 tp_is_empty!35947))

(declare-datatypes ((V!53033 0))(
  ( (V!53034 (val!18048 Int)) )
))
(declare-datatypes ((ValueCell!17075 0))(
  ( (ValueCellFull!17075 (v!20673 V!53033)) (EmptyCell!17075) )
))
(declare-datatypes ((array!88909 0))(
  ( (array!88910 (arr!42924 (Array (_ BitVec 32) ValueCell!17075)) (size!43475 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88909)

(declare-fun e!753633 () Bool)

(declare-fun array_inv!32682 (array!88909) Bool)

(assert (=> start!111694 (and (array_inv!32682 _values!1337) e!753633)))

(assert (=> start!111694 tp!105856))

(declare-fun mapIsEmpty!55568 () Bool)

(declare-fun mapRes!55568 () Bool)

(assert (=> mapIsEmpty!55568 mapRes!55568))

(declare-fun b!1320741 () Bool)

(declare-fun e!753635 () Bool)

(assert (=> b!1320741 (= e!753633 (and e!753635 mapRes!55568))))

(declare-fun condMapEmpty!55568 () Bool)

(declare-fun mapDefault!55568 () ValueCell!17075)

(assert (=> b!1320741 (= condMapEmpty!55568 (= (arr!42924 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17075)) mapDefault!55568)))))

(declare-fun b!1320742 () Bool)

(assert (=> b!1320742 (= e!753635 tp_is_empty!35947)))

(declare-fun b!1320743 () Bool)

(declare-fun res!876226 () Bool)

(assert (=> b!1320743 (=> (not res!876226) (not e!753637))))

(assert (=> b!1320743 (= res!876226 (not (= (select (arr!42923 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320744 () Bool)

(declare-fun res!876223 () Bool)

(assert (=> b!1320744 (=> (not res!876223) (not e!753637))))

(assert (=> b!1320744 (= res!876223 (and (= (size!43475 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43474 _keys!1609) (size!43475 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320745 () Bool)

(declare-fun e!753636 () Bool)

(assert (=> b!1320745 (= e!753636 tp_is_empty!35947)))

(declare-fun b!1320746 () Bool)

(assert (=> b!1320746 (= e!753637 (not true))))

(declare-datatypes ((tuple2!23268 0))(
  ( (tuple2!23269 (_1!11645 (_ BitVec 64)) (_2!11645 V!53033)) )
))
(declare-datatypes ((List!30426 0))(
  ( (Nil!30423) (Cons!30422 (h!31640 tuple2!23268) (t!44094 List!30426)) )
))
(declare-datatypes ((ListLongMap!20933 0))(
  ( (ListLongMap!20934 (toList!10482 List!30426)) )
))
(declare-fun lt!587116 () ListLongMap!20933)

(declare-fun contains!8649 (ListLongMap!20933 (_ BitVec 64)) Bool)

(assert (=> b!1320746 (contains!8649 lt!587116 k0!1164)))

(declare-fun minValue!1279 () V!53033)

(declare-datatypes ((Unit!43427 0))(
  ( (Unit!43428) )
))
(declare-fun lt!587117 () Unit!43427)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!125 ((_ BitVec 64) (_ BitVec 64) V!53033 ListLongMap!20933) Unit!43427)

(assert (=> b!1320746 (= lt!587117 (lemmaInListMapAfterAddingDiffThenInBefore!125 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587116))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!53033)

(declare-fun +!4570 (ListLongMap!20933 tuple2!23268) ListLongMap!20933)

(declare-fun getCurrentListMapNoExtraKeys!6209 (array!88907 array!88909 (_ BitVec 32) (_ BitVec 32) V!53033 V!53033 (_ BitVec 32) Int) ListLongMap!20933)

(declare-fun get!21607 (ValueCell!17075 V!53033) V!53033)

(declare-fun dynLambda!3524 (Int (_ BitVec 64)) V!53033)

(assert (=> b!1320746 (= lt!587116 (+!4570 (+!4570 (getCurrentListMapNoExtraKeys!6209 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23269 (select (arr!42923 _keys!1609) from!2000) (get!21607 (select (arr!42924 _values!1337) from!2000) (dynLambda!3524 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320747 () Bool)

(declare-fun res!876225 () Bool)

(assert (=> b!1320747 (=> (not res!876225) (not e!753637))))

(declare-fun getCurrentListMap!5479 (array!88907 array!88909 (_ BitVec 32) (_ BitVec 32) V!53033 V!53033 (_ BitVec 32) Int) ListLongMap!20933)

(assert (=> b!1320747 (= res!876225 (contains!8649 (getCurrentListMap!5479 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320748 () Bool)

(declare-fun res!876219 () Bool)

(assert (=> b!1320748 (=> (not res!876219) (not e!753637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88907 (_ BitVec 32)) Bool)

(assert (=> b!1320748 (= res!876219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320749 () Bool)

(declare-fun res!876220 () Bool)

(assert (=> b!1320749 (=> (not res!876220) (not e!753637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320749 (= res!876220 (validKeyInArray!0 (select (arr!42923 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55568 () Bool)

(declare-fun tp!105857 () Bool)

(assert (=> mapNonEmpty!55568 (= mapRes!55568 (and tp!105857 e!753636))))

(declare-fun mapValue!55568 () ValueCell!17075)

(declare-fun mapRest!55568 () (Array (_ BitVec 32) ValueCell!17075))

(declare-fun mapKey!55568 () (_ BitVec 32))

(assert (=> mapNonEmpty!55568 (= (arr!42924 _values!1337) (store mapRest!55568 mapKey!55568 mapValue!55568))))

(assert (= (and start!111694 res!876221) b!1320744))

(assert (= (and b!1320744 res!876223) b!1320748))

(assert (= (and b!1320748 res!876219) b!1320740))

(assert (= (and b!1320740 res!876222) b!1320739))

(assert (= (and b!1320739 res!876224) b!1320747))

(assert (= (and b!1320747 res!876225) b!1320743))

(assert (= (and b!1320743 res!876226) b!1320749))

(assert (= (and b!1320749 res!876220) b!1320746))

(assert (= (and b!1320741 condMapEmpty!55568) mapIsEmpty!55568))

(assert (= (and b!1320741 (not condMapEmpty!55568)) mapNonEmpty!55568))

(get-info :version)

(assert (= (and mapNonEmpty!55568 ((_ is ValueCellFull!17075) mapValue!55568)) b!1320745))

(assert (= (and b!1320741 ((_ is ValueCellFull!17075) mapDefault!55568)) b!1320742))

(assert (= start!111694 b!1320741))

(declare-fun b_lambda!23447 () Bool)

(assert (=> (not b_lambda!23447) (not b!1320746)))

(declare-fun t!44092 () Bool)

(declare-fun tb!11471 () Bool)

(assert (=> (and start!111694 (= defaultEntry!1340 defaultEntry!1340) t!44092) tb!11471))

(declare-fun result!24005 () Bool)

(assert (=> tb!11471 (= result!24005 tp_is_empty!35947)))

(assert (=> b!1320746 t!44092))

(declare-fun b_and!48417 () Bool)

(assert (= b_and!48415 (and (=> t!44092 result!24005) b_and!48417)))

(declare-fun m!1208633 () Bool)

(assert (=> b!1320743 m!1208633))

(assert (=> b!1320749 m!1208633))

(assert (=> b!1320749 m!1208633))

(declare-fun m!1208635 () Bool)

(assert (=> b!1320749 m!1208635))

(declare-fun m!1208637 () Bool)

(assert (=> b!1320748 m!1208637))

(declare-fun m!1208639 () Bool)

(assert (=> b!1320746 m!1208639))

(declare-fun m!1208641 () Bool)

(assert (=> b!1320746 m!1208641))

(assert (=> b!1320746 m!1208639))

(declare-fun m!1208643 () Bool)

(assert (=> b!1320746 m!1208643))

(declare-fun m!1208645 () Bool)

(assert (=> b!1320746 m!1208645))

(assert (=> b!1320746 m!1208643))

(declare-fun m!1208647 () Bool)

(assert (=> b!1320746 m!1208647))

(declare-fun m!1208649 () Bool)

(assert (=> b!1320746 m!1208649))

(assert (=> b!1320746 m!1208633))

(declare-fun m!1208651 () Bool)

(assert (=> b!1320746 m!1208651))

(assert (=> b!1320746 m!1208645))

(assert (=> b!1320746 m!1208641))

(declare-fun m!1208653 () Bool)

(assert (=> b!1320746 m!1208653))

(declare-fun m!1208655 () Bool)

(assert (=> mapNonEmpty!55568 m!1208655))

(declare-fun m!1208657 () Bool)

(assert (=> b!1320740 m!1208657))

(declare-fun m!1208659 () Bool)

(assert (=> start!111694 m!1208659))

(declare-fun m!1208661 () Bool)

(assert (=> start!111694 m!1208661))

(declare-fun m!1208663 () Bool)

(assert (=> start!111694 m!1208663))

(declare-fun m!1208665 () Bool)

(assert (=> b!1320747 m!1208665))

(assert (=> b!1320747 m!1208665))

(declare-fun m!1208667 () Bool)

(assert (=> b!1320747 m!1208667))

(check-sat b_and!48417 (not b_next!30127) (not b!1320747) (not b!1320749) (not b!1320740) (not b_lambda!23447) tp_is_empty!35947 (not b!1320748) (not mapNonEmpty!55568) (not b!1320746) (not start!111694))
(check-sat b_and!48417 (not b_next!30127))
