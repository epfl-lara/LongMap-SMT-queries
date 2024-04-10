; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79286 () Bool)

(assert start!79286)

(declare-fun b_free!17499 () Bool)

(declare-fun b_next!17499 () Bool)

(assert (=> start!79286 (= b_free!17499 (not b_next!17499))))

(declare-fun tp!60937 () Bool)

(declare-fun b_and!28565 () Bool)

(assert (=> start!79286 (= tp!60937 b_and!28565)))

(declare-fun res!627066 () Bool)

(declare-fun e!522919 () Bool)

(assert (=> start!79286 (=> (not res!627066) (not e!522919))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79286 (= res!627066 (validMask!0 mask!1881))))

(assert (=> start!79286 e!522919))

(assert (=> start!79286 true))

(declare-datatypes ((V!31641 0))(
  ( (V!31642 (val!10054 Int)) )
))
(declare-datatypes ((ValueCell!9522 0))(
  ( (ValueCellFull!9522 (v!12572 V!31641)) (EmptyCell!9522) )
))
(declare-datatypes ((array!55954 0))(
  ( (array!55955 (arr!26922 (Array (_ BitVec 32) ValueCell!9522)) (size!27381 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55954)

(declare-fun e!522917 () Bool)

(declare-fun array_inv!20954 (array!55954) Bool)

(assert (=> start!79286 (and (array_inv!20954 _values!1231) e!522917)))

(assert (=> start!79286 tp!60937))

(declare-datatypes ((array!55956 0))(
  ( (array!55957 (arr!26923 (Array (_ BitVec 32) (_ BitVec 64))) (size!27382 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55956)

(declare-fun array_inv!20955 (array!55956) Bool)

(assert (=> start!79286 (array_inv!20955 _keys!1487)))

(declare-fun tp_is_empty!20007 () Bool)

(assert (=> start!79286 tp_is_empty!20007))

(declare-fun b!931113 () Bool)

(declare-fun res!627067 () Bool)

(assert (=> b!931113 (=> (not res!627067) (not e!522919))))

(declare-datatypes ((List!18952 0))(
  ( (Nil!18949) (Cons!18948 (h!20094 (_ BitVec 64)) (t!27009 List!18952)) )
))
(declare-fun arrayNoDuplicates!0 (array!55956 (_ BitVec 32) List!18952) Bool)

(assert (=> b!931113 (= res!627067 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18949))))

(declare-fun b!931114 () Bool)

(declare-fun e!522914 () Bool)

(assert (=> b!931114 (= e!522914 tp_is_empty!20007)))

(declare-fun b!931115 () Bool)

(declare-fun mapRes!31767 () Bool)

(assert (=> b!931115 (= e!522917 (and e!522914 mapRes!31767))))

(declare-fun condMapEmpty!31767 () Bool)

(declare-fun mapDefault!31767 () ValueCell!9522)

(assert (=> b!931115 (= condMapEmpty!31767 (= (arr!26922 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9522)) mapDefault!31767)))))

(declare-fun b!931116 () Bool)

(declare-fun e!522918 () Bool)

(assert (=> b!931116 (= e!522918 tp_is_empty!20007)))

(declare-fun b!931117 () Bool)

(declare-fun res!627063 () Bool)

(assert (=> b!931117 (=> (not res!627063) (not e!522919))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931117 (= res!627063 (and (= (size!27381 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27382 _keys!1487) (size!27381 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931118 () Bool)

(declare-fun res!627064 () Bool)

(assert (=> b!931118 (=> (not res!627064) (not e!522919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55956 (_ BitVec 32)) Bool)

(assert (=> b!931118 (= res!627064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931119 () Bool)

(declare-fun e!522916 () Bool)

(assert (=> b!931119 (= e!522919 e!522916)))

(declare-fun res!627062 () Bool)

(assert (=> b!931119 (=> (not res!627062) (not e!522916))))

(declare-datatypes ((tuple2!13166 0))(
  ( (tuple2!13167 (_1!6594 (_ BitVec 64)) (_2!6594 V!31641)) )
))
(declare-datatypes ((List!18953 0))(
  ( (Nil!18950) (Cons!18949 (h!20095 tuple2!13166) (t!27010 List!18953)) )
))
(declare-datatypes ((ListLongMap!11863 0))(
  ( (ListLongMap!11864 (toList!5947 List!18953)) )
))
(declare-fun lt!419377 () ListLongMap!11863)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4994 (ListLongMap!11863 (_ BitVec 64)) Bool)

(assert (=> b!931119 (= res!627062 (contains!4994 lt!419377 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31641)

(declare-fun minValue!1173 () V!31641)

(declare-fun getCurrentListMap!3185 (array!55956 array!55954 (_ BitVec 32) (_ BitVec 32) V!31641 V!31641 (_ BitVec 32) Int) ListLongMap!11863)

(assert (=> b!931119 (= lt!419377 (getCurrentListMap!3185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31767 () Bool)

(declare-fun tp!60938 () Bool)

(assert (=> mapNonEmpty!31767 (= mapRes!31767 (and tp!60938 e!522918))))

(declare-fun mapRest!31767 () (Array (_ BitVec 32) ValueCell!9522))

(declare-fun mapKey!31767 () (_ BitVec 32))

(declare-fun mapValue!31767 () ValueCell!9522)

(assert (=> mapNonEmpty!31767 (= (arr!26922 _values!1231) (store mapRest!31767 mapKey!31767 mapValue!31767))))

(declare-fun mapIsEmpty!31767 () Bool)

(assert (=> mapIsEmpty!31767 mapRes!31767))

(declare-fun b!931120 () Bool)

(declare-fun res!627065 () Bool)

(assert (=> b!931120 (=> (not res!627065) (not e!522919))))

(assert (=> b!931120 (= res!627065 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27382 _keys!1487))))))

(declare-fun b!931121 () Bool)

(assert (=> b!931121 (= e!522916 false)))

(declare-fun lt!419376 () V!31641)

(declare-fun apply!767 (ListLongMap!11863 (_ BitVec 64)) V!31641)

(assert (=> b!931121 (= lt!419376 (apply!767 lt!419377 k0!1099))))

(assert (= (and start!79286 res!627066) b!931117))

(assert (= (and b!931117 res!627063) b!931118))

(assert (= (and b!931118 res!627064) b!931113))

(assert (= (and b!931113 res!627067) b!931120))

(assert (= (and b!931120 res!627065) b!931119))

(assert (= (and b!931119 res!627062) b!931121))

(assert (= (and b!931115 condMapEmpty!31767) mapIsEmpty!31767))

(assert (= (and b!931115 (not condMapEmpty!31767)) mapNonEmpty!31767))

(get-info :version)

(assert (= (and mapNonEmpty!31767 ((_ is ValueCellFull!9522) mapValue!31767)) b!931116))

(assert (= (and b!931115 ((_ is ValueCellFull!9522) mapDefault!31767)) b!931114))

(assert (= start!79286 b!931115))

(declare-fun m!865101 () Bool)

(assert (=> b!931118 m!865101))

(declare-fun m!865103 () Bool)

(assert (=> b!931113 m!865103))

(declare-fun m!865105 () Bool)

(assert (=> mapNonEmpty!31767 m!865105))

(declare-fun m!865107 () Bool)

(assert (=> start!79286 m!865107))

(declare-fun m!865109 () Bool)

(assert (=> start!79286 m!865109))

(declare-fun m!865111 () Bool)

(assert (=> start!79286 m!865111))

(declare-fun m!865113 () Bool)

(assert (=> b!931121 m!865113))

(declare-fun m!865115 () Bool)

(assert (=> b!931119 m!865115))

(declare-fun m!865117 () Bool)

(assert (=> b!931119 m!865117))

(check-sat b_and!28565 (not start!79286) (not b!931113) (not b_next!17499) (not b!931121) (not mapNonEmpty!31767) (not b!931118) tp_is_empty!20007 (not b!931119))
(check-sat b_and!28565 (not b_next!17499))
