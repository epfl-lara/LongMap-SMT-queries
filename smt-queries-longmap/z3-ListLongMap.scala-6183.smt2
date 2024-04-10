; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79208 () Bool)

(assert start!79208)

(declare-fun b_free!17421 () Bool)

(declare-fun b_next!17421 () Bool)

(assert (=> start!79208 (= b_free!17421 (not b_next!17421))))

(declare-fun tp!60704 () Bool)

(declare-fun b_and!28487 () Bool)

(assert (=> start!79208 (= tp!60704 b_and!28487)))

(declare-fun b!929962 () Bool)

(declare-fun e!522215 () Bool)

(declare-fun tp_is_empty!19929 () Bool)

(assert (=> b!929962 (= e!522215 tp_is_empty!19929)))

(declare-fun mapNonEmpty!31650 () Bool)

(declare-fun mapRes!31650 () Bool)

(declare-fun tp!60703 () Bool)

(assert (=> mapNonEmpty!31650 (= mapRes!31650 (and tp!60703 e!522215))))

(declare-datatypes ((V!31537 0))(
  ( (V!31538 (val!10015 Int)) )
))
(declare-datatypes ((ValueCell!9483 0))(
  ( (ValueCellFull!9483 (v!12533 V!31537)) (EmptyCell!9483) )
))
(declare-fun mapRest!31650 () (Array (_ BitVec 32) ValueCell!9483))

(declare-fun mapKey!31650 () (_ BitVec 32))

(declare-fun mapValue!31650 () ValueCell!9483)

