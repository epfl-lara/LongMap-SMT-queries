; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112730 () Bool)

(assert start!112730)

(declare-fun b_free!31041 () Bool)

(declare-fun b_next!31041 () Bool)

(assert (=> start!112730 (= b_free!31041 (not b_next!31041))))

(declare-fun tp!108766 () Bool)

(declare-fun b_and!50019 () Bool)

(assert (=> start!112730 (= tp!108766 b_and!50019)))

(declare-fun b!1337231 () Bool)

(declare-fun res!887407 () Bool)

(declare-fun e!761455 () Bool)

(assert (=> b!1337231 (=> (not res!887407) (not e!761455))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90760 0))(
  ( (array!90761 (arr!43844 (Array (_ BitVec 32) (_ BitVec 64))) (size!44394 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90760)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337231 (= res!887407 (not (= (select (arr!43844 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337232 () Bool)

(declare-fun res!887406 () Bool)

(assert (=> b!1337232 (=> (not res!887406) (not e!761455))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337232 (= res!887406 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44394 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337233 () Bool)

(declare-fun res!887408 () Bool)

(assert (=> b!1337233 (=> (not res!887408) (not e!761455))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90760 (_ BitVec 32)) Bool)

(assert (=> b!1337233 (= res!887408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!887404 () Bool)

(assert (=> start!112730 (=> (not res!887404) (not e!761455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112730 (= res!887404 (validMask!0 mask!1998))))

(assert (=> start!112730 e!761455))

(declare-datatypes ((V!54371 0))(
  ( (V!54372 (val!18550 Int)) )
))
(declare-datatypes ((ValueCell!17577 0))(
  ( (ValueCellFull!17577 (v!21191 V!54371)) (EmptyCell!17577) )
))
(declare-datatypes ((array!90762 0))(
  ( (array!90763 (arr!43845 (Array (_ BitVec 32) ValueCell!17577)) (size!44395 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90762)

(declare-fun e!761456 () Bool)

(declare-fun array_inv!33067 (array!90762) Bool)

(assert (=> start!112730 (and (array_inv!33067 _values!1320) e!761456)))

(assert (=> start!112730 true))

(declare-fun array_inv!33068 (array!90760) Bool)

(assert (=> start!112730 (array_inv!33068 _keys!1590)))

(assert (=> start!112730 tp!108766))

(declare-fun tp_is_empty!36951 () Bool)

(assert (=> start!112730 tp_is_empty!36951))

(declare-fun b!1337234 () Bool)

(assert (=> b!1337234 (= e!761455 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1980 (size!44395 _values!1320))))))

(declare-fun b!1337235 () Bool)

(declare-fun e!761452 () Bool)

(assert (=> b!1337235 (= e!761452 tp_is_empty!36951)))

(declare-fun mapNonEmpty!57107 () Bool)

(declare-fun mapRes!57107 () Bool)

(declare-fun tp!108767 () Bool)

(assert (=> mapNonEmpty!57107 (= mapRes!57107 (and tp!108767 e!761452))))

(declare-fun mapKey!57107 () (_ BitVec 32))

(declare-fun mapRest!57107 () (Array (_ BitVec 32) ValueCell!17577))

(declare-fun mapValue!57107 () ValueCell!17577)

(assert (=> mapNonEmpty!57107 (= (arr!43845 _values!1320) (store mapRest!57107 mapKey!57107 mapValue!57107))))

(declare-fun b!1337236 () Bool)

(declare-fun e!761453 () Bool)

(assert (=> b!1337236 (= e!761456 (and e!761453 mapRes!57107))))

(declare-fun condMapEmpty!57107 () Bool)

(declare-fun mapDefault!57107 () ValueCell!17577)

(assert (=> b!1337236 (= condMapEmpty!57107 (= (arr!43845 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17577)) mapDefault!57107)))))

(declare-fun b!1337237 () Bool)

(declare-fun res!887410 () Bool)

(assert (=> b!1337237 (=> (not res!887410) (not e!761455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337237 (= res!887410 (validKeyInArray!0 (select (arr!43844 _keys!1590) from!1980)))))

(declare-fun b!1337238 () Bool)

(assert (=> b!1337238 (= e!761453 tp_is_empty!36951)))

(declare-fun b!1337239 () Bool)

(declare-fun res!887409 () Bool)

(assert (=> b!1337239 (=> (not res!887409) (not e!761455))))

(assert (=> b!1337239 (= res!887409 (and (= (size!44395 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44394 _keys!1590) (size!44395 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337240 () Bool)

(declare-fun res!887411 () Bool)

(assert (=> b!1337240 (=> (not res!887411) (not e!761455))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54371)

(declare-fun zeroValue!1262 () V!54371)

(declare-datatypes ((tuple2!23928 0))(
  ( (tuple2!23929 (_1!11975 (_ BitVec 64)) (_2!11975 V!54371)) )
))
(declare-datatypes ((List!31070 0))(
  ( (Nil!31067) (Cons!31066 (h!32275 tuple2!23928) (t!45382 List!31070)) )
))
(declare-datatypes ((ListLongMap!21585 0))(
  ( (ListLongMap!21586 (toList!10808 List!31070)) )
))
(declare-fun contains!8975 (ListLongMap!21585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5779 (array!90760 array!90762 (_ BitVec 32) (_ BitVec 32) V!54371 V!54371 (_ BitVec 32) Int) ListLongMap!21585)

(assert (=> b!1337240 (= res!887411 (contains!8975 (getCurrentListMap!5779 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337241 () Bool)

(declare-fun res!887405 () Bool)

(assert (=> b!1337241 (=> (not res!887405) (not e!761455))))

(declare-datatypes ((List!31071 0))(
  ( (Nil!31068) (Cons!31067 (h!32276 (_ BitVec 64)) (t!45383 List!31071)) )
))
(declare-fun arrayNoDuplicates!0 (array!90760 (_ BitVec 32) List!31071) Bool)

(assert (=> b!1337241 (= res!887405 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31068))))

(declare-fun mapIsEmpty!57107 () Bool)

(assert (=> mapIsEmpty!57107 mapRes!57107))

(assert (= (and start!112730 res!887404) b!1337239))

(assert (= (and b!1337239 res!887409) b!1337233))

(assert (= (and b!1337233 res!887408) b!1337241))

(assert (= (and b!1337241 res!887405) b!1337232))

(assert (= (and b!1337232 res!887406) b!1337240))

(assert (= (and b!1337240 res!887411) b!1337231))

(assert (= (and b!1337231 res!887407) b!1337237))

(assert (= (and b!1337237 res!887410) b!1337234))

(assert (= (and b!1337236 condMapEmpty!57107) mapIsEmpty!57107))

(assert (= (and b!1337236 (not condMapEmpty!57107)) mapNonEmpty!57107))

(get-info :version)

(assert (= (and mapNonEmpty!57107 ((_ is ValueCellFull!17577) mapValue!57107)) b!1337235))

(assert (= (and b!1337236 ((_ is ValueCellFull!17577) mapDefault!57107)) b!1337238))

(assert (= start!112730 b!1337236))

(declare-fun m!1225315 () Bool)

(assert (=> b!1337233 m!1225315))

(declare-fun m!1225317 () Bool)

(assert (=> mapNonEmpty!57107 m!1225317))

(declare-fun m!1225319 () Bool)

(assert (=> b!1337240 m!1225319))

(assert (=> b!1337240 m!1225319))

(declare-fun m!1225321 () Bool)

(assert (=> b!1337240 m!1225321))

(declare-fun m!1225323 () Bool)

(assert (=> start!112730 m!1225323))

(declare-fun m!1225325 () Bool)

(assert (=> start!112730 m!1225325))

(declare-fun m!1225327 () Bool)

(assert (=> start!112730 m!1225327))

(declare-fun m!1225329 () Bool)

(assert (=> b!1337231 m!1225329))

(declare-fun m!1225331 () Bool)

(assert (=> b!1337241 m!1225331))

(assert (=> b!1337237 m!1225329))

(assert (=> b!1337237 m!1225329))

(declare-fun m!1225333 () Bool)

(assert (=> b!1337237 m!1225333))

(check-sat (not b_next!31041) (not b!1337237) (not b!1337240) (not start!112730) b_and!50019 tp_is_empty!36951 (not b!1337241) (not b!1337233) (not mapNonEmpty!57107))
(check-sat b_and!50019 (not b_next!31041))
