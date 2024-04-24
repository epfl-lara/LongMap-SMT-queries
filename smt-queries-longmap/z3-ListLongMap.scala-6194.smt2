; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79440 () Bool)

(assert start!79440)

(declare-fun b_free!17485 () Bool)

(declare-fun b_next!17485 () Bool)

(assert (=> start!79440 (= b_free!17485 (not b_next!17485))))

(declare-fun tp!60896 () Bool)

(declare-fun b_and!28561 () Bool)

(assert (=> start!79440 (= tp!60896 b_and!28561)))

(declare-fun b!931827 () Bool)

(declare-fun res!627283 () Bool)

(declare-fun e!523374 () Bool)

(assert (=> b!931827 (=> (not res!627283) (not e!523374))))

(declare-datatypes ((array!55989 0))(
  ( (array!55990 (arr!26935 (Array (_ BitVec 32) (_ BitVec 64))) (size!27395 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55989)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55989 (_ BitVec 32)) Bool)

(assert (=> b!931827 (= res!627283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31746 () Bool)

(declare-fun mapRes!31746 () Bool)

(declare-fun tp!60897 () Bool)

(declare-fun e!523373 () Bool)

(assert (=> mapNonEmpty!31746 (= mapRes!31746 (and tp!60897 e!523373))))

(declare-datatypes ((V!31623 0))(
  ( (V!31624 (val!10047 Int)) )
))
(declare-datatypes ((ValueCell!9515 0))(
  ( (ValueCellFull!9515 (v!12562 V!31623)) (EmptyCell!9515) )
))
(declare-fun mapRest!31746 () (Array (_ BitVec 32) ValueCell!9515))

(declare-fun mapValue!31746 () ValueCell!9515)

(declare-fun mapKey!31746 () (_ BitVec 32))

(declare-datatypes ((array!55991 0))(
  ( (array!55992 (arr!26936 (Array (_ BitVec 32) ValueCell!9515)) (size!27396 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55991)

(assert (=> mapNonEmpty!31746 (= (arr!26936 _values!1231) (store mapRest!31746 mapKey!31746 mapValue!31746))))

(declare-fun b!931828 () Bool)

(declare-fun e!523371 () Bool)

(assert (=> b!931828 (= e!523374 e!523371)))

(declare-fun res!627281 () Bool)

(assert (=> b!931828 (=> (not res!627281) (not e!523371))))

(declare-datatypes ((tuple2!13148 0))(
  ( (tuple2!13149 (_1!6585 (_ BitVec 64)) (_2!6585 V!31623)) )
))
(declare-datatypes ((List!18936 0))(
  ( (Nil!18933) (Cons!18932 (h!20084 tuple2!13148) (t!26985 List!18936)) )
))
(declare-datatypes ((ListLongMap!11847 0))(
  ( (ListLongMap!11848 (toList!5939 List!18936)) )
))
(declare-fun lt!419696 () ListLongMap!11847)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5004 (ListLongMap!11847 (_ BitVec 64)) Bool)

(assert (=> b!931828 (= res!627281 (contains!5004 lt!419696 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31623)

(declare-fun minValue!1173 () V!31623)

(declare-fun getCurrentListMap!3182 (array!55989 array!55991 (_ BitVec 32) (_ BitVec 32) V!31623 V!31623 (_ BitVec 32) Int) ListLongMap!11847)

(assert (=> b!931828 (= lt!419696 (getCurrentListMap!3182 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!627284 () Bool)

(assert (=> start!79440 (=> (not res!627284) (not e!523374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79440 (= res!627284 (validMask!0 mask!1881))))

(assert (=> start!79440 e!523374))

(assert (=> start!79440 true))

(declare-fun e!523372 () Bool)

(declare-fun array_inv!21058 (array!55991) Bool)

(assert (=> start!79440 (and (array_inv!21058 _values!1231) e!523372)))

(assert (=> start!79440 tp!60896))

(declare-fun array_inv!21059 (array!55989) Bool)

(assert (=> start!79440 (array_inv!21059 _keys!1487)))

(declare-fun tp_is_empty!19993 () Bool)

(assert (=> start!79440 tp_is_empty!19993))

(declare-fun b!931829 () Bool)

(declare-fun e!523370 () Bool)

(assert (=> b!931829 (= e!523372 (and e!523370 mapRes!31746))))

(declare-fun condMapEmpty!31746 () Bool)

(declare-fun mapDefault!31746 () ValueCell!9515)

(assert (=> b!931829 (= condMapEmpty!31746 (= (arr!26936 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9515)) mapDefault!31746)))))

(declare-fun b!931830 () Bool)

(declare-fun res!627285 () Bool)

(assert (=> b!931830 (=> (not res!627285) (not e!523374))))

(assert (=> b!931830 (= res!627285 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27395 _keys!1487))))))

(declare-fun b!931831 () Bool)

(assert (=> b!931831 (= e!523373 tp_is_empty!19993)))

(declare-fun b!931832 () Bool)

(assert (=> b!931832 (= e!523371 false)))

(declare-fun lt!419695 () V!31623)

(declare-fun apply!773 (ListLongMap!11847 (_ BitVec 64)) V!31623)

(assert (=> b!931832 (= lt!419695 (apply!773 lt!419696 k0!1099))))

(declare-fun b!931833 () Bool)

(assert (=> b!931833 (= e!523370 tp_is_empty!19993)))

(declare-fun b!931834 () Bool)

(declare-fun res!627282 () Bool)

(assert (=> b!931834 (=> (not res!627282) (not e!523374))))

(declare-datatypes ((List!18937 0))(
  ( (Nil!18934) (Cons!18933 (h!20085 (_ BitVec 64)) (t!26986 List!18937)) )
))
(declare-fun arrayNoDuplicates!0 (array!55989 (_ BitVec 32) List!18937) Bool)

(assert (=> b!931834 (= res!627282 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18934))))

(declare-fun b!931835 () Bool)

(declare-fun res!627280 () Bool)

(assert (=> b!931835 (=> (not res!627280) (not e!523374))))

(assert (=> b!931835 (= res!627280 (and (= (size!27396 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27395 _keys!1487) (size!27396 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31746 () Bool)

(assert (=> mapIsEmpty!31746 mapRes!31746))

(assert (= (and start!79440 res!627284) b!931835))

(assert (= (and b!931835 res!627280) b!931827))

(assert (= (and b!931827 res!627283) b!931834))

(assert (= (and b!931834 res!627282) b!931830))

(assert (= (and b!931830 res!627285) b!931828))

(assert (= (and b!931828 res!627281) b!931832))

(assert (= (and b!931829 condMapEmpty!31746) mapIsEmpty!31746))

(assert (= (and b!931829 (not condMapEmpty!31746)) mapNonEmpty!31746))

(get-info :version)

(assert (= (and mapNonEmpty!31746 ((_ is ValueCellFull!9515) mapValue!31746)) b!931831))

(assert (= (and b!931829 ((_ is ValueCellFull!9515) mapDefault!31746)) b!931833))

(assert (= start!79440 b!931829))

(declare-fun m!866269 () Bool)

(assert (=> b!931834 m!866269))

(declare-fun m!866271 () Bool)

(assert (=> start!79440 m!866271))

(declare-fun m!866273 () Bool)

(assert (=> start!79440 m!866273))

(declare-fun m!866275 () Bool)

(assert (=> start!79440 m!866275))

(declare-fun m!866277 () Bool)

(assert (=> mapNonEmpty!31746 m!866277))

(declare-fun m!866279 () Bool)

(assert (=> b!931827 m!866279))

(declare-fun m!866281 () Bool)

(assert (=> b!931832 m!866281))

(declare-fun m!866283 () Bool)

(assert (=> b!931828 m!866283))

(declare-fun m!866285 () Bool)

(assert (=> b!931828 m!866285))

(check-sat b_and!28561 tp_is_empty!19993 (not b_next!17485) (not b!931832) (not start!79440) (not b!931827) (not b!931834) (not mapNonEmpty!31746) (not b!931828))
(check-sat b_and!28561 (not b_next!17485))
