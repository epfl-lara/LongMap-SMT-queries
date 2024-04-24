; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79326 () Bool)

(assert start!79326)

(declare-fun b_free!17371 () Bool)

(declare-fun b_next!17371 () Bool)

(assert (=> start!79326 (= b_free!17371 (not b_next!17371))))

(declare-fun tp!60554 () Bool)

(declare-fun b_and!28447 () Bool)

(assert (=> start!79326 (= tp!60554 b_and!28447)))

(declare-fun b!930063 () Bool)

(declare-fun res!626031 () Bool)

(declare-fun e!522348 () Bool)

(assert (=> b!930063 (=> (not res!626031) (not e!522348))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55767 0))(
  ( (array!55768 (arr!26824 (Array (_ BitVec 32) (_ BitVec 64))) (size!27284 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55767)

(assert (=> b!930063 (= res!626031 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27284 _keys!1487))))))

(declare-fun b!930064 () Bool)

(declare-fun res!626030 () Bool)

(assert (=> b!930064 (=> (not res!626030) (not e!522348))))

(declare-datatypes ((List!18851 0))(
  ( (Nil!18848) (Cons!18847 (h!19999 (_ BitVec 64)) (t!26900 List!18851)) )
))
(declare-fun arrayNoDuplicates!0 (array!55767 (_ BitVec 32) List!18851) Bool)

(assert (=> b!930064 (= res!626030 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18848))))

(declare-fun b!930065 () Bool)

(declare-fun e!522345 () Bool)

(assert (=> b!930065 (= e!522348 e!522345)))

(declare-fun res!626032 () Bool)

(assert (=> b!930065 (=> (not res!626032) (not e!522345))))

(declare-datatypes ((V!31471 0))(
  ( (V!31472 (val!9990 Int)) )
))
(declare-datatypes ((tuple2!13048 0))(
  ( (tuple2!13049 (_1!6535 (_ BitVec 64)) (_2!6535 V!31471)) )
))
(declare-datatypes ((List!18852 0))(
  ( (Nil!18849) (Cons!18848 (h!20000 tuple2!13048) (t!26901 List!18852)) )
))
(declare-datatypes ((ListLongMap!11747 0))(
  ( (ListLongMap!11748 (toList!5889 List!18852)) )
))
(declare-fun lt!419380 () ListLongMap!11747)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4959 (ListLongMap!11747 (_ BitVec 64)) Bool)

