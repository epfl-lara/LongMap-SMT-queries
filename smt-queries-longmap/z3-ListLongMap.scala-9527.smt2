; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113024 () Bool)

(assert start!113024)

(declare-fun b_free!31075 () Bool)

(declare-fun b_next!31075 () Bool)

(assert (=> start!113024 (= b_free!31075 (not b_next!31075))))

(declare-fun tp!109031 () Bool)

(declare-fun b_and!50087 () Bool)

(assert (=> start!113024 (= tp!109031 b_and!50087)))

(declare-fun mapIsEmpty!57319 () Bool)

(declare-fun mapRes!57319 () Bool)

(assert (=> mapIsEmpty!57319 mapRes!57319))

(declare-fun b!1339551 () Bool)

(declare-fun e!763007 () Bool)

(declare-fun e!763006 () Bool)

(assert (=> b!1339551 (= e!763007 (and e!763006 mapRes!57319))))

(declare-fun condMapEmpty!57319 () Bool)

(declare-datatypes ((V!54537 0))(
  ( (V!54538 (val!18612 Int)) )
))
(declare-datatypes ((ValueCell!17639 0))(
  ( (ValueCellFull!17639 (v!21259 V!54537)) (EmptyCell!17639) )
))
(declare-datatypes ((array!90951 0))(
  ( (array!90952 (arr!43932 (Array (_ BitVec 32) ValueCell!17639)) (size!44484 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90951)

(declare-fun mapDefault!57319 () ValueCell!17639)

(assert (=> b!1339551 (= condMapEmpty!57319 (= (arr!43932 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17639)) mapDefault!57319)))))

(declare-fun b!1339552 () Bool)

(declare-fun tp_is_empty!37075 () Bool)

(assert (=> b!1339552 (= e!763006 tp_is_empty!37075)))

(declare-fun b!1339553 () Bool)

(declare-fun res!888633 () Bool)

(declare-fun e!763008 () Bool)

(assert (=> b!1339553 (=> (not res!888633) (not e!763008))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((array!90953 0))(
  ( (array!90954 (arr!43933 (Array (_ BitVec 32) (_ BitVec 64))) (size!44485 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90953)

(assert (=> b!1339553 (= res!888633 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44485 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339554 () Bool)

(declare-fun e!763010 () Bool)

(assert (=> b!1339554 (= e!763010 tp_is_empty!37075)))

(declare-fun b!1339550 () Bool)

(declare-fun res!888636 () Bool)

(assert (=> b!1339550 (=> (not res!888636) (not e!763008))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1339550 (= res!888636 (and (= (size!44484 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44485 _keys!1571) (size!44484 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888635 () Bool)

(assert (=> start!113024 (=> (not res!888635) (not e!763008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113024 (= res!888635 (validMask!0 mask!1977))))

(assert (=> start!113024 e!763008))

(assert (=> start!113024 tp_is_empty!37075))

(assert (=> start!113024 true))

(declare-fun array_inv!33317 (array!90953) Bool)

(assert (=> start!113024 (array_inv!33317 _keys!1571)))

(declare-fun array_inv!33318 (array!90951) Bool)

(assert (=> start!113024 (and (array_inv!33318 _values!1303) e!763007)))

(assert (=> start!113024 tp!109031))

(declare-fun b!1339555 () Bool)

(declare-fun res!888634 () Bool)

(assert (=> b!1339555 (=> (not res!888634) (not e!763008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90953 (_ BitVec 32)) Bool)

(assert (=> b!1339555 (= res!888634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339556 () Bool)

(assert (=> b!1339556 (= e!763008 false)))

(declare-fun lt!593721 () Bool)

(declare-fun minValue!1245 () V!54537)

(declare-fun zeroValue!1245 () V!54537)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24012 0))(
  ( (tuple2!24013 (_1!12017 (_ BitVec 64)) (_2!12017 V!54537)) )
))
(declare-datatypes ((List!31161 0))(
  ( (Nil!31158) (Cons!31157 (h!32366 tuple2!24012) (t!45485 List!31161)) )
))
(declare-datatypes ((ListLongMap!21669 0))(
  ( (ListLongMap!21670 (toList!10850 List!31161)) )
))
(declare-fun contains!8955 (ListLongMap!21669 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5703 (array!90953 array!90951 (_ BitVec 32) (_ BitVec 32) V!54537 V!54537 (_ BitVec 32) Int) ListLongMap!21669)

(assert (=> b!1339556 (= lt!593721 (contains!8955 (getCurrentListMap!5703 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339557 () Bool)

(declare-fun res!888637 () Bool)

(assert (=> b!1339557 (=> (not res!888637) (not e!763008))))

(declare-datatypes ((List!31162 0))(
  ( (Nil!31159) (Cons!31158 (h!32367 (_ BitVec 64)) (t!45486 List!31162)) )
))
(declare-fun arrayNoDuplicates!0 (array!90953 (_ BitVec 32) List!31162) Bool)

(assert (=> b!1339557 (= res!888637 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31159))))

(declare-fun mapNonEmpty!57319 () Bool)

(declare-fun tp!109030 () Bool)

(assert (=> mapNonEmpty!57319 (= mapRes!57319 (and tp!109030 e!763010))))

(declare-fun mapRest!57319 () (Array (_ BitVec 32) ValueCell!17639))

(declare-fun mapValue!57319 () ValueCell!17639)

(declare-fun mapKey!57319 () (_ BitVec 32))

(assert (=> mapNonEmpty!57319 (= (arr!43932 _values!1303) (store mapRest!57319 mapKey!57319 mapValue!57319))))

(assert (= (and start!113024 res!888635) b!1339550))

(assert (= (and b!1339550 res!888636) b!1339555))

(assert (= (and b!1339555 res!888634) b!1339557))

(assert (= (and b!1339557 res!888637) b!1339553))

(assert (= (and b!1339553 res!888633) b!1339556))

(assert (= (and b!1339551 condMapEmpty!57319) mapIsEmpty!57319))

(assert (= (and b!1339551 (not condMapEmpty!57319)) mapNonEmpty!57319))

(get-info :version)

(assert (= (and mapNonEmpty!57319 ((_ is ValueCellFull!17639) mapValue!57319)) b!1339554))

(assert (= (and b!1339551 ((_ is ValueCellFull!17639) mapDefault!57319)) b!1339552))

(assert (= start!113024 b!1339551))

(declare-fun m!1227097 () Bool)

(assert (=> b!1339556 m!1227097))

(assert (=> b!1339556 m!1227097))

(declare-fun m!1227099 () Bool)

(assert (=> b!1339556 m!1227099))

(declare-fun m!1227101 () Bool)

(assert (=> mapNonEmpty!57319 m!1227101))

(declare-fun m!1227103 () Bool)

(assert (=> start!113024 m!1227103))

(declare-fun m!1227105 () Bool)

(assert (=> start!113024 m!1227105))

(declare-fun m!1227107 () Bool)

(assert (=> start!113024 m!1227107))

(declare-fun m!1227109 () Bool)

(assert (=> b!1339557 m!1227109))

(declare-fun m!1227111 () Bool)

(assert (=> b!1339555 m!1227111))

(check-sat (not b_next!31075) tp_is_empty!37075 (not b!1339555) (not start!113024) b_and!50087 (not mapNonEmpty!57319) (not b!1339557) (not b!1339556))
(check-sat b_and!50087 (not b_next!31075))
