; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79298 () Bool)

(assert start!79298)

(declare-fun b_free!17511 () Bool)

(declare-fun b_next!17511 () Bool)

(assert (=> start!79298 (= b_free!17511 (not b_next!17511))))

(declare-fun tp!60973 () Bool)

(declare-fun b_and!28577 () Bool)

(assert (=> start!79298 (= tp!60973 b_and!28577)))

(declare-fun b!931311 () Bool)

(declare-fun e!523022 () Bool)

(declare-fun tp_is_empty!20019 () Bool)

(assert (=> b!931311 (= e!523022 tp_is_empty!20019)))

(declare-fun b!931312 () Bool)

(declare-fun e!523023 () Bool)

(assert (=> b!931312 (= e!523023 false)))

(declare-datatypes ((V!31657 0))(
  ( (V!31658 (val!10060 Int)) )
))
(declare-fun lt!419403 () V!31657)

(declare-datatypes ((tuple2!13178 0))(
  ( (tuple2!13179 (_1!6600 (_ BitVec 64)) (_2!6600 V!31657)) )
))
(declare-datatypes ((List!18963 0))(
  ( (Nil!18960) (Cons!18959 (h!20105 tuple2!13178) (t!27020 List!18963)) )
))
(declare-datatypes ((ListLongMap!11875 0))(
  ( (ListLongMap!11876 (toList!5953 List!18963)) )
))
(declare-fun lt!419404 () ListLongMap!11875)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!771 (ListLongMap!11875 (_ BitVec 64)) V!31657)

(assert (=> b!931312 (= lt!419403 (apply!771 lt!419404 k0!1099))))

(declare-fun mapNonEmpty!31785 () Bool)

(declare-fun mapRes!31785 () Bool)

(declare-fun tp!60974 () Bool)

(declare-fun e!523024 () Bool)

(assert (=> mapNonEmpty!31785 (= mapRes!31785 (and tp!60974 e!523024))))

