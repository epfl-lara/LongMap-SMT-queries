; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112748 () Bool)

(assert start!112748)

(declare-fun b_free!30919 () Bool)

(declare-fun b_next!30919 () Bool)

(assert (=> start!112748 (= b_free!30919 (not b_next!30919))))

(declare-fun tp!108393 () Bool)

(declare-fun b_and!49829 () Bool)

(assert (=> start!112748 (= tp!108393 b_and!49829)))

(declare-fun b!1336041 () Bool)

(declare-fun e!761020 () Bool)

(declare-fun e!761019 () Bool)

(declare-fun mapRes!56917 () Bool)

(assert (=> b!1336041 (= e!761020 (and e!761019 mapRes!56917))))

(declare-fun condMapEmpty!56917 () Bool)

(declare-datatypes ((V!54209 0))(
  ( (V!54210 (val!18489 Int)) )
))
(declare-datatypes ((ValueCell!17516 0))(
  ( (ValueCellFull!17516 (v!21121 V!54209)) (EmptyCell!17516) )
))
(declare-datatypes ((array!90629 0))(
  ( (array!90630 (arr!43776 (Array (_ BitVec 32) ValueCell!17516)) (size!44327 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90629)

(declare-fun mapDefault!56917 () ValueCell!17516)

(assert (=> b!1336041 (= condMapEmpty!56917 (= (arr!43776 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17516)) mapDefault!56917)))))

(declare-fun b!1336042 () Bool)

(declare-fun res!886369 () Bool)

(declare-fun e!761017 () Bool)

(assert (=> b!1336042 (=> (not res!886369) (not e!761017))))

(declare-datatypes ((array!90631 0))(
  ( (array!90632 (arr!43777 (Array (_ BitVec 32) (_ BitVec 64))) (size!44328 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90631)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90631 (_ BitVec 32)) Bool)

(assert (=> b!1336042 (= res!886369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336043 () Bool)

(declare-fun res!886367 () Bool)

(assert (=> b!1336043 (=> (not res!886367) (not e!761017))))

(declare-datatypes ((List!31012 0))(
  ( (Nil!31009) (Cons!31008 (h!32226 (_ BitVec 64)) (t!45268 List!31012)) )
))
(declare-fun arrayNoDuplicates!0 (array!90631 (_ BitVec 32) List!31012) Bool)

(assert (=> b!1336043 (= res!886367 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31009))))

(declare-fun b!1336044 () Bool)

(declare-fun res!886368 () Bool)

(assert (=> b!1336044 (=> (not res!886368) (not e!761017))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336044 (= res!886368 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44328 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!886370 () Bool)

(assert (=> start!112748 (=> (not res!886370) (not e!761017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112748 (= res!886370 (validMask!0 mask!1998))))

(assert (=> start!112748 e!761017))

(declare-fun array_inv!33279 (array!90629) Bool)

(assert (=> start!112748 (and (array_inv!33279 _values!1320) e!761020)))

(assert (=> start!112748 true))

(declare-fun array_inv!33280 (array!90631) Bool)

(assert (=> start!112748 (array_inv!33280 _keys!1590)))

(assert (=> start!112748 tp!108393))

(declare-fun tp_is_empty!36829 () Bool)

(assert (=> start!112748 tp_is_empty!36829))

(declare-fun mapNonEmpty!56917 () Bool)

(declare-fun tp!108394 () Bool)

(declare-fun e!761016 () Bool)

(assert (=> mapNonEmpty!56917 (= mapRes!56917 (and tp!108394 e!761016))))

(declare-fun mapValue!56917 () ValueCell!17516)

(declare-fun mapRest!56917 () (Array (_ BitVec 32) ValueCell!17516))

(declare-fun mapKey!56917 () (_ BitVec 32))

(assert (=> mapNonEmpty!56917 (= (arr!43776 _values!1320) (store mapRest!56917 mapKey!56917 mapValue!56917))))

(declare-fun b!1336045 () Bool)

(declare-fun res!886366 () Bool)

(assert (=> b!1336045 (=> (not res!886366) (not e!761017))))

(assert (=> b!1336045 (= res!886366 (and (= (size!44327 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44328 _keys!1590) (size!44327 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336046 () Bool)

(assert (=> b!1336046 (= e!761019 tp_is_empty!36829)))

(declare-fun b!1336047 () Bool)

(assert (=> b!1336047 (= e!761016 tp_is_empty!36829)))

(declare-fun b!1336048 () Bool)

(assert (=> b!1336048 (= e!761017 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54209)

(declare-fun zeroValue!1262 () V!54209)

(declare-fun lt!592860 () Bool)

(declare-datatypes ((tuple2!23862 0))(
  ( (tuple2!23863 (_1!11942 (_ BitVec 64)) (_2!11942 V!54209)) )
))
(declare-datatypes ((List!31013 0))(
  ( (Nil!31010) (Cons!31009 (h!32227 tuple2!23862) (t!45269 List!31013)) )
))
(declare-datatypes ((ListLongMap!21527 0))(
  ( (ListLongMap!21528 (toList!10779 List!31013)) )
))
(declare-fun contains!8955 (ListLongMap!21527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5738 (array!90631 array!90629 (_ BitVec 32) (_ BitVec 32) V!54209 V!54209 (_ BitVec 32) Int) ListLongMap!21527)

(assert (=> b!1336048 (= lt!592860 (contains!8955 (getCurrentListMap!5738 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56917 () Bool)

(assert (=> mapIsEmpty!56917 mapRes!56917))

(assert (= (and start!112748 res!886370) b!1336045))

(assert (= (and b!1336045 res!886366) b!1336042))

(assert (= (and b!1336042 res!886369) b!1336043))

(assert (= (and b!1336043 res!886367) b!1336044))

(assert (= (and b!1336044 res!886368) b!1336048))

(assert (= (and b!1336041 condMapEmpty!56917) mapIsEmpty!56917))

(assert (= (and b!1336041 (not condMapEmpty!56917)) mapNonEmpty!56917))

(get-info :version)

(assert (= (and mapNonEmpty!56917 ((_ is ValueCellFull!17516) mapValue!56917)) b!1336047))

(assert (= (and b!1336041 ((_ is ValueCellFull!17516) mapDefault!56917)) b!1336046))

(assert (= start!112748 b!1336041))

(declare-fun m!1224641 () Bool)

(assert (=> mapNonEmpty!56917 m!1224641))

(declare-fun m!1224643 () Bool)

(assert (=> b!1336048 m!1224643))

(assert (=> b!1336048 m!1224643))

(declare-fun m!1224645 () Bool)

(assert (=> b!1336048 m!1224645))

(declare-fun m!1224647 () Bool)

(assert (=> start!112748 m!1224647))

(declare-fun m!1224649 () Bool)

(assert (=> start!112748 m!1224649))

(declare-fun m!1224651 () Bool)

(assert (=> start!112748 m!1224651))

(declare-fun m!1224653 () Bool)

(assert (=> b!1336043 m!1224653))

(declare-fun m!1224655 () Bool)

(assert (=> b!1336042 m!1224655))

(check-sat (not start!112748) (not mapNonEmpty!56917) tp_is_empty!36829 (not b_next!30919) (not b!1336048) b_and!49829 (not b!1336043) (not b!1336042))
(check-sat b_and!49829 (not b_next!30919))
