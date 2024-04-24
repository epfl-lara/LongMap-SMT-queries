; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108692 () Bool)

(assert start!108692)

(declare-fun b_free!28015 () Bool)

(declare-fun b_next!28015 () Bool)

(assert (=> start!108692 (= b_free!28015 (not b_next!28015))))

(declare-fun tp!99154 () Bool)

(declare-fun b_and!46077 () Bool)

(assert (=> start!108692 (= tp!99154 b_and!46077)))

(declare-fun res!850905 () Bool)

(declare-fun e!732325 () Bool)

(assert (=> start!108692 (=> (not res!850905) (not e!732325))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108692 (= res!850905 (validMask!0 mask!2175))))

(assert (=> start!108692 e!732325))

(declare-fun tp_is_empty!33655 () Bool)

(assert (=> start!108692 tp_is_empty!33655))

(assert (=> start!108692 true))

(declare-datatypes ((V!49977 0))(
  ( (V!49978 (val!16902 Int)) )
))
(declare-datatypes ((ValueCell!15929 0))(
  ( (ValueCellFull!15929 (v!19497 V!49977)) (EmptyCell!15929) )
))
(declare-datatypes ((array!84415 0))(
  ( (array!84416 (arr!40707 (Array (_ BitVec 32) ValueCell!15929)) (size!41258 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84415)

(declare-fun e!732323 () Bool)

(declare-fun array_inv!31097 (array!84415) Bool)

(assert (=> start!108692 (and (array_inv!31097 _values!1445) e!732323)))

(declare-datatypes ((array!84417 0))(
  ( (array!84418 (arr!40708 (Array (_ BitVec 32) (_ BitVec 64))) (size!41259 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84417)

(declare-fun array_inv!31098 (array!84417) Bool)

(assert (=> start!108692 (array_inv!31098 _keys!1741)))

(assert (=> start!108692 tp!99154))

(declare-fun b!1281498 () Bool)

(declare-fun e!732327 () Bool)

(assert (=> b!1281498 (= e!732327 tp_is_empty!33655)))

(declare-fun b!1281499 () Bool)

(declare-fun res!850902 () Bool)

(assert (=> b!1281499 (=> (not res!850902) (not e!732325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84417 (_ BitVec 32)) Bool)

(assert (=> b!1281499 (= res!850902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52034 () Bool)

(declare-fun mapRes!52034 () Bool)

(assert (=> mapIsEmpty!52034 mapRes!52034))

(declare-fun b!1281500 () Bool)

(declare-fun res!850903 () Bool)

(assert (=> b!1281500 (=> (not res!850903) (not e!732325))))

(declare-datatypes ((List!28862 0))(
  ( (Nil!28859) (Cons!28858 (h!30076 (_ BitVec 64)) (t!42394 List!28862)) )
))
(declare-fun arrayNoDuplicates!0 (array!84417 (_ BitVec 32) List!28862) Bool)

(assert (=> b!1281500 (= res!850903 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28859))))

(declare-fun b!1281501 () Bool)

(declare-fun res!850901 () Bool)

(assert (=> b!1281501 (=> (not res!850901) (not e!732325))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281501 (= res!850901 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41259 _keys!1741))))))

(declare-fun b!1281502 () Bool)

(assert (=> b!1281502 (= e!732325 false)))

(declare-fun zeroValue!1387 () V!49977)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!49977)

(declare-fun lt!576579 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21648 0))(
  ( (tuple2!21649 (_1!10835 (_ BitVec 64)) (_2!10835 V!49977)) )
))
(declare-datatypes ((List!28863 0))(
  ( (Nil!28860) (Cons!28859 (h!30077 tuple2!21648) (t!42395 List!28863)) )
))
(declare-datatypes ((ListLongMap!19313 0))(
  ( (ListLongMap!19314 (toList!9672 List!28863)) )
))
(declare-fun contains!7801 (ListLongMap!19313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4741 (array!84417 array!84415 (_ BitVec 32) (_ BitVec 32) V!49977 V!49977 (_ BitVec 32) Int) ListLongMap!19313)

(assert (=> b!1281502 (= lt!576579 (contains!7801 (getCurrentListMap!4741 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281503 () Bool)

(declare-fun res!850904 () Bool)

(assert (=> b!1281503 (=> (not res!850904) (not e!732325))))

(assert (=> b!1281503 (= res!850904 (and (= (size!41258 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41259 _keys!1741) (size!41258 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52034 () Bool)

(declare-fun tp!99155 () Bool)

(declare-fun e!732326 () Bool)

(assert (=> mapNonEmpty!52034 (= mapRes!52034 (and tp!99155 e!732326))))

(declare-fun mapRest!52034 () (Array (_ BitVec 32) ValueCell!15929))

(declare-fun mapValue!52034 () ValueCell!15929)

(declare-fun mapKey!52034 () (_ BitVec 32))

(assert (=> mapNonEmpty!52034 (= (arr!40707 _values!1445) (store mapRest!52034 mapKey!52034 mapValue!52034))))

(declare-fun b!1281504 () Bool)

(assert (=> b!1281504 (= e!732326 tp_is_empty!33655)))

(declare-fun b!1281505 () Bool)

(assert (=> b!1281505 (= e!732323 (and e!732327 mapRes!52034))))

(declare-fun condMapEmpty!52034 () Bool)

(declare-fun mapDefault!52034 () ValueCell!15929)

(assert (=> b!1281505 (= condMapEmpty!52034 (= (arr!40707 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15929)) mapDefault!52034)))))

(assert (= (and start!108692 res!850905) b!1281503))

(assert (= (and b!1281503 res!850904) b!1281499))

(assert (= (and b!1281499 res!850902) b!1281500))

(assert (= (and b!1281500 res!850903) b!1281501))

(assert (= (and b!1281501 res!850901) b!1281502))

(assert (= (and b!1281505 condMapEmpty!52034) mapIsEmpty!52034))

(assert (= (and b!1281505 (not condMapEmpty!52034)) mapNonEmpty!52034))

(get-info :version)

(assert (= (and mapNonEmpty!52034 ((_ is ValueCellFull!15929) mapValue!52034)) b!1281504))

(assert (= (and b!1281505 ((_ is ValueCellFull!15929) mapDefault!52034)) b!1281498))

(assert (= start!108692 b!1281505))

(declare-fun m!1176513 () Bool)

(assert (=> mapNonEmpty!52034 m!1176513))

(declare-fun m!1176515 () Bool)

(assert (=> b!1281500 m!1176515))

(declare-fun m!1176517 () Bool)

(assert (=> b!1281502 m!1176517))

(assert (=> b!1281502 m!1176517))

(declare-fun m!1176519 () Bool)

(assert (=> b!1281502 m!1176519))

(declare-fun m!1176521 () Bool)

(assert (=> b!1281499 m!1176521))

(declare-fun m!1176523 () Bool)

(assert (=> start!108692 m!1176523))

(declare-fun m!1176525 () Bool)

(assert (=> start!108692 m!1176525))

(declare-fun m!1176527 () Bool)

(assert (=> start!108692 m!1176527))

(check-sat (not mapNonEmpty!52034) (not start!108692) (not b!1281499) b_and!46077 tp_is_empty!33655 (not b!1281500) (not b!1281502) (not b_next!28015))
(check-sat b_and!46077 (not b_next!28015))
