; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113012 () Bool)

(assert start!113012)

(declare-fun b!1339413 () Bool)

(declare-fun e!762918 () Bool)

(declare-fun tp_is_empty!37063 () Bool)

(assert (=> b!1339413 (= e!762918 tp_is_empty!37063)))

(declare-fun b!1339415 () Bool)

(declare-fun res!888550 () Bool)

(declare-fun e!762920 () Bool)

(assert (=> b!1339415 (=> (not res!888550) (not e!762920))))

(declare-datatypes ((array!90929 0))(
  ( (array!90930 (arr!43921 (Array (_ BitVec 32) (_ BitVec 64))) (size!44473 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90929)

(declare-datatypes ((List!31156 0))(
  ( (Nil!31153) (Cons!31152 (h!32361 (_ BitVec 64)) (t!45480 List!31156)) )
))
(declare-fun arrayNoDuplicates!0 (array!90929 (_ BitVec 32) List!31156) Bool)

(assert (=> b!1339415 (= res!888550 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31153))))

(declare-fun mapNonEmpty!57301 () Bool)

(declare-fun mapRes!57301 () Bool)

(declare-fun tp!109001 () Bool)

(declare-fun e!762919 () Bool)

(assert (=> mapNonEmpty!57301 (= mapRes!57301 (and tp!109001 e!762919))))

(declare-fun mapKey!57301 () (_ BitVec 32))

(declare-datatypes ((V!54521 0))(
  ( (V!54522 (val!18606 Int)) )
))
(declare-datatypes ((ValueCell!17633 0))(
  ( (ValueCellFull!17633 (v!21253 V!54521)) (EmptyCell!17633) )
))
(declare-fun mapRest!57301 () (Array (_ BitVec 32) ValueCell!17633))

(declare-datatypes ((array!90931 0))(
  ( (array!90932 (arr!43922 (Array (_ BitVec 32) ValueCell!17633)) (size!44474 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90931)

(declare-fun mapValue!57301 () ValueCell!17633)

(assert (=> mapNonEmpty!57301 (= (arr!43922 _values!1303) (store mapRest!57301 mapKey!57301 mapValue!57301))))

(declare-fun b!1339416 () Bool)

(declare-fun e!762917 () Bool)

(assert (=> b!1339416 (= e!762917 (and e!762918 mapRes!57301))))

(declare-fun condMapEmpty!57301 () Bool)

(declare-fun mapDefault!57301 () ValueCell!17633)

(assert (=> b!1339416 (= condMapEmpty!57301 (= (arr!43922 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17633)) mapDefault!57301)))))

(declare-fun b!1339417 () Bool)

(declare-fun res!888553 () Bool)

(assert (=> b!1339417 (=> (not res!888553) (not e!762920))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339417 (= res!888553 (and (= (size!44474 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44473 _keys!1571) (size!44474 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun b!1339418 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339418 (= e!762920 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44473 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1960 (size!44473 _keys!1571))))))

(declare-fun mapIsEmpty!57301 () Bool)

(assert (=> mapIsEmpty!57301 mapRes!57301))

(declare-fun b!1339419 () Bool)

(declare-fun res!888551 () Bool)

(assert (=> b!1339419 (=> (not res!888551) (not e!762920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90929 (_ BitVec 32)) Bool)

(assert (=> b!1339419 (= res!888551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!888552 () Bool)

(assert (=> start!113012 (=> (not res!888552) (not e!762920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113012 (= res!888552 (validMask!0 mask!1977))))

(assert (=> start!113012 e!762920))

(assert (=> start!113012 true))

(declare-fun array_inv!33309 (array!90929) Bool)

(assert (=> start!113012 (array_inv!33309 _keys!1571)))

(declare-fun array_inv!33310 (array!90931) Bool)

(assert (=> start!113012 (and (array_inv!33310 _values!1303) e!762917)))

(declare-fun b!1339414 () Bool)

(assert (=> b!1339414 (= e!762919 tp_is_empty!37063)))

(assert (= (and start!113012 res!888552) b!1339417))

(assert (= (and b!1339417 res!888553) b!1339419))

(assert (= (and b!1339419 res!888551) b!1339415))

(assert (= (and b!1339415 res!888550) b!1339418))

(assert (= (and b!1339416 condMapEmpty!57301) mapIsEmpty!57301))

(assert (= (and b!1339416 (not condMapEmpty!57301)) mapNonEmpty!57301))

(get-info :version)

(assert (= (and mapNonEmpty!57301 ((_ is ValueCellFull!17633) mapValue!57301)) b!1339414))

(assert (= (and b!1339416 ((_ is ValueCellFull!17633) mapDefault!57301)) b!1339413))

(assert (= start!113012 b!1339416))

(declare-fun m!1227013 () Bool)

(assert (=> b!1339415 m!1227013))

(declare-fun m!1227015 () Bool)

(assert (=> mapNonEmpty!57301 m!1227015))

(declare-fun m!1227017 () Bool)

(assert (=> b!1339419 m!1227017))

(declare-fun m!1227019 () Bool)

(assert (=> start!113012 m!1227019))

(declare-fun m!1227021 () Bool)

(assert (=> start!113012 m!1227021))

(declare-fun m!1227023 () Bool)

(assert (=> start!113012 m!1227023))

(check-sat (not b!1339419) tp_is_empty!37063 (not mapNonEmpty!57301) (not start!113012) (not b!1339415))
(check-sat)
