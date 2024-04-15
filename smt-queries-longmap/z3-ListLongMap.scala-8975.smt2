; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108596 () Bool)

(assert start!108596)

(declare-fun b_free!28123 () Bool)

(declare-fun b_next!28123 () Bool)

(assert (=> start!108596 (= b_free!28123 (not b_next!28123))))

(declare-fun tp!99483 () Bool)

(declare-fun b_and!46169 () Bool)

(assert (=> start!108596 (= tp!99483 b_and!46169)))

(declare-fun b!1281831 () Bool)

(declare-fun res!851490 () Bool)

(declare-fun e!732381 () Bool)

(assert (=> b!1281831 (=> (not res!851490) (not e!732381))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50121 0))(
  ( (V!50122 (val!16956 Int)) )
))
(declare-datatypes ((ValueCell!15983 0))(
  ( (ValueCellFull!15983 (v!19556 V!50121)) (EmptyCell!15983) )
))
(declare-datatypes ((array!84493 0))(
  ( (array!84494 (arr!40750 (Array (_ BitVec 32) ValueCell!15983)) (size!41302 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84493)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84495 0))(
  ( (array!84496 (arr!40751 (Array (_ BitVec 32) (_ BitVec 64))) (size!41303 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84495)

(assert (=> b!1281831 (= res!851490 (and (= (size!41302 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41303 _keys!1741) (size!41302 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281832 () Bool)

(declare-fun e!732384 () Bool)

(declare-fun e!732383 () Bool)

(declare-fun mapRes!52199 () Bool)

(assert (=> b!1281832 (= e!732384 (and e!732383 mapRes!52199))))

(declare-fun condMapEmpty!52199 () Bool)

(declare-fun mapDefault!52199 () ValueCell!15983)

(assert (=> b!1281832 (= condMapEmpty!52199 (= (arr!40750 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15983)) mapDefault!52199)))))

(declare-fun b!1281833 () Bool)

(declare-fun tp_is_empty!33763 () Bool)

(assert (=> b!1281833 (= e!732383 tp_is_empty!33763)))

(declare-fun mapIsEmpty!52199 () Bool)

(assert (=> mapIsEmpty!52199 mapRes!52199))

(declare-fun b!1281834 () Bool)

(declare-fun res!851487 () Bool)

(assert (=> b!1281834 (=> (not res!851487) (not e!732381))))

(declare-datatypes ((List!28974 0))(
  ( (Nil!28971) (Cons!28970 (h!30179 (_ BitVec 64)) (t!42508 List!28974)) )
))
(declare-fun arrayNoDuplicates!0 (array!84495 (_ BitVec 32) List!28974) Bool)

(assert (=> b!1281834 (= res!851487 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28971))))

(declare-fun mapNonEmpty!52199 () Bool)

(declare-fun tp!99482 () Bool)

(declare-fun e!732380 () Bool)

(assert (=> mapNonEmpty!52199 (= mapRes!52199 (and tp!99482 e!732380))))

(declare-fun mapValue!52199 () ValueCell!15983)

(declare-fun mapRest!52199 () (Array (_ BitVec 32) ValueCell!15983))

(declare-fun mapKey!52199 () (_ BitVec 32))

(assert (=> mapNonEmpty!52199 (= (arr!40750 _values!1445) (store mapRest!52199 mapKey!52199 mapValue!52199))))

(declare-fun res!851488 () Bool)

(assert (=> start!108596 (=> (not res!851488) (not e!732381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108596 (= res!851488 (validMask!0 mask!2175))))

(assert (=> start!108596 e!732381))

(assert (=> start!108596 tp_is_empty!33763))

(assert (=> start!108596 true))

(declare-fun array_inv!31081 (array!84493) Bool)

(assert (=> start!108596 (and (array_inv!31081 _values!1445) e!732384)))

(declare-fun array_inv!31082 (array!84495) Bool)

(assert (=> start!108596 (array_inv!31082 _keys!1741)))

(assert (=> start!108596 tp!99483))

(declare-fun b!1281835 () Bool)

(declare-fun res!851486 () Bool)

(assert (=> b!1281835 (=> (not res!851486) (not e!732381))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281835 (= res!851486 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41303 _keys!1741))))))

(declare-fun b!1281836 () Bool)

(assert (=> b!1281836 (= e!732381 false)))

(declare-fun minValue!1387 () V!50121)

(declare-fun zeroValue!1387 () V!50121)

(declare-fun lt!576225 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21788 0))(
  ( (tuple2!21789 (_1!10905 (_ BitVec 64)) (_2!10905 V!50121)) )
))
(declare-datatypes ((List!28975 0))(
  ( (Nil!28972) (Cons!28971 (h!30180 tuple2!21788) (t!42509 List!28975)) )
))
(declare-datatypes ((ListLongMap!19445 0))(
  ( (ListLongMap!19446 (toList!9738 List!28975)) )
))
(declare-fun contains!7784 (ListLongMap!19445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4712 (array!84495 array!84493 (_ BitVec 32) (_ BitVec 32) V!50121 V!50121 (_ BitVec 32) Int) ListLongMap!19445)

(assert (=> b!1281836 (= lt!576225 (contains!7784 (getCurrentListMap!4712 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281837 () Bool)

(assert (=> b!1281837 (= e!732380 tp_is_empty!33763)))

(declare-fun b!1281838 () Bool)

(declare-fun res!851489 () Bool)

(assert (=> b!1281838 (=> (not res!851489) (not e!732381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84495 (_ BitVec 32)) Bool)

(assert (=> b!1281838 (= res!851489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108596 res!851488) b!1281831))

(assert (= (and b!1281831 res!851490) b!1281838))

(assert (= (and b!1281838 res!851489) b!1281834))

(assert (= (and b!1281834 res!851487) b!1281835))

(assert (= (and b!1281835 res!851486) b!1281836))

(assert (= (and b!1281832 condMapEmpty!52199) mapIsEmpty!52199))

(assert (= (and b!1281832 (not condMapEmpty!52199)) mapNonEmpty!52199))

(get-info :version)

(assert (= (and mapNonEmpty!52199 ((_ is ValueCellFull!15983) mapValue!52199)) b!1281837))

(assert (= (and b!1281832 ((_ is ValueCellFull!15983) mapDefault!52199)) b!1281833))

(assert (= start!108596 b!1281832))

(declare-fun m!1175769 () Bool)

(assert (=> mapNonEmpty!52199 m!1175769))

(declare-fun m!1175771 () Bool)

(assert (=> b!1281836 m!1175771))

(assert (=> b!1281836 m!1175771))

(declare-fun m!1175773 () Bool)

(assert (=> b!1281836 m!1175773))

(declare-fun m!1175775 () Bool)

(assert (=> b!1281838 m!1175775))

(declare-fun m!1175777 () Bool)

(assert (=> start!108596 m!1175777))

(declare-fun m!1175779 () Bool)

(assert (=> start!108596 m!1175779))

(declare-fun m!1175781 () Bool)

(assert (=> start!108596 m!1175781))

(declare-fun m!1175783 () Bool)

(assert (=> b!1281834 m!1175783))

(check-sat (not b!1281836) (not start!108596) (not b_next!28123) (not b!1281834) (not b!1281838) (not mapNonEmpty!52199) b_and!46169 tp_is_empty!33763)
(check-sat b_and!46169 (not b_next!28123))
