; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79308 () Bool)

(assert start!79308)

(declare-fun b_free!17353 () Bool)

(declare-fun b_next!17353 () Bool)

(assert (=> start!79308 (= b_free!17353 (not b_next!17353))))

(declare-fun tp!60500 () Bool)

(declare-fun b_and!28429 () Bool)

(assert (=> start!79308 (= tp!60500 b_and!28429)))

(declare-fun b!929820 () Bool)

(declare-fun e!522183 () Bool)

(assert (=> b!929820 (= e!522183 false)))

(declare-datatypes ((V!31447 0))(
  ( (V!31448 (val!9981 Int)) )
))
(declare-fun lt!419327 () V!31447)

(declare-datatypes ((tuple2!13034 0))(
  ( (tuple2!13035 (_1!6528 (_ BitVec 64)) (_2!6528 V!31447)) )
))
(declare-datatypes ((List!18839 0))(
  ( (Nil!18836) (Cons!18835 (h!19987 tuple2!13034) (t!26888 List!18839)) )
))
(declare-datatypes ((ListLongMap!11733 0))(
  ( (ListLongMap!11734 (toList!5882 List!18839)) )
))
(declare-fun lt!419326 () ListLongMap!11733)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!730 (ListLongMap!11733 (_ BitVec 64)) V!31447)

(assert (=> b!929820 (= lt!419327 (apply!730 lt!419326 k0!1099))))

(declare-fun b!929821 () Bool)

(declare-fun e!522186 () Bool)

(declare-fun tp_is_empty!19861 () Bool)

(assert (=> b!929821 (= e!522186 tp_is_empty!19861)))

(declare-fun b!929822 () Bool)

(declare-fun e!522187 () Bool)

(declare-fun e!522184 () Bool)

(declare-fun mapRes!31548 () Bool)

(assert (=> b!929822 (= e!522187 (and e!522184 mapRes!31548))))

(declare-fun condMapEmpty!31548 () Bool)

