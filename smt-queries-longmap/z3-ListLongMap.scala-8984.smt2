; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108666 () Bool)

(assert start!108666)

(declare-fun b_free!28179 () Bool)

(declare-fun b_next!28179 () Bool)

(assert (=> start!108666 (= b_free!28179 (not b_next!28179))))

(declare-fun tp!99652 () Bool)

(declare-fun b_and!46245 () Bool)

(assert (=> start!108666 (= tp!99652 b_and!46245)))

(declare-fun b!1282685 () Bool)

(declare-fun e!732904 () Bool)

(declare-fun tp_is_empty!33819 () Bool)

(assert (=> b!1282685 (= e!732904 tp_is_empty!33819)))

(declare-fun res!851987 () Bool)

(declare-fun e!732902 () Bool)

(assert (=> start!108666 (=> (not res!851987) (not e!732902))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108666 (= res!851987 (validMask!0 mask!2175))))

(assert (=> start!108666 e!732902))

(assert (=> start!108666 tp_is_empty!33819))

(assert (=> start!108666 true))

(declare-datatypes ((V!50195 0))(
  ( (V!50196 (val!16984 Int)) )
))
(declare-datatypes ((ValueCell!16011 0))(
  ( (ValueCellFull!16011 (v!19586 V!50195)) (EmptyCell!16011) )
))
(declare-datatypes ((array!84706 0))(
  ( (array!84707 (arr!40855 (Array (_ BitVec 32) ValueCell!16011)) (size!41405 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84706)

(declare-fun e!732905 () Bool)

(declare-fun array_inv!30993 (array!84706) Bool)

(assert (=> start!108666 (and (array_inv!30993 _values!1445) e!732905)))

(declare-datatypes ((array!84708 0))(
  ( (array!84709 (arr!40856 (Array (_ BitVec 32) (_ BitVec 64))) (size!41406 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84708)

(declare-fun array_inv!30994 (array!84708) Bool)

(assert (=> start!108666 (array_inv!30994 _keys!1741)))

(assert (=> start!108666 tp!99652))

(declare-fun b!1282686 () Bool)

(declare-fun res!851990 () Bool)

(assert (=> b!1282686 (=> (not res!851990) (not e!732902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84708 (_ BitVec 32)) Bool)

(assert (=> b!1282686 (= res!851990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282687 () Bool)

(declare-fun e!732901 () Bool)

(assert (=> b!1282687 (= e!732901 tp_is_empty!33819)))

(declare-fun mapIsEmpty!52286 () Bool)

(declare-fun mapRes!52286 () Bool)

(assert (=> mapIsEmpty!52286 mapRes!52286))

(declare-fun b!1282688 () Bool)

(assert (=> b!1282688 (= e!732905 (and e!732904 mapRes!52286))))

(declare-fun condMapEmpty!52286 () Bool)

(declare-fun mapDefault!52286 () ValueCell!16011)

(assert (=> b!1282688 (= condMapEmpty!52286 (= (arr!40855 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16011)) mapDefault!52286)))))

(declare-fun b!1282689 () Bool)

(declare-fun res!851988 () Bool)

(assert (=> b!1282689 (=> (not res!851988) (not e!732902))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282689 (= res!851988 (and (= (size!41405 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41406 _keys!1741) (size!41405 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282690 () Bool)

(declare-fun res!851991 () Bool)

(assert (=> b!1282690 (=> (not res!851991) (not e!732902))))

(declare-datatypes ((List!28946 0))(
  ( (Nil!28943) (Cons!28942 (h!30151 (_ BitVec 64)) (t!42490 List!28946)) )
))
(declare-fun arrayNoDuplicates!0 (array!84708 (_ BitVec 32) List!28946) Bool)

(assert (=> b!1282690 (= res!851991 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28943))))

(declare-fun b!1282691 () Bool)

(declare-fun res!851989 () Bool)

(assert (=> b!1282691 (=> (not res!851989) (not e!732902))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282691 (= res!851989 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41406 _keys!1741))))))

(declare-fun b!1282692 () Bool)

(assert (=> b!1282692 (= e!732902 false)))

(declare-fun minValue!1387 () V!50195)

(declare-fun zeroValue!1387 () V!50195)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576565 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21750 0))(
  ( (tuple2!21751 (_1!10886 (_ BitVec 64)) (_2!10886 V!50195)) )
))
(declare-datatypes ((List!28947 0))(
  ( (Nil!28944) (Cons!28943 (h!30152 tuple2!21750) (t!42491 List!28947)) )
))
(declare-datatypes ((ListLongMap!19407 0))(
  ( (ListLongMap!19408 (toList!9719 List!28947)) )
))
(declare-fun contains!7836 (ListLongMap!19407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4803 (array!84708 array!84706 (_ BitVec 32) (_ BitVec 32) V!50195 V!50195 (_ BitVec 32) Int) ListLongMap!19407)

(assert (=> b!1282692 (= lt!576565 (contains!7836 (getCurrentListMap!4803 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52286 () Bool)

(declare-fun tp!99653 () Bool)

(assert (=> mapNonEmpty!52286 (= mapRes!52286 (and tp!99653 e!732901))))

(declare-fun mapKey!52286 () (_ BitVec 32))

(declare-fun mapValue!52286 () ValueCell!16011)

(declare-fun mapRest!52286 () (Array (_ BitVec 32) ValueCell!16011))

(assert (=> mapNonEmpty!52286 (= (arr!40855 _values!1445) (store mapRest!52286 mapKey!52286 mapValue!52286))))

(assert (= (and start!108666 res!851987) b!1282689))

(assert (= (and b!1282689 res!851988) b!1282686))

(assert (= (and b!1282686 res!851990) b!1282690))

(assert (= (and b!1282690 res!851991) b!1282691))

(assert (= (and b!1282691 res!851989) b!1282692))

(assert (= (and b!1282688 condMapEmpty!52286) mapIsEmpty!52286))

(assert (= (and b!1282688 (not condMapEmpty!52286)) mapNonEmpty!52286))

(get-info :version)

(assert (= (and mapNonEmpty!52286 ((_ is ValueCellFull!16011) mapValue!52286)) b!1282687))

(assert (= (and b!1282688 ((_ is ValueCellFull!16011) mapDefault!52286)) b!1282685))

(assert (= start!108666 b!1282688))

(declare-fun m!1176805 () Bool)

(assert (=> mapNonEmpty!52286 m!1176805))

(declare-fun m!1176807 () Bool)

(assert (=> b!1282692 m!1176807))

(assert (=> b!1282692 m!1176807))

(declare-fun m!1176809 () Bool)

(assert (=> b!1282692 m!1176809))

(declare-fun m!1176811 () Bool)

(assert (=> b!1282690 m!1176811))

(declare-fun m!1176813 () Bool)

(assert (=> start!108666 m!1176813))

(declare-fun m!1176815 () Bool)

(assert (=> start!108666 m!1176815))

(declare-fun m!1176817 () Bool)

(assert (=> start!108666 m!1176817))

(declare-fun m!1176819 () Bool)

(assert (=> b!1282686 m!1176819))

(check-sat tp_is_empty!33819 (not mapNonEmpty!52286) (not b!1282690) (not b!1282686) b_and!46245 (not b!1282692) (not b_next!28179) (not start!108666))
(check-sat b_and!46245 (not b_next!28179))
