; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79250 () Bool)

(assert start!79250)

(declare-fun b_free!17463 () Bool)

(declare-fun b_next!17463 () Bool)

(assert (=> start!79250 (= b_free!17463 (not b_next!17463))))

(declare-fun tp!60829 () Bool)

(declare-fun b_and!28529 () Bool)

(assert (=> start!79250 (= tp!60829 b_and!28529)))

(declare-fun res!626738 () Bool)

(declare-fun e!522593 () Bool)

(assert (=> start!79250 (=> (not res!626738) (not e!522593))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79250 (= res!626738 (validMask!0 mask!1881))))

(assert (=> start!79250 e!522593))

(assert (=> start!79250 true))

(declare-datatypes ((V!31593 0))(
  ( (V!31594 (val!10036 Int)) )
))
(declare-datatypes ((ValueCell!9504 0))(
  ( (ValueCellFull!9504 (v!12554 V!31593)) (EmptyCell!9504) )
))
(declare-datatypes ((array!55886 0))(
  ( (array!55887 (arr!26888 (Array (_ BitVec 32) ValueCell!9504)) (size!27347 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55886)

(declare-fun e!522590 () Bool)

(declare-fun array_inv!20926 (array!55886) Bool)

(assert (=> start!79250 (and (array_inv!20926 _values!1231) e!522590)))

(assert (=> start!79250 tp!60829))

(declare-datatypes ((array!55888 0))(
  ( (array!55889 (arr!26889 (Array (_ BitVec 32) (_ BitVec 64))) (size!27348 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55888)

(declare-fun array_inv!20927 (array!55888) Bool)

(assert (=> start!79250 (array_inv!20927 _keys!1487)))

(declare-fun tp_is_empty!19971 () Bool)

(assert (=> start!79250 tp_is_empty!19971))

(declare-fun b!930627 () Bool)

(declare-fun res!626743 () Bool)

(assert (=> b!930627 (=> (not res!626743) (not e!522593))))

(declare-datatypes ((List!18925 0))(
  ( (Nil!18922) (Cons!18921 (h!20067 (_ BitVec 64)) (t!26982 List!18925)) )
))
(declare-fun arrayNoDuplicates!0 (array!55888 (_ BitVec 32) List!18925) Bool)

(assert (=> b!930627 (= res!626743 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18922))))

(declare-fun mapIsEmpty!31713 () Bool)

(declare-fun mapRes!31713 () Bool)

(assert (=> mapIsEmpty!31713 mapRes!31713))

(declare-fun b!930628 () Bool)

(declare-fun res!626739 () Bool)

(assert (=> b!930628 (=> (not res!626739) (not e!522593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55888 (_ BitVec 32)) Bool)

(assert (=> b!930628 (= res!626739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930629 () Bool)

(declare-fun res!626740 () Bool)

(assert (=> b!930629 (=> (not res!626740) (not e!522593))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930629 (= res!626740 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27348 _keys!1487))))))

(declare-fun mapNonEmpty!31713 () Bool)

(declare-fun tp!60830 () Bool)

(declare-fun e!522594 () Bool)

(assert (=> mapNonEmpty!31713 (= mapRes!31713 (and tp!60830 e!522594))))

(declare-fun mapValue!31713 () ValueCell!9504)

(declare-fun mapKey!31713 () (_ BitVec 32))

(declare-fun mapRest!31713 () (Array (_ BitVec 32) ValueCell!9504))

(assert (=> mapNonEmpty!31713 (= (arr!26888 _values!1231) (store mapRest!31713 mapKey!31713 mapValue!31713))))

(declare-fun b!930630 () Bool)

(declare-fun e!522595 () Bool)

(assert (=> b!930630 (= e!522595 false)))

(declare-fun lt!419269 () V!31593)

(declare-datatypes ((tuple2!13134 0))(
  ( (tuple2!13135 (_1!6578 (_ BitVec 64)) (_2!6578 V!31593)) )
))
(declare-datatypes ((List!18926 0))(
  ( (Nil!18923) (Cons!18922 (h!20068 tuple2!13134) (t!26983 List!18926)) )
))
(declare-datatypes ((ListLongMap!11831 0))(
  ( (ListLongMap!11832 (toList!5931 List!18926)) )
))
(declare-fun lt!419268 () ListLongMap!11831)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!753 (ListLongMap!11831 (_ BitVec 64)) V!31593)

(assert (=> b!930630 (= lt!419269 (apply!753 lt!419268 k0!1099))))

(declare-fun b!930631 () Bool)

(assert (=> b!930631 (= e!522593 e!522595)))

(declare-fun res!626742 () Bool)

(assert (=> b!930631 (=> (not res!626742) (not e!522595))))

(declare-fun contains!4981 (ListLongMap!11831 (_ BitVec 64)) Bool)

(assert (=> b!930631 (= res!626742 (contains!4981 lt!419268 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31593)

(declare-fun minValue!1173 () V!31593)

(declare-fun getCurrentListMap!3172 (array!55888 array!55886 (_ BitVec 32) (_ BitVec 32) V!31593 V!31593 (_ BitVec 32) Int) ListLongMap!11831)

(assert (=> b!930631 (= lt!419268 (getCurrentListMap!3172 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930632 () Bool)

(declare-fun e!522591 () Bool)

(assert (=> b!930632 (= e!522591 tp_is_empty!19971)))

(declare-fun b!930633 () Bool)

(assert (=> b!930633 (= e!522590 (and e!522591 mapRes!31713))))

(declare-fun condMapEmpty!31713 () Bool)

(declare-fun mapDefault!31713 () ValueCell!9504)

(assert (=> b!930633 (= condMapEmpty!31713 (= (arr!26888 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9504)) mapDefault!31713)))))

(declare-fun b!930634 () Bool)

(assert (=> b!930634 (= e!522594 tp_is_empty!19971)))

(declare-fun b!930635 () Bool)

(declare-fun res!626741 () Bool)

(assert (=> b!930635 (=> (not res!626741) (not e!522593))))

(assert (=> b!930635 (= res!626741 (and (= (size!27347 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27348 _keys!1487) (size!27347 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79250 res!626738) b!930635))

(assert (= (and b!930635 res!626741) b!930628))

(assert (= (and b!930628 res!626739) b!930627))

(assert (= (and b!930627 res!626743) b!930629))

(assert (= (and b!930629 res!626740) b!930631))

(assert (= (and b!930631 res!626742) b!930630))

(assert (= (and b!930633 condMapEmpty!31713) mapIsEmpty!31713))

(assert (= (and b!930633 (not condMapEmpty!31713)) mapNonEmpty!31713))

(get-info :version)

(assert (= (and mapNonEmpty!31713 ((_ is ValueCellFull!9504) mapValue!31713)) b!930634))

(assert (= (and b!930633 ((_ is ValueCellFull!9504) mapDefault!31713)) b!930632))

(assert (= start!79250 b!930633))

(declare-fun m!864777 () Bool)

(assert (=> b!930630 m!864777))

(declare-fun m!864779 () Bool)

(assert (=> mapNonEmpty!31713 m!864779))

(declare-fun m!864781 () Bool)

(assert (=> b!930628 m!864781))

(declare-fun m!864783 () Bool)

(assert (=> b!930631 m!864783))

(declare-fun m!864785 () Bool)

(assert (=> b!930631 m!864785))

(declare-fun m!864787 () Bool)

(assert (=> start!79250 m!864787))

(declare-fun m!864789 () Bool)

(assert (=> start!79250 m!864789))

(declare-fun m!864791 () Bool)

(assert (=> start!79250 m!864791))

(declare-fun m!864793 () Bool)

(assert (=> b!930627 m!864793))

(check-sat tp_is_empty!19971 (not b_next!17463) (not b!930627) (not b!930630) (not start!79250) b_and!28529 (not b!930631) (not mapNonEmpty!31713) (not b!930628))
(check-sat b_and!28529 (not b_next!17463))
