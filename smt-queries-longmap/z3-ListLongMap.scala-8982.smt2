; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108652 () Bool)

(assert start!108652)

(declare-fun b_free!28165 () Bool)

(declare-fun b_next!28165 () Bool)

(assert (=> start!108652 (= b_free!28165 (not b_next!28165))))

(declare-fun tp!99611 () Bool)

(declare-fun b_and!46213 () Bool)

(assert (=> start!108652 (= tp!99611 b_and!46213)))

(declare-fun mapIsEmpty!52265 () Bool)

(declare-fun mapRes!52265 () Bool)

(assert (=> mapIsEmpty!52265 mapRes!52265))

(declare-fun b!1282453 () Bool)

(declare-fun e!732767 () Bool)

(assert (=> b!1282453 (= e!732767 false)))

(declare-datatypes ((V!50177 0))(
  ( (V!50178 (val!16977 Int)) )
))
(declare-fun zeroValue!1387 () V!50177)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576366 () Bool)

(declare-datatypes ((ValueCell!16004 0))(
  ( (ValueCellFull!16004 (v!19578 V!50177)) (EmptyCell!16004) )
))
(declare-datatypes ((array!84573 0))(
  ( (array!84574 (arr!40789 (Array (_ BitVec 32) ValueCell!16004)) (size!41341 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84573)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84575 0))(
  ( (array!84576 (arr!40790 (Array (_ BitVec 32) (_ BitVec 64))) (size!41342 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84575)

(declare-fun minValue!1387 () V!50177)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21804 0))(
  ( (tuple2!21805 (_1!10913 (_ BitVec 64)) (_2!10913 V!50177)) )
))
(declare-datatypes ((List!28993 0))(
  ( (Nil!28990) (Cons!28989 (h!30198 tuple2!21804) (t!42529 List!28993)) )
))
(declare-datatypes ((ListLongMap!19461 0))(
  ( (ListLongMap!19462 (toList!9746 List!28993)) )
))
(declare-fun contains!7793 (ListLongMap!19461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4720 (array!84575 array!84573 (_ BitVec 32) (_ BitVec 32) V!50177 V!50177 (_ BitVec 32) Int) ListLongMap!19461)

(assert (=> b!1282453 (= lt!576366 (contains!7793 (getCurrentListMap!4720 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!851858 () Bool)

(assert (=> start!108652 (=> (not res!851858) (not e!732767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108652 (= res!851858 (validMask!0 mask!2175))))

(assert (=> start!108652 e!732767))

(declare-fun tp_is_empty!33805 () Bool)

(assert (=> start!108652 tp_is_empty!33805))

(assert (=> start!108652 true))

(declare-fun e!732771 () Bool)

(declare-fun array_inv!31101 (array!84573) Bool)

(assert (=> start!108652 (and (array_inv!31101 _values!1445) e!732771)))

(declare-fun array_inv!31102 (array!84575) Bool)

(assert (=> start!108652 (array_inv!31102 _keys!1741)))

(assert (=> start!108652 tp!99611))

(declare-fun b!1282454 () Bool)

(declare-fun e!732770 () Bool)

(assert (=> b!1282454 (= e!732771 (and e!732770 mapRes!52265))))

(declare-fun condMapEmpty!52265 () Bool)

(declare-fun mapDefault!52265 () ValueCell!16004)

(assert (=> b!1282454 (= condMapEmpty!52265 (= (arr!40789 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16004)) mapDefault!52265)))))

(declare-fun b!1282455 () Bool)

(declare-fun res!851856 () Bool)

(assert (=> b!1282455 (=> (not res!851856) (not e!732767))))

(declare-datatypes ((List!28994 0))(
  ( (Nil!28991) (Cons!28990 (h!30199 (_ BitVec 64)) (t!42530 List!28994)) )
))
(declare-fun arrayNoDuplicates!0 (array!84575 (_ BitVec 32) List!28994) Bool)

(assert (=> b!1282455 (= res!851856 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28991))))

(declare-fun mapNonEmpty!52265 () Bool)

(declare-fun tp!99612 () Bool)

(declare-fun e!732769 () Bool)

(assert (=> mapNonEmpty!52265 (= mapRes!52265 (and tp!99612 e!732769))))

(declare-fun mapRest!52265 () (Array (_ BitVec 32) ValueCell!16004))

(declare-fun mapValue!52265 () ValueCell!16004)

(declare-fun mapKey!52265 () (_ BitVec 32))

(assert (=> mapNonEmpty!52265 (= (arr!40789 _values!1445) (store mapRest!52265 mapKey!52265 mapValue!52265))))

(declare-fun b!1282456 () Bool)

(declare-fun res!851859 () Bool)

(assert (=> b!1282456 (=> (not res!851859) (not e!732767))))

(assert (=> b!1282456 (= res!851859 (and (= (size!41341 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41342 _keys!1741) (size!41341 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282457 () Bool)

(assert (=> b!1282457 (= e!732770 tp_is_empty!33805)))

(declare-fun b!1282458 () Bool)

(declare-fun res!851855 () Bool)

(assert (=> b!1282458 (=> (not res!851855) (not e!732767))))

(assert (=> b!1282458 (= res!851855 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41342 _keys!1741))))))

(declare-fun b!1282459 () Bool)

(assert (=> b!1282459 (= e!732769 tp_is_empty!33805)))

(declare-fun b!1282460 () Bool)

(declare-fun res!851857 () Bool)

(assert (=> b!1282460 (=> (not res!851857) (not e!732767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84575 (_ BitVec 32)) Bool)

(assert (=> b!1282460 (= res!851857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108652 res!851858) b!1282456))

(assert (= (and b!1282456 res!851859) b!1282460))

(assert (= (and b!1282460 res!851857) b!1282455))

(assert (= (and b!1282455 res!851856) b!1282458))

(assert (= (and b!1282458 res!851855) b!1282453))

(assert (= (and b!1282454 condMapEmpty!52265) mapIsEmpty!52265))

(assert (= (and b!1282454 (not condMapEmpty!52265)) mapNonEmpty!52265))

(get-info :version)

(assert (= (and mapNonEmpty!52265 ((_ is ValueCellFull!16004) mapValue!52265)) b!1282459))

(assert (= (and b!1282454 ((_ is ValueCellFull!16004) mapDefault!52265)) b!1282457))

(assert (= start!108652 b!1282454))

(declare-fun m!1176193 () Bool)

(assert (=> mapNonEmpty!52265 m!1176193))

(declare-fun m!1176195 () Bool)

(assert (=> start!108652 m!1176195))

(declare-fun m!1176197 () Bool)

(assert (=> start!108652 m!1176197))

(declare-fun m!1176199 () Bool)

(assert (=> start!108652 m!1176199))

(declare-fun m!1176201 () Bool)

(assert (=> b!1282453 m!1176201))

(assert (=> b!1282453 m!1176201))

(declare-fun m!1176203 () Bool)

(assert (=> b!1282453 m!1176203))

(declare-fun m!1176205 () Bool)

(assert (=> b!1282455 m!1176205))

(declare-fun m!1176207 () Bool)

(assert (=> b!1282460 m!1176207))

(check-sat (not mapNonEmpty!52265) (not b!1282453) (not b!1282460) b_and!46213 (not b_next!28165) (not start!108652) tp_is_empty!33805 (not b!1282455))
(check-sat b_and!46213 (not b_next!28165))