(declare-fun mapKey!31785 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9528 0))(
  ( (ValueCellFull!9528 (v!12578 V!31657)) (EmptyCell!9528) )
))
(declare-datatypes ((array!55978 0))(
  ( (array!55979 (arr!26934 (Array (_ BitVec 32) ValueCell!9528)) (size!27393 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55978)

(declare-fun mapValue!31785 () ValueCell!9528)

(declare-fun mapRest!31785 () (Array (_ BitVec 32) ValueCell!9528))

(assert (=> mapNonEmpty!31785 (= (arr!26934 _values!1231) (store mapRest!31785 mapKey!31785 mapValue!31785))))

(declare-fun b!931313 () Bool)

(assert (=> b!931313 (= e!523024 tp_is_empty!20019)))

(declare-fun b!931314 () Bool)

(declare-fun res!627206 () Bool)

(declare-fun e!523025 () Bool)

(assert (=> b!931314 (=> (not res!627206) (not e!523025))))

(declare-datatypes ((array!55980 0))(
  ( (array!55981 (arr!26935 (Array (_ BitVec 32) (_ BitVec 64))) (size!27394 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55980)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55980 (_ BitVec 32)) Bool)

(assert (=> b!931314 (= res!627206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931315 () Bool)

(declare-fun res!627208 () Bool)

(assert (=> b!931315 (=> (not res!627208) (not e!523025))))

(declare-datatypes ((List!18964 0))(
  ( (Nil!18961) (Cons!18960 (h!20106 (_ BitVec 64)) (t!27021 List!18964)) )
))
(declare-fun arrayNoDuplicates!0 (array!55980 (_ BitVec 32) List!18964) Bool)

(assert (=> b!931315 (= res!627208 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18961))))

(declare-fun res!627209 () Bool)

(assert (=> start!79298 (=> (not res!627209) (not e!523025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79298 (= res!627209 (validMask!0 mask!1881))))

(assert (=> start!79298 e!523025))

(assert (=> start!79298 true))

(declare-fun e!523026 () Bool)

(declare-fun array_inv!20966 (array!55978) Bool)

(assert (=> start!79298 (and (array_inv!20966 _values!1231) e!523026)))

(assert (=> start!79298 tp!60973))

(declare-fun array_inv!20967 (array!55980) Bool)

(assert (=> start!79298 (array_inv!20967 _keys!1487)))

(assert (=> start!79298 tp_is_empty!20019))

(declare-fun b!931316 () Bool)

(assert (=> b!931316 (= e!523025 e!523023)))

(declare-fun res!627211 () Bool)

(assert (=> b!931316 (=> (not res!627211) (not e!523023))))

(declare-fun contains!5000 (ListLongMap!11875 (_ BitVec 64)) Bool)

(assert (=> b!931316 (= res!627211 (contains!5000 lt!419404 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31657)

(declare-fun minValue!1173 () V!31657)

(declare-fun getCurrentListMap!3191 (array!55980 array!55978 (_ BitVec 32) (_ BitVec 32) V!31657 V!31657 (_ BitVec 32) Int) ListLongMap!11875)

(assert (=> b!931316 (= lt!419404 (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931317 () Bool)

(assert (=> b!931317 (= e!523026 (and e!523022 mapRes!31785))))

(declare-fun condMapEmpty!31785 () Bool)

(declare-fun mapDefault!31785 () ValueCell!9528)

(assert (=> b!931317 (= condMapEmpty!31785 (= (arr!26934 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9528)) mapDefault!31785)))))

(declare-fun b!931318 () Bool)

(declare-fun res!627210 () Bool)

(assert (=> b!931318 (=> (not res!627210) (not e!523025))))

(assert (=> b!931318 (= res!627210 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27394 _keys!1487))))))

(declare-fun mapIsEmpty!31785 () Bool)

(assert (=> mapIsEmpty!31785 mapRes!31785))

(declare-fun b!931319 () Bool)

(declare-fun res!627207 () Bool)

(assert (=> b!931319 (=> (not res!627207) (not e!523025))))

(assert (=> b!931319 (= res!627207 (and (= (size!27393 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27394 _keys!1487) (size!27393 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79298 res!627209) b!931319))

(assert (= (and b!931319 res!627207) b!931314))

(assert (= (and b!931314 res!627206) b!931315))

(assert (= (and b!931315 res!627208) b!931318))

(assert (= (and b!931318 res!627210) b!931316))

(assert (= (and b!931316 res!627211) b!931312))

(assert (= (and b!931317 condMapEmpty!31785) mapIsEmpty!31785))

(assert (= (and b!931317 (not condMapEmpty!31785)) mapNonEmpty!31785))

(get-info :version)

(assert (= (and mapNonEmpty!31785 ((_ is ValueCellFull!9528) mapValue!31785)) b!931313))

(assert (= (and b!931317 ((_ is ValueCellFull!9528) mapDefault!31785)) b!931311))

(assert (= start!79298 b!931317))

(declare-fun m!865227 () Bool)

(assert (=> b!931314 m!865227))

(declare-fun m!865229 () Bool)

(assert (=> b!931316 m!865229))

(declare-fun m!865231 () Bool)

(assert (=> b!931316 m!865231))

(declare-fun m!865233 () Bool)

(assert (=> b!931315 m!865233))

(declare-fun m!865235 () Bool)

(assert (=> mapNonEmpty!31785 m!865235))

(declare-fun m!865237 () Bool)

(assert (=> start!79298 m!865237))

(declare-fun m!865239 () Bool)

(assert (=> start!79298 m!865239))

(declare-fun m!865241 () Bool)

(assert (=> start!79298 m!865241))

(declare-fun m!865243 () Bool)

(assert (=> b!931312 m!865243))

(check-sat (not b!931314) (not b!931315) (not b_next!17511) (not start!79298) (not b!931312) (not b!931316) tp_is_empty!20019 b_and!28577 (not mapNonEmpty!31785))
(check-sat b_and!28577 (not b_next!17511))