(declare-datatypes ((array!55808 0))(
  ( (array!55809 (arr!26849 (Array (_ BitVec 32) ValueCell!9483)) (size!27308 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55808)

(assert (=> mapNonEmpty!31650 (= (arr!26849 _values!1231) (store mapRest!31650 mapKey!31650 mapValue!31650))))

(declare-fun b!929963 () Bool)

(declare-fun e!522212 () Bool)

(assert (=> b!929963 (= e!522212 false)))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!419161 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55810 0))(
  ( (array!55811 (arr!26850 (Array (_ BitVec 32) (_ BitVec 64))) (size!27309 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55810)

(declare-fun zeroValue!1173 () V!31537)

(declare-fun minValue!1173 () V!31537)

(declare-datatypes ((tuple2!13100 0))(
  ( (tuple2!13101 (_1!6561 (_ BitVec 64)) (_2!6561 V!31537)) )
))
(declare-datatypes ((List!18892 0))(
  ( (Nil!18889) (Cons!18888 (h!20034 tuple2!13100) (t!26949 List!18892)) )
))
(declare-datatypes ((ListLongMap!11797 0))(
  ( (ListLongMap!11798 (toList!5914 List!18892)) )
))
(declare-fun contains!4966 (ListLongMap!11797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3157 (array!55810 array!55808 (_ BitVec 32) (_ BitVec 32) V!31537 V!31537 (_ BitVec 32) Int) ListLongMap!11797)

(assert (=> b!929963 (= lt!419161 (contains!4966 (getCurrentListMap!3157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929964 () Bool)

(declare-fun res!626267 () Bool)

(declare-fun e!522217 () Bool)

(assert (=> b!929964 (=> (not res!626267) (not e!522217))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929964 (= res!626267 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27309 _keys!1487))))))

(declare-fun mapIsEmpty!31650 () Bool)

(assert (=> mapIsEmpty!31650 mapRes!31650))

(declare-fun b!929965 () Bool)

(declare-fun res!626266 () Bool)

(assert (=> b!929965 (=> (not res!626266) (not e!522217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55810 (_ BitVec 32)) Bool)

(assert (=> b!929965 (= res!626266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929966 () Bool)

(declare-fun res!626268 () Bool)

(assert (=> b!929966 (=> (not res!626268) (not e!522217))))

(declare-datatypes ((List!18893 0))(
  ( (Nil!18890) (Cons!18889 (h!20035 (_ BitVec 64)) (t!26950 List!18893)) )
))
(declare-fun arrayNoDuplicates!0 (array!55810 (_ BitVec 32) List!18893) Bool)

(assert (=> b!929966 (= res!626268 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18890))))

(declare-fun b!929967 () Bool)

(declare-fun e!522214 () Bool)

(declare-fun e!522216 () Bool)

(assert (=> b!929967 (= e!522214 (and e!522216 mapRes!31650))))

(declare-fun condMapEmpty!31650 () Bool)

(declare-fun mapDefault!31650 () ValueCell!9483)

(assert (=> b!929967 (= condMapEmpty!31650 (= (arr!26849 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9483)) mapDefault!31650)))))

(declare-fun res!626263 () Bool)

(assert (=> start!79208 (=> (not res!626263) (not e!522217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79208 (= res!626263 (validMask!0 mask!1881))))

(assert (=> start!79208 e!522217))

(assert (=> start!79208 true))

(assert (=> start!79208 tp_is_empty!19929))

(declare-fun array_inv!20892 (array!55808) Bool)

(assert (=> start!79208 (and (array_inv!20892 _values!1231) e!522214)))

(assert (=> start!79208 tp!60704))

(declare-fun array_inv!20893 (array!55810) Bool)

(assert (=> start!79208 (array_inv!20893 _keys!1487)))

(declare-fun b!929968 () Bool)

(declare-fun res!626265 () Bool)

(assert (=> b!929968 (=> (not res!626265) (not e!522217))))

(assert (=> b!929968 (= res!626265 (and (= (size!27308 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27309 _keys!1487) (size!27308 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929969 () Bool)

(assert (=> b!929969 (= e!522216 tp_is_empty!19929)))

(declare-fun b!929970 () Bool)

(declare-fun res!626264 () Bool)

(assert (=> b!929970 (=> (not res!626264) (not e!522212))))

(assert (=> b!929970 (= res!626264 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929971 () Bool)

(declare-fun res!626262 () Bool)

(assert (=> b!929971 (=> (not res!626262) (not e!522212))))

(declare-fun v!791 () V!31537)

(declare-fun lt!419160 () ListLongMap!11797)

(declare-fun apply!737 (ListLongMap!11797 (_ BitVec 64)) V!31537)

(assert (=> b!929971 (= res!626262 (= (apply!737 lt!419160 k0!1099) v!791))))

(declare-fun b!929972 () Bool)

(assert (=> b!929972 (= e!522217 e!522212)))

(declare-fun res!626269 () Bool)

(assert (=> b!929972 (=> (not res!626269) (not e!522212))))

(assert (=> b!929972 (= res!626269 (contains!4966 lt!419160 k0!1099))))

(assert (=> b!929972 (= lt!419160 (getCurrentListMap!3157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79208 res!626263) b!929968))

(assert (= (and b!929968 res!626265) b!929965))

(assert (= (and b!929965 res!626266) b!929966))

(assert (= (and b!929966 res!626268) b!929964))

(assert (= (and b!929964 res!626267) b!929972))

(assert (= (and b!929972 res!626269) b!929971))

(assert (= (and b!929971 res!626262) b!929970))

(assert (= (and b!929970 res!626264) b!929963))

(assert (= (and b!929967 condMapEmpty!31650) mapIsEmpty!31650))

(assert (= (and b!929967 (not condMapEmpty!31650)) mapNonEmpty!31650))

(get-info :version)

(assert (= (and mapNonEmpty!31650 ((_ is ValueCellFull!9483) mapValue!31650)) b!929962))

(assert (= (and b!929967 ((_ is ValueCellFull!9483) mapDefault!31650)) b!929969))

(assert (= start!79208 b!929967))

(declare-fun m!864349 () Bool)

(assert (=> b!929971 m!864349))

(declare-fun m!864351 () Bool)

(assert (=> b!929965 m!864351))

(declare-fun m!864353 () Bool)

(assert (=> start!79208 m!864353))

(declare-fun m!864355 () Bool)

(assert (=> start!79208 m!864355))

(declare-fun m!864357 () Bool)

(assert (=> start!79208 m!864357))

(declare-fun m!864359 () Bool)

(assert (=> b!929966 m!864359))

(declare-fun m!864361 () Bool)

(assert (=> b!929972 m!864361))

(declare-fun m!864363 () Bool)

(assert (=> b!929972 m!864363))

(declare-fun m!864365 () Bool)

(assert (=> b!929963 m!864365))

(assert (=> b!929963 m!864365))

(declare-fun m!864367 () Bool)

(assert (=> b!929963 m!864367))

(declare-fun m!864369 () Bool)

(assert (=> mapNonEmpty!31650 m!864369))

(check-sat tp_is_empty!19929 (not b!929965) b_and!28487 (not b!929963) (not mapNonEmpty!31650) (not start!79208) (not b!929972) (not b!929971) (not b!929966) (not b_next!17421))
(check-sat b_and!28487 (not b_next!17421))
