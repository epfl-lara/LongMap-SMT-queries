; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83456 () Bool)

(assert start!83456)

(declare-fun b_free!19443 () Bool)

(declare-fun b_next!19443 () Bool)

(assert (=> start!83456 (= b_free!19443 (not b_next!19443))))

(declare-fun tp!67617 () Bool)

(declare-fun b_and!31045 () Bool)

(assert (=> start!83456 (= tp!67617 b_and!31045)))

(declare-fun b!974797 () Bool)

(declare-fun e!549429 () Bool)

(declare-fun e!549426 () Bool)

(declare-fun mapRes!35530 () Bool)

(assert (=> b!974797 (= e!549429 (and e!549426 mapRes!35530))))

(declare-fun condMapEmpty!35530 () Bool)

(declare-datatypes ((V!34779 0))(
  ( (V!34780 (val!11224 Int)) )
))
(declare-datatypes ((ValueCell!10692 0))(
  ( (ValueCellFull!10692 (v!13783 V!34779)) (EmptyCell!10692) )
))
(declare-datatypes ((array!60733 0))(
  ( (array!60734 (arr!29230 (Array (_ BitVec 32) ValueCell!10692)) (size!29709 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60733)

(declare-fun mapDefault!35530 () ValueCell!10692)

(assert (=> b!974797 (= condMapEmpty!35530 (= (arr!29230 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10692)) mapDefault!35530)))))

(declare-fun b!974798 () Bool)

(declare-fun res!652530 () Bool)

(declare-fun e!549428 () Bool)

(assert (=> b!974798 (=> (not res!652530) (not e!549428))))

(declare-datatypes ((array!60735 0))(
  ( (array!60736 (arr!29231 (Array (_ BitVec 32) (_ BitVec 64))) (size!29710 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60735)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974798 (= res!652530 (validKeyInArray!0 (select (arr!29231 _keys!1717) i!822)))))

(declare-fun b!974799 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974799 (= e!549428 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29710 _keys!1717)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14428 0))(
  ( (tuple2!14429 (_1!7225 (_ BitVec 64)) (_2!7225 V!34779)) )
))
(declare-datatypes ((List!20282 0))(
  ( (Nil!20279) (Cons!20278 (h!21440 tuple2!14428) (t!28759 List!20282)) )
))
(declare-datatypes ((ListLongMap!13125 0))(
  ( (ListLongMap!13126 (toList!6578 List!20282)) )
))
(declare-fun lt!432800 () ListLongMap!13125)

(declare-fun zeroValue!1367 () V!34779)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34779)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3811 (array!60735 array!60733 (_ BitVec 32) (_ BitVec 32) V!34779 V!34779 (_ BitVec 32) Int) ListLongMap!13125)

