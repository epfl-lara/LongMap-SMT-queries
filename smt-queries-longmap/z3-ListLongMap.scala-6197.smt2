; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79272 () Bool)

(assert start!79272)

(declare-fun b_free!17503 () Bool)

(declare-fun b_next!17503 () Bool)

(assert (=> start!79272 (= b_free!17503 (not b_next!17503))))

(declare-fun tp!60950 () Bool)

(declare-fun b_and!28543 () Bool)

(assert (=> start!79272 (= tp!60950 b_and!28543)))

(declare-fun b!930936 () Bool)

(declare-fun res!626999 () Bool)

(declare-fun e!522804 () Bool)

(assert (=> b!930936 (=> (not res!626999) (not e!522804))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930936 (= res!626999 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930937 () Bool)

(declare-fun res!626996 () Bool)

(declare-fun e!522807 () Bool)

(assert (=> b!930937 (=> (not res!626996) (not e!522807))))

(declare-datatypes ((array!55931 0))(
  ( (array!55932 (arr!26911 (Array (_ BitVec 32) (_ BitVec 64))) (size!27372 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55931)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55931 (_ BitVec 32)) Bool)

(assert (=> b!930937 (= res!626996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930938 () Bool)

(assert (=> b!930938 (= e!522804 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27372 _keys!1487)))))

(declare-fun b!930939 () Bool)

(declare-fun res!627002 () Bool)

(assert (=> b!930939 (=> (not res!627002) (not e!522807))))

(assert (=> b!930939 (= res!627002 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27372 _keys!1487))))))

(declare-fun b!930940 () Bool)

(declare-fun res!627000 () Bool)

(assert (=> b!930940 (=> (not res!627000) (not e!522804))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31647 0))(
  ( (V!31648 (val!10056 Int)) )
))
(declare-fun v!791 () V!31647)

(declare-datatypes ((tuple2!13214 0))(
  ( (tuple2!13215 (_1!6618 (_ BitVec 64)) (_2!6618 V!31647)) )
))
(declare-datatypes ((List!18970 0))(
  ( (Nil!18967) (Cons!18966 (h!20112 tuple2!13214) (t!27018 List!18970)) )
))
(declare-datatypes ((ListLongMap!11901 0))(
  ( (ListLongMap!11902 (toList!5966 List!18970)) )
))
(declare-fun lt!419150 () ListLongMap!11901)

(declare-fun apply!762 (ListLongMap!11901 (_ BitVec 64)) V!31647)

(assert (=> b!930940 (= res!627000 (= (apply!762 lt!419150 k0!1099) v!791))))

(declare-fun res!626998 () Bool)

