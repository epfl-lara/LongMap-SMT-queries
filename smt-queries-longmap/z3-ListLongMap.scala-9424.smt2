; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112152 () Bool)

(assert start!112152)

(declare-fun b_free!30547 () Bool)

(declare-fun b_next!30547 () Bool)

(assert (=> start!112152 (= b_free!30547 (not b_next!30547))))

(declare-fun tp!107279 () Bool)

(declare-fun b_and!49179 () Bool)

(assert (=> start!112152 (= tp!107279 b_and!49179)))

(declare-fun b!1328186 () Bool)

(declare-fun res!881268 () Bool)

(declare-fun e!757270 () Bool)

(assert (=> b!1328186 (=> (not res!881268) (not e!757270))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89743 0))(
  ( (array!89744 (arr!43338 (Array (_ BitVec 32) (_ BitVec 64))) (size!43890 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89743)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328186 (= res!881268 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43890 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328187 () Bool)

(declare-fun res!881269 () Bool)

(assert (=> b!1328187 (=> (not res!881269) (not e!757270))))

(declare-datatypes ((V!53713 0))(
  ( (V!53714 (val!18303 Int)) )
))
(declare-datatypes ((ValueCell!17330 0))(
  ( (ValueCellFull!17330 (v!20939 V!53713)) (EmptyCell!17330) )
))
(declare-datatypes ((array!89745 0))(
  ( (array!89746 (arr!43339 (Array (_ BitVec 32) ValueCell!17330)) (size!43891 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89745)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1328187 (= res!881269 (and (= (size!43891 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43890 _keys!1590) (size!43891 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328188 () Bool)

(declare-fun res!881266 () Bool)

(assert (=> b!1328188 (=> (not res!881266) (not e!757270))))

(declare-datatypes ((List!30767 0))(
  ( (Nil!30764) (Cons!30763 (h!31972 (_ BitVec 64)) (t!44765 List!30767)) )
))
(declare-fun arrayNoDuplicates!0 (array!89743 (_ BitVec 32) List!30767) Bool)

(assert (=> b!1328188 (= res!881266 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30764))))

(declare-fun b!1328189 () Bool)

(assert (=> b!1328189 (= e!757270 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!590632 () Bool)

(declare-fun minValue!1262 () V!53713)

(declare-fun zeroValue!1262 () V!53713)

(declare-datatypes ((tuple2!23618 0))(
  ( (tuple2!23619 (_1!11820 (_ BitVec 64)) (_2!11820 V!53713)) )
))
(declare-datatypes ((List!30768 0))(
  ( (Nil!30765) (Cons!30764 (h!31973 tuple2!23618) (t!44766 List!30768)) )
))
(declare-datatypes ((ListLongMap!21275 0))(
  ( (ListLongMap!21276 (toList!10653 List!30768)) )
))
(declare-fun contains!8745 (ListLongMap!21275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5525 (array!89743 array!89745 (_ BitVec 32) (_ BitVec 32) V!53713 V!53713 (_ BitVec 32) Int) ListLongMap!21275)

(assert (=> b!1328189 (= lt!590632 (contains!8745 (getCurrentListMap!5525 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328190 () Bool)

(declare-fun e!757273 () Bool)

(declare-fun tp_is_empty!36457 () Bool)

(assert (=> b!1328190 (= e!757273 tp_is_empty!36457)))

(declare-fun mapNonEmpty!56359 () Bool)

(declare-fun mapRes!56359 () Bool)

(declare-fun tp!107278 () Bool)

(assert (=> mapNonEmpty!56359 (= mapRes!56359 (and tp!107278 e!757273))))

(declare-fun mapValue!56359 () ValueCell!17330)

(declare-fun mapKey!56359 () (_ BitVec 32))

(declare-fun mapRest!56359 () (Array (_ BitVec 32) ValueCell!17330))

(assert (=> mapNonEmpty!56359 (= (arr!43339 _values!1320) (store mapRest!56359 mapKey!56359 mapValue!56359))))

(declare-fun b!1328191 () Bool)

(declare-fun e!757271 () Bool)

(declare-fun e!757269 () Bool)

(assert (=> b!1328191 (= e!757271 (and e!757269 mapRes!56359))))

(declare-fun condMapEmpty!56359 () Bool)

(declare-fun mapDefault!56359 () ValueCell!17330)

(assert (=> b!1328191 (= condMapEmpty!56359 (= (arr!43339 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17330)) mapDefault!56359)))))

(declare-fun res!881267 () Bool)

(assert (=> start!112152 (=> (not res!881267) (not e!757270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112152 (= res!881267 (validMask!0 mask!1998))))

(assert (=> start!112152 e!757270))

(declare-fun array_inv!32873 (array!89745) Bool)

(assert (=> start!112152 (and (array_inv!32873 _values!1320) e!757271)))

(assert (=> start!112152 true))

(declare-fun array_inv!32874 (array!89743) Bool)

(assert (=> start!112152 (array_inv!32874 _keys!1590)))

(assert (=> start!112152 tp!107279))

(assert (=> start!112152 tp_is_empty!36457))

(declare-fun b!1328192 () Bool)

(declare-fun res!881265 () Bool)

(assert (=> b!1328192 (=> (not res!881265) (not e!757270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89743 (_ BitVec 32)) Bool)

(assert (=> b!1328192 (= res!881265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56359 () Bool)

(assert (=> mapIsEmpty!56359 mapRes!56359))

(declare-fun b!1328193 () Bool)

(assert (=> b!1328193 (= e!757269 tp_is_empty!36457)))

(assert (= (and start!112152 res!881267) b!1328187))

(assert (= (and b!1328187 res!881269) b!1328192))

(assert (= (and b!1328192 res!881265) b!1328188))

(assert (= (and b!1328188 res!881266) b!1328186))

(assert (= (and b!1328186 res!881268) b!1328189))

(assert (= (and b!1328191 condMapEmpty!56359) mapIsEmpty!56359))

(assert (= (and b!1328191 (not condMapEmpty!56359)) mapNonEmpty!56359))

(get-info :version)

(assert (= (and mapNonEmpty!56359 ((_ is ValueCellFull!17330) mapValue!56359)) b!1328190))

(assert (= (and b!1328191 ((_ is ValueCellFull!17330) mapDefault!56359)) b!1328193))

(assert (= start!112152 b!1328191))

(declare-fun m!1216773 () Bool)

(assert (=> b!1328189 m!1216773))

(assert (=> b!1328189 m!1216773))

(declare-fun m!1216775 () Bool)

(assert (=> b!1328189 m!1216775))

(declare-fun m!1216777 () Bool)

(assert (=> mapNonEmpty!56359 m!1216777))

(declare-fun m!1216779 () Bool)

(assert (=> start!112152 m!1216779))

(declare-fun m!1216781 () Bool)

(assert (=> start!112152 m!1216781))

(declare-fun m!1216783 () Bool)

(assert (=> start!112152 m!1216783))

(declare-fun m!1216785 () Bool)

(assert (=> b!1328192 m!1216785))

(declare-fun m!1216787 () Bool)

(assert (=> b!1328188 m!1216787))

(check-sat (not b!1328188) tp_is_empty!36457 (not mapNonEmpty!56359) (not b!1328192) (not start!112152) b_and!49179 (not b_next!30547) (not b!1328189))
(check-sat b_and!49179 (not b_next!30547))
