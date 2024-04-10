; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79704 () Bool)

(assert start!79704)

(declare-fun b_free!17753 () Bool)

(declare-fun b_next!17753 () Bool)

(assert (=> start!79704 (= b_free!17753 (not b_next!17753))))

(declare-fun tp!61714 () Bool)

(declare-fun b_and!29097 () Bool)

(assert (=> start!79704 (= tp!61714 b_and!29097)))

(declare-fun b!937796 () Bool)

(declare-fun res!631109 () Bool)

(declare-fun e!526629 () Bool)

(assert (=> b!937796 (=> (not res!631109) (not e!526629))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56462 0))(
  ( (array!56463 (arr!27171 (Array (_ BitVec 32) (_ BitVec 64))) (size!27630 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56462)

(assert (=> b!937796 (= res!631109 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27630 _keys!1487))))))

(declare-fun e!526634 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun b!937797 () Bool)

(declare-fun arrayContainsKey!0 (array!56462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937797 (= e!526634 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937798 () Bool)

(declare-datatypes ((V!31979 0))(
  ( (V!31980 (val!10181 Int)) )
))
(declare-datatypes ((tuple2!13378 0))(
  ( (tuple2!13379 (_1!6700 (_ BitVec 64)) (_2!6700 V!31979)) )
))
(declare-datatypes ((List!19156 0))(
  ( (Nil!19153) (Cons!19152 (h!20298 tuple2!13378) (t!27453 List!19156)) )
))
(declare-datatypes ((ListLongMap!12075 0))(
  ( (ListLongMap!12076 (toList!6053 List!19156)) )
))
(declare-fun lt!423277 () ListLongMap!12075)

(declare-fun lt!423278 () V!31979)

(declare-fun apply!854 (ListLongMap!12075 (_ BitVec 64)) V!31979)

(assert (=> b!937798 (= (apply!854 lt!423277 k!1099) lt!423278)))

(declare-fun lt!423287 () V!31979)

(declare-datatypes ((Unit!31672 0))(
  ( (Unit!31673) )
))
(declare-fun lt!423284 () Unit!31672)

(declare-fun lt!423279 () (_ BitVec 64))

(declare-fun lt!423281 () ListLongMap!12075)

(declare-fun addApplyDifferent!440 (ListLongMap!12075 (_ BitVec 64) V!31979 (_ BitVec 64)) Unit!31672)

(assert (=> b!937798 (= lt!423284 (addApplyDifferent!440 lt!423281 lt!423279 lt!423287 k!1099))))

(assert (=> b!937798 (not (= lt!423279 k!1099))))

(declare-fun lt!423282 () Unit!31672)

(declare-datatypes ((List!19157 0))(
  ( (Nil!19154) (Cons!19153 (h!20299 (_ BitVec 64)) (t!27454 List!19157)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56462 (_ BitVec 64) (_ BitVec 32) List!19157) Unit!31672)

(assert (=> b!937798 (= lt!423282 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19154))))

(assert (=> b!937798 e!526634))

(declare-fun c!97641 () Bool)

(assert (=> b!937798 (= c!97641 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!423276 () Unit!31672)

(declare-datatypes ((ValueCell!9649 0))(
  ( (ValueCellFull!9649 (v!12706 V!31979)) (EmptyCell!9649) )
))
(declare-datatypes ((array!56464 0))(
  ( (array!56465 (arr!27172 (Array (_ BitVec 32) ValueCell!9649)) (size!27631 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56464)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31979)

(declare-fun minValue!1173 () V!31979)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!313 (array!56462 array!56464 (_ BitVec 32) (_ BitVec 32) V!31979 V!31979 (_ BitVec 64) (_ BitVec 32) Int) Unit!31672)

(assert (=> b!937798 (= lt!423276 (lemmaListMapContainsThenArrayContainsFrom!313 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56462 (_ BitVec 32) List!19157) Bool)

(assert (=> b!937798 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19154)))

(declare-fun lt!423280 () Unit!31672)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56462 (_ BitVec 32) (_ BitVec 32)) Unit!31672)

(assert (=> b!937798 (= lt!423280 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5112 (ListLongMap!12075 (_ BitVec 64)) Bool)

(assert (=> b!937798 (contains!5112 lt!423277 k!1099)))

(declare-fun lt!423286 () tuple2!13378)

(declare-fun +!2841 (ListLongMap!12075 tuple2!13378) ListLongMap!12075)

(assert (=> b!937798 (= lt!423277 (+!2841 lt!423281 lt!423286))))

(declare-fun lt!423275 () Unit!31672)

(declare-fun addStillContains!560 (ListLongMap!12075 (_ BitVec 64) V!31979 (_ BitVec 64)) Unit!31672)

(assert (=> b!937798 (= lt!423275 (addStillContains!560 lt!423281 lt!423279 lt!423287 k!1099))))

(declare-fun getCurrentListMap!3288 (array!56462 array!56464 (_ BitVec 32) (_ BitVec 32) V!31979 V!31979 (_ BitVec 32) Int) ListLongMap!12075)

(assert (=> b!937798 (= (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2841 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423286))))

(assert (=> b!937798 (= lt!423286 (tuple2!13379 lt!423279 lt!423287))))

(declare-fun get!14329 (ValueCell!9649 V!31979) V!31979)

(declare-fun dynLambda!1630 (Int (_ BitVec 64)) V!31979)

(assert (=> b!937798 (= lt!423287 (get!14329 (select (arr!27172 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1630 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423285 () Unit!31672)

(declare-fun lemmaListMapRecursiveValidKeyArray!231 (array!56462 array!56464 (_ BitVec 32) (_ BitVec 32) V!31979 V!31979 (_ BitVec 32) Int) Unit!31672)

(assert (=> b!937798 (= lt!423285 (lemmaListMapRecursiveValidKeyArray!231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526631 () Unit!31672)

(assert (=> b!937798 (= e!526631 lt!423284)))

(declare-fun mapNonEmpty!32163 () Bool)

(declare-fun mapRes!32163 () Bool)

(declare-fun tp!61715 () Bool)

(declare-fun e!526630 () Bool)

(assert (=> mapNonEmpty!32163 (= mapRes!32163 (and tp!61715 e!526630))))

(declare-fun mapValue!32163 () ValueCell!9649)

(declare-fun mapKey!32163 () (_ BitVec 32))

(declare-fun mapRest!32163 () (Array (_ BitVec 32) ValueCell!9649))

(assert (=> mapNonEmpty!32163 (= (arr!27172 _values!1231) (store mapRest!32163 mapKey!32163 mapValue!32163))))

(declare-fun b!937799 () Bool)

(declare-fun e!526632 () Unit!31672)

(declare-fun Unit!31674 () Unit!31672)

(assert (=> b!937799 (= e!526632 Unit!31674)))

(declare-fun b!937800 () Bool)

(declare-fun e!526633 () Bool)

(declare-fun e!526626 () Bool)

(assert (=> b!937800 (= e!526633 e!526626)))

(declare-fun res!631111 () Bool)

(assert (=> b!937800 (=> (not res!631111) (not e!526626))))

(declare-fun v!791 () V!31979)

(assert (=> b!937800 (= res!631111 (and (= lt!423278 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937800 (= lt!423278 (apply!854 lt!423281 k!1099))))

(declare-fun b!937801 () Bool)

(declare-fun res!631107 () Bool)

(assert (=> b!937801 (=> (not res!631107) (not e!526629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56462 (_ BitVec 32)) Bool)

(assert (=> b!937801 (= res!631107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937803 () Bool)

(declare-fun tp_is_empty!20261 () Bool)

(assert (=> b!937803 (= e!526630 tp_is_empty!20261)))

(declare-fun b!937804 () Bool)

(assert (=> b!937804 (= e!526634 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937805 () Bool)

(declare-fun e!526635 () Bool)

(assert (=> b!937805 (= e!526626 e!526635)))

(declare-fun res!631108 () Bool)

(assert (=> b!937805 (=> (not res!631108) (not e!526635))))

(assert (=> b!937805 (= res!631108 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27630 _keys!1487)))))

(declare-fun lt!423283 () Unit!31672)

(assert (=> b!937805 (= lt!423283 e!526632)))

(declare-fun c!97639 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937805 (= c!97639 (validKeyInArray!0 k!1099))))

(declare-fun b!937806 () Bool)

(assert (=> b!937806 (= e!526632 e!526631)))

(assert (=> b!937806 (= lt!423279 (select (arr!27171 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97640 () Bool)

(assert (=> b!937806 (= c!97640 (validKeyInArray!0 lt!423279))))

(declare-fun b!937807 () Bool)

(assert (=> b!937807 (= e!526629 e!526633)))

(declare-fun res!631112 () Bool)

(assert (=> b!937807 (=> (not res!631112) (not e!526633))))

(assert (=> b!937807 (= res!631112 (contains!5112 lt!423281 k!1099))))

(assert (=> b!937807 (= lt!423281 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937808 () Bool)

(declare-fun res!631114 () Bool)

(assert (=> b!937808 (=> (not res!631114) (not e!526629))))

(assert (=> b!937808 (= res!631114 (and (= (size!27631 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27630 _keys!1487) (size!27631 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937809 () Bool)

(assert (=> b!937809 (= e!526635 (not (contains!5112 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k!1099)))))

(declare-fun res!631110 () Bool)

(assert (=> start!79704 (=> (not res!631110) (not e!526629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79704 (= res!631110 (validMask!0 mask!1881))))

(assert (=> start!79704 e!526629))

(assert (=> start!79704 true))

(assert (=> start!79704 tp_is_empty!20261))

(declare-fun e!526625 () Bool)

(declare-fun array_inv!21136 (array!56464) Bool)

(assert (=> start!79704 (and (array_inv!21136 _values!1231) e!526625)))

(assert (=> start!79704 tp!61714))

(declare-fun array_inv!21137 (array!56462) Bool)

(assert (=> start!79704 (array_inv!21137 _keys!1487)))

(declare-fun b!937802 () Bool)

(declare-fun e!526628 () Bool)

(assert (=> b!937802 (= e!526628 tp_is_empty!20261)))

(declare-fun b!937810 () Bool)

(declare-fun res!631113 () Bool)

(assert (=> b!937810 (=> (not res!631113) (not e!526629))))

(assert (=> b!937810 (= res!631113 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19154))))

(declare-fun mapIsEmpty!32163 () Bool)

(assert (=> mapIsEmpty!32163 mapRes!32163))

(declare-fun b!937811 () Bool)

(assert (=> b!937811 (= e!526625 (and e!526628 mapRes!32163))))

(declare-fun condMapEmpty!32163 () Bool)

(declare-fun mapDefault!32163 () ValueCell!9649)