(declare-datatypes ((ValueCell!9449 0))(
  ( (ValueCellFull!9449 (v!12496 V!31447)) (EmptyCell!9449) )
))
(declare-datatypes ((array!55731 0))(
  ( (array!55732 (arr!26806 (Array (_ BitVec 32) ValueCell!9449)) (size!27266 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55731)

(declare-fun mapDefault!31548 () ValueCell!9449)

(assert (=> b!929822 (= condMapEmpty!31548 (= (arr!26806 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9449)) mapDefault!31548)))))

(declare-fun mapNonEmpty!31548 () Bool)

(declare-fun tp!60501 () Bool)

(assert (=> mapNonEmpty!31548 (= mapRes!31548 (and tp!60501 e!522186))))

(declare-fun mapKey!31548 () (_ BitVec 32))

(declare-fun mapValue!31548 () ValueCell!9449)

(declare-fun mapRest!31548 () (Array (_ BitVec 32) ValueCell!9449))

(assert (=> mapNonEmpty!31548 (= (arr!26806 _values!1231) (store mapRest!31548 mapKey!31548 mapValue!31548))))

(declare-fun b!929823 () Bool)

(declare-fun res!625868 () Bool)

(declare-fun e!522185 () Bool)

(assert (=> b!929823 (=> (not res!625868) (not e!522185))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55733 0))(
  ( (array!55734 (arr!26807 (Array (_ BitVec 32) (_ BitVec 64))) (size!27267 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55733)

(assert (=> b!929823 (= res!625868 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27267 _keys!1487))))))

(declare-fun b!929824 () Bool)

(declare-fun res!625871 () Bool)

(assert (=> b!929824 (=> (not res!625871) (not e!522185))))

(declare-datatypes ((List!18840 0))(
  ( (Nil!18837) (Cons!18836 (h!19988 (_ BitVec 64)) (t!26889 List!18840)) )
))
(declare-fun arrayNoDuplicates!0 (array!55733 (_ BitVec 32) List!18840) Bool)

(assert (=> b!929824 (= res!625871 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18837))))

(declare-fun b!929825 () Bool)

(declare-fun res!625870 () Bool)

(assert (=> b!929825 (=> (not res!625870) (not e!522185))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55733 (_ BitVec 32)) Bool)

(assert (=> b!929825 (= res!625870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929826 () Bool)

(declare-fun res!625872 () Bool)

(assert (=> b!929826 (=> (not res!625872) (not e!522185))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929826 (= res!625872 (and (= (size!27266 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27267 _keys!1487) (size!27266 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929827 () Bool)

(assert (=> b!929827 (= e!522185 e!522183)))

(declare-fun res!625869 () Bool)

(assert (=> b!929827 (=> (not res!625869) (not e!522183))))

(declare-fun contains!4952 (ListLongMap!11733 (_ BitVec 64)) Bool)

(assert (=> b!929827 (= res!625869 (contains!4952 lt!419326 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31447)

(declare-fun minValue!1173 () V!31447)

(declare-fun getCurrentListMap!3130 (array!55733 array!55731 (_ BitVec 32) (_ BitVec 32) V!31447 V!31447 (_ BitVec 32) Int) ListLongMap!11733)

(assert (=> b!929827 (= lt!419326 (getCurrentListMap!3130 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!625867 () Bool)

(assert (=> start!79308 (=> (not res!625867) (not e!522185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79308 (= res!625867 (validMask!0 mask!1881))))

(assert (=> start!79308 e!522185))

(assert (=> start!79308 true))

(declare-fun array_inv!20976 (array!55731) Bool)

(assert (=> start!79308 (and (array_inv!20976 _values!1231) e!522187)))

(assert (=> start!79308 tp!60500))

(declare-fun array_inv!20977 (array!55733) Bool)

(assert (=> start!79308 (array_inv!20977 _keys!1487)))

(assert (=> start!79308 tp_is_empty!19861))

(declare-fun mapIsEmpty!31548 () Bool)

(assert (=> mapIsEmpty!31548 mapRes!31548))

(declare-fun b!929828 () Bool)

(assert (=> b!929828 (= e!522184 tp_is_empty!19861)))

(assert (= (and start!79308 res!625867) b!929826))

(assert (= (and b!929826 res!625872) b!929825))

(assert (= (and b!929825 res!625870) b!929824))

(assert (= (and b!929824 res!625871) b!929823))

(assert (= (and b!929823 res!625868) b!929827))

(assert (= (and b!929827 res!625869) b!929820))

(assert (= (and b!929822 condMapEmpty!31548) mapIsEmpty!31548))

(assert (= (and b!929822 (not condMapEmpty!31548)) mapNonEmpty!31548))

(get-info :version)

(assert (= (and mapNonEmpty!31548 ((_ is ValueCellFull!9449) mapValue!31548)) b!929821))

(assert (= (and b!929822 ((_ is ValueCellFull!9449) mapDefault!31548)) b!929828))

(assert (= start!79308 b!929822))

(declare-fun m!864955 () Bool)

(assert (=> start!79308 m!864955))

(declare-fun m!864957 () Bool)

(assert (=> start!79308 m!864957))

(declare-fun m!864959 () Bool)

(assert (=> start!79308 m!864959))

(declare-fun m!864961 () Bool)

(assert (=> b!929824 m!864961))

(declare-fun m!864963 () Bool)

(assert (=> mapNonEmpty!31548 m!864963))

(declare-fun m!864965 () Bool)

(assert (=> b!929827 m!864965))

(declare-fun m!864967 () Bool)

(assert (=> b!929827 m!864967))

(declare-fun m!864969 () Bool)

(assert (=> b!929825 m!864969))

(declare-fun m!864971 () Bool)

(assert (=> b!929820 m!864971))

(check-sat tp_is_empty!19861 b_and!28429 (not b!929824) (not mapNonEmpty!31548) (not b_next!17353) (not b!929825) (not b!929827) (not start!79308) (not b!929820))
(check-sat b_and!28429 (not b_next!17353))
