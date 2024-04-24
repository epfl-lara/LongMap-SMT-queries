; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108698 () Bool)

(assert start!108698)

(declare-fun b_free!28021 () Bool)

(declare-fun b_next!28021 () Bool)

(assert (=> start!108698 (= b_free!28021 (not b_next!28021))))

(declare-fun tp!99172 () Bool)

(declare-fun b_and!46083 () Bool)

(assert (=> start!108698 (= tp!99172 b_and!46083)))

(declare-fun b!1281570 () Bool)

(declare-fun e!732370 () Bool)

(declare-fun tp_is_empty!33661 () Bool)

(assert (=> b!1281570 (= e!732370 tp_is_empty!33661)))

(declare-fun b!1281571 () Bool)

(declare-fun res!850947 () Bool)

(declare-fun e!732371 () Bool)

(assert (=> b!1281571 (=> (not res!850947) (not e!732371))))

(declare-datatypes ((array!84427 0))(
  ( (array!84428 (arr!40713 (Array (_ BitVec 32) (_ BitVec 64))) (size!41264 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84427)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84427 (_ BitVec 32)) Bool)

(assert (=> b!1281571 (= res!850947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!850946 () Bool)

(assert (=> start!108698 (=> (not res!850946) (not e!732371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108698 (= res!850946 (validMask!0 mask!2175))))

(assert (=> start!108698 e!732371))

(assert (=> start!108698 tp_is_empty!33661))

(assert (=> start!108698 true))

(declare-datatypes ((V!49985 0))(
  ( (V!49986 (val!16905 Int)) )
))
(declare-datatypes ((ValueCell!15932 0))(
  ( (ValueCellFull!15932 (v!19500 V!49985)) (EmptyCell!15932) )
))
(declare-datatypes ((array!84429 0))(
  ( (array!84430 (arr!40714 (Array (_ BitVec 32) ValueCell!15932)) (size!41265 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84429)

(declare-fun e!732368 () Bool)

(declare-fun array_inv!31101 (array!84429) Bool)

(assert (=> start!108698 (and (array_inv!31101 _values!1445) e!732368)))

(declare-fun array_inv!31102 (array!84427) Bool)

(assert (=> start!108698 (array_inv!31102 _keys!1741)))

(assert (=> start!108698 tp!99172))

(declare-fun b!1281572 () Bool)

(declare-fun res!850948 () Bool)

(assert (=> b!1281572 (=> (not res!850948) (not e!732371))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281572 (= res!850948 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41264 _keys!1741))))))

(declare-fun b!1281573 () Bool)

(declare-fun res!850949 () Bool)

(assert (=> b!1281573 (=> (not res!850949) (not e!732371))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281573 (= res!850949 (and (= (size!41265 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41264 _keys!1741) (size!41265 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52043 () Bool)

(declare-fun mapRes!52043 () Bool)

(declare-fun tp!99173 () Bool)

(declare-fun e!732369 () Bool)

(assert (=> mapNonEmpty!52043 (= mapRes!52043 (and tp!99173 e!732369))))

(declare-fun mapRest!52043 () (Array (_ BitVec 32) ValueCell!15932))

(declare-fun mapValue!52043 () ValueCell!15932)

(declare-fun mapKey!52043 () (_ BitVec 32))

(assert (=> mapNonEmpty!52043 (= (arr!40714 _values!1445) (store mapRest!52043 mapKey!52043 mapValue!52043))))

(declare-fun b!1281574 () Bool)

(declare-fun res!850950 () Bool)

(assert (=> b!1281574 (=> (not res!850950) (not e!732371))))

(declare-datatypes ((List!28866 0))(
  ( (Nil!28863) (Cons!28862 (h!30080 (_ BitVec 64)) (t!42398 List!28866)) )
))
(declare-fun arrayNoDuplicates!0 (array!84427 (_ BitVec 32) List!28866) Bool)

(assert (=> b!1281574 (= res!850950 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28863))))

(declare-fun b!1281575 () Bool)

(assert (=> b!1281575 (= e!732368 (and e!732370 mapRes!52043))))

(declare-fun condMapEmpty!52043 () Bool)

(declare-fun mapDefault!52043 () ValueCell!15932)

(assert (=> b!1281575 (= condMapEmpty!52043 (= (arr!40714 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15932)) mapDefault!52043)))))

(declare-fun mapIsEmpty!52043 () Bool)

(assert (=> mapIsEmpty!52043 mapRes!52043))

(declare-fun b!1281576 () Bool)

(assert (=> b!1281576 (= e!732371 false)))

(declare-fun minValue!1387 () V!49985)

(declare-fun zeroValue!1387 () V!49985)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576588 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21652 0))(
  ( (tuple2!21653 (_1!10837 (_ BitVec 64)) (_2!10837 V!49985)) )
))
(declare-datatypes ((List!28867 0))(
  ( (Nil!28864) (Cons!28863 (h!30081 tuple2!21652) (t!42399 List!28867)) )
))
(declare-datatypes ((ListLongMap!19317 0))(
  ( (ListLongMap!19318 (toList!9674 List!28867)) )
))
(declare-fun contains!7803 (ListLongMap!19317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4743 (array!84427 array!84429 (_ BitVec 32) (_ BitVec 32) V!49985 V!49985 (_ BitVec 32) Int) ListLongMap!19317)

(assert (=> b!1281576 (= lt!576588 (contains!7803 (getCurrentListMap!4743 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281577 () Bool)

(assert (=> b!1281577 (= e!732369 tp_is_empty!33661)))

(assert (= (and start!108698 res!850946) b!1281573))

(assert (= (and b!1281573 res!850949) b!1281571))

(assert (= (and b!1281571 res!850947) b!1281574))

(assert (= (and b!1281574 res!850950) b!1281572))

(assert (= (and b!1281572 res!850948) b!1281576))

(assert (= (and b!1281575 condMapEmpty!52043) mapIsEmpty!52043))

(assert (= (and b!1281575 (not condMapEmpty!52043)) mapNonEmpty!52043))

(get-info :version)

(assert (= (and mapNonEmpty!52043 ((_ is ValueCellFull!15932) mapValue!52043)) b!1281577))

(assert (= (and b!1281575 ((_ is ValueCellFull!15932) mapDefault!52043)) b!1281570))

(assert (= start!108698 b!1281575))

(declare-fun m!1176561 () Bool)

(assert (=> b!1281571 m!1176561))

(declare-fun m!1176563 () Bool)

(assert (=> b!1281574 m!1176563))

(declare-fun m!1176565 () Bool)

(assert (=> start!108698 m!1176565))

(declare-fun m!1176567 () Bool)

(assert (=> start!108698 m!1176567))

(declare-fun m!1176569 () Bool)

(assert (=> start!108698 m!1176569))

(declare-fun m!1176571 () Bool)

(assert (=> mapNonEmpty!52043 m!1176571))

(declare-fun m!1176573 () Bool)

(assert (=> b!1281576 m!1176573))

(assert (=> b!1281576 m!1176573))

(declare-fun m!1176575 () Bool)

(assert (=> b!1281576 m!1176575))

(check-sat b_and!46083 (not b!1281576) (not b_next!28021) (not b!1281571) (not start!108698) tp_is_empty!33661 (not b!1281574) (not mapNonEmpty!52043))
(check-sat b_and!46083 (not b_next!28021))
