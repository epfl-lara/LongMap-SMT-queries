; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79392 () Bool)

(assert start!79392)

(declare-fun b_free!17437 () Bool)

(declare-fun b_next!17437 () Bool)

(assert (=> start!79392 (= b_free!17437 (not b_next!17437))))

(declare-fun tp!60752 () Bool)

(declare-fun b_and!28513 () Bool)

(assert (=> start!79392 (= tp!60752 b_and!28513)))

(declare-fun b!931138 () Bool)

(declare-fun res!626810 () Bool)

(declare-fun e!522939 () Bool)

(assert (=> b!931138 (=> (not res!626810) (not e!522939))))

(declare-datatypes ((array!55895 0))(
  ( (array!55896 (arr!26888 (Array (_ BitVec 32) (_ BitVec 64))) (size!27348 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55895)

(declare-datatypes ((List!18899 0))(
  ( (Nil!18896) (Cons!18895 (h!20047 (_ BitVec 64)) (t!26948 List!18899)) )
))
(declare-fun arrayNoDuplicates!0 (array!55895 (_ BitVec 32) List!18899) Bool)

(assert (=> b!931138 (= res!626810 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18896))))

(declare-fun b!931139 () Bool)

(declare-fun e!522943 () Bool)

(assert (=> b!931139 (= e!522939 e!522943)))

(declare-fun res!626813 () Bool)

(assert (=> b!931139 (=> (not res!626813) (not e!522943))))

(declare-datatypes ((V!31559 0))(
  ( (V!31560 (val!10023 Int)) )
))
(declare-datatypes ((tuple2!13108 0))(
  ( (tuple2!13109 (_1!6565 (_ BitVec 64)) (_2!6565 V!31559)) )
))
(declare-datatypes ((List!18900 0))(
  ( (Nil!18897) (Cons!18896 (h!20048 tuple2!13108) (t!26949 List!18900)) )
))
(declare-datatypes ((ListLongMap!11807 0))(
  ( (ListLongMap!11808 (toList!5919 List!18900)) )
))
(declare-fun lt!419560 () ListLongMap!11807)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4986 (ListLongMap!11807 (_ BitVec 64)) Bool)

(assert (=> b!931139 (= res!626813 (contains!4986 lt!419560 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9491 0))(
  ( (ValueCellFull!9491 (v!12538 V!31559)) (EmptyCell!9491) )
))
(declare-datatypes ((array!55897 0))(
  ( (array!55898 (arr!26889 (Array (_ BitVec 32) ValueCell!9491)) (size!27349 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55897)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31559)

(declare-fun minValue!1173 () V!31559)

(declare-fun getCurrentListMap!3164 (array!55895 array!55897 (_ BitVec 32) (_ BitVec 32) V!31559 V!31559 (_ BitVec 32) Int) ListLongMap!11807)

(assert (=> b!931139 (= lt!419560 (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931140 () Bool)

(declare-fun res!626811 () Bool)

(assert (=> b!931140 (=> (not res!626811) (not e!522939))))

(assert (=> b!931140 (= res!626811 (and (= (size!27349 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27348 _keys!1487) (size!27349 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931141 () Bool)

(declare-fun res!626814 () Bool)

(assert (=> b!931141 (=> (not res!626814) (not e!522943))))

(assert (=> b!931141 (= res!626814 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931142 () Bool)

(declare-fun res!626812 () Bool)

(assert (=> b!931142 (=> (not res!626812) (not e!522939))))

(assert (=> b!931142 (= res!626812 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27348 _keys!1487))))))

(declare-fun res!626807 () Bool)

(assert (=> start!79392 (=> (not res!626807) (not e!522939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79392 (= res!626807 (validMask!0 mask!1881))))

(assert (=> start!79392 e!522939))

(assert (=> start!79392 true))

(declare-fun tp_is_empty!19945 () Bool)

(assert (=> start!79392 tp_is_empty!19945))

(declare-fun e!522941 () Bool)

(declare-fun array_inv!21028 (array!55897) Bool)

(assert (=> start!79392 (and (array_inv!21028 _values!1231) e!522941)))

(assert (=> start!79392 tp!60752))

(declare-fun array_inv!21029 (array!55895) Bool)

(assert (=> start!79392 (array_inv!21029 _keys!1487)))

(declare-fun b!931143 () Bool)

(assert (=> b!931143 (= e!522943 false)))

(declare-fun lt!419561 () Bool)

(assert (=> b!931143 (= lt!419561 (contains!4986 (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!931144 () Bool)

(declare-fun res!626808 () Bool)

(assert (=> b!931144 (=> (not res!626808) (not e!522943))))

(declare-fun v!791 () V!31559)

(declare-fun apply!757 (ListLongMap!11807 (_ BitVec 64)) V!31559)

(assert (=> b!931144 (= res!626808 (= (apply!757 lt!419560 k0!1099) v!791))))

(declare-fun mapNonEmpty!31674 () Bool)

(declare-fun mapRes!31674 () Bool)

(declare-fun tp!60753 () Bool)

(declare-fun e!522938 () Bool)

(assert (=> mapNonEmpty!31674 (= mapRes!31674 (and tp!60753 e!522938))))

(declare-fun mapValue!31674 () ValueCell!9491)

(declare-fun mapRest!31674 () (Array (_ BitVec 32) ValueCell!9491))

(declare-fun mapKey!31674 () (_ BitVec 32))

(assert (=> mapNonEmpty!31674 (= (arr!26889 _values!1231) (store mapRest!31674 mapKey!31674 mapValue!31674))))

(declare-fun b!931145 () Bool)

(declare-fun res!626809 () Bool)

(assert (=> b!931145 (=> (not res!626809) (not e!522939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55895 (_ BitVec 32)) Bool)

(assert (=> b!931145 (= res!626809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931146 () Bool)

(assert (=> b!931146 (= e!522938 tp_is_empty!19945)))

(declare-fun b!931147 () Bool)

(declare-fun e!522940 () Bool)

(assert (=> b!931147 (= e!522941 (and e!522940 mapRes!31674))))

(declare-fun condMapEmpty!31674 () Bool)

(declare-fun mapDefault!31674 () ValueCell!9491)

(assert (=> b!931147 (= condMapEmpty!31674 (= (arr!26889 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9491)) mapDefault!31674)))))

(declare-fun mapIsEmpty!31674 () Bool)

(assert (=> mapIsEmpty!31674 mapRes!31674))

(declare-fun b!931148 () Bool)

(assert (=> b!931148 (= e!522940 tp_is_empty!19945)))

(assert (= (and start!79392 res!626807) b!931140))

(assert (= (and b!931140 res!626811) b!931145))

(assert (= (and b!931145 res!626809) b!931138))

(assert (= (and b!931138 res!626810) b!931142))

(assert (= (and b!931142 res!626812) b!931139))

(assert (= (and b!931139 res!626813) b!931144))

(assert (= (and b!931144 res!626808) b!931141))

(assert (= (and b!931141 res!626814) b!931143))

(assert (= (and b!931147 condMapEmpty!31674) mapIsEmpty!31674))

(assert (= (and b!931147 (not condMapEmpty!31674)) mapNonEmpty!31674))

(get-info :version)

(assert (= (and mapNonEmpty!31674 ((_ is ValueCellFull!9491) mapValue!31674)) b!931146))

(assert (= (and b!931147 ((_ is ValueCellFull!9491) mapDefault!31674)) b!931148))

(assert (= start!79392 b!931147))

(declare-fun m!865819 () Bool)

(assert (=> b!931144 m!865819))

(declare-fun m!865821 () Bool)

(assert (=> b!931145 m!865821))

(declare-fun m!865823 () Bool)

(assert (=> start!79392 m!865823))

(declare-fun m!865825 () Bool)

(assert (=> start!79392 m!865825))

(declare-fun m!865827 () Bool)

(assert (=> start!79392 m!865827))

(declare-fun m!865829 () Bool)

(assert (=> mapNonEmpty!31674 m!865829))

(declare-fun m!865831 () Bool)

(assert (=> b!931138 m!865831))

(declare-fun m!865833 () Bool)

(assert (=> b!931143 m!865833))

(assert (=> b!931143 m!865833))

(declare-fun m!865835 () Bool)

(assert (=> b!931143 m!865835))

(declare-fun m!865837 () Bool)

(assert (=> b!931139 m!865837))

(declare-fun m!865839 () Bool)

(assert (=> b!931139 m!865839))

(check-sat (not start!79392) tp_is_empty!19945 (not b!931143) (not b_next!17437) (not b!931144) (not mapNonEmpty!31674) (not b!931145) (not b!931138) b_and!28513 (not b!931139))
(check-sat b_and!28513 (not b_next!17437))
