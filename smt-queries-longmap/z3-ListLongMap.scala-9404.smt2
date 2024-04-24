; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112142 () Bool)

(assert start!112142)

(declare-fun b_free!30517 () Bool)

(declare-fun b_next!30517 () Bool)

(assert (=> start!112142 (= b_free!30517 (not b_next!30517))))

(declare-fun tp!107031 () Bool)

(declare-fun b_and!49131 () Bool)

(assert (=> start!112142 (= tp!107031 b_and!49131)))

(declare-fun b!1327627 () Bool)

(declare-fun res!880800 () Bool)

(declare-fun e!756819 () Bool)

(assert (=> b!1327627 (=> (not res!880800) (not e!756819))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-datatypes ((array!89675 0))(
  ( (array!89676 (arr!43306 (Array (_ BitVec 32) (_ BitVec 64))) (size!43857 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89675)

(assert (=> b!1327627 (= res!880800 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43857 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56157 () Bool)

(declare-fun mapRes!56157 () Bool)

(declare-fun tp!107030 () Bool)

(declare-fun e!756820 () Bool)

(assert (=> mapNonEmpty!56157 (= mapRes!56157 (and tp!107030 e!756820))))

(declare-fun mapKey!56157 () (_ BitVec 32))

(declare-datatypes ((V!53553 0))(
  ( (V!53554 (val!18243 Int)) )
))
(declare-datatypes ((ValueCell!17270 0))(
  ( (ValueCellFull!17270 (v!20871 V!53553)) (EmptyCell!17270) )
))
(declare-fun mapValue!56157 () ValueCell!17270)

(declare-datatypes ((array!89677 0))(
  ( (array!89678 (arr!43307 (Array (_ BitVec 32) ValueCell!17270)) (size!43858 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89677)

(declare-fun mapRest!56157 () (Array (_ BitVec 32) ValueCell!17270))

(assert (=> mapNonEmpty!56157 (= (arr!43307 _values!1337) (store mapRest!56157 mapKey!56157 mapValue!56157))))

(declare-fun b!1327628 () Bool)

(declare-fun res!880801 () Bool)

(assert (=> b!1327628 (=> (not res!880801) (not e!756819))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1327628 (= res!880801 (and (= (size!43858 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43857 _keys!1609) (size!43858 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327629 () Bool)

(declare-fun res!880802 () Bool)

(assert (=> b!1327629 (=> (not res!880802) (not e!756819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89675 (_ BitVec 32)) Bool)

(assert (=> b!1327629 (= res!880802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1327630 () Bool)

(declare-fun res!880806 () Bool)

(assert (=> b!1327630 (=> (not res!880806) (not e!756819))))

(declare-datatypes ((List!30718 0))(
  ( (Nil!30715) (Cons!30714 (h!31932 (_ BitVec 64)) (t!44698 List!30718)) )
))
(declare-fun arrayNoDuplicates!0 (array!89675 (_ BitVec 32) List!30718) Bool)

(assert (=> b!1327630 (= res!880806 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30715))))

(declare-fun b!1327631 () Bool)

(declare-fun res!880804 () Bool)

(assert (=> b!1327631 (=> (not res!880804) (not e!756819))))

(declare-fun zeroValue!1279 () V!53553)

(declare-fun minValue!1279 () V!53553)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23566 0))(
  ( (tuple2!23567 (_1!11794 (_ BitVec 64)) (_2!11794 V!53553)) )
))
(declare-datatypes ((List!30719 0))(
  ( (Nil!30716) (Cons!30715 (h!31933 tuple2!23566) (t!44699 List!30719)) )
))
(declare-datatypes ((ListLongMap!21231 0))(
  ( (ListLongMap!21232 (toList!10631 List!30719)) )
))
(declare-fun contains!8799 (ListLongMap!21231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5609 (array!89675 array!89677 (_ BitVec 32) (_ BitVec 32) V!53553 V!53553 (_ BitVec 32) Int) ListLongMap!21231)

(assert (=> b!1327631 (= res!880804 (contains!8799 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1327632 () Bool)

(declare-fun tp_is_empty!36337 () Bool)

(assert (=> b!1327632 (= e!756820 tp_is_empty!36337)))

(declare-fun b!1327633 () Bool)

(declare-fun res!880799 () Bool)

(assert (=> b!1327633 (=> (not res!880799) (not e!756819))))

(assert (=> b!1327633 (= res!880799 (not (= (select (arr!43306 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!880803 () Bool)

(assert (=> start!112142 (=> (not res!880803) (not e!756819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112142 (= res!880803 (validMask!0 mask!2019))))

(assert (=> start!112142 e!756819))

(declare-fun array_inv!32951 (array!89675) Bool)

(assert (=> start!112142 (array_inv!32951 _keys!1609)))

(assert (=> start!112142 true))

(assert (=> start!112142 tp_is_empty!36337))

(declare-fun e!756816 () Bool)

(declare-fun array_inv!32952 (array!89677) Bool)

(assert (=> start!112142 (and (array_inv!32952 _values!1337) e!756816)))

(assert (=> start!112142 tp!107031))

(declare-fun b!1327634 () Bool)

(declare-fun e!756818 () Bool)

(assert (=> b!1327634 (= e!756818 tp_is_empty!36337)))

(declare-fun b!1327635 () Bool)

(assert (=> b!1327635 (= e!756816 (and e!756818 mapRes!56157))))

(declare-fun condMapEmpty!56157 () Bool)

(declare-fun mapDefault!56157 () ValueCell!17270)

(assert (=> b!1327635 (= condMapEmpty!56157 (= (arr!43307 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17270)) mapDefault!56157)))))

(declare-fun b!1327636 () Bool)

(declare-fun res!880805 () Bool)

(assert (=> b!1327636 (=> (not res!880805) (not e!756819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327636 (= res!880805 (validKeyInArray!0 (select (arr!43306 _keys!1609) from!2000)))))

(declare-fun b!1327637 () Bool)

(assert (=> b!1327637 (= e!756819 (not true))))

(declare-fun lt!590493 () ListLongMap!21231)

(assert (=> b!1327637 (contains!8799 lt!590493 k0!1164)))

(declare-datatypes ((Unit!43643 0))(
  ( (Unit!43644) )
))
(declare-fun lt!590492 () Unit!43643)

(declare-fun lt!590495 () V!53553)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!225 ((_ BitVec 64) (_ BitVec 64) V!53553 ListLongMap!21231) Unit!43643)

(assert (=> b!1327637 (= lt!590492 (lemmaInListMapAfterAddingDiffThenInBefore!225 k0!1164 (select (arr!43306 _keys!1609) from!2000) lt!590495 lt!590493))))

(declare-fun lt!590497 () ListLongMap!21231)

(assert (=> b!1327637 (contains!8799 lt!590497 k0!1164)))

(declare-fun lt!590494 () Unit!43643)

(assert (=> b!1327637 (= lt!590494 (lemmaInListMapAfterAddingDiffThenInBefore!225 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590497))))

(declare-fun lt!590498 () ListLongMap!21231)

(assert (=> b!1327637 (contains!8799 lt!590498 k0!1164)))

(declare-fun lt!590496 () Unit!43643)

(assert (=> b!1327637 (= lt!590496 (lemmaInListMapAfterAddingDiffThenInBefore!225 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590498))))

(declare-fun +!4675 (ListLongMap!21231 tuple2!23566) ListLongMap!21231)

(assert (=> b!1327637 (= lt!590498 (+!4675 lt!590497 (tuple2!23567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1327637 (= lt!590497 (+!4675 lt!590493 (tuple2!23567 (select (arr!43306 _keys!1609) from!2000) lt!590495)))))

(declare-fun get!21845 (ValueCell!17270 V!53553) V!53553)

(declare-fun dynLambda!3629 (Int (_ BitVec 64)) V!53553)

(assert (=> b!1327637 (= lt!590495 (get!21845 (select (arr!43307 _values!1337) from!2000) (dynLambda!3629 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6319 (array!89675 array!89677 (_ BitVec 32) (_ BitVec 32) V!53553 V!53553 (_ BitVec 32) Int) ListLongMap!21231)

(assert (=> b!1327637 (= lt!590493 (getCurrentListMapNoExtraKeys!6319 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!56157 () Bool)

(assert (=> mapIsEmpty!56157 mapRes!56157))

(assert (= (and start!112142 res!880803) b!1327628))

(assert (= (and b!1327628 res!880801) b!1327629))

(assert (= (and b!1327629 res!880802) b!1327630))

(assert (= (and b!1327630 res!880806) b!1327627))

(assert (= (and b!1327627 res!880800) b!1327631))

(assert (= (and b!1327631 res!880804) b!1327633))

(assert (= (and b!1327633 res!880799) b!1327636))

(assert (= (and b!1327636 res!880805) b!1327637))

(assert (= (and b!1327635 condMapEmpty!56157) mapIsEmpty!56157))

(assert (= (and b!1327635 (not condMapEmpty!56157)) mapNonEmpty!56157))

(get-info :version)

(assert (= (and mapNonEmpty!56157 ((_ is ValueCellFull!17270) mapValue!56157)) b!1327632))

(assert (= (and b!1327635 ((_ is ValueCellFull!17270) mapDefault!56157)) b!1327634))

(assert (= start!112142 b!1327635))

(declare-fun b_lambda!23789 () Bool)

(assert (=> (not b_lambda!23789) (not b!1327637)))

(declare-fun t!44697 () Bool)

(declare-fun tb!11783 () Bool)

(assert (=> (and start!112142 (= defaultEntry!1340 defaultEntry!1340) t!44697) tb!11783))

(declare-fun result!24631 () Bool)

(assert (=> tb!11783 (= result!24631 tp_is_empty!36337)))

(assert (=> b!1327637 t!44697))

(declare-fun b_and!49133 () Bool)

(assert (= b_and!49131 (and (=> t!44697 result!24631) b_and!49133)))

(declare-fun m!1216887 () Bool)

(assert (=> start!112142 m!1216887))

(declare-fun m!1216889 () Bool)

(assert (=> start!112142 m!1216889))

(declare-fun m!1216891 () Bool)

(assert (=> start!112142 m!1216891))

(declare-fun m!1216893 () Bool)

(assert (=> b!1327633 m!1216893))

(assert (=> b!1327636 m!1216893))

(assert (=> b!1327636 m!1216893))

(declare-fun m!1216895 () Bool)

(assert (=> b!1327636 m!1216895))

(declare-fun m!1216897 () Bool)

(assert (=> b!1327629 m!1216897))

(declare-fun m!1216899 () Bool)

(assert (=> b!1327637 m!1216899))

(declare-fun m!1216901 () Bool)

(assert (=> b!1327637 m!1216901))

(declare-fun m!1216903 () Bool)

(assert (=> b!1327637 m!1216903))

(declare-fun m!1216905 () Bool)

(assert (=> b!1327637 m!1216905))

(declare-fun m!1216907 () Bool)

(assert (=> b!1327637 m!1216907))

(declare-fun m!1216909 () Bool)

(assert (=> b!1327637 m!1216909))

(declare-fun m!1216911 () Bool)

(assert (=> b!1327637 m!1216911))

(assert (=> b!1327637 m!1216893))

(declare-fun m!1216913 () Bool)

(assert (=> b!1327637 m!1216913))

(declare-fun m!1216915 () Bool)

(assert (=> b!1327637 m!1216915))

(assert (=> b!1327637 m!1216911))

(assert (=> b!1327637 m!1216905))

(declare-fun m!1216917 () Bool)

(assert (=> b!1327637 m!1216917))

(declare-fun m!1216919 () Bool)

(assert (=> b!1327637 m!1216919))

(declare-fun m!1216921 () Bool)

(assert (=> b!1327637 m!1216921))

(assert (=> b!1327637 m!1216893))

(declare-fun m!1216923 () Bool)

(assert (=> mapNonEmpty!56157 m!1216923))

(declare-fun m!1216925 () Bool)

(assert (=> b!1327630 m!1216925))

(declare-fun m!1216927 () Bool)

(assert (=> b!1327631 m!1216927))

(assert (=> b!1327631 m!1216927))

(declare-fun m!1216929 () Bool)

(assert (=> b!1327631 m!1216929))

(check-sat (not mapNonEmpty!56157) (not b!1327631) b_and!49133 (not b_lambda!23789) (not start!112142) (not b!1327630) tp_is_empty!36337 (not b_next!30517) (not b!1327637) (not b!1327636) (not b!1327629))
(check-sat b_and!49133 (not b_next!30517))
