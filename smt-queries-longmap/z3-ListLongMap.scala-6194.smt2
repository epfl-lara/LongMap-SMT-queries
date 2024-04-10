; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79274 () Bool)

(assert start!79274)

(declare-fun b_free!17487 () Bool)

(declare-fun b_next!17487 () Bool)

(assert (=> start!79274 (= b_free!17487 (not b_next!17487))))

(declare-fun tp!60901 () Bool)

(declare-fun b_and!28553 () Bool)

(assert (=> start!79274 (= tp!60901 b_and!28553)))

(declare-fun b!930951 () Bool)

(declare-fun res!626954 () Bool)

(declare-fun e!522809 () Bool)

(assert (=> b!930951 (=> (not res!626954) (not e!522809))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55930 0))(
  ( (array!55931 (arr!26910 (Array (_ BitVec 32) (_ BitVec 64))) (size!27369 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55930)

(assert (=> b!930951 (= res!626954 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27369 _keys!1487))))))

(declare-fun res!626959 () Bool)

(assert (=> start!79274 (=> (not res!626959) (not e!522809))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79274 (= res!626959 (validMask!0 mask!1881))))

(assert (=> start!79274 e!522809))

(assert (=> start!79274 true))

(declare-datatypes ((V!31625 0))(
  ( (V!31626 (val!10048 Int)) )
))
(declare-datatypes ((ValueCell!9516 0))(
  ( (ValueCellFull!9516 (v!12566 V!31625)) (EmptyCell!9516) )
))
(declare-datatypes ((array!55932 0))(
  ( (array!55933 (arr!26911 (Array (_ BitVec 32) ValueCell!9516)) (size!27370 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55932)

(declare-fun e!522808 () Bool)

(declare-fun array_inv!20942 (array!55932) Bool)

(assert (=> start!79274 (and (array_inv!20942 _values!1231) e!522808)))

(assert (=> start!79274 tp!60901))

(declare-fun array_inv!20943 (array!55930) Bool)

(assert (=> start!79274 (array_inv!20943 _keys!1487)))

(declare-fun tp_is_empty!19995 () Bool)

(assert (=> start!79274 tp_is_empty!19995))

(declare-fun b!930952 () Bool)

(declare-fun e!522806 () Bool)

(assert (=> b!930952 (= e!522809 e!522806)))

(declare-fun res!626957 () Bool)

(assert (=> b!930952 (=> (not res!626957) (not e!522806))))

(declare-datatypes ((tuple2!13154 0))(
  ( (tuple2!13155 (_1!6588 (_ BitVec 64)) (_2!6588 V!31625)) )
))
(declare-datatypes ((List!18942 0))(
  ( (Nil!18939) (Cons!18938 (h!20084 tuple2!13154) (t!26999 List!18942)) )
))
(declare-datatypes ((ListLongMap!11851 0))(
  ( (ListLongMap!11852 (toList!5941 List!18942)) )
))
(declare-fun lt!419340 () ListLongMap!11851)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4989 (ListLongMap!11851 (_ BitVec 64)) Bool)

(assert (=> b!930952 (= res!626957 (contains!4989 lt!419340 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31625)

(declare-fun minValue!1173 () V!31625)

(declare-fun getCurrentListMap!3180 (array!55930 array!55932 (_ BitVec 32) (_ BitVec 32) V!31625 V!31625 (_ BitVec 32) Int) ListLongMap!11851)

(assert (=> b!930952 (= lt!419340 (getCurrentListMap!3180 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930953 () Bool)

(declare-fun e!522810 () Bool)

(declare-fun mapRes!31749 () Bool)

(assert (=> b!930953 (= e!522808 (and e!522810 mapRes!31749))))

(declare-fun condMapEmpty!31749 () Bool)

(declare-fun mapDefault!31749 () ValueCell!9516)

(assert (=> b!930953 (= condMapEmpty!31749 (= (arr!26911 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9516)) mapDefault!31749)))))

(declare-fun mapIsEmpty!31749 () Bool)

(assert (=> mapIsEmpty!31749 mapRes!31749))

(declare-fun b!930954 () Bool)

(declare-fun res!626955 () Bool)

(assert (=> b!930954 (=> (not res!626955) (not e!522809))))

(assert (=> b!930954 (= res!626955 (and (= (size!27370 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27369 _keys!1487) (size!27370 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930955 () Bool)

(declare-fun res!626958 () Bool)

(assert (=> b!930955 (=> (not res!626958) (not e!522809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55930 (_ BitVec 32)) Bool)

(assert (=> b!930955 (= res!626958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31749 () Bool)

(declare-fun tp!60902 () Bool)

(declare-fun e!522811 () Bool)

(assert (=> mapNonEmpty!31749 (= mapRes!31749 (and tp!60902 e!522811))))

(declare-fun mapRest!31749 () (Array (_ BitVec 32) ValueCell!9516))

(declare-fun mapKey!31749 () (_ BitVec 32))

(declare-fun mapValue!31749 () ValueCell!9516)

(assert (=> mapNonEmpty!31749 (= (arr!26911 _values!1231) (store mapRest!31749 mapKey!31749 mapValue!31749))))

(declare-fun b!930956 () Bool)

(declare-fun res!626956 () Bool)

(assert (=> b!930956 (=> (not res!626956) (not e!522809))))

(declare-datatypes ((List!18943 0))(
  ( (Nil!18940) (Cons!18939 (h!20085 (_ BitVec 64)) (t!27000 List!18943)) )
))
(declare-fun arrayNoDuplicates!0 (array!55930 (_ BitVec 32) List!18943) Bool)

(assert (=> b!930956 (= res!626956 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18940))))

(declare-fun b!930957 () Bool)

(assert (=> b!930957 (= e!522811 tp_is_empty!19995)))

(declare-fun b!930958 () Bool)

(assert (=> b!930958 (= e!522806 false)))

(declare-fun lt!419341 () V!31625)

(declare-fun apply!762 (ListLongMap!11851 (_ BitVec 64)) V!31625)

(assert (=> b!930958 (= lt!419341 (apply!762 lt!419340 k0!1099))))

(declare-fun b!930959 () Bool)

(assert (=> b!930959 (= e!522810 tp_is_empty!19995)))

(assert (= (and start!79274 res!626959) b!930954))

(assert (= (and b!930954 res!626955) b!930955))

(assert (= (and b!930955 res!626958) b!930956))

(assert (= (and b!930956 res!626956) b!930951))

(assert (= (and b!930951 res!626954) b!930952))

(assert (= (and b!930952 res!626957) b!930958))

(assert (= (and b!930953 condMapEmpty!31749) mapIsEmpty!31749))

(assert (= (and b!930953 (not condMapEmpty!31749)) mapNonEmpty!31749))

(get-info :version)

(assert (= (and mapNonEmpty!31749 ((_ is ValueCellFull!9516) mapValue!31749)) b!930957))

(assert (= (and b!930953 ((_ is ValueCellFull!9516) mapDefault!31749)) b!930959))

(assert (= start!79274 b!930953))

(declare-fun m!864993 () Bool)

(assert (=> b!930955 m!864993))

(declare-fun m!864995 () Bool)

(assert (=> b!930958 m!864995))

(declare-fun m!864997 () Bool)

(assert (=> start!79274 m!864997))

(declare-fun m!864999 () Bool)

(assert (=> start!79274 m!864999))

(declare-fun m!865001 () Bool)

(assert (=> start!79274 m!865001))

(declare-fun m!865003 () Bool)

(assert (=> mapNonEmpty!31749 m!865003))

(declare-fun m!865005 () Bool)

(assert (=> b!930956 m!865005))

(declare-fun m!865007 () Bool)

(assert (=> b!930952 m!865007))

(declare-fun m!865009 () Bool)

(assert (=> b!930952 m!865009))

(check-sat (not b_next!17487) (not b!930952) (not b!930956) (not b!930955) (not mapNonEmpty!31749) (not b!930958) (not start!79274) tp_is_empty!19995 b_and!28553)
(check-sat b_and!28553 (not b_next!17487))