(assert (=> b!974799 (= lt!432800 (getCurrentListMap!3811 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!652535 () Bool)

(assert (=> start!83456 (=> (not res!652535) (not e!549428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83456 (= res!652535 (validMask!0 mask!2147))))

(assert (=> start!83456 e!549428))

(assert (=> start!83456 true))

(declare-fun array_inv!22609 (array!60733) Bool)

(assert (=> start!83456 (and (array_inv!22609 _values!1425) e!549429)))

(declare-fun tp_is_empty!22347 () Bool)

(assert (=> start!83456 tp_is_empty!22347))

(assert (=> start!83456 tp!67617))

(declare-fun array_inv!22610 (array!60735) Bool)

(assert (=> start!83456 (array_inv!22610 _keys!1717)))

(declare-fun b!974800 () Bool)

(assert (=> b!974800 (= e!549426 tp_is_empty!22347)))

(declare-fun b!974801 () Bool)

(declare-fun res!652536 () Bool)

(assert (=> b!974801 (=> (not res!652536) (not e!549428))))

(declare-fun contains!5662 (ListLongMap!13125 (_ BitVec 64)) Bool)

(assert (=> b!974801 (= res!652536 (contains!5662 (getCurrentListMap!3811 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29231 _keys!1717) i!822)))))

(declare-fun b!974802 () Bool)

(declare-fun res!652531 () Bool)

(assert (=> b!974802 (=> (not res!652531) (not e!549428))))

(declare-datatypes ((List!20283 0))(
  ( (Nil!20280) (Cons!20279 (h!21441 (_ BitVec 64)) (t!28760 List!20283)) )
))
(declare-fun arrayNoDuplicates!0 (array!60735 (_ BitVec 32) List!20283) Bool)

(assert (=> b!974802 (= res!652531 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20280))))

(declare-fun b!974803 () Bool)

(declare-fun e!549427 () Bool)

(assert (=> b!974803 (= e!549427 tp_is_empty!22347)))

(declare-fun mapNonEmpty!35530 () Bool)

(declare-fun tp!67616 () Bool)

(assert (=> mapNonEmpty!35530 (= mapRes!35530 (and tp!67616 e!549427))))

(declare-fun mapValue!35530 () ValueCell!10692)

(declare-fun mapKey!35530 () (_ BitVec 32))

(declare-fun mapRest!35530 () (Array (_ BitVec 32) ValueCell!10692))

(assert (=> mapNonEmpty!35530 (= (arr!29230 _values!1425) (store mapRest!35530 mapKey!35530 mapValue!35530))))

(declare-fun b!974804 () Bool)

(declare-fun res!652532 () Bool)

(assert (=> b!974804 (=> (not res!652532) (not e!549428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60735 (_ BitVec 32)) Bool)

(assert (=> b!974804 (= res!652532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35530 () Bool)

(assert (=> mapIsEmpty!35530 mapRes!35530))

(declare-fun b!974805 () Bool)

(declare-fun res!652534 () Bool)

(assert (=> b!974805 (=> (not res!652534) (not e!549428))))

(assert (=> b!974805 (= res!652534 (and (= (size!29709 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29710 _keys!1717) (size!29709 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974806 () Bool)

(declare-fun res!652533 () Bool)

(assert (=> b!974806 (=> (not res!652533) (not e!549428))))

(assert (=> b!974806 (= res!652533 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29710 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29710 _keys!1717))))))

(assert (= (and start!83456 res!652535) b!974805))

(assert (= (and b!974805 res!652534) b!974804))

(assert (= (and b!974804 res!652532) b!974802))

(assert (= (and b!974802 res!652531) b!974806))

(assert (= (and b!974806 res!652533) b!974798))

(assert (= (and b!974798 res!652530) b!974801))

(assert (= (and b!974801 res!652536) b!974799))

(assert (= (and b!974797 condMapEmpty!35530) mapIsEmpty!35530))

(assert (= (and b!974797 (not condMapEmpty!35530)) mapNonEmpty!35530))

(get-info :version)

(assert (= (and mapNonEmpty!35530 ((_ is ValueCellFull!10692) mapValue!35530)) b!974803))

(assert (= (and b!974797 ((_ is ValueCellFull!10692) mapDefault!35530)) b!974800))

(assert (= start!83456 b!974797))

(declare-fun m!902213 () Bool)

(assert (=> mapNonEmpty!35530 m!902213))

(declare-fun m!902215 () Bool)

(assert (=> b!974798 m!902215))

(assert (=> b!974798 m!902215))

(declare-fun m!902217 () Bool)

(assert (=> b!974798 m!902217))

(declare-fun m!902219 () Bool)

(assert (=> start!83456 m!902219))

(declare-fun m!902221 () Bool)

(assert (=> start!83456 m!902221))

(declare-fun m!902223 () Bool)

(assert (=> start!83456 m!902223))

(declare-fun m!902225 () Bool)

(assert (=> b!974804 m!902225))

(declare-fun m!902227 () Bool)

(assert (=> b!974799 m!902227))

(declare-fun m!902229 () Bool)

(assert (=> b!974802 m!902229))

(declare-fun m!902231 () Bool)

(assert (=> b!974801 m!902231))

(assert (=> b!974801 m!902215))

(assert (=> b!974801 m!902231))

(assert (=> b!974801 m!902215))

(declare-fun m!902233 () Bool)

(assert (=> b!974801 m!902233))

(check-sat tp_is_empty!22347 (not b!974802) (not mapNonEmpty!35530) (not b!974804) (not b_next!19443) (not start!83456) (not b!974799) (not b!974798) (not b!974801) b_and!31045)
(check-sat b_and!31045 (not b_next!19443))
