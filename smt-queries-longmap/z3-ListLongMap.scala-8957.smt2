; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108470 () Bool)

(assert start!108470)

(declare-fun b_free!28017 () Bool)

(declare-fun b_next!28017 () Bool)

(assert (=> start!108470 (= b_free!28017 (not b_next!28017))))

(declare-fun tp!99161 () Bool)

(declare-fun b_and!46077 () Bool)

(assert (=> start!108470 (= tp!99161 b_and!46077)))

(declare-fun b!1280217 () Bool)

(declare-fun res!850399 () Bool)

(declare-fun e!731495 () Bool)

(assert (=> b!1280217 (=> (not res!850399) (not e!731495))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84394 0))(
  ( (array!84395 (arr!40701 (Array (_ BitVec 32) (_ BitVec 64))) (size!41251 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84394)

(assert (=> b!1280217 (= res!850399 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41251 _keys!1741))))))

(declare-fun mapNonEmpty!52037 () Bool)

(declare-fun mapRes!52037 () Bool)

(declare-fun tp!99160 () Bool)

(declare-fun e!731494 () Bool)

(assert (=> mapNonEmpty!52037 (= mapRes!52037 (and tp!99160 e!731494))))

(declare-fun mapKey!52037 () (_ BitVec 32))

(declare-datatypes ((V!49979 0))(
  ( (V!49980 (val!16903 Int)) )
))
(declare-datatypes ((ValueCell!15930 0))(
  ( (ValueCellFull!15930 (v!19503 V!49979)) (EmptyCell!15930) )
))
(declare-datatypes ((array!84396 0))(
  ( (array!84397 (arr!40702 (Array (_ BitVec 32) ValueCell!15930)) (size!41252 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84396)

(declare-fun mapRest!52037 () (Array (_ BitVec 32) ValueCell!15930))

(declare-fun mapValue!52037 () ValueCell!15930)

(assert (=> mapNonEmpty!52037 (= (arr!40702 _values!1445) (store mapRest!52037 mapKey!52037 mapValue!52037))))

(declare-fun b!1280218 () Bool)

(declare-fun e!731493 () Bool)

(declare-fun tp_is_empty!33657 () Bool)

(assert (=> b!1280218 (= e!731493 tp_is_empty!33657)))

(declare-fun b!1280219 () Bool)

(declare-fun res!850398 () Bool)

(assert (=> b!1280219 (=> (not res!850398) (not e!731495))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84394 (_ BitVec 32)) Bool)

(assert (=> b!1280219 (= res!850398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280220 () Bool)

(assert (=> b!1280220 (= e!731495 false)))

(declare-fun minValue!1387 () V!49979)

(declare-fun zeroValue!1387 () V!49979)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!576098 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21632 0))(
  ( (tuple2!21633 (_1!10827 (_ BitVec 64)) (_2!10827 V!49979)) )
))
(declare-datatypes ((List!28832 0))(
  ( (Nil!28829) (Cons!28828 (h!30037 tuple2!21632) (t!42372 List!28832)) )
))
(declare-datatypes ((ListLongMap!19289 0))(
  ( (ListLongMap!19290 (toList!9660 List!28832)) )
))
(declare-fun contains!7775 (ListLongMap!19289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4744 (array!84394 array!84396 (_ BitVec 32) (_ BitVec 32) V!49979 V!49979 (_ BitVec 32) Int) ListLongMap!19289)

(assert (=> b!1280220 (= lt!576098 (contains!7775 (getCurrentListMap!4744 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280221 () Bool)

(assert (=> b!1280221 (= e!731494 tp_is_empty!33657)))

(declare-fun b!1280222 () Bool)

(declare-fun e!731492 () Bool)

(assert (=> b!1280222 (= e!731492 (and e!731493 mapRes!52037))))

(declare-fun condMapEmpty!52037 () Bool)

(declare-fun mapDefault!52037 () ValueCell!15930)

(assert (=> b!1280222 (= condMapEmpty!52037 (= (arr!40702 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15930)) mapDefault!52037)))))

(declare-fun b!1280223 () Bool)

(declare-fun res!850400 () Bool)

(assert (=> b!1280223 (=> (not res!850400) (not e!731495))))

(declare-datatypes ((List!28833 0))(
  ( (Nil!28830) (Cons!28829 (h!30038 (_ BitVec 64)) (t!42373 List!28833)) )
))
(declare-fun arrayNoDuplicates!0 (array!84394 (_ BitVec 32) List!28833) Bool)

(assert (=> b!1280223 (= res!850400 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28830))))

(declare-fun b!1280224 () Bool)

(declare-fun res!850396 () Bool)

(assert (=> b!1280224 (=> (not res!850396) (not e!731495))))

(assert (=> b!1280224 (= res!850396 (and (= (size!41252 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41251 _keys!1741) (size!41252 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52037 () Bool)

(assert (=> mapIsEmpty!52037 mapRes!52037))

(declare-fun res!850397 () Bool)

(assert (=> start!108470 (=> (not res!850397) (not e!731495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108470 (= res!850397 (validMask!0 mask!2175))))

(assert (=> start!108470 e!731495))

(assert (=> start!108470 tp_is_empty!33657))

(assert (=> start!108470 true))

(declare-fun array_inv!30893 (array!84396) Bool)

(assert (=> start!108470 (and (array_inv!30893 _values!1445) e!731492)))

(declare-fun array_inv!30894 (array!84394) Bool)

(assert (=> start!108470 (array_inv!30894 _keys!1741)))

(assert (=> start!108470 tp!99161))

(assert (= (and start!108470 res!850397) b!1280224))

(assert (= (and b!1280224 res!850396) b!1280219))

(assert (= (and b!1280219 res!850398) b!1280223))

(assert (= (and b!1280223 res!850400) b!1280217))

(assert (= (and b!1280217 res!850399) b!1280220))

(assert (= (and b!1280222 condMapEmpty!52037) mapIsEmpty!52037))

(assert (= (and b!1280222 (not condMapEmpty!52037)) mapNonEmpty!52037))

(get-info :version)

(assert (= (and mapNonEmpty!52037 ((_ is ValueCellFull!15930) mapValue!52037)) b!1280221))

(assert (= (and b!1280222 ((_ is ValueCellFull!15930) mapDefault!52037)) b!1280218))

(assert (= start!108470 b!1280222))

(declare-fun m!1174917 () Bool)

(assert (=> b!1280220 m!1174917))

(assert (=> b!1280220 m!1174917))

(declare-fun m!1174919 () Bool)

(assert (=> b!1280220 m!1174919))

(declare-fun m!1174921 () Bool)

(assert (=> mapNonEmpty!52037 m!1174921))

(declare-fun m!1174923 () Bool)

(assert (=> b!1280223 m!1174923))

(declare-fun m!1174925 () Bool)

(assert (=> start!108470 m!1174925))

(declare-fun m!1174927 () Bool)

(assert (=> start!108470 m!1174927))

(declare-fun m!1174929 () Bool)

(assert (=> start!108470 m!1174929))

(declare-fun m!1174931 () Bool)

(assert (=> b!1280219 m!1174931))

(check-sat (not start!108470) (not mapNonEmpty!52037) (not b_next!28017) (not b!1280219) (not b!1280220) (not b!1280223) tp_is_empty!33657 b_and!46077)
(check-sat b_and!46077 (not b_next!28017))