(assert (=> start!79272 (=> (not res!626998) (not e!522807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79272 (= res!626998 (validMask!0 mask!1881))))

(assert (=> start!79272 e!522807))

(assert (=> start!79272 true))

(declare-fun tp_is_empty!20011 () Bool)

(assert (=> start!79272 tp_is_empty!20011))

(declare-datatypes ((ValueCell!9524 0))(
  ( (ValueCellFull!9524 (v!12573 V!31647)) (EmptyCell!9524) )
))
(declare-datatypes ((array!55933 0))(
  ( (array!55934 (arr!26912 (Array (_ BitVec 32) ValueCell!9524)) (size!27373 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55933)

(declare-fun e!522806 () Bool)

(declare-fun array_inv!21012 (array!55933) Bool)

(assert (=> start!79272 (and (array_inv!21012 _values!1231) e!522806)))

(assert (=> start!79272 tp!60950))

(declare-fun array_inv!21013 (array!55931) Bool)

(assert (=> start!79272 (array_inv!21013 _keys!1487)))

(declare-fun b!930941 () Bool)

(declare-fun res!627001 () Bool)

(assert (=> b!930941 (=> (not res!627001) (not e!522807))))

(declare-datatypes ((List!18971 0))(
  ( (Nil!18968) (Cons!18967 (h!20113 (_ BitVec 64)) (t!27019 List!18971)) )
))
(declare-fun arrayNoDuplicates!0 (array!55931 (_ BitVec 32) List!18971) Bool)

(assert (=> b!930941 (= res!627001 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18968))))

(declare-fun b!930942 () Bool)

(assert (=> b!930942 (= e!522807 e!522804)))

(declare-fun res!626997 () Bool)

(assert (=> b!930942 (=> (not res!626997) (not e!522804))))

(declare-fun contains!4967 (ListLongMap!11901 (_ BitVec 64)) Bool)

(assert (=> b!930942 (= res!626997 (contains!4967 lt!419150 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31647)

(declare-fun minValue!1173 () V!31647)

(declare-fun getCurrentListMap!3141 (array!55931 array!55933 (_ BitVec 32) (_ BitVec 32) V!31647 V!31647 (_ BitVec 32) Int) ListLongMap!11901)

(assert (=> b!930942 (= lt!419150 (getCurrentListMap!3141 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930943 () Bool)

(declare-fun res!627003 () Bool)

(assert (=> b!930943 (=> (not res!627003) (not e!522804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!930943 (= res!627003 (validKeyInArray!0 (select (arr!26911 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!930944 () Bool)

(declare-fun e!522802 () Bool)

(assert (=> b!930944 (= e!522802 tp_is_empty!20011)))

(declare-fun mapNonEmpty!31773 () Bool)

(declare-fun mapRes!31773 () Bool)

(declare-fun tp!60951 () Bool)

(assert (=> mapNonEmpty!31773 (= mapRes!31773 (and tp!60951 e!522802))))

(declare-fun mapRest!31773 () (Array (_ BitVec 32) ValueCell!9524))

(declare-fun mapValue!31773 () ValueCell!9524)

(declare-fun mapKey!31773 () (_ BitVec 32))

(assert (=> mapNonEmpty!31773 (= (arr!26912 _values!1231) (store mapRest!31773 mapKey!31773 mapValue!31773))))

(declare-fun mapIsEmpty!31773 () Bool)

(assert (=> mapIsEmpty!31773 mapRes!31773))

(declare-fun b!930945 () Bool)

(declare-fun e!522803 () Bool)

(assert (=> b!930945 (= e!522803 tp_is_empty!20011)))

(declare-fun b!930946 () Bool)

(declare-fun res!627005 () Bool)

(assert (=> b!930946 (=> (not res!627005) (not e!522807))))

(assert (=> b!930946 (= res!627005 (and (= (size!27373 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27372 _keys!1487) (size!27373 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930947 () Bool)

(assert (=> b!930947 (= e!522806 (and e!522803 mapRes!31773))))

(declare-fun condMapEmpty!31773 () Bool)

(declare-fun mapDefault!31773 () ValueCell!9524)

(assert (=> b!930947 (= condMapEmpty!31773 (= (arr!26912 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9524)) mapDefault!31773)))))

(declare-fun b!930948 () Bool)

(declare-fun res!627004 () Bool)

(assert (=> b!930948 (=> (not res!627004) (not e!522804))))

(assert (=> b!930948 (= res!627004 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79272 res!626998) b!930946))

(assert (= (and b!930946 res!627005) b!930937))

(assert (= (and b!930937 res!626996) b!930941))

(assert (= (and b!930941 res!627001) b!930939))

(assert (= (and b!930939 res!627002) b!930942))

(assert (= (and b!930942 res!626997) b!930940))

(assert (= (and b!930940 res!627000) b!930936))

(assert (= (and b!930936 res!626999) b!930948))

(assert (= (and b!930948 res!627004) b!930943))

(assert (= (and b!930943 res!627003) b!930938))

(assert (= (and b!930947 condMapEmpty!31773) mapIsEmpty!31773))

(assert (= (and b!930947 (not condMapEmpty!31773)) mapNonEmpty!31773))

(get-info :version)

(assert (= (and mapNonEmpty!31773 ((_ is ValueCellFull!9524) mapValue!31773)) b!930944))

(assert (= (and b!930947 ((_ is ValueCellFull!9524) mapDefault!31773)) b!930945))

(assert (= start!79272 b!930947))

(declare-fun m!864379 () Bool)

(assert (=> b!930948 m!864379))

(declare-fun m!864381 () Bool)

(assert (=> b!930937 m!864381))

(declare-fun m!864383 () Bool)

(assert (=> start!79272 m!864383))

(declare-fun m!864385 () Bool)

(assert (=> start!79272 m!864385))

(declare-fun m!864387 () Bool)

(assert (=> start!79272 m!864387))

(declare-fun m!864389 () Bool)

(assert (=> b!930943 m!864389))

(assert (=> b!930943 m!864389))

(declare-fun m!864391 () Bool)

(assert (=> b!930943 m!864391))

(declare-fun m!864393 () Bool)

(assert (=> b!930942 m!864393))

(declare-fun m!864395 () Bool)

(assert (=> b!930942 m!864395))

(declare-fun m!864397 () Bool)

(assert (=> mapNonEmpty!31773 m!864397))

(declare-fun m!864399 () Bool)

(assert (=> b!930940 m!864399))

(declare-fun m!864401 () Bool)

(assert (=> b!930941 m!864401))

(check-sat tp_is_empty!20011 b_and!28543 (not b!930940) (not b!930948) (not b!930941) (not b!930943) (not b!930942) (not b!930937) (not mapNonEmpty!31773) (not b_next!17503) (not start!79272))
(check-sat b_and!28543 (not b_next!17503))
