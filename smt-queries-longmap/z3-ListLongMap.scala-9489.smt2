; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112542 () Bool)

(assert start!112542)

(declare-fun b_free!30937 () Bool)

(declare-fun b_next!30937 () Bool)

(assert (=> start!112542 (= b_free!30937 (not b_next!30937))))

(declare-fun tp!108449 () Bool)

(declare-fun b_and!49827 () Bool)

(assert (=> start!112542 (= tp!108449 b_and!49827)))

(declare-fun mapNonEmpty!56944 () Bool)

(declare-fun mapRes!56944 () Bool)

(declare-fun tp!108448 () Bool)

(declare-fun e!760276 () Bool)

(assert (=> mapNonEmpty!56944 (= mapRes!56944 (and tp!108448 e!760276))))

(declare-datatypes ((V!54233 0))(
  ( (V!54234 (val!18498 Int)) )
))
(declare-datatypes ((ValueCell!17525 0))(
  ( (ValueCellFull!17525 (v!21134 V!54233)) (EmptyCell!17525) )
))
(declare-datatypes ((array!90503 0))(
  ( (array!90504 (arr!43718 (Array (_ BitVec 32) ValueCell!17525)) (size!44270 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90503)

(declare-fun mapValue!56944 () ValueCell!17525)

(declare-fun mapRest!56944 () (Array (_ BitVec 32) ValueCell!17525))

(declare-fun mapKey!56944 () (_ BitVec 32))

(assert (=> mapNonEmpty!56944 (= (arr!43718 _values!1320) (store mapRest!56944 mapKey!56944 mapValue!56944))))

(declare-fun b!1334888 () Bool)

(declare-fun res!885955 () Bool)

(declare-fun e!760279 () Bool)

(assert (=> b!1334888 (=> (not res!885955) (not e!760279))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90505 0))(
  ( (array!90506 (arr!43719 (Array (_ BitVec 32) (_ BitVec 64))) (size!44271 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90505)

(assert (=> b!1334888 (= res!885955 (and (= (size!44270 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44271 _keys!1590) (size!44270 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334889 () Bool)

(declare-fun e!760278 () Bool)

(declare-fun tp_is_empty!36847 () Bool)

(assert (=> b!1334889 (= e!760278 tp_is_empty!36847)))

(declare-fun mapIsEmpty!56944 () Bool)

(assert (=> mapIsEmpty!56944 mapRes!56944))

(declare-fun b!1334890 () Bool)

(declare-fun res!885954 () Bool)

(assert (=> b!1334890 (=> (not res!885954) (not e!760279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90505 (_ BitVec 32)) Bool)

(assert (=> b!1334890 (= res!885954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334891 () Bool)

(declare-fun e!760275 () Bool)

(assert (=> b!1334891 (= e!760275 (and e!760278 mapRes!56944))))

(declare-fun condMapEmpty!56944 () Bool)

(declare-fun mapDefault!56944 () ValueCell!17525)

(assert (=> b!1334891 (= condMapEmpty!56944 (= (arr!43718 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17525)) mapDefault!56944)))))

(declare-fun b!1334892 () Bool)

(declare-fun res!885957 () Bool)

(assert (=> b!1334892 (=> (not res!885957) (not e!760279))))

(declare-datatypes ((List!31051 0))(
  ( (Nil!31048) (Cons!31047 (h!32256 (_ BitVec 64)) (t!45307 List!31051)) )
))
(declare-fun arrayNoDuplicates!0 (array!90505 (_ BitVec 32) List!31051) Bool)

(assert (=> b!1334892 (= res!885957 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31048))))

(declare-fun res!885958 () Bool)

(assert (=> start!112542 (=> (not res!885958) (not e!760279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112542 (= res!885958 (validMask!0 mask!1998))))

(assert (=> start!112542 e!760279))

(declare-fun array_inv!33171 (array!90503) Bool)

(assert (=> start!112542 (and (array_inv!33171 _values!1320) e!760275)))

(assert (=> start!112542 true))

(declare-fun array_inv!33172 (array!90505) Bool)

(assert (=> start!112542 (array_inv!33172 _keys!1590)))

(assert (=> start!112542 tp!108449))

(assert (=> start!112542 tp_is_empty!36847))

(declare-fun b!1334893 () Bool)

(assert (=> b!1334893 (= e!760279 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592225 () Bool)

(declare-fun minValue!1262 () V!54233)

(declare-fun zeroValue!1262 () V!54233)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23914 0))(
  ( (tuple2!23915 (_1!11968 (_ BitVec 64)) (_2!11968 V!54233)) )
))
(declare-datatypes ((List!31052 0))(
  ( (Nil!31049) (Cons!31048 (h!32257 tuple2!23914) (t!45308 List!31052)) )
))
(declare-datatypes ((ListLongMap!21571 0))(
  ( (ListLongMap!21572 (toList!10801 List!31052)) )
))
(declare-fun contains!8893 (ListLongMap!21571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5655 (array!90505 array!90503 (_ BitVec 32) (_ BitVec 32) V!54233 V!54233 (_ BitVec 32) Int) ListLongMap!21571)

(assert (=> b!1334893 (= lt!592225 (contains!8893 (getCurrentListMap!5655 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334894 () Bool)

(assert (=> b!1334894 (= e!760276 tp_is_empty!36847)))

(declare-fun b!1334895 () Bool)

(declare-fun res!885956 () Bool)

(assert (=> b!1334895 (=> (not res!885956) (not e!760279))))

(assert (=> b!1334895 (= res!885956 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44271 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112542 res!885958) b!1334888))

(assert (= (and b!1334888 res!885955) b!1334890))

(assert (= (and b!1334890 res!885954) b!1334892))

(assert (= (and b!1334892 res!885957) b!1334895))

(assert (= (and b!1334895 res!885956) b!1334893))

(assert (= (and b!1334891 condMapEmpty!56944) mapIsEmpty!56944))

(assert (= (and b!1334891 (not condMapEmpty!56944)) mapNonEmpty!56944))

(get-info :version)

(assert (= (and mapNonEmpty!56944 ((_ is ValueCellFull!17525) mapValue!56944)) b!1334894))

(assert (= (and b!1334891 ((_ is ValueCellFull!17525) mapDefault!56944)) b!1334889))

(assert (= start!112542 b!1334891))

(declare-fun m!1222671 () Bool)

(assert (=> mapNonEmpty!56944 m!1222671))

(declare-fun m!1222673 () Bool)

(assert (=> b!1334890 m!1222673))

(declare-fun m!1222675 () Bool)

(assert (=> start!112542 m!1222675))

(declare-fun m!1222677 () Bool)

(assert (=> start!112542 m!1222677))

(declare-fun m!1222679 () Bool)

(assert (=> start!112542 m!1222679))

(declare-fun m!1222681 () Bool)

(assert (=> b!1334893 m!1222681))

(assert (=> b!1334893 m!1222681))

(declare-fun m!1222683 () Bool)

(assert (=> b!1334893 m!1222683))

(declare-fun m!1222685 () Bool)

(assert (=> b!1334892 m!1222685))

(check-sat tp_is_empty!36847 (not start!112542) (not b!1334892) (not b!1334890) b_and!49827 (not mapNonEmpty!56944) (not b_next!30937) (not b!1334893))
(check-sat b_and!49827 (not b_next!30937))
