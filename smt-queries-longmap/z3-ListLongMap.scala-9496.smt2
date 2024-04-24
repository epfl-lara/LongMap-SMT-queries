; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112808 () Bool)

(assert start!112808)

(declare-fun b_free!30979 () Bool)

(declare-fun b_next!30979 () Bool)

(assert (=> start!112808 (= b_free!30979 (not b_next!30979))))

(declare-fun tp!108574 () Bool)

(declare-fun b_and!49889 () Bool)

(assert (=> start!112808 (= tp!108574 b_and!49889)))

(declare-fun b!1336832 () Bool)

(declare-fun e!761470 () Bool)

(declare-fun tp_is_empty!36889 () Bool)

(assert (=> b!1336832 (= e!761470 tp_is_empty!36889)))

(declare-fun b!1336833 () Bool)

(declare-fun e!761466 () Bool)

(declare-fun mapRes!57007 () Bool)

(assert (=> b!1336833 (= e!761466 (and e!761470 mapRes!57007))))

(declare-fun condMapEmpty!57007 () Bool)

(declare-datatypes ((V!54289 0))(
  ( (V!54290 (val!18519 Int)) )
))
(declare-datatypes ((ValueCell!17546 0))(
  ( (ValueCellFull!17546 (v!21151 V!54289)) (EmptyCell!17546) )
))
(declare-datatypes ((array!90749 0))(
  ( (array!90750 (arr!43836 (Array (_ BitVec 32) ValueCell!17546)) (size!44387 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90749)

(declare-fun mapDefault!57007 () ValueCell!17546)

(assert (=> b!1336833 (= condMapEmpty!57007 (= (arr!43836 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17546)) mapDefault!57007)))))

(declare-fun b!1336834 () Bool)

(declare-fun res!886887 () Bool)

(declare-fun e!761469 () Bool)

(assert (=> b!1336834 (=> (not res!886887) (not e!761469))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336834 (= res!886887 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336835 () Bool)

(declare-fun e!761468 () Bool)

(assert (=> b!1336835 (= e!761468 tp_is_empty!36889)))

(declare-fun b!1336836 () Bool)

(declare-fun res!886893 () Bool)

(assert (=> b!1336836 (=> (not res!886893) (not e!761469))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90751 0))(
  ( (array!90752 (arr!43837 (Array (_ BitVec 32) (_ BitVec 64))) (size!44388 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90751)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54289)

(declare-fun zeroValue!1262 () V!54289)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23916 0))(
  ( (tuple2!23917 (_1!11969 (_ BitVec 64)) (_2!11969 V!54289)) )
))
(declare-datatypes ((List!31062 0))(
  ( (Nil!31059) (Cons!31058 (h!32276 tuple2!23916) (t!45318 List!31062)) )
))
(declare-datatypes ((ListLongMap!21581 0))(
  ( (ListLongMap!21582 (toList!10806 List!31062)) )
))
(declare-fun contains!8981 (ListLongMap!21581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5764 (array!90751 array!90749 (_ BitVec 32) (_ BitVec 32) V!54289 V!54289 (_ BitVec 32) Int) ListLongMap!21581)

(assert (=> b!1336836 (= res!886893 (contains!8981 (getCurrentListMap!5764 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!886889 () Bool)

(assert (=> start!112808 (=> (not res!886889) (not e!761469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112808 (= res!886889 (validMask!0 mask!1998))))

(assert (=> start!112808 e!761469))

(declare-fun array_inv!33325 (array!90749) Bool)

(assert (=> start!112808 (and (array_inv!33325 _values!1320) e!761466)))

(assert (=> start!112808 true))

(declare-fun array_inv!33326 (array!90751) Bool)

(assert (=> start!112808 (array_inv!33326 _keys!1590)))

(assert (=> start!112808 tp!108574))

(assert (=> start!112808 tp_is_empty!36889))

(declare-fun b!1336837 () Bool)

(declare-fun res!886894 () Bool)

(assert (=> b!1336837 (=> (not res!886894) (not e!761469))))

(declare-datatypes ((List!31063 0))(
  ( (Nil!31060) (Cons!31059 (h!32277 (_ BitVec 64)) (t!45319 List!31063)) )
))
(declare-fun arrayNoDuplicates!0 (array!90751 (_ BitVec 32) List!31063) Bool)

(assert (=> b!1336837 (= res!886894 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31060))))

(declare-fun b!1336838 () Bool)

(declare-fun res!886890 () Bool)

(assert (=> b!1336838 (=> (not res!886890) (not e!761469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90751 (_ BitVec 32)) Bool)

(assert (=> b!1336838 (= res!886890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!57007 () Bool)

(assert (=> mapIsEmpty!57007 mapRes!57007))

(declare-fun b!1336839 () Bool)

(declare-fun res!886892 () Bool)

(assert (=> b!1336839 (=> (not res!886892) (not e!761469))))

(assert (=> b!1336839 (= res!886892 (not (= (select (arr!43837 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336840 () Bool)

(assert (=> b!1336840 (= e!761469 (bvsge from!1980 (size!44387 _values!1320)))))

(declare-fun lt!592941 () ListLongMap!21581)

(declare-fun getCurrentListMapNoExtraKeys!6409 (array!90751 array!90749 (_ BitVec 32) (_ BitVec 32) V!54289 V!54289 (_ BitVec 32) Int) ListLongMap!21581)

(assert (=> b!1336840 (= lt!592941 (getCurrentListMapNoExtraKeys!6409 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun mapNonEmpty!57007 () Bool)

(declare-fun tp!108573 () Bool)

(assert (=> mapNonEmpty!57007 (= mapRes!57007 (and tp!108573 e!761468))))

(declare-fun mapRest!57007 () (Array (_ BitVec 32) ValueCell!17546))

(declare-fun mapKey!57007 () (_ BitVec 32))

(declare-fun mapValue!57007 () ValueCell!17546)

(assert (=> mapNonEmpty!57007 (= (arr!43836 _values!1320) (store mapRest!57007 mapKey!57007 mapValue!57007))))

(declare-fun b!1336841 () Bool)

(declare-fun res!886895 () Bool)

(assert (=> b!1336841 (=> (not res!886895) (not e!761469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336841 (= res!886895 (validKeyInArray!0 (select (arr!43837 _keys!1590) from!1980)))))

(declare-fun b!1336842 () Bool)

(declare-fun res!886891 () Bool)

(assert (=> b!1336842 (=> (not res!886891) (not e!761469))))

(assert (=> b!1336842 (= res!886891 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44388 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336843 () Bool)

(declare-fun res!886888 () Bool)

(assert (=> b!1336843 (=> (not res!886888) (not e!761469))))

(assert (=> b!1336843 (= res!886888 (and (= (size!44387 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44388 _keys!1590) (size!44387 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112808 res!886889) b!1336843))

(assert (= (and b!1336843 res!886888) b!1336838))

(assert (= (and b!1336838 res!886890) b!1336837))

(assert (= (and b!1336837 res!886894) b!1336842))

(assert (= (and b!1336842 res!886891) b!1336836))

(assert (= (and b!1336836 res!886893) b!1336839))

(assert (= (and b!1336839 res!886892) b!1336841))

(assert (= (and b!1336841 res!886895) b!1336834))

(assert (= (and b!1336834 res!886887) b!1336840))

(assert (= (and b!1336833 condMapEmpty!57007) mapIsEmpty!57007))

(assert (= (and b!1336833 (not condMapEmpty!57007)) mapNonEmpty!57007))

(get-info :version)

(assert (= (and mapNonEmpty!57007 ((_ is ValueCellFull!17546) mapValue!57007)) b!1336835))

(assert (= (and b!1336833 ((_ is ValueCellFull!17546) mapDefault!57007)) b!1336832))

(assert (= start!112808 b!1336833))

(declare-fun m!1225151 () Bool)

(assert (=> b!1336837 m!1225151))

(declare-fun m!1225153 () Bool)

(assert (=> start!112808 m!1225153))

(declare-fun m!1225155 () Bool)

(assert (=> start!112808 m!1225155))

(declare-fun m!1225157 () Bool)

(assert (=> start!112808 m!1225157))

(declare-fun m!1225159 () Bool)

(assert (=> b!1336839 m!1225159))

(declare-fun m!1225161 () Bool)

(assert (=> b!1336838 m!1225161))

(declare-fun m!1225163 () Bool)

(assert (=> b!1336836 m!1225163))

(assert (=> b!1336836 m!1225163))

(declare-fun m!1225165 () Bool)

(assert (=> b!1336836 m!1225165))

(declare-fun m!1225167 () Bool)

(assert (=> b!1336840 m!1225167))

(declare-fun m!1225169 () Bool)

(assert (=> mapNonEmpty!57007 m!1225169))

(assert (=> b!1336841 m!1225159))

(assert (=> b!1336841 m!1225159))

(declare-fun m!1225171 () Bool)

(assert (=> b!1336841 m!1225171))

(check-sat (not b_next!30979) b_and!49889 (not b!1336840) (not start!112808) tp_is_empty!36889 (not b!1336837) (not b!1336841) (not b!1336838) (not mapNonEmpty!57007) (not b!1336836))
(check-sat b_and!49889 (not b_next!30979))