(assert (=> b!930065 (= res!626032 (contains!4959 lt!419380 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9458 0))(
  ( (ValueCellFull!9458 (v!12505 V!31471)) (EmptyCell!9458) )
))
(declare-datatypes ((array!55769 0))(
  ( (array!55770 (arr!26825 (Array (_ BitVec 32) ValueCell!9458)) (size!27285 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55769)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31471)

(declare-fun minValue!1173 () V!31471)

(declare-fun getCurrentListMap!3137 (array!55767 array!55769 (_ BitVec 32) (_ BitVec 32) V!31471 V!31471 (_ BitVec 32) Int) ListLongMap!11747)

(assert (=> b!930065 (= lt!419380 (getCurrentListMap!3137 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930066 () Bool)

(declare-fun e!522344 () Bool)

(declare-fun tp_is_empty!19879 () Bool)

(assert (=> b!930066 (= e!522344 tp_is_empty!19879)))

(declare-fun b!930067 () Bool)

(assert (=> b!930067 (= e!522345 false)))

(declare-fun lt!419381 () V!31471)

(declare-fun apply!735 (ListLongMap!11747 (_ BitVec 64)) V!31471)

(assert (=> b!930067 (= lt!419381 (apply!735 lt!419380 k0!1099))))

(declare-fun b!930068 () Bool)

(declare-fun e!522347 () Bool)

(declare-fun e!522349 () Bool)

(declare-fun mapRes!31575 () Bool)

(assert (=> b!930068 (= e!522347 (and e!522349 mapRes!31575))))

(declare-fun condMapEmpty!31575 () Bool)

(declare-fun mapDefault!31575 () ValueCell!9458)

(assert (=> b!930068 (= condMapEmpty!31575 (= (arr!26825 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9458)) mapDefault!31575)))))

(declare-fun b!930069 () Bool)

(assert (=> b!930069 (= e!522349 tp_is_empty!19879)))

(declare-fun b!930070 () Bool)

(declare-fun res!626029 () Bool)

(assert (=> b!930070 (=> (not res!626029) (not e!522348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55767 (_ BitVec 32)) Bool)

(assert (=> b!930070 (= res!626029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!626033 () Bool)

(assert (=> start!79326 (=> (not res!626033) (not e!522348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79326 (= res!626033 (validMask!0 mask!1881))))

(assert (=> start!79326 e!522348))

(assert (=> start!79326 true))

(declare-fun array_inv!20988 (array!55769) Bool)

(assert (=> start!79326 (and (array_inv!20988 _values!1231) e!522347)))

(assert (=> start!79326 tp!60554))

(declare-fun array_inv!20989 (array!55767) Bool)

(assert (=> start!79326 (array_inv!20989 _keys!1487)))

(assert (=> start!79326 tp_is_empty!19879))

(declare-fun b!930071 () Bool)

(declare-fun res!626034 () Bool)

(assert (=> b!930071 (=> (not res!626034) (not e!522348))))

(assert (=> b!930071 (= res!626034 (and (= (size!27285 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27284 _keys!1487) (size!27285 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31575 () Bool)

(declare-fun tp!60555 () Bool)

(assert (=> mapNonEmpty!31575 (= mapRes!31575 (and tp!60555 e!522344))))

(declare-fun mapValue!31575 () ValueCell!9458)

(declare-fun mapRest!31575 () (Array (_ BitVec 32) ValueCell!9458))

(declare-fun mapKey!31575 () (_ BitVec 32))

(assert (=> mapNonEmpty!31575 (= (arr!26825 _values!1231) (store mapRest!31575 mapKey!31575 mapValue!31575))))

(declare-fun mapIsEmpty!31575 () Bool)

(assert (=> mapIsEmpty!31575 mapRes!31575))

(assert (= (and start!79326 res!626033) b!930071))

(assert (= (and b!930071 res!626034) b!930070))

(assert (= (and b!930070 res!626029) b!930064))

(assert (= (and b!930064 res!626030) b!930063))

(assert (= (and b!930063 res!626031) b!930065))

(assert (= (and b!930065 res!626032) b!930067))

(assert (= (and b!930068 condMapEmpty!31575) mapIsEmpty!31575))

(assert (= (and b!930068 (not condMapEmpty!31575)) mapNonEmpty!31575))

(get-info :version)

(assert (= (and mapNonEmpty!31575 ((_ is ValueCellFull!9458) mapValue!31575)) b!930066))

(assert (= (and b!930068 ((_ is ValueCellFull!9458) mapDefault!31575)) b!930069))

(assert (= start!79326 b!930068))

(declare-fun m!865117 () Bool)

(assert (=> start!79326 m!865117))

(declare-fun m!865119 () Bool)

(assert (=> start!79326 m!865119))

(declare-fun m!865121 () Bool)

(assert (=> start!79326 m!865121))

(declare-fun m!865123 () Bool)

(assert (=> mapNonEmpty!31575 m!865123))

(declare-fun m!865125 () Bool)

(assert (=> b!930070 m!865125))

(declare-fun m!865127 () Bool)

(assert (=> b!930067 m!865127))

(declare-fun m!865129 () Bool)

(assert (=> b!930064 m!865129))

(declare-fun m!865131 () Bool)

(assert (=> b!930065 m!865131))

(declare-fun m!865133 () Bool)

(assert (=> b!930065 m!865133))

(check-sat (not mapNonEmpty!31575) (not b_next!17371) (not b!930070) (not b!930065) (not b!930067) (not b!930064) tp_is_empty!19879 (not start!79326) b_and!28447)
(check-sat b_and!28447 (not b_next!17371))
