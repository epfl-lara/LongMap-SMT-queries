; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79196 () Bool)

(assert start!79196)

(declare-fun b_free!17409 () Bool)

(declare-fun b_next!17409 () Bool)

(assert (=> start!79196 (= b_free!17409 (not b_next!17409))))

(declare-fun tp!60667 () Bool)

(declare-fun b_and!28475 () Bool)

(assert (=> start!79196 (= tp!60667 b_and!28475)))

(declare-fun b!929765 () Bool)

(declare-fun e!522105 () Bool)

(declare-fun e!522104 () Bool)

(declare-fun mapRes!31632 () Bool)

(assert (=> b!929765 (= e!522105 (and e!522104 mapRes!31632))))

(declare-fun condMapEmpty!31632 () Bool)

(declare-datatypes ((V!31521 0))(
  ( (V!31522 (val!10009 Int)) )
))
(declare-datatypes ((ValueCell!9477 0))(
  ( (ValueCellFull!9477 (v!12527 V!31521)) (EmptyCell!9477) )
))
(declare-datatypes ((array!55786 0))(
  ( (array!55787 (arr!26838 (Array (_ BitVec 32) ValueCell!9477)) (size!27297 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55786)

(declare-fun mapDefault!31632 () ValueCell!9477)

(assert (=> b!929765 (= condMapEmpty!31632 (= (arr!26838 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9477)) mapDefault!31632)))))

(declare-fun b!929766 () Bool)

(declare-fun tp_is_empty!19917 () Bool)

(assert (=> b!929766 (= e!522104 tp_is_empty!19917)))

(declare-fun b!929767 () Bool)

(declare-fun res!626122 () Bool)

(declare-fun e!522106 () Bool)

(assert (=> b!929767 (=> (not res!626122) (not e!522106))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55788 0))(
  ( (array!55789 (arr!26839 (Array (_ BitVec 32) (_ BitVec 64))) (size!27298 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55788)

(assert (=> b!929767 (= res!626122 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27298 _keys!1487))))))

(declare-fun b!929768 () Bool)

(declare-fun e!522107 () Bool)

(assert (=> b!929768 (= e!522107 tp_is_empty!19917)))

(declare-fun b!929769 () Bool)

(declare-fun res!626118 () Bool)

(assert (=> b!929769 (=> (not res!626118) (not e!522106))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55788 (_ BitVec 32)) Bool)

(assert (=> b!929769 (= res!626118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929770 () Bool)

(declare-fun res!626125 () Bool)

(declare-fun e!522108 () Bool)

(assert (=> b!929770 (=> (not res!626125) (not e!522108))))

(assert (=> b!929770 (= res!626125 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929771 () Bool)

(declare-fun res!626119 () Bool)

(assert (=> b!929771 (=> (not res!626119) (not e!522106))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929771 (= res!626119 (and (= (size!27297 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27298 _keys!1487) (size!27297 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929772 () Bool)

(declare-fun res!626120 () Bool)

(assert (=> b!929772 (=> (not res!626120) (not e!522108))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31521)

(declare-datatypes ((tuple2!13090 0))(
  ( (tuple2!13091 (_1!6556 (_ BitVec 64)) (_2!6556 V!31521)) )
))
(declare-datatypes ((List!18883 0))(
  ( (Nil!18880) (Cons!18879 (h!20025 tuple2!13090) (t!26940 List!18883)) )
))
(declare-datatypes ((ListLongMap!11787 0))(
  ( (ListLongMap!11788 (toList!5909 List!18883)) )
))
(declare-fun lt!419124 () ListLongMap!11787)

(declare-fun apply!733 (ListLongMap!11787 (_ BitVec 64)) V!31521)

(assert (=> b!929772 (= res!626120 (= (apply!733 lt!419124 k0!1099) v!791))))

(declare-fun mapNonEmpty!31632 () Bool)

(declare-fun tp!60668 () Bool)

(assert (=> mapNonEmpty!31632 (= mapRes!31632 (and tp!60668 e!522107))))

(declare-fun mapValue!31632 () ValueCell!9477)

(declare-fun mapRest!31632 () (Array (_ BitVec 32) ValueCell!9477))

(declare-fun mapKey!31632 () (_ BitVec 32))

(assert (=> mapNonEmpty!31632 (= (arr!26838 _values!1231) (store mapRest!31632 mapKey!31632 mapValue!31632))))

(declare-fun b!929773 () Bool)

(declare-fun res!626123 () Bool)

(assert (=> b!929773 (=> (not res!626123) (not e!522106))))

(declare-datatypes ((List!18884 0))(
  ( (Nil!18881) (Cons!18880 (h!20026 (_ BitVec 64)) (t!26941 List!18884)) )
))
(declare-fun arrayNoDuplicates!0 (array!55788 (_ BitVec 32) List!18884) Bool)

(assert (=> b!929773 (= res!626123 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18881))))

(declare-fun b!929764 () Bool)

(assert (=> b!929764 (= e!522106 e!522108)))

(declare-fun res!626124 () Bool)

(assert (=> b!929764 (=> (not res!626124) (not e!522108))))

(declare-fun contains!4961 (ListLongMap!11787 (_ BitVec 64)) Bool)

(assert (=> b!929764 (= res!626124 (contains!4961 lt!419124 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31521)

(declare-fun minValue!1173 () V!31521)

(declare-fun getCurrentListMap!3152 (array!55788 array!55786 (_ BitVec 32) (_ BitVec 32) V!31521 V!31521 (_ BitVec 32) Int) ListLongMap!11787)

(assert (=> b!929764 (= lt!419124 (getCurrentListMap!3152 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!626121 () Bool)

(assert (=> start!79196 (=> (not res!626121) (not e!522106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79196 (= res!626121 (validMask!0 mask!1881))))

(assert (=> start!79196 e!522106))

(assert (=> start!79196 true))

(assert (=> start!79196 tp_is_empty!19917))

(declare-fun array_inv!20884 (array!55786) Bool)

(assert (=> start!79196 (and (array_inv!20884 _values!1231) e!522105)))

(assert (=> start!79196 tp!60667))

(declare-fun array_inv!20885 (array!55788) Bool)

(assert (=> start!79196 (array_inv!20885 _keys!1487)))

(declare-fun b!929774 () Bool)

(assert (=> b!929774 (= e!522108 false)))

(declare-fun lt!419125 () Bool)

(assert (=> b!929774 (= lt!419125 (contains!4961 (getCurrentListMap!3152 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!31632 () Bool)

(assert (=> mapIsEmpty!31632 mapRes!31632))

(assert (= (and start!79196 res!626121) b!929771))

(assert (= (and b!929771 res!626119) b!929769))

(assert (= (and b!929769 res!626118) b!929773))

(assert (= (and b!929773 res!626123) b!929767))

(assert (= (and b!929767 res!626122) b!929764))

(assert (= (and b!929764 res!626124) b!929772))

(assert (= (and b!929772 res!626120) b!929770))

(assert (= (and b!929770 res!626125) b!929774))

(assert (= (and b!929765 condMapEmpty!31632) mapIsEmpty!31632))

(assert (= (and b!929765 (not condMapEmpty!31632)) mapNonEmpty!31632))

(get-info :version)

(assert (= (and mapNonEmpty!31632 ((_ is ValueCellFull!9477) mapValue!31632)) b!929768))

(assert (= (and b!929765 ((_ is ValueCellFull!9477) mapDefault!31632)) b!929766))

(assert (= start!79196 b!929765))

(declare-fun m!864217 () Bool)

(assert (=> mapNonEmpty!31632 m!864217))

(declare-fun m!864219 () Bool)

(assert (=> b!929772 m!864219))

(declare-fun m!864221 () Bool)

(assert (=> b!929774 m!864221))

(assert (=> b!929774 m!864221))

(declare-fun m!864223 () Bool)

(assert (=> b!929774 m!864223))

(declare-fun m!864225 () Bool)

(assert (=> b!929764 m!864225))

(declare-fun m!864227 () Bool)

(assert (=> b!929764 m!864227))

(declare-fun m!864229 () Bool)

(assert (=> start!79196 m!864229))

(declare-fun m!864231 () Bool)

(assert (=> start!79196 m!864231))

(declare-fun m!864233 () Bool)

(assert (=> start!79196 m!864233))

(declare-fun m!864235 () Bool)

(assert (=> b!929769 m!864235))

(declare-fun m!864237 () Bool)

(assert (=> b!929773 m!864237))

(check-sat (not start!79196) (not b!929774) (not b!929764) (not b!929769) (not b!929773) (not b!929772) (not mapNonEmpty!31632) (not b_next!17409) b_and!28475 tp_is_empty!19917)
(check-sat b_and!28475 (not b_next!17409))
