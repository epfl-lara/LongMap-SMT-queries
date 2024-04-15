; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79358 () Bool)

(assert start!79358)

(declare-fun b_free!17563 () Bool)

(declare-fun b_next!17563 () Bool)

(assert (=> start!79358 (= b_free!17563 (not b_next!17563))))

(declare-fun tp!61133 () Bool)

(declare-fun b_and!28659 () Bool)

(assert (=> start!79358 (= tp!61133 b_and!28659)))

(declare-fun b!932288 () Bool)

(declare-fun res!627942 () Bool)

(declare-fun e!523530 () Bool)

(assert (=> b!932288 (=> (not res!627942) (not e!523530))))

(declare-datatypes ((array!56049 0))(
  ( (array!56050 (arr!26969 (Array (_ BitVec 32) (_ BitVec 64))) (size!27430 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56049)

(declare-datatypes ((List!19020 0))(
  ( (Nil!19017) (Cons!19016 (h!20162 (_ BitVec 64)) (t!27118 List!19020)) )
))
(declare-fun arrayNoDuplicates!0 (array!56049 (_ BitVec 32) List!19020) Bool)

(assert (=> b!932288 (= res!627942 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19017))))

(declare-fun b!932289 () Bool)

(declare-fun res!627938 () Bool)

(assert (=> b!932289 (=> (not res!627938) (not e!523530))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932289 (= res!627938 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27430 _keys!1487))))))

(declare-fun b!932290 () Bool)

(declare-fun e!523532 () Bool)

(assert (=> b!932290 (= e!523532 (not true))))

(assert (=> b!932290 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19017)))

(declare-datatypes ((Unit!31376 0))(
  ( (Unit!31377) )
))
(declare-fun lt!419701 () Unit!31376)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56049 (_ BitVec 32) (_ BitVec 32)) Unit!31376)

(assert (=> b!932290 (= lt!419701 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31727 0))(
  ( (V!31728 (val!10086 Int)) )
))
(declare-datatypes ((tuple2!13270 0))(
  ( (tuple2!13271 (_1!6646 (_ BitVec 64)) (_2!6646 V!31727)) )
))
(declare-datatypes ((List!19021 0))(
  ( (Nil!19018) (Cons!19017 (h!20163 tuple2!13270) (t!27119 List!19021)) )
))
(declare-datatypes ((ListLongMap!11957 0))(
  ( (ListLongMap!11958 (toList!5994 List!19021)) )
))
(declare-fun lt!419702 () ListLongMap!11957)

(declare-fun lt!419697 () tuple2!13270)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4992 (ListLongMap!11957 (_ BitVec 64)) Bool)

(declare-fun +!2803 (ListLongMap!11957 tuple2!13270) ListLongMap!11957)

(assert (=> b!932290 (contains!4992 (+!2803 lt!419702 lt!419697) k0!1099)))

(declare-fun lt!419699 () Unit!31376)

(declare-fun lt!419703 () (_ BitVec 64))

(declare-fun lt!419698 () V!31727)

(declare-fun addStillContains!492 (ListLongMap!11957 (_ BitVec 64) V!31727 (_ BitVec 64)) Unit!31376)

