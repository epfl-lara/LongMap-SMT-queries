; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108468 () Bool)

(assert start!108468)

(declare-fun b_free!28015 () Bool)

(declare-fun b_next!28015 () Bool)

(assert (=> start!108468 (= b_free!28015 (not b_next!28015))))

(declare-fun tp!99156 () Bool)

(declare-fun b_and!46057 () Bool)

(assert (=> start!108468 (= tp!99156 b_and!46057)))

(declare-fun b!1280129 () Bool)

(declare-fun res!850357 () Bool)

(declare-fun e!731451 () Bool)

(assert (=> b!1280129 (=> (not res!850357) (not e!731451))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84281 0))(
  ( (array!84282 (arr!40645 (Array (_ BitVec 32) (_ BitVec 64))) (size!41197 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84281)

(assert (=> b!1280129 (= res!850357 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41197 _keys!1741))))))

(declare-fun b!1280130 () Bool)

(declare-fun res!850356 () Bool)

(assert (=> b!1280130 (=> (not res!850356) (not e!731451))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84281 (_ BitVec 32)) Bool)

(assert (=> b!1280130 (= res!850356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52034 () Bool)

(declare-fun mapRes!52034 () Bool)

(assert (=> mapIsEmpty!52034 mapRes!52034))

(declare-fun b!1280131 () Bool)

(declare-fun res!850358 () Bool)

(assert (=> b!1280131 (=> (not res!850358) (not e!731451))))

(declare-datatypes ((List!28894 0))(
  ( (Nil!28891) (Cons!28890 (h!30099 (_ BitVec 64)) (t!42426 List!28894)) )
))
(declare-fun arrayNoDuplicates!0 (array!84281 (_ BitVec 32) List!28894) Bool)

(assert (=> b!1280131 (= res!850358 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28891))))

(declare-fun res!850355 () Bool)

(assert (=> start!108468 (=> (not res!850355) (not e!731451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108468 (= res!850355 (validMask!0 mask!2175))))

(assert (=> start!108468 e!731451))

(declare-fun tp_is_empty!33655 () Bool)

(assert (=> start!108468 tp_is_empty!33655))

(assert (=> start!108468 true))

(declare-datatypes ((V!49977 0))(
  ( (V!49978 (val!16902 Int)) )
))
(declare-datatypes ((ValueCell!15929 0))(
  ( (ValueCellFull!15929 (v!19501 V!49977)) (EmptyCell!15929) )
))
(declare-datatypes ((array!84283 0))(
  ( (array!84284 (arr!40646 (Array (_ BitVec 32) ValueCell!15929)) (size!41198 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84283)

(declare-fun e!731448 () Bool)

(declare-fun array_inv!31019 (array!84283) Bool)

(assert (=> start!108468 (and (array_inv!31019 _values!1445) e!731448)))

(declare-fun array_inv!31020 (array!84281) Bool)

(assert (=> start!108468 (array_inv!31020 _keys!1741)))

(assert (=> start!108468 tp!99156))

(declare-fun b!1280132 () Bool)

(declare-fun e!731449 () Bool)

(assert (=> b!1280132 (= e!731448 (and e!731449 mapRes!52034))))

(declare-fun condMapEmpty!52034 () Bool)

(declare-fun mapDefault!52034 () ValueCell!15929)

(assert (=> b!1280132 (= condMapEmpty!52034 (= (arr!40646 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15929)) mapDefault!52034)))))

(declare-fun b!1280133 () Bool)

(declare-fun res!850354 () Bool)

(assert (=> b!1280133 (=> (not res!850354) (not e!731451))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280133 (= res!850354 (and (= (size!41198 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41197 _keys!1741) (size!41198 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280134 () Bool)

(assert (=> b!1280134 (= e!731449 tp_is_empty!33655)))

(declare-fun mapNonEmpty!52034 () Bool)

(declare-fun tp!99155 () Bool)

(declare-fun e!731450 () Bool)

(assert (=> mapNonEmpty!52034 (= mapRes!52034 (and tp!99155 e!731450))))

(declare-fun mapKey!52034 () (_ BitVec 32))

(declare-fun mapRest!52034 () (Array (_ BitVec 32) ValueCell!15929))

(declare-fun mapValue!52034 () ValueCell!15929)

(assert (=> mapNonEmpty!52034 (= (arr!40646 _values!1445) (store mapRest!52034 mapKey!52034 mapValue!52034))))

(declare-fun b!1280135 () Bool)

(assert (=> b!1280135 (= e!731451 false)))

(declare-fun minValue!1387 () V!49977)

(declare-fun zeroValue!1387 () V!49977)

(declare-fun lt!575917 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21702 0))(
  ( (tuple2!21703 (_1!10862 (_ BitVec 64)) (_2!10862 V!49977)) )
))
(declare-datatypes ((List!28895 0))(
  ( (Nil!28892) (Cons!28891 (h!30100 tuple2!21702) (t!42427 List!28895)) )
))
(declare-datatypes ((ListLongMap!19359 0))(
  ( (ListLongMap!19360 (toList!9695 List!28895)) )
))
(declare-fun contains!7740 (ListLongMap!19359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4669 (array!84281 array!84283 (_ BitVec 32) (_ BitVec 32) V!49977 V!49977 (_ BitVec 32) Int) ListLongMap!19359)

(assert (=> b!1280135 (= lt!575917 (contains!7740 (getCurrentListMap!4669 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280136 () Bool)

(assert (=> b!1280136 (= e!731450 tp_is_empty!33655)))

(assert (= (and start!108468 res!850355) b!1280133))

(assert (= (and b!1280133 res!850354) b!1280130))

(assert (= (and b!1280130 res!850356) b!1280131))

(assert (= (and b!1280131 res!850358) b!1280129))

(assert (= (and b!1280129 res!850357) b!1280135))

(assert (= (and b!1280132 condMapEmpty!52034) mapIsEmpty!52034))

(assert (= (and b!1280132 (not condMapEmpty!52034)) mapNonEmpty!52034))

(get-info :version)

(assert (= (and mapNonEmpty!52034 ((_ is ValueCellFull!15929) mapValue!52034)) b!1280136))

(assert (= (and b!1280132 ((_ is ValueCellFull!15929) mapDefault!52034)) b!1280134))

(assert (= start!108468 b!1280132))

(declare-fun m!1174401 () Bool)

(assert (=> b!1280130 m!1174401))

(declare-fun m!1174403 () Bool)

(assert (=> mapNonEmpty!52034 m!1174403))

(declare-fun m!1174405 () Bool)

(assert (=> b!1280131 m!1174405))

(declare-fun m!1174407 () Bool)

(assert (=> start!108468 m!1174407))

(declare-fun m!1174409 () Bool)

(assert (=> start!108468 m!1174409))

(declare-fun m!1174411 () Bool)

(assert (=> start!108468 m!1174411))

(declare-fun m!1174413 () Bool)

(assert (=> b!1280135 m!1174413))

(assert (=> b!1280135 m!1174413))

(declare-fun m!1174415 () Bool)

(assert (=> b!1280135 m!1174415))

(check-sat (not b!1280135) (not b!1280130) (not b_next!28015) tp_is_empty!33655 (not start!108468) (not mapNonEmpty!52034) (not b!1280131) b_and!46057)
(check-sat b_and!46057 (not b_next!28015))
