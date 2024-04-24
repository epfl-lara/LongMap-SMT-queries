; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112796 () Bool)

(assert start!112796)

(declare-fun b_free!30967 () Bool)

(declare-fun b_next!30967 () Bool)

(assert (=> start!112796 (= b_free!30967 (not b_next!30967))))

(declare-fun tp!108537 () Bool)

(declare-fun b_and!49877 () Bool)

(assert (=> start!112796 (= tp!108537 b_and!49877)))

(declare-fun b!1336644 () Bool)

(declare-fun res!886755 () Bool)

(declare-fun e!761380 () Bool)

(assert (=> b!1336644 (=> (not res!886755) (not e!761380))))

(declare-datatypes ((array!90725 0))(
  ( (array!90726 (arr!43824 (Array (_ BitVec 32) (_ BitVec 64))) (size!44375 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90725)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90725 (_ BitVec 32)) Bool)

(assert (=> b!1336644 (= res!886755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336645 () Bool)

(declare-fun res!886757 () Bool)

(assert (=> b!1336645 (=> (not res!886757) (not e!761380))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336645 (= res!886757 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44375 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56989 () Bool)

(declare-fun mapRes!56989 () Bool)

(declare-fun tp!108538 () Bool)

(declare-fun e!761379 () Bool)

(assert (=> mapNonEmpty!56989 (= mapRes!56989 (and tp!108538 e!761379))))

(declare-datatypes ((V!54273 0))(
  ( (V!54274 (val!18513 Int)) )
))
(declare-datatypes ((ValueCell!17540 0))(
  ( (ValueCellFull!17540 (v!21145 V!54273)) (EmptyCell!17540) )
))
(declare-fun mapValue!56989 () ValueCell!17540)

(declare-datatypes ((array!90727 0))(
  ( (array!90728 (arr!43825 (Array (_ BitVec 32) ValueCell!17540)) (size!44376 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90727)

(declare-fun mapKey!56989 () (_ BitVec 32))

(declare-fun mapRest!56989 () (Array (_ BitVec 32) ValueCell!17540))

(assert (=> mapNonEmpty!56989 (= (arr!43825 _values!1320) (store mapRest!56989 mapKey!56989 mapValue!56989))))

(declare-fun b!1336646 () Bool)

(declare-fun e!761376 () Bool)

(declare-fun tp_is_empty!36877 () Bool)

(assert (=> b!1336646 (= e!761376 tp_is_empty!36877)))

(declare-fun b!1336647 () Bool)

(declare-fun res!886756 () Bool)

(assert (=> b!1336647 (=> (not res!886756) (not e!761380))))

(declare-datatypes ((List!31052 0))(
  ( (Nil!31049) (Cons!31048 (h!32266 (_ BitVec 64)) (t!45308 List!31052)) )
))
(declare-fun arrayNoDuplicates!0 (array!90725 (_ BitVec 32) List!31052) Bool)

(assert (=> b!1336647 (= res!886756 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31049))))

(declare-fun b!1336648 () Bool)

(declare-fun res!886753 () Bool)

(assert (=> b!1336648 (=> (not res!886753) (not e!761380))))

(assert (=> b!1336648 (= res!886753 (and (= (size!44376 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44375 _keys!1590) (size!44376 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336649 () Bool)

(assert (=> b!1336649 (= e!761379 tp_is_empty!36877)))

(declare-fun b!1336650 () Bool)

(assert (=> b!1336650 (= e!761380 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592923 () Bool)

(declare-fun minValue!1262 () V!54273)

(declare-fun zeroValue!1262 () V!54273)

(declare-datatypes ((tuple2!23906 0))(
  ( (tuple2!23907 (_1!11964 (_ BitVec 64)) (_2!11964 V!54273)) )
))
(declare-datatypes ((List!31053 0))(
  ( (Nil!31050) (Cons!31049 (h!32267 tuple2!23906) (t!45309 List!31053)) )
))
(declare-datatypes ((ListLongMap!21571 0))(
  ( (ListLongMap!21572 (toList!10801 List!31053)) )
))
(declare-fun contains!8977 (ListLongMap!21571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5760 (array!90725 array!90727 (_ BitVec 32) (_ BitVec 32) V!54273 V!54273 (_ BitVec 32) Int) ListLongMap!21571)

(assert (=> b!1336650 (= lt!592923 (contains!8977 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336651 () Bool)

(declare-fun e!761377 () Bool)

(assert (=> b!1336651 (= e!761377 (and e!761376 mapRes!56989))))

(declare-fun condMapEmpty!56989 () Bool)

(declare-fun mapDefault!56989 () ValueCell!17540)

(assert (=> b!1336651 (= condMapEmpty!56989 (= (arr!43825 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17540)) mapDefault!56989)))))

(declare-fun mapIsEmpty!56989 () Bool)

(assert (=> mapIsEmpty!56989 mapRes!56989))

(declare-fun res!886754 () Bool)

(assert (=> start!112796 (=> (not res!886754) (not e!761380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112796 (= res!886754 (validMask!0 mask!1998))))

(assert (=> start!112796 e!761380))

(declare-fun array_inv!33317 (array!90727) Bool)

(assert (=> start!112796 (and (array_inv!33317 _values!1320) e!761377)))

(assert (=> start!112796 true))

(declare-fun array_inv!33318 (array!90725) Bool)

(assert (=> start!112796 (array_inv!33318 _keys!1590)))

(assert (=> start!112796 tp!108537))

(assert (=> start!112796 tp_is_empty!36877))

(assert (= (and start!112796 res!886754) b!1336648))

(assert (= (and b!1336648 res!886753) b!1336644))

(assert (= (and b!1336644 res!886755) b!1336647))

(assert (= (and b!1336647 res!886756) b!1336645))

(assert (= (and b!1336645 res!886757) b!1336650))

(assert (= (and b!1336651 condMapEmpty!56989) mapIsEmpty!56989))

(assert (= (and b!1336651 (not condMapEmpty!56989)) mapNonEmpty!56989))

(get-info :version)

(assert (= (and mapNonEmpty!56989 ((_ is ValueCellFull!17540) mapValue!56989)) b!1336649))

(assert (= (and b!1336651 ((_ is ValueCellFull!17540) mapDefault!56989)) b!1336646))

(assert (= start!112796 b!1336651))

(declare-fun m!1225037 () Bool)

(assert (=> b!1336644 m!1225037))

(declare-fun m!1225039 () Bool)

(assert (=> mapNonEmpty!56989 m!1225039))

(declare-fun m!1225041 () Bool)

(assert (=> start!112796 m!1225041))

(declare-fun m!1225043 () Bool)

(assert (=> start!112796 m!1225043))

(declare-fun m!1225045 () Bool)

(assert (=> start!112796 m!1225045))

(declare-fun m!1225047 () Bool)

(assert (=> b!1336647 m!1225047))

(declare-fun m!1225049 () Bool)

(assert (=> b!1336650 m!1225049))

(assert (=> b!1336650 m!1225049))

(declare-fun m!1225051 () Bool)

(assert (=> b!1336650 m!1225051))

(check-sat (not b_next!30967) b_and!49877 (not start!112796) (not b!1336644) (not b!1336647) (not mapNonEmpty!56989) tp_is_empty!36877 (not b!1336650))
(check-sat b_and!49877 (not b_next!30967))
