; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79356 () Bool)

(assert start!79356)

(declare-fun b_free!17401 () Bool)

(declare-fun b_next!17401 () Bool)

(assert (=> start!79356 (= b_free!17401 (not b_next!17401))))

(declare-fun tp!60645 () Bool)

(declare-fun b_and!28477 () Bool)

(assert (=> start!79356 (= tp!60645 b_and!28477)))

(declare-fun b!930535 () Bool)

(declare-fun res!626373 () Bool)

(declare-fun e!522616 () Bool)

(assert (=> b!930535 (=> (not res!626373) (not e!522616))))

(declare-datatypes ((array!55827 0))(
  ( (array!55828 (arr!26854 (Array (_ BitVec 32) (_ BitVec 64))) (size!27314 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55827)

(declare-datatypes ((List!18873 0))(
  ( (Nil!18870) (Cons!18869 (h!20021 (_ BitVec 64)) (t!26922 List!18873)) )
))
(declare-fun arrayNoDuplicates!0 (array!55827 (_ BitVec 32) List!18873) Bool)

(assert (=> b!930535 (= res!626373 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18870))))

(declare-fun mapNonEmpty!31620 () Bool)

(declare-fun mapRes!31620 () Bool)

(declare-fun tp!60644 () Bool)

(declare-fun e!522615 () Bool)

(assert (=> mapNonEmpty!31620 (= mapRes!31620 (and tp!60644 e!522615))))

(declare-fun mapKey!31620 () (_ BitVec 32))

(declare-datatypes ((V!31511 0))(
  ( (V!31512 (val!10005 Int)) )
))
(declare-datatypes ((ValueCell!9473 0))(
  ( (ValueCellFull!9473 (v!12520 V!31511)) (EmptyCell!9473) )
))
(declare-fun mapValue!31620 () ValueCell!9473)

(declare-fun mapRest!31620 () (Array (_ BitVec 32) ValueCell!9473))

(declare-datatypes ((array!55829 0))(
  ( (array!55830 (arr!26855 (Array (_ BitVec 32) ValueCell!9473)) (size!27315 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55829)

(assert (=> mapNonEmpty!31620 (= (arr!26855 _values!1231) (store mapRest!31620 mapKey!31620 mapValue!31620))))

(declare-fun res!626371 () Bool)

(assert (=> start!79356 (=> (not res!626371) (not e!522616))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79356 (= res!626371 (validMask!0 mask!1881))))

(assert (=> start!79356 e!522616))

(assert (=> start!79356 true))

(declare-fun tp_is_empty!19909 () Bool)

(assert (=> start!79356 tp_is_empty!19909))

(declare-fun e!522614 () Bool)

(declare-fun array_inv!21008 (array!55829) Bool)

(assert (=> start!79356 (and (array_inv!21008 _values!1231) e!522614)))

(assert (=> start!79356 tp!60645))

(declare-fun array_inv!21009 (array!55827) Bool)

(assert (=> start!79356 (array_inv!21009 _keys!1487)))

(declare-fun b!930536 () Bool)

(assert (=> b!930536 (= e!522615 tp_is_empty!19909)))

(declare-fun b!930537 () Bool)

(declare-fun e!522617 () Bool)

(assert (=> b!930537 (= e!522614 (and e!522617 mapRes!31620))))

(declare-fun condMapEmpty!31620 () Bool)

(declare-fun mapDefault!31620 () ValueCell!9473)

(assert (=> b!930537 (= condMapEmpty!31620 (= (arr!26855 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9473)) mapDefault!31620)))))

(declare-fun b!930538 () Bool)

(declare-fun res!626368 () Bool)

(assert (=> b!930538 (=> (not res!626368) (not e!522616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55827 (_ BitVec 32)) Bool)

(assert (=> b!930538 (= res!626368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930539 () Bool)

(declare-fun e!522619 () Bool)

(assert (=> b!930539 (= e!522619 false)))

(declare-fun lt!419461 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31511)

(declare-fun minValue!1173 () V!31511)

(declare-datatypes ((tuple2!13076 0))(
  ( (tuple2!13077 (_1!6549 (_ BitVec 64)) (_2!6549 V!31511)) )
))
(declare-datatypes ((List!18874 0))(
  ( (Nil!18871) (Cons!18870 (h!20022 tuple2!13076) (t!26923 List!18874)) )
))
(declare-datatypes ((ListLongMap!11775 0))(
  ( (ListLongMap!11776 (toList!5903 List!18874)) )
))
(declare-fun contains!4972 (ListLongMap!11775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3150 (array!55827 array!55829 (_ BitVec 32) (_ BitVec 32) V!31511 V!31511 (_ BitVec 32) Int) ListLongMap!11775)

(assert (=> b!930539 (= lt!419461 (contains!4972 (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930540 () Bool)

(assert (=> b!930540 (= e!522616 e!522619)))

(declare-fun res!626369 () Bool)

(assert (=> b!930540 (=> (not res!626369) (not e!522619))))

(declare-fun lt!419462 () ListLongMap!11775)

(assert (=> b!930540 (= res!626369 (contains!4972 lt!419462 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930540 (= lt!419462 (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930541 () Bool)

(declare-fun res!626370 () Bool)

(assert (=> b!930541 (=> (not res!626370) (not e!522619))))

(assert (=> b!930541 (= res!626370 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930542 () Bool)

(declare-fun res!626372 () Bool)

(assert (=> b!930542 (=> (not res!626372) (not e!522616))))

(assert (=> b!930542 (= res!626372 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27314 _keys!1487))))))

(declare-fun b!930543 () Bool)

(declare-fun res!626367 () Bool)

(assert (=> b!930543 (=> (not res!626367) (not e!522619))))

(declare-fun v!791 () V!31511)

(declare-fun apply!746 (ListLongMap!11775 (_ BitVec 64)) V!31511)

(assert (=> b!930543 (= res!626367 (= (apply!746 lt!419462 k0!1099) v!791))))

(declare-fun mapIsEmpty!31620 () Bool)

(assert (=> mapIsEmpty!31620 mapRes!31620))

(declare-fun b!930544 () Bool)

(declare-fun res!626366 () Bool)

(assert (=> b!930544 (=> (not res!626366) (not e!522616))))

(assert (=> b!930544 (= res!626366 (and (= (size!27315 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27314 _keys!1487) (size!27315 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930545 () Bool)

(assert (=> b!930545 (= e!522617 tp_is_empty!19909)))

(assert (= (and start!79356 res!626371) b!930544))

(assert (= (and b!930544 res!626366) b!930538))

(assert (= (and b!930538 res!626368) b!930535))

(assert (= (and b!930535 res!626373) b!930542))

(assert (= (and b!930542 res!626372) b!930540))

(assert (= (and b!930540 res!626369) b!930543))

(assert (= (and b!930543 res!626367) b!930541))

(assert (= (and b!930541 res!626370) b!930539))

(assert (= (and b!930537 condMapEmpty!31620) mapIsEmpty!31620))

(assert (= (and b!930537 (not condMapEmpty!31620)) mapNonEmpty!31620))

(get-info :version)

(assert (= (and mapNonEmpty!31620 ((_ is ValueCellFull!9473) mapValue!31620)) b!930536))

(assert (= (and b!930537 ((_ is ValueCellFull!9473) mapDefault!31620)) b!930545))

(assert (= start!79356 b!930537))

(declare-fun m!865423 () Bool)

(assert (=> b!930540 m!865423))

(declare-fun m!865425 () Bool)

(assert (=> b!930540 m!865425))

(declare-fun m!865427 () Bool)

(assert (=> b!930538 m!865427))

(declare-fun m!865429 () Bool)

(assert (=> b!930543 m!865429))

(declare-fun m!865431 () Bool)

(assert (=> b!930535 m!865431))

(declare-fun m!865433 () Bool)

(assert (=> start!79356 m!865433))

(declare-fun m!865435 () Bool)

(assert (=> start!79356 m!865435))

(declare-fun m!865437 () Bool)

(assert (=> start!79356 m!865437))

(declare-fun m!865439 () Bool)

(assert (=> b!930539 m!865439))

(assert (=> b!930539 m!865439))

(declare-fun m!865441 () Bool)

(assert (=> b!930539 m!865441))

(declare-fun m!865443 () Bool)

(assert (=> mapNonEmpty!31620 m!865443))

(check-sat (not b!930539) (not b!930535) b_and!28477 (not mapNonEmpty!31620) tp_is_empty!19909 (not start!79356) (not b!930540) (not b!930543) (not b!930538) (not b_next!17401))
(check-sat b_and!28477 (not b_next!17401))
