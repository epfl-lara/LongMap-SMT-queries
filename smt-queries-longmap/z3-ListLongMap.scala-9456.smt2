; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112568 () Bool)

(assert start!112568)

(declare-fun b_free!30739 () Bool)

(declare-fun b_next!30739 () Bool)

(assert (=> start!112568 (= b_free!30739 (not b_next!30739))))

(declare-fun tp!107853 () Bool)

(declare-fun b_and!49535 () Bool)

(assert (=> start!112568 (= tp!107853 b_and!49535)))

(declare-fun b!1332902 () Bool)

(declare-fun res!884151 () Bool)

(declare-fun e!759589 () Bool)

(assert (=> b!1332902 (=> (not res!884151) (not e!759589))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90285 0))(
  ( (array!90286 (arr!43604 (Array (_ BitVec 32) (_ BitVec 64))) (size!44155 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90285)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332902 (= res!884151 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44155 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332903 () Bool)

(declare-fun res!884152 () Bool)

(assert (=> b!1332903 (=> (not res!884152) (not e!759589))))

(assert (=> b!1332903 (= res!884152 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332904 () Bool)

(assert (=> b!1332904 (= e!759589 (not true))))

(declare-datatypes ((V!53969 0))(
  ( (V!53970 (val!18399 Int)) )
))
(declare-datatypes ((tuple2!23734 0))(
  ( (tuple2!23735 (_1!11878 (_ BitVec 64)) (_2!11878 V!53969)) )
))
(declare-datatypes ((List!30898 0))(
  ( (Nil!30895) (Cons!30894 (h!32112 tuple2!23734) (t!45042 List!30898)) )
))
(declare-datatypes ((ListLongMap!21399 0))(
  ( (ListLongMap!21400 (toList!10715 List!30898)) )
))
(declare-fun lt!592092 () ListLongMap!21399)

(declare-fun minValue!1262 () V!53969)

(declare-fun contains!8891 (ListLongMap!21399 (_ BitVec 64)) Bool)

(declare-fun +!4727 (ListLongMap!21399 tuple2!23734) ListLongMap!21399)

(assert (=> b!1332904 (contains!8891 (+!4727 lt!592092 (tuple2!23735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43764 0))(
  ( (Unit!43765) )
))
(declare-fun lt!592087 () Unit!43764)

(declare-fun addStillContains!1173 (ListLongMap!21399 (_ BitVec 64) V!53969 (_ BitVec 64)) Unit!43764)

(assert (=> b!1332904 (= lt!592087 (addStillContains!1173 lt!592092 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332904 (contains!8891 lt!592092 k0!1153)))

(declare-fun lt!592088 () V!53969)

(declare-fun lt!592090 () Unit!43764)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!270 ((_ BitVec 64) (_ BitVec 64) V!53969 ListLongMap!21399) Unit!43764)

(assert (=> b!1332904 (= lt!592090 (lemmaInListMapAfterAddingDiffThenInBefore!270 k0!1153 (select (arr!43604 _keys!1590) from!1980) lt!592088 lt!592092))))

(declare-fun lt!592089 () ListLongMap!21399)

(assert (=> b!1332904 (contains!8891 lt!592089 k0!1153)))

(declare-fun lt!592091 () Unit!43764)

(assert (=> b!1332904 (= lt!592091 (lemmaInListMapAfterAddingDiffThenInBefore!270 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592089))))

(assert (=> b!1332904 (= lt!592089 (+!4727 lt!592092 (tuple2!23735 (select (arr!43604 _keys!1590) from!1980) lt!592088)))))

(declare-datatypes ((ValueCell!17426 0))(
  ( (ValueCellFull!17426 (v!21031 V!53969)) (EmptyCell!17426) )
))
(declare-datatypes ((array!90287 0))(
  ( (array!90288 (arr!43605 (Array (_ BitVec 32) ValueCell!17426)) (size!44156 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90287)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!22006 (ValueCell!17426 V!53969) V!53969)

(declare-fun dynLambda!3681 (Int (_ BitVec 64)) V!53969)

(assert (=> b!1332904 (= lt!592088 (get!22006 (select (arr!43605 _values!1320) from!1980) (dynLambda!3681 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53969)

(declare-fun getCurrentListMapNoExtraKeys!6371 (array!90285 array!90287 (_ BitVec 32) (_ BitVec 32) V!53969 V!53969 (_ BitVec 32) Int) ListLongMap!21399)

(assert (=> b!1332904 (= lt!592092 (getCurrentListMapNoExtraKeys!6371 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332905 () Bool)

(declare-fun res!884154 () Bool)

(assert (=> b!1332905 (=> (not res!884154) (not e!759589))))

(assert (=> b!1332905 (= res!884154 (and (= (size!44156 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44155 _keys!1590) (size!44156 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332906 () Bool)

(declare-fun res!884159 () Bool)

(assert (=> b!1332906 (=> (not res!884159) (not e!759589))))

(assert (=> b!1332906 (= res!884159 (not (= (select (arr!43604 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332907 () Bool)

(declare-fun e!759586 () Bool)

(declare-fun tp_is_empty!36649 () Bool)

(assert (=> b!1332907 (= e!759586 tp_is_empty!36649)))

(declare-fun b!1332908 () Bool)

(declare-fun res!884157 () Bool)

(assert (=> b!1332908 (=> (not res!884157) (not e!759589))))

(declare-datatypes ((List!30899 0))(
  ( (Nil!30896) (Cons!30895 (h!32113 (_ BitVec 64)) (t!45043 List!30899)) )
))
(declare-fun arrayNoDuplicates!0 (array!90285 (_ BitVec 32) List!30899) Bool)

(assert (=> b!1332908 (= res!884157 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30896))))

(declare-fun b!1332909 () Bool)

(declare-fun e!759588 () Bool)

(declare-fun mapRes!56647 () Bool)

(assert (=> b!1332909 (= e!759588 (and e!759586 mapRes!56647))))

(declare-fun condMapEmpty!56647 () Bool)

(declare-fun mapDefault!56647 () ValueCell!17426)

(assert (=> b!1332909 (= condMapEmpty!56647 (= (arr!43605 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17426)) mapDefault!56647)))))

(declare-fun b!1332910 () Bool)

(declare-fun res!884155 () Bool)

(assert (=> b!1332910 (=> (not res!884155) (not e!759589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90285 (_ BitVec 32)) Bool)

(assert (=> b!1332910 (= res!884155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!884153 () Bool)

(assert (=> start!112568 (=> (not res!884153) (not e!759589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112568 (= res!884153 (validMask!0 mask!1998))))

(assert (=> start!112568 e!759589))

(declare-fun array_inv!33171 (array!90287) Bool)

(assert (=> start!112568 (and (array_inv!33171 _values!1320) e!759588)))

(assert (=> start!112568 true))

(declare-fun array_inv!33172 (array!90285) Bool)

(assert (=> start!112568 (array_inv!33172 _keys!1590)))

(assert (=> start!112568 tp!107853))

(assert (=> start!112568 tp_is_empty!36649))

(declare-fun b!1332911 () Bool)

(declare-fun res!884156 () Bool)

(assert (=> b!1332911 (=> (not res!884156) (not e!759589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332911 (= res!884156 (validKeyInArray!0 (select (arr!43604 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56647 () Bool)

(declare-fun tp!107854 () Bool)

(declare-fun e!759587 () Bool)

(assert (=> mapNonEmpty!56647 (= mapRes!56647 (and tp!107854 e!759587))))

(declare-fun mapRest!56647 () (Array (_ BitVec 32) ValueCell!17426))

(declare-fun mapValue!56647 () ValueCell!17426)

(declare-fun mapKey!56647 () (_ BitVec 32))

(assert (=> mapNonEmpty!56647 (= (arr!43605 _values!1320) (store mapRest!56647 mapKey!56647 mapValue!56647))))

(declare-fun b!1332912 () Bool)

(declare-fun res!884158 () Bool)

(assert (=> b!1332912 (=> (not res!884158) (not e!759589))))

(declare-fun getCurrentListMap!5684 (array!90285 array!90287 (_ BitVec 32) (_ BitVec 32) V!53969 V!53969 (_ BitVec 32) Int) ListLongMap!21399)

(assert (=> b!1332912 (= res!884158 (contains!8891 (getCurrentListMap!5684 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56647 () Bool)

(assert (=> mapIsEmpty!56647 mapRes!56647))

(declare-fun b!1332913 () Bool)

(assert (=> b!1332913 (= e!759587 tp_is_empty!36649)))

(assert (= (and start!112568 res!884153) b!1332905))

(assert (= (and b!1332905 res!884154) b!1332910))

(assert (= (and b!1332910 res!884155) b!1332908))

(assert (= (and b!1332908 res!884157) b!1332902))

(assert (= (and b!1332902 res!884151) b!1332912))

(assert (= (and b!1332912 res!884158) b!1332906))

(assert (= (and b!1332906 res!884159) b!1332911))

(assert (= (and b!1332911 res!884156) b!1332903))

(assert (= (and b!1332903 res!884152) b!1332904))

(assert (= (and b!1332909 condMapEmpty!56647) mapIsEmpty!56647))

(assert (= (and b!1332909 (not condMapEmpty!56647)) mapNonEmpty!56647))

(get-info :version)

(assert (= (and mapNonEmpty!56647 ((_ is ValueCellFull!17426) mapValue!56647)) b!1332913))

(assert (= (and b!1332909 ((_ is ValueCellFull!17426) mapDefault!56647)) b!1332907))

(assert (= start!112568 b!1332909))

(declare-fun b_lambda!23993 () Bool)

(assert (=> (not b_lambda!23993) (not b!1332904)))

(declare-fun t!45041 () Bool)

(declare-fun tb!11947 () Bool)

(assert (=> (and start!112568 (= defaultEntry!1323 defaultEntry!1323) t!45041) tb!11947))

(declare-fun result!24973 () Bool)

(assert (=> tb!11947 (= result!24973 tp_is_empty!36649)))

(assert (=> b!1332904 t!45041))

(declare-fun b_and!49537 () Bool)

(assert (= b_and!49535 (and (=> t!45041 result!24973) b_and!49537)))

(declare-fun m!1221881 () Bool)

(assert (=> b!1332911 m!1221881))

(assert (=> b!1332911 m!1221881))

(declare-fun m!1221883 () Bool)

(assert (=> b!1332911 m!1221883))

(assert (=> b!1332906 m!1221881))

(declare-fun m!1221885 () Bool)

(assert (=> mapNonEmpty!56647 m!1221885))

(declare-fun m!1221887 () Bool)

(assert (=> b!1332910 m!1221887))

(declare-fun m!1221889 () Bool)

(assert (=> b!1332912 m!1221889))

(assert (=> b!1332912 m!1221889))

(declare-fun m!1221891 () Bool)

(assert (=> b!1332912 m!1221891))

(declare-fun m!1221893 () Bool)

(assert (=> start!112568 m!1221893))

(declare-fun m!1221895 () Bool)

(assert (=> start!112568 m!1221895))

(declare-fun m!1221897 () Bool)

(assert (=> start!112568 m!1221897))

(declare-fun m!1221899 () Bool)

(assert (=> b!1332904 m!1221899))

(declare-fun m!1221901 () Bool)

(assert (=> b!1332904 m!1221901))

(assert (=> b!1332904 m!1221899))

(declare-fun m!1221903 () Bool)

(assert (=> b!1332904 m!1221903))

(declare-fun m!1221905 () Bool)

(assert (=> b!1332904 m!1221905))

(declare-fun m!1221907 () Bool)

(assert (=> b!1332904 m!1221907))

(declare-fun m!1221909 () Bool)

(assert (=> b!1332904 m!1221909))

(assert (=> b!1332904 m!1221881))

(declare-fun m!1221911 () Bool)

(assert (=> b!1332904 m!1221911))

(declare-fun m!1221913 () Bool)

(assert (=> b!1332904 m!1221913))

(declare-fun m!1221915 () Bool)

(assert (=> b!1332904 m!1221915))

(declare-fun m!1221917 () Bool)

(assert (=> b!1332904 m!1221917))

(declare-fun m!1221919 () Bool)

(assert (=> b!1332904 m!1221919))

(assert (=> b!1332904 m!1221881))

(assert (=> b!1332904 m!1221901))

(assert (=> b!1332904 m!1221913))

(declare-fun m!1221921 () Bool)

(assert (=> b!1332904 m!1221921))

(declare-fun m!1221923 () Bool)

(assert (=> b!1332908 m!1221923))

(check-sat (not mapNonEmpty!56647) (not b_lambda!23993) tp_is_empty!36649 (not b!1332908) (not start!112568) (not b!1332912) b_and!49537 (not b_next!30739) (not b!1332904) (not b!1332910) (not b!1332911))
(check-sat b_and!49537 (not b_next!30739))
