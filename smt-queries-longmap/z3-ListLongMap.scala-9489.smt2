; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112766 () Bool)

(assert start!112766)

(declare-fun b_free!30937 () Bool)

(declare-fun b_next!30937 () Bool)

(assert (=> start!112766 (= b_free!30937 (not b_next!30937))))

(declare-fun tp!108447 () Bool)

(declare-fun b_and!49847 () Bool)

(assert (=> start!112766 (= tp!108447 b_and!49847)))

(declare-fun b!1336257 () Bool)

(declare-fun res!886501 () Bool)

(declare-fun e!761152 () Bool)

(assert (=> b!1336257 (=> (not res!886501) (not e!761152))))

(declare-datatypes ((V!54233 0))(
  ( (V!54234 (val!18498 Int)) )
))
(declare-datatypes ((ValueCell!17525 0))(
  ( (ValueCellFull!17525 (v!21130 V!54233)) (EmptyCell!17525) )
))
(declare-datatypes ((array!90665 0))(
  ( (array!90666 (arr!43794 (Array (_ BitVec 32) ValueCell!17525)) (size!44345 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90665)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90667 0))(
  ( (array!90668 (arr!43795 (Array (_ BitVec 32) (_ BitVec 64))) (size!44346 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90667)

(assert (=> b!1336257 (= res!886501 (and (= (size!44345 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44346 _keys!1590) (size!44345 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56944 () Bool)

(declare-fun mapRes!56944 () Bool)

(assert (=> mapIsEmpty!56944 mapRes!56944))

(declare-fun b!1336258 () Bool)

(declare-fun res!886502 () Bool)

(assert (=> b!1336258 (=> (not res!886502) (not e!761152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90667 (_ BitVec 32)) Bool)

(assert (=> b!1336258 (= res!886502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336260 () Bool)

(declare-fun e!761154 () Bool)

(declare-fun e!761153 () Bool)

(assert (=> b!1336260 (= e!761154 (and e!761153 mapRes!56944))))

(declare-fun condMapEmpty!56944 () Bool)

(declare-fun mapDefault!56944 () ValueCell!17525)

(assert (=> b!1336260 (= condMapEmpty!56944 (= (arr!43794 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17525)) mapDefault!56944)))))

(declare-fun b!1336261 () Bool)

(declare-fun tp_is_empty!36847 () Bool)

(assert (=> b!1336261 (= e!761153 tp_is_empty!36847)))

(declare-fun mapNonEmpty!56944 () Bool)

(declare-fun tp!108448 () Bool)

(declare-fun e!761155 () Bool)

(assert (=> mapNonEmpty!56944 (= mapRes!56944 (and tp!108448 e!761155))))

(declare-fun mapKey!56944 () (_ BitVec 32))

(declare-fun mapValue!56944 () ValueCell!17525)

(declare-fun mapRest!56944 () (Array (_ BitVec 32) ValueCell!17525))

(assert (=> mapNonEmpty!56944 (= (arr!43794 _values!1320) (store mapRest!56944 mapKey!56944 mapValue!56944))))

(declare-fun b!1336262 () Bool)

(assert (=> b!1336262 (= e!761155 tp_is_empty!36847)))

(declare-fun b!1336263 () Bool)

(declare-fun res!886504 () Bool)

(assert (=> b!1336263 (=> (not res!886504) (not e!761152))))

(declare-datatypes ((List!31026 0))(
  ( (Nil!31023) (Cons!31022 (h!32240 (_ BitVec 64)) (t!45282 List!31026)) )
))
(declare-fun arrayNoDuplicates!0 (array!90667 (_ BitVec 32) List!31026) Bool)

(assert (=> b!1336263 (= res!886504 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31023))))

(declare-fun b!1336264 () Bool)

(assert (=> b!1336264 (= e!761152 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54233)

(declare-fun zeroValue!1262 () V!54233)

(declare-fun lt!592887 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23878 0))(
  ( (tuple2!23879 (_1!11950 (_ BitVec 64)) (_2!11950 V!54233)) )
))
(declare-datatypes ((List!31027 0))(
  ( (Nil!31024) (Cons!31023 (h!32241 tuple2!23878) (t!45283 List!31027)) )
))
(declare-datatypes ((ListLongMap!21543 0))(
  ( (ListLongMap!21544 (toList!10787 List!31027)) )
))
(declare-fun contains!8963 (ListLongMap!21543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5746 (array!90667 array!90665 (_ BitVec 32) (_ BitVec 32) V!54233 V!54233 (_ BitVec 32) Int) ListLongMap!21543)

(assert (=> b!1336264 (= lt!592887 (contains!8963 (getCurrentListMap!5746 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336259 () Bool)

(declare-fun res!886505 () Bool)

(assert (=> b!1336259 (=> (not res!886505) (not e!761152))))

(assert (=> b!1336259 (= res!886505 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44346 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!886503 () Bool)

(assert (=> start!112766 (=> (not res!886503) (not e!761152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112766 (= res!886503 (validMask!0 mask!1998))))

(assert (=> start!112766 e!761152))

(declare-fun array_inv!33293 (array!90665) Bool)

(assert (=> start!112766 (and (array_inv!33293 _values!1320) e!761154)))

(assert (=> start!112766 true))

(declare-fun array_inv!33294 (array!90667) Bool)

(assert (=> start!112766 (array_inv!33294 _keys!1590)))

(assert (=> start!112766 tp!108447))

(assert (=> start!112766 tp_is_empty!36847))

(assert (= (and start!112766 res!886503) b!1336257))

(assert (= (and b!1336257 res!886501) b!1336258))

(assert (= (and b!1336258 res!886502) b!1336263))

(assert (= (and b!1336263 res!886504) b!1336259))

(assert (= (and b!1336259 res!886505) b!1336264))

(assert (= (and b!1336260 condMapEmpty!56944) mapIsEmpty!56944))

(assert (= (and b!1336260 (not condMapEmpty!56944)) mapNonEmpty!56944))

(get-info :version)

(assert (= (and mapNonEmpty!56944 ((_ is ValueCellFull!17525) mapValue!56944)) b!1336262))

(assert (= (and b!1336260 ((_ is ValueCellFull!17525) mapDefault!56944)) b!1336261))

(assert (= start!112766 b!1336260))

(declare-fun m!1224785 () Bool)

(assert (=> b!1336263 m!1224785))

(declare-fun m!1224787 () Bool)

(assert (=> b!1336264 m!1224787))

(assert (=> b!1336264 m!1224787))

(declare-fun m!1224789 () Bool)

(assert (=> b!1336264 m!1224789))

(declare-fun m!1224791 () Bool)

(assert (=> start!112766 m!1224791))

(declare-fun m!1224793 () Bool)

(assert (=> start!112766 m!1224793))

(declare-fun m!1224795 () Bool)

(assert (=> start!112766 m!1224795))

(declare-fun m!1224797 () Bool)

(assert (=> b!1336258 m!1224797))

(declare-fun m!1224799 () Bool)

(assert (=> mapNonEmpty!56944 m!1224799))

(check-sat b_and!49847 (not b!1336258) (not b_next!30937) (not mapNonEmpty!56944) (not b!1336263) tp_is_empty!36847 (not start!112766) (not b!1336264))
(check-sat b_and!49847 (not b_next!30937))
