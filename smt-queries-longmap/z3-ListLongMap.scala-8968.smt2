; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108758 () Bool)

(assert start!108758)

(declare-fun b_free!28081 () Bool)

(declare-fun b_next!28081 () Bool)

(assert (=> start!108758 (= b_free!28081 (not b_next!28081))))

(declare-fun tp!99352 () Bool)

(declare-fun b_and!46143 () Bool)

(assert (=> start!108758 (= tp!99352 b_and!46143)))

(declare-fun b!1282420 () Bool)

(declare-fun e!732822 () Bool)

(declare-fun tp_is_empty!33721 () Bool)

(assert (=> b!1282420 (= e!732822 tp_is_empty!33721)))

(declare-fun b!1282421 () Bool)

(declare-fun e!732820 () Bool)

(assert (=> b!1282421 (= e!732820 tp_is_empty!33721)))

(declare-fun res!851527 () Bool)

(declare-fun e!732819 () Bool)

(assert (=> start!108758 (=> (not res!851527) (not e!732819))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108758 (= res!851527 (validMask!0 mask!2175))))

(assert (=> start!108758 e!732819))

(assert (=> start!108758 tp_is_empty!33721))

(assert (=> start!108758 true))

(declare-datatypes ((V!50065 0))(
  ( (V!50066 (val!16935 Int)) )
))
(declare-datatypes ((ValueCell!15962 0))(
  ( (ValueCellFull!15962 (v!19530 V!50065)) (EmptyCell!15962) )
))
(declare-datatypes ((array!84545 0))(
  ( (array!84546 (arr!40772 (Array (_ BitVec 32) ValueCell!15962)) (size!41323 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84545)

(declare-fun e!732818 () Bool)

(declare-fun array_inv!31153 (array!84545) Bool)

(assert (=> start!108758 (and (array_inv!31153 _values!1445) e!732818)))

(declare-datatypes ((array!84547 0))(
  ( (array!84548 (arr!40773 (Array (_ BitVec 32) (_ BitVec 64))) (size!41324 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84547)

(declare-fun array_inv!31154 (array!84547) Bool)

(assert (=> start!108758 (array_inv!31154 _keys!1741)))

(assert (=> start!108758 tp!99352))

(declare-fun mapNonEmpty!52133 () Bool)

(declare-fun mapRes!52133 () Bool)

(declare-fun tp!99353 () Bool)

(assert (=> mapNonEmpty!52133 (= mapRes!52133 (and tp!99353 e!732820))))

(declare-fun mapRest!52133 () (Array (_ BitVec 32) ValueCell!15962))

(declare-fun mapKey!52133 () (_ BitVec 32))

(declare-fun mapValue!52133 () ValueCell!15962)

(assert (=> mapNonEmpty!52133 (= (arr!40772 _values!1445) (store mapRest!52133 mapKey!52133 mapValue!52133))))

(declare-fun b!1282422 () Bool)

(declare-fun res!851526 () Bool)

(assert (=> b!1282422 (=> (not res!851526) (not e!732819))))

(declare-datatypes ((List!28918 0))(
  ( (Nil!28915) (Cons!28914 (h!30132 (_ BitVec 64)) (t!42450 List!28918)) )
))
(declare-fun arrayNoDuplicates!0 (array!84547 (_ BitVec 32) List!28918) Bool)

(assert (=> b!1282422 (= res!851526 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28915))))

(declare-fun b!1282423 () Bool)

(declare-fun res!851531 () Bool)

(assert (=> b!1282423 (=> (not res!851531) (not e!732819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84547 (_ BitVec 32)) Bool)

(assert (=> b!1282423 (= res!851531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282424 () Bool)

(declare-fun res!851532 () Bool)

(assert (=> b!1282424 (=> (not res!851532) (not e!732819))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282424 (= res!851532 (and (= (size!41323 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41324 _keys!1741) (size!41323 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52133 () Bool)

(assert (=> mapIsEmpty!52133 mapRes!52133))

(declare-fun b!1282425 () Bool)

(assert (=> b!1282425 (= e!732818 (and e!732822 mapRes!52133))))

(declare-fun condMapEmpty!52133 () Bool)

(declare-fun mapDefault!52133 () ValueCell!15962)

(assert (=> b!1282425 (= condMapEmpty!52133 (= (arr!40772 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15962)) mapDefault!52133)))))

(declare-fun b!1282426 () Bool)

(declare-fun res!851529 () Bool)

(assert (=> b!1282426 (=> (not res!851529) (not e!732819))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1282426 (= res!851529 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41324 _keys!1741)) (not (= (select (arr!40773 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282427 () Bool)

(declare-fun res!851530 () Bool)

(assert (=> b!1282427 (=> (not res!851530) (not e!732819))))

(declare-fun minValue!1387 () V!50065)

(declare-fun zeroValue!1387 () V!50065)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21702 0))(
  ( (tuple2!21703 (_1!10862 (_ BitVec 64)) (_2!10862 V!50065)) )
))
(declare-datatypes ((List!28919 0))(
  ( (Nil!28916) (Cons!28915 (h!30133 tuple2!21702) (t!42451 List!28919)) )
))
(declare-datatypes ((ListLongMap!19367 0))(
  ( (ListLongMap!19368 (toList!9699 List!28919)) )
))
(declare-fun contains!7828 (ListLongMap!19367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4768 (array!84547 array!84545 (_ BitVec 32) (_ BitVec 32) V!50065 V!50065 (_ BitVec 32) Int) ListLongMap!19367)

(assert (=> b!1282427 (= res!851530 (contains!7828 (getCurrentListMap!4768 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282428 () Bool)

(assert (=> b!1282428 (= e!732819 (not true))))

(assert (=> b!1282428 (contains!7828 (getCurrentListMap!4768 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42388 0))(
  ( (Unit!42389) )
))
(declare-fun lt!576678 () Unit!42388)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!15 (array!84547 array!84545 (_ BitVec 32) (_ BitVec 32) V!50065 V!50065 (_ BitVec 64) (_ BitVec 32) Int) Unit!42388)

(assert (=> b!1282428 (= lt!576678 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!15 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1282429 () Bool)

(declare-fun res!851528 () Bool)

(assert (=> b!1282429 (=> (not res!851528) (not e!732819))))

(assert (=> b!1282429 (= res!851528 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41324 _keys!1741))))))

(assert (= (and start!108758 res!851527) b!1282424))

(assert (= (and b!1282424 res!851532) b!1282423))

(assert (= (and b!1282423 res!851531) b!1282422))

(assert (= (and b!1282422 res!851526) b!1282429))

(assert (= (and b!1282429 res!851528) b!1282427))

(assert (= (and b!1282427 res!851530) b!1282426))

(assert (= (and b!1282426 res!851529) b!1282428))

(assert (= (and b!1282425 condMapEmpty!52133) mapIsEmpty!52133))

(assert (= (and b!1282425 (not condMapEmpty!52133)) mapNonEmpty!52133))

(get-info :version)

(assert (= (and mapNonEmpty!52133 ((_ is ValueCellFull!15962) mapValue!52133)) b!1282421))

(assert (= (and b!1282425 ((_ is ValueCellFull!15962) mapDefault!52133)) b!1282420))

(assert (= start!108758 b!1282425))

(declare-fun m!1177209 () Bool)

(assert (=> b!1282427 m!1177209))

(assert (=> b!1282427 m!1177209))

(declare-fun m!1177211 () Bool)

(assert (=> b!1282427 m!1177211))

(declare-fun m!1177213 () Bool)

(assert (=> mapNonEmpty!52133 m!1177213))

(declare-fun m!1177215 () Bool)

(assert (=> start!108758 m!1177215))

(declare-fun m!1177217 () Bool)

(assert (=> start!108758 m!1177217))

(declare-fun m!1177219 () Bool)

(assert (=> start!108758 m!1177219))

(declare-fun m!1177221 () Bool)

(assert (=> b!1282428 m!1177221))

(assert (=> b!1282428 m!1177221))

(declare-fun m!1177223 () Bool)

(assert (=> b!1282428 m!1177223))

(declare-fun m!1177225 () Bool)

(assert (=> b!1282428 m!1177225))

(declare-fun m!1177227 () Bool)

(assert (=> b!1282422 m!1177227))

(declare-fun m!1177229 () Bool)

(assert (=> b!1282423 m!1177229))

(declare-fun m!1177231 () Bool)

(assert (=> b!1282426 m!1177231))

(check-sat (not b!1282422) tp_is_empty!33721 (not b!1282428) (not start!108758) (not b_next!28081) (not b!1282423) (not b!1282427) (not mapNonEmpty!52133) b_and!46143)
(check-sat b_and!46143 (not b_next!28081))