(assert (=> b!932290 (= lt!419699 (addStillContains!492 lt!419702 lt!419703 lt!419698 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9554 0))(
  ( (ValueCellFull!9554 (v!12604 V!31727)) (EmptyCell!9554) )
))
(declare-datatypes ((array!56051 0))(
  ( (array!56052 (arr!26970 (Array (_ BitVec 32) ValueCell!9554)) (size!27431 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56051)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31727)

(declare-fun minValue!1173 () V!31727)

(declare-fun getCurrentListMap!3167 (array!56049 array!56051 (_ BitVec 32) (_ BitVec 32) V!31727 V!31727 (_ BitVec 32) Int) ListLongMap!11957)

(assert (=> b!932290 (= (getCurrentListMap!3167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2803 (getCurrentListMap!3167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419697))))

(assert (=> b!932290 (= lt!419697 (tuple2!13271 lt!419703 lt!419698))))

(declare-fun get!14189 (ValueCell!9554 V!31727) V!31727)

(declare-fun dynLambda!1559 (Int (_ BitVec 64)) V!31727)

(assert (=> b!932290 (= lt!419698 (get!14189 (select (arr!26970 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1559 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419700 () Unit!31376)

(declare-fun lemmaListMapRecursiveValidKeyArray!167 (array!56049 array!56051 (_ BitVec 32) (_ BitVec 32) V!31727 V!31727 (_ BitVec 32) Int) Unit!31376)

(assert (=> b!932290 (= lt!419700 (lemmaListMapRecursiveValidKeyArray!167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932291 () Bool)

(declare-fun e!523528 () Bool)

(declare-fun tp_is_empty!20071 () Bool)

(assert (=> b!932291 (= e!523528 tp_is_empty!20071)))

(declare-fun b!932292 () Bool)

(declare-fun res!627937 () Bool)

(declare-fun e!523531 () Bool)

(assert (=> b!932292 (=> (not res!627937) (not e!523531))))

(assert (=> b!932292 (= res!627937 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932293 () Bool)

(declare-fun res!627935 () Bool)

(assert (=> b!932293 (=> (not res!627935) (not e!523531))))

(declare-fun v!791 () V!31727)

(declare-fun apply!784 (ListLongMap!11957 (_ BitVec 64)) V!31727)

(assert (=> b!932293 (= res!627935 (= (apply!784 lt!419702 k0!1099) v!791))))

(declare-fun b!932294 () Bool)

(declare-fun e!523526 () Bool)

(assert (=> b!932294 (= e!523526 tp_is_empty!20071)))

(declare-fun b!932295 () Bool)

(declare-fun res!627944 () Bool)

(assert (=> b!932295 (=> (not res!627944) (not e!523530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56049 (_ BitVec 32)) Bool)

(assert (=> b!932295 (= res!627944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932296 () Bool)

(declare-fun res!627943 () Bool)

(assert (=> b!932296 (=> (not res!627943) (not e!523530))))

(assert (=> b!932296 (= res!627943 (and (= (size!27431 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27430 _keys!1487) (size!27431 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932297 () Bool)

(declare-fun e!523527 () Bool)

(declare-fun mapRes!31866 () Bool)

(assert (=> b!932297 (= e!523527 (and e!523528 mapRes!31866))))

(declare-fun condMapEmpty!31866 () Bool)

(declare-fun mapDefault!31866 () ValueCell!9554)

(assert (=> b!932297 (= condMapEmpty!31866 (= (arr!26970 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9554)) mapDefault!31866)))))

(declare-fun res!627936 () Bool)

(assert (=> start!79358 (=> (not res!627936) (not e!523530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79358 (= res!627936 (validMask!0 mask!1881))))

(assert (=> start!79358 e!523530))

(assert (=> start!79358 true))

(assert (=> start!79358 tp_is_empty!20071))

(declare-fun array_inv!21058 (array!56051) Bool)

(assert (=> start!79358 (and (array_inv!21058 _values!1231) e!523527)))

(assert (=> start!79358 tp!61133))

(declare-fun array_inv!21059 (array!56049) Bool)

(assert (=> start!79358 (array_inv!21059 _keys!1487)))

(declare-fun mapNonEmpty!31866 () Bool)

(declare-fun tp!61134 () Bool)

(assert (=> mapNonEmpty!31866 (= mapRes!31866 (and tp!61134 e!523526))))

(declare-fun mapValue!31866 () ValueCell!9554)

(declare-fun mapKey!31866 () (_ BitVec 32))

(declare-fun mapRest!31866 () (Array (_ BitVec 32) ValueCell!9554))

(assert (=> mapNonEmpty!31866 (= (arr!26970 _values!1231) (store mapRest!31866 mapKey!31866 mapValue!31866))))

(declare-fun b!932298 () Bool)

(declare-fun res!627941 () Bool)

(assert (=> b!932298 (=> (not res!627941) (not e!523531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932298 (= res!627941 (validKeyInArray!0 k0!1099))))

(declare-fun b!932299 () Bool)

(assert (=> b!932299 (= e!523530 e!523531)))

(declare-fun res!627939 () Bool)

(assert (=> b!932299 (=> (not res!627939) (not e!523531))))

(assert (=> b!932299 (= res!627939 (contains!4992 lt!419702 k0!1099))))

(assert (=> b!932299 (= lt!419702 (getCurrentListMap!3167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932300 () Bool)

(assert (=> b!932300 (= e!523531 e!523532)))

(declare-fun res!627940 () Bool)

(assert (=> b!932300 (=> (not res!627940) (not e!523532))))

(assert (=> b!932300 (= res!627940 (validKeyInArray!0 lt!419703))))

(assert (=> b!932300 (= lt!419703 (select (arr!26969 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31866 () Bool)

(assert (=> mapIsEmpty!31866 mapRes!31866))

(assert (= (and start!79358 res!627936) b!932296))

(assert (= (and b!932296 res!627943) b!932295))

(assert (= (and b!932295 res!627944) b!932288))

(assert (= (and b!932288 res!627942) b!932289))

(assert (= (and b!932289 res!627938) b!932299))

(assert (= (and b!932299 res!627939) b!932293))

(assert (= (and b!932293 res!627935) b!932292))

(assert (= (and b!932292 res!627937) b!932298))

(assert (= (and b!932298 res!627941) b!932300))

(assert (= (and b!932300 res!627940) b!932290))

(assert (= (and b!932297 condMapEmpty!31866) mapIsEmpty!31866))

(assert (= (and b!932297 (not condMapEmpty!31866)) mapNonEmpty!31866))

(get-info :version)

(assert (= (and mapNonEmpty!31866 ((_ is ValueCellFull!9554) mapValue!31866)) b!932294))

(assert (= (and b!932297 ((_ is ValueCellFull!9554) mapDefault!31866)) b!932291))

(assert (= start!79358 b!932297))

(declare-fun b_lambda!13879 () Bool)

(assert (=> (not b_lambda!13879) (not b!932290)))

(declare-fun t!27117 () Bool)

(declare-fun tb!5949 () Bool)

(assert (=> (and start!79358 (= defaultEntry!1235 defaultEntry!1235) t!27117) tb!5949))

(declare-fun result!11731 () Bool)

(assert (=> tb!5949 (= result!11731 tp_is_empty!20071)))

(assert (=> b!932290 t!27117))

(declare-fun b_and!28661 () Bool)

(assert (= b_and!28659 (and (=> t!27117 result!11731) b_and!28661)))

(declare-fun m!865745 () Bool)

(assert (=> start!79358 m!865745))

(declare-fun m!865747 () Bool)

(assert (=> start!79358 m!865747))

(declare-fun m!865749 () Bool)

(assert (=> start!79358 m!865749))

(declare-fun m!865751 () Bool)

(assert (=> b!932290 m!865751))

(declare-fun m!865753 () Bool)

(assert (=> b!932290 m!865753))

(declare-fun m!865755 () Bool)

(assert (=> b!932290 m!865755))

(assert (=> b!932290 m!865755))

(declare-fun m!865757 () Bool)

(assert (=> b!932290 m!865757))

(declare-fun m!865759 () Bool)

(assert (=> b!932290 m!865759))

(declare-fun m!865761 () Bool)

(assert (=> b!932290 m!865761))

(assert (=> b!932290 m!865751))

(declare-fun m!865763 () Bool)

(assert (=> b!932290 m!865763))

(declare-fun m!865765 () Bool)

(assert (=> b!932290 m!865765))

(declare-fun m!865767 () Bool)

(assert (=> b!932290 m!865767))

(assert (=> b!932290 m!865757))

(declare-fun m!865769 () Bool)

(assert (=> b!932290 m!865769))

(declare-fun m!865771 () Bool)

(assert (=> b!932290 m!865771))

(assert (=> b!932290 m!865769))

(declare-fun m!865773 () Bool)

(assert (=> b!932290 m!865773))

(declare-fun m!865775 () Bool)

(assert (=> mapNonEmpty!31866 m!865775))

(declare-fun m!865777 () Bool)

(assert (=> b!932298 m!865777))

(declare-fun m!865779 () Bool)

(assert (=> b!932288 m!865779))

(declare-fun m!865781 () Bool)

(assert (=> b!932299 m!865781))

(declare-fun m!865783 () Bool)

(assert (=> b!932299 m!865783))

(declare-fun m!865785 () Bool)

(assert (=> b!932293 m!865785))

(declare-fun m!865787 () Bool)

(assert (=> b!932300 m!865787))

(declare-fun m!865789 () Bool)

(assert (=> b!932300 m!865789))

(declare-fun m!865791 () Bool)

(assert (=> b!932295 m!865791))

(check-sat tp_is_empty!20071 (not b!932290) (not b_lambda!13879) (not b!932295) (not b!932299) (not b!932298) (not b!932288) (not b!932293) (not b_next!17563) (not b!932300) (not start!79358) (not mapNonEmpty!31866) b_and!28661)
(check-sat b_and!28661 (not b_next!17563))
