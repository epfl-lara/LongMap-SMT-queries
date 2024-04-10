; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79154 () Bool)

(assert start!79154)

(declare-fun b_free!17367 () Bool)

(declare-fun b_next!17367 () Bool)

(assert (=> start!79154 (= b_free!17367 (not b_next!17367))))

(declare-fun tp!60541 () Bool)

(declare-fun b_and!28433 () Bool)

(assert (=> start!79154 (= tp!60541 b_and!28433)))

(declare-fun res!625651 () Bool)

(declare-fun e!521726 () Bool)

(assert (=> start!79154 (=> (not res!625651) (not e!521726))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79154 (= res!625651 (validMask!0 mask!1881))))

(assert (=> start!79154 e!521726))

(assert (=> start!79154 true))

(declare-datatypes ((V!31465 0))(
  ( (V!31466 (val!9988 Int)) )
))
(declare-datatypes ((ValueCell!9456 0))(
  ( (ValueCellFull!9456 (v!12506 V!31465)) (EmptyCell!9456) )
))
(declare-datatypes ((array!55704 0))(
  ( (array!55705 (arr!26797 (Array (_ BitVec 32) ValueCell!9456)) (size!27256 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55704)

(declare-fun e!521731 () Bool)

(declare-fun array_inv!20856 (array!55704) Bool)

(assert (=> start!79154 (and (array_inv!20856 _values!1231) e!521731)))

(assert (=> start!79154 tp!60541))

(declare-datatypes ((array!55706 0))(
  ( (array!55707 (arr!26798 (Array (_ BitVec 32) (_ BitVec 64))) (size!27257 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55706)

(declare-fun array_inv!20857 (array!55706) Bool)

(assert (=> start!79154 (array_inv!20857 _keys!1487)))

(declare-fun tp_is_empty!19875 () Bool)

(assert (=> start!79154 tp_is_empty!19875))

(declare-fun b!929106 () Bool)

(declare-fun e!521727 () Bool)

(assert (=> b!929106 (= e!521727 tp_is_empty!19875)))

(declare-fun b!929107 () Bool)

(declare-fun res!625650 () Bool)

(assert (=> b!929107 (=> (not res!625650) (not e!521726))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929107 (= res!625650 (and (= (size!27256 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27257 _keys!1487) (size!27256 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929108 () Bool)

(declare-fun res!625653 () Bool)

(assert (=> b!929108 (=> (not res!625653) (not e!521726))))

(declare-datatypes ((List!18851 0))(
  ( (Nil!18848) (Cons!18847 (h!19993 (_ BitVec 64)) (t!26908 List!18851)) )
))
(declare-fun arrayNoDuplicates!0 (array!55706 (_ BitVec 32) List!18851) Bool)

(assert (=> b!929108 (= res!625653 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18848))))

(declare-fun mapIsEmpty!31569 () Bool)

(declare-fun mapRes!31569 () Bool)

(assert (=> mapIsEmpty!31569 mapRes!31569))

(declare-fun b!929109 () Bool)

(declare-fun e!521729 () Bool)

(assert (=> b!929109 (= e!521729 false)))

(declare-fun lt!419007 () V!31465)

(declare-datatypes ((tuple2!13056 0))(
  ( (tuple2!13057 (_1!6539 (_ BitVec 64)) (_2!6539 V!31465)) )
))
(declare-datatypes ((List!18852 0))(
  ( (Nil!18849) (Cons!18848 (h!19994 tuple2!13056) (t!26909 List!18852)) )
))
(declare-datatypes ((ListLongMap!11753 0))(
  ( (ListLongMap!11754 (toList!5892 List!18852)) )
))
(declare-fun lt!419008 () ListLongMap!11753)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!719 (ListLongMap!11753 (_ BitVec 64)) V!31465)

(assert (=> b!929109 (= lt!419007 (apply!719 lt!419008 k0!1099))))

(declare-fun mapNonEmpty!31569 () Bool)

(declare-fun tp!60542 () Bool)

(assert (=> mapNonEmpty!31569 (= mapRes!31569 (and tp!60542 e!521727))))

(declare-fun mapRest!31569 () (Array (_ BitVec 32) ValueCell!9456))

(declare-fun mapKey!31569 () (_ BitVec 32))

(declare-fun mapValue!31569 () ValueCell!9456)

(assert (=> mapNonEmpty!31569 (= (arr!26797 _values!1231) (store mapRest!31569 mapKey!31569 mapValue!31569))))

(declare-fun b!929110 () Bool)

(assert (=> b!929110 (= e!521726 e!521729)))

(declare-fun res!625652 () Bool)

(assert (=> b!929110 (=> (not res!625652) (not e!521729))))

(declare-fun contains!4947 (ListLongMap!11753 (_ BitVec 64)) Bool)

(assert (=> b!929110 (= res!625652 (contains!4947 lt!419008 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31465)

(declare-fun minValue!1173 () V!31465)

(declare-fun getCurrentListMap!3138 (array!55706 array!55704 (_ BitVec 32) (_ BitVec 32) V!31465 V!31465 (_ BitVec 32) Int) ListLongMap!11753)

(assert (=> b!929110 (= lt!419008 (getCurrentListMap!3138 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929111 () Bool)

(declare-fun e!521730 () Bool)

(assert (=> b!929111 (= e!521731 (and e!521730 mapRes!31569))))

(declare-fun condMapEmpty!31569 () Bool)

(declare-fun mapDefault!31569 () ValueCell!9456)

(assert (=> b!929111 (= condMapEmpty!31569 (= (arr!26797 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9456)) mapDefault!31569)))))

(declare-fun b!929112 () Bool)

(declare-fun res!625654 () Bool)

(assert (=> b!929112 (=> (not res!625654) (not e!521726))))

(assert (=> b!929112 (= res!625654 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27257 _keys!1487))))))

(declare-fun b!929113 () Bool)

(assert (=> b!929113 (= e!521730 tp_is_empty!19875)))

(declare-fun b!929114 () Bool)

(declare-fun res!625649 () Bool)

(assert (=> b!929114 (=> (not res!625649) (not e!521726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55706 (_ BitVec 32)) Bool)

(assert (=> b!929114 (= res!625649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79154 res!625651) b!929107))

(assert (= (and b!929107 res!625650) b!929114))

(assert (= (and b!929114 res!625649) b!929108))

(assert (= (and b!929108 res!625653) b!929112))

(assert (= (and b!929112 res!625654) b!929110))

(assert (= (and b!929110 res!625652) b!929109))

(assert (= (and b!929111 condMapEmpty!31569) mapIsEmpty!31569))

(assert (= (and b!929111 (not condMapEmpty!31569)) mapNonEmpty!31569))

(get-info :version)

(assert (= (and mapNonEmpty!31569 ((_ is ValueCellFull!9456) mapValue!31569)) b!929106))

(assert (= (and b!929111 ((_ is ValueCellFull!9456) mapDefault!31569)) b!929113))

(assert (= start!79154 b!929111))

(declare-fun m!863787 () Bool)

(assert (=> b!929110 m!863787))

(declare-fun m!863789 () Bool)

(assert (=> b!929110 m!863789))

(declare-fun m!863791 () Bool)

(assert (=> b!929108 m!863791))

(declare-fun m!863793 () Bool)

(assert (=> b!929109 m!863793))

(declare-fun m!863795 () Bool)

(assert (=> start!79154 m!863795))

(declare-fun m!863797 () Bool)

(assert (=> start!79154 m!863797))

(declare-fun m!863799 () Bool)

(assert (=> start!79154 m!863799))

(declare-fun m!863801 () Bool)

(assert (=> mapNonEmpty!31569 m!863801))

(declare-fun m!863803 () Bool)

(assert (=> b!929114 m!863803))

(check-sat (not b!929108) (not mapNonEmpty!31569) (not b!929114) (not b!929109) (not start!79154) (not b!929110) tp_is_empty!19875 (not b_next!17367) b_and!28433)
(check-sat b_and!28433 (not b_next!17367))
