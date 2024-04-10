; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112526 () Bool)

(assert start!112526)

(declare-fun b_free!30921 () Bool)

(declare-fun b_next!30921 () Bool)

(assert (=> start!112526 (= b_free!30921 (not b_next!30921))))

(declare-fun tp!108400 () Bool)

(declare-fun b_and!49829 () Bool)

(assert (=> start!112526 (= tp!108400 b_and!49829)))

(declare-fun mapNonEmpty!56920 () Bool)

(declare-fun mapRes!56920 () Bool)

(declare-fun tp!108399 () Bool)

(declare-fun e!760189 () Bool)

(assert (=> mapNonEmpty!56920 (= mapRes!56920 (and tp!108399 e!760189))))

(declare-datatypes ((V!54211 0))(
  ( (V!54212 (val!18490 Int)) )
))
(declare-datatypes ((ValueCell!17517 0))(
  ( (ValueCellFull!17517 (v!21127 V!54211)) (EmptyCell!17517) )
))
(declare-datatypes ((array!90524 0))(
  ( (array!90525 (arr!43728 (Array (_ BitVec 32) ValueCell!17517)) (size!44278 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90524)

(declare-fun mapRest!56920 () (Array (_ BitVec 32) ValueCell!17517))

(declare-fun mapKey!56920 () (_ BitVec 32))

(declare-fun mapValue!56920 () ValueCell!17517)

(assert (=> mapNonEmpty!56920 (= (arr!43728 _values!1320) (store mapRest!56920 mapKey!56920 mapValue!56920))))

(declare-fun b!1334766 () Bool)

(declare-fun res!885863 () Bool)

(declare-fun e!760192 () Bool)

(assert (=> b!1334766 (=> (not res!885863) (not e!760192))))

(declare-datatypes ((array!90526 0))(
  ( (array!90527 (arr!43729 (Array (_ BitVec 32) (_ BitVec 64))) (size!44279 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90526)

(declare-datatypes ((List!30979 0))(
  ( (Nil!30976) (Cons!30975 (h!32184 (_ BitVec 64)) (t!45243 List!30979)) )
))
(declare-fun arrayNoDuplicates!0 (array!90526 (_ BitVec 32) List!30979) Bool)

(assert (=> b!1334766 (= res!885863 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30976))))

(declare-fun b!1334767 () Bool)

(assert (=> b!1334767 (= e!760192 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54211)

(declare-fun zeroValue!1262 () V!54211)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun lt!592387 () Bool)

(declare-datatypes ((tuple2!23840 0))(
  ( (tuple2!23841 (_1!11931 (_ BitVec 64)) (_2!11931 V!54211)) )
))
(declare-datatypes ((List!30980 0))(
  ( (Nil!30977) (Cons!30976 (h!32185 tuple2!23840) (t!45244 List!30980)) )
))
(declare-datatypes ((ListLongMap!21497 0))(
  ( (ListLongMap!21498 (toList!10764 List!30980)) )
))
(declare-fun contains!8928 (ListLongMap!21497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5738 (array!90526 array!90524 (_ BitVec 32) (_ BitVec 32) V!54211 V!54211 (_ BitVec 32) Int) ListLongMap!21497)

(assert (=> b!1334767 (= lt!592387 (contains!8928 (getCurrentListMap!5738 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334768 () Bool)

(declare-fun e!760188 () Bool)

(declare-fun e!760190 () Bool)

(assert (=> b!1334768 (= e!760188 (and e!760190 mapRes!56920))))

(declare-fun condMapEmpty!56920 () Bool)

(declare-fun mapDefault!56920 () ValueCell!17517)

(assert (=> b!1334768 (= condMapEmpty!56920 (= (arr!43728 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17517)) mapDefault!56920)))))

(declare-fun b!1334769 () Bool)

(declare-fun res!885864 () Bool)

(assert (=> b!1334769 (=> (not res!885864) (not e!760192))))

(assert (=> b!1334769 (= res!885864 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44279 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334770 () Bool)

(declare-fun tp_is_empty!36831 () Bool)

(assert (=> b!1334770 (= e!760189 tp_is_empty!36831)))

(declare-fun b!1334771 () Bool)

(declare-fun res!885866 () Bool)

(assert (=> b!1334771 (=> (not res!885866) (not e!760192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90526 (_ BitVec 32)) Bool)

(assert (=> b!1334771 (= res!885866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56920 () Bool)

(assert (=> mapIsEmpty!56920 mapRes!56920))

(declare-fun res!885865 () Bool)

(assert (=> start!112526 (=> (not res!885865) (not e!760192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112526 (= res!885865 (validMask!0 mask!1998))))

(assert (=> start!112526 e!760192))

(declare-fun array_inv!32979 (array!90524) Bool)

(assert (=> start!112526 (and (array_inv!32979 _values!1320) e!760188)))

(assert (=> start!112526 true))

(declare-fun array_inv!32980 (array!90526) Bool)

(assert (=> start!112526 (array_inv!32980 _keys!1590)))

(assert (=> start!112526 tp!108400))

(assert (=> start!112526 tp_is_empty!36831))

(declare-fun b!1334772 () Bool)

(declare-fun res!885867 () Bool)

(assert (=> b!1334772 (=> (not res!885867) (not e!760192))))

(assert (=> b!1334772 (= res!885867 (and (= (size!44278 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44279 _keys!1590) (size!44278 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334773 () Bool)

(assert (=> b!1334773 (= e!760190 tp_is_empty!36831)))

(assert (= (and start!112526 res!885865) b!1334772))

(assert (= (and b!1334772 res!885867) b!1334771))

(assert (= (and b!1334771 res!885866) b!1334766))

(assert (= (and b!1334766 res!885863) b!1334769))

(assert (= (and b!1334769 res!885864) b!1334767))

(assert (= (and b!1334768 condMapEmpty!56920) mapIsEmpty!56920))

(assert (= (and b!1334768 (not condMapEmpty!56920)) mapNonEmpty!56920))

(get-info :version)

(assert (= (and mapNonEmpty!56920 ((_ is ValueCellFull!17517) mapValue!56920)) b!1334770))

(assert (= (and b!1334768 ((_ is ValueCellFull!17517) mapDefault!56920)) b!1334773))

(assert (= start!112526 b!1334768))

(declare-fun m!1223059 () Bool)

(assert (=> b!1334771 m!1223059))

(declare-fun m!1223061 () Bool)

(assert (=> b!1334766 m!1223061))

(declare-fun m!1223063 () Bool)

(assert (=> start!112526 m!1223063))

(declare-fun m!1223065 () Bool)

(assert (=> start!112526 m!1223065))

(declare-fun m!1223067 () Bool)

(assert (=> start!112526 m!1223067))

(declare-fun m!1223069 () Bool)

(assert (=> b!1334767 m!1223069))

(assert (=> b!1334767 m!1223069))

(declare-fun m!1223071 () Bool)

(assert (=> b!1334767 m!1223071))

(declare-fun m!1223073 () Bool)

(assert (=> mapNonEmpty!56920 m!1223073))

(check-sat b_and!49829 (not b!1334771) (not b_next!30921) (not b!1334766) (not mapNonEmpty!56920) (not b!1334767) tp_is_empty!36831 (not start!112526))
(check-sat b_and!49829 (not b_next!30921))
