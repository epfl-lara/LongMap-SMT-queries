; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113428 () Bool)

(assert start!113428)

(declare-fun b_free!31479 () Bool)

(declare-fun b_next!31479 () Bool)

(assert (=> start!113428 (= b_free!31479 (not b_next!31479))))

(declare-fun tp!110242 () Bool)

(declare-fun b_and!50767 () Bool)

(assert (=> start!113428 (= tp!110242 b_and!50767)))

(declare-fun b!1346490 () Bool)

(declare-fun e!766153 () Bool)

(declare-fun tp_is_empty!37479 () Bool)

(assert (=> b!1346490 (= e!766153 tp_is_empty!37479)))

(declare-fun b!1346491 () Bool)

(declare-fun e!766150 () Bool)

(assert (=> b!1346491 (= e!766150 false)))

(declare-datatypes ((V!55075 0))(
  ( (V!55076 (val!18814 Int)) )
))
(declare-fun minValue!1245 () V!55075)

(declare-fun lt!595521 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91790 0))(
  ( (array!91791 (arr!44351 (Array (_ BitVec 32) (_ BitVec 64))) (size!44901 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91790)

(declare-fun zeroValue!1245 () V!55075)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17841 0))(
  ( (ValueCellFull!17841 (v!21462 V!55075)) (EmptyCell!17841) )
))
(declare-datatypes ((array!91792 0))(
  ( (array!91793 (arr!44352 (Array (_ BitVec 32) ValueCell!17841)) (size!44902 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91792)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24250 0))(
  ( (tuple2!24251 (_1!12136 (_ BitVec 64)) (_2!12136 V!55075)) )
))
(declare-datatypes ((List!31407 0))(
  ( (Nil!31404) (Cons!31403 (h!32612 tuple2!24250) (t!45997 List!31407)) )
))
(declare-datatypes ((ListLongMap!21907 0))(
  ( (ListLongMap!21908 (toList!10969 List!31407)) )
))
(declare-fun contains!9145 (ListLongMap!21907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5921 (array!91790 array!91792 (_ BitVec 32) (_ BitVec 32) V!55075 V!55075 (_ BitVec 32) Int) ListLongMap!21907)

(assert (=> b!1346491 (= lt!595521 (contains!9145 (getCurrentListMap!5921 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346492 () Bool)

(declare-fun res!893459 () Bool)

(assert (=> b!1346492 (=> (not res!893459) (not e!766150))))

(assert (=> b!1346492 (= res!893459 (and (= (size!44902 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44901 _keys!1571) (size!44902 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57925 () Bool)

(declare-fun mapRes!57925 () Bool)

(declare-fun tp!110241 () Bool)

(assert (=> mapNonEmpty!57925 (= mapRes!57925 (and tp!110241 e!766153))))

(declare-fun mapRest!57925 () (Array (_ BitVec 32) ValueCell!17841))

(declare-fun mapKey!57925 () (_ BitVec 32))

(declare-fun mapValue!57925 () ValueCell!17841)

(assert (=> mapNonEmpty!57925 (= (arr!44352 _values!1303) (store mapRest!57925 mapKey!57925 mapValue!57925))))

(declare-fun res!893460 () Bool)

(assert (=> start!113428 (=> (not res!893460) (not e!766150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113428 (= res!893460 (validMask!0 mask!1977))))

(assert (=> start!113428 e!766150))

(assert (=> start!113428 tp_is_empty!37479))

(assert (=> start!113428 true))

(declare-fun array_inv!33411 (array!91790) Bool)

(assert (=> start!113428 (array_inv!33411 _keys!1571)))

(declare-fun e!766151 () Bool)

(declare-fun array_inv!33412 (array!91792) Bool)

(assert (=> start!113428 (and (array_inv!33412 _values!1303) e!766151)))

(assert (=> start!113428 tp!110242))

(declare-fun b!1346493 () Bool)

(declare-fun res!893456 () Bool)

(assert (=> b!1346493 (=> (not res!893456) (not e!766150))))

(declare-datatypes ((List!31408 0))(
  ( (Nil!31405) (Cons!31404 (h!32613 (_ BitVec 64)) (t!45998 List!31408)) )
))
(declare-fun arrayNoDuplicates!0 (array!91790 (_ BitVec 32) List!31408) Bool)

(assert (=> b!1346493 (= res!893456 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31405))))

(declare-fun b!1346494 () Bool)

(declare-fun e!766154 () Bool)

(assert (=> b!1346494 (= e!766151 (and e!766154 mapRes!57925))))

(declare-fun condMapEmpty!57925 () Bool)

(declare-fun mapDefault!57925 () ValueCell!17841)

(assert (=> b!1346494 (= condMapEmpty!57925 (= (arr!44352 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17841)) mapDefault!57925)))))

(declare-fun mapIsEmpty!57925 () Bool)

(assert (=> mapIsEmpty!57925 mapRes!57925))

(declare-fun b!1346495 () Bool)

(assert (=> b!1346495 (= e!766154 tp_is_empty!37479)))

(declare-fun b!1346496 () Bool)

(declare-fun res!893457 () Bool)

(assert (=> b!1346496 (=> (not res!893457) (not e!766150))))

(assert (=> b!1346496 (= res!893457 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44901 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346497 () Bool)

(declare-fun res!893458 () Bool)

(assert (=> b!1346497 (=> (not res!893458) (not e!766150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91790 (_ BitVec 32)) Bool)

(assert (=> b!1346497 (= res!893458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113428 res!893460) b!1346492))

(assert (= (and b!1346492 res!893459) b!1346497))

(assert (= (and b!1346497 res!893458) b!1346493))

(assert (= (and b!1346493 res!893456) b!1346496))

(assert (= (and b!1346496 res!893457) b!1346491))

(assert (= (and b!1346494 condMapEmpty!57925) mapIsEmpty!57925))

(assert (= (and b!1346494 (not condMapEmpty!57925)) mapNonEmpty!57925))

(get-info :version)

(assert (= (and mapNonEmpty!57925 ((_ is ValueCellFull!17841) mapValue!57925)) b!1346490))

(assert (= (and b!1346494 ((_ is ValueCellFull!17841) mapDefault!57925)) b!1346495))

(assert (= start!113428 b!1346494))

(declare-fun m!1233623 () Bool)

(assert (=> b!1346497 m!1233623))

(declare-fun m!1233625 () Bool)

(assert (=> mapNonEmpty!57925 m!1233625))

(declare-fun m!1233627 () Bool)

(assert (=> b!1346491 m!1233627))

(assert (=> b!1346491 m!1233627))

(declare-fun m!1233629 () Bool)

(assert (=> b!1346491 m!1233629))

(declare-fun m!1233631 () Bool)

(assert (=> b!1346493 m!1233631))

(declare-fun m!1233633 () Bool)

(assert (=> start!113428 m!1233633))

(declare-fun m!1233635 () Bool)

(assert (=> start!113428 m!1233635))

(declare-fun m!1233637 () Bool)

(assert (=> start!113428 m!1233637))

(check-sat (not b!1346491) (not mapNonEmpty!57925) (not b!1346497) b_and!50767 (not b!1346493) (not start!113428) (not b_next!31479) tp_is_empty!37479)
(check-sat b_and!50767 (not b_next!31479))
