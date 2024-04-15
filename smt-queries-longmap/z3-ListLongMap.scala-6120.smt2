; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78810 () Bool)

(assert start!78810)

(declare-fun b_free!17041 () Bool)

(declare-fun b_next!17041 () Bool)

(assert (=> start!78810 (= b_free!17041 (not b_next!17041))))

(declare-fun tp!59565 () Bool)

(declare-fun b_and!27793 () Bool)

(assert (=> start!78810 (= tp!59565 b_and!27793)))

(declare-fun b!920236 () Bool)

(declare-fun e!516471 () Bool)

(declare-fun e!516467 () Bool)

(assert (=> b!920236 (= e!516471 e!516467)))

(declare-fun res!620614 () Bool)

(assert (=> b!920236 (=> (not res!620614) (not e!516467))))

(declare-datatypes ((V!31031 0))(
  ( (V!31032 (val!9825 Int)) )
))
(declare-datatypes ((tuple2!12830 0))(
  ( (tuple2!12831 (_1!6426 (_ BitVec 64)) (_2!6426 V!31031)) )
))
(declare-datatypes ((List!18613 0))(
  ( (Nil!18610) (Cons!18609 (h!19755 tuple2!12830) (t!26375 List!18613)) )
))
(declare-datatypes ((ListLongMap!11517 0))(
  ( (ListLongMap!11518 (toList!5774 List!18613)) )
))
(declare-fun lt!412997 () ListLongMap!11517)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4776 (ListLongMap!11517 (_ BitVec 64)) Bool)

(assert (=> b!920236 (= res!620614 (contains!4776 lt!412997 k0!1099))))

(declare-datatypes ((array!55055 0))(
  ( (array!55056 (arr!26473 (Array (_ BitVec 32) (_ BitVec 64))) (size!26934 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55055)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9293 0))(
  ( (ValueCellFull!9293 (v!12342 V!31031)) (EmptyCell!9293) )
))
(declare-datatypes ((array!55057 0))(
  ( (array!55058 (arr!26474 (Array (_ BitVec 32) ValueCell!9293)) (size!26935 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55057)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31031)

(declare-fun minValue!1173 () V!31031)

(declare-fun getCurrentListMap!2965 (array!55055 array!55057 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 32) Int) ListLongMap!11517)

(assert (=> b!920236 (= lt!412997 (getCurrentListMap!2965 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920237 () Bool)

(declare-fun res!620609 () Bool)

(assert (=> b!920237 (=> (not res!620609) (not e!516467))))

(declare-fun v!791 () V!31031)

(declare-fun apply!597 (ListLongMap!11517 (_ BitVec 64)) V!31031)

(assert (=> b!920237 (= res!620609 (= (apply!597 lt!412997 k0!1099) v!791))))

(declare-fun res!620607 () Bool)

(assert (=> start!78810 (=> (not res!620607) (not e!516471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78810 (= res!620607 (validMask!0 mask!1881))))

(assert (=> start!78810 e!516471))

(assert (=> start!78810 true))

(declare-fun tp_is_empty!19549 () Bool)

(assert (=> start!78810 tp_is_empty!19549))

(declare-fun e!516464 () Bool)

(declare-fun array_inv!20712 (array!55057) Bool)

(assert (=> start!78810 (and (array_inv!20712 _values!1231) e!516464)))

(assert (=> start!78810 tp!59565))

(declare-fun array_inv!20713 (array!55055) Bool)

(assert (=> start!78810 (array_inv!20713 _keys!1487)))

(declare-fun b!920238 () Bool)

(declare-fun res!620615 () Bool)

(assert (=> b!920238 (=> (not res!620615) (not e!516471))))

(declare-datatypes ((List!18614 0))(
  ( (Nil!18611) (Cons!18610 (h!19756 (_ BitVec 64)) (t!26376 List!18614)) )
))
(declare-fun arrayNoDuplicates!0 (array!55055 (_ BitVec 32) List!18614) Bool)

(assert (=> b!920238 (= res!620615 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18611))))

(declare-fun b!920239 () Bool)

(declare-fun e!516466 () Bool)

(assert (=> b!920239 (= e!516466 tp_is_empty!19549)))

(declare-fun e!516463 () Bool)

(declare-fun b!920240 () Bool)

(declare-fun arrayContainsKey!0 (array!55055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920240 (= e!516463 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920241 () Bool)

(declare-fun e!516465 () Bool)

(declare-fun mapRes!31080 () Bool)

(assert (=> b!920241 (= e!516464 (and e!516465 mapRes!31080))))

(declare-fun condMapEmpty!31080 () Bool)

(declare-fun mapDefault!31080 () ValueCell!9293)

(assert (=> b!920241 (= condMapEmpty!31080 (= (arr!26474 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9293)) mapDefault!31080)))))

(declare-fun b!920242 () Bool)

(declare-fun res!620613 () Bool)

(assert (=> b!920242 (=> (not res!620613) (not e!516467))))

(assert (=> b!920242 (= res!620613 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31080 () Bool)

(declare-fun tp!59564 () Bool)

(assert (=> mapNonEmpty!31080 (= mapRes!31080 (and tp!59564 e!516466))))

(declare-fun mapKey!31080 () (_ BitVec 32))

(declare-fun mapRest!31080 () (Array (_ BitVec 32) ValueCell!9293))

(declare-fun mapValue!31080 () ValueCell!9293)

(assert (=> mapNonEmpty!31080 (= (arr!26474 _values!1231) (store mapRest!31080 mapKey!31080 mapValue!31080))))

(declare-fun b!920243 () Bool)

(declare-fun res!620605 () Bool)

(assert (=> b!920243 (=> (not res!620605) (not e!516471))))

(assert (=> b!920243 (= res!620605 (and (= (size!26935 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26934 _keys!1487) (size!26935 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920244 () Bool)

(declare-fun e!516470 () Bool)

(assert (=> b!920244 (= e!516467 e!516470)))

(declare-fun res!620604 () Bool)

(assert (=> b!920244 (=> (not res!620604) (not e!516470))))

(declare-fun lt!412993 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920244 (= res!620604 (validKeyInArray!0 lt!412993))))

(assert (=> b!920244 (= lt!412993 (select (arr!26473 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920245 () Bool)

(declare-fun res!620611 () Bool)

(declare-fun e!516469 () Bool)

(assert (=> b!920245 (=> res!620611 e!516469)))

(declare-fun noDuplicate!1339 (List!18614) Bool)

(assert (=> b!920245 (= res!620611 (not (noDuplicate!1339 Nil!18611)))))

(declare-fun b!920246 () Bool)

(assert (=> b!920246 (= e!516465 tp_is_empty!19549)))

(declare-fun b!920247 () Bool)

(declare-fun res!620606 () Bool)

(assert (=> b!920247 (=> res!620606 e!516469)))

(declare-fun contains!4777 (List!18614 (_ BitVec 64)) Bool)

(assert (=> b!920247 (= res!620606 (contains!4777 Nil!18611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920248 () Bool)

(assert (=> b!920248 (= e!516470 (not e!516469))))

(declare-fun res!620610 () Bool)

(assert (=> b!920248 (=> res!620610 e!516469)))

(assert (=> b!920248 (= res!620610 (or (bvsge (size!26934 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26934 _keys!1487))))))

(assert (=> b!920248 e!516463))

(declare-fun c!95998 () Bool)

(assert (=> b!920248 (= c!95998 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!30984 0))(
  ( (Unit!30985) )
))
(declare-fun lt!413000 () Unit!30984)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!174 (array!55055 array!55057 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 64) (_ BitVec 32) Int) Unit!30984)

(assert (=> b!920248 (= lt!413000 (lemmaListMapContainsThenArrayContainsFrom!174 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920248 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18611)))

(declare-fun lt!412996 () Unit!30984)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55055 (_ BitVec 32) (_ BitVec 32)) Unit!30984)

(assert (=> b!920248 (= lt!412996 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412999 () tuple2!12830)

(declare-fun +!2686 (ListLongMap!11517 tuple2!12830) ListLongMap!11517)

(assert (=> b!920248 (contains!4776 (+!2686 lt!412997 lt!412999) k0!1099)))

(declare-fun lt!412992 () Unit!30984)

(declare-fun lt!412998 () V!31031)

(declare-fun addStillContains!383 (ListLongMap!11517 (_ BitVec 64) V!31031 (_ BitVec 64)) Unit!30984)

(assert (=> b!920248 (= lt!412992 (addStillContains!383 lt!412997 lt!412993 lt!412998 k0!1099))))

(assert (=> b!920248 (= (getCurrentListMap!2965 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2686 (getCurrentListMap!2965 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412999))))

(assert (=> b!920248 (= lt!412999 (tuple2!12831 lt!412993 lt!412998))))

(declare-fun get!13895 (ValueCell!9293 V!31031) V!31031)

(declare-fun dynLambda!1442 (Int (_ BitVec 64)) V!31031)

(assert (=> b!920248 (= lt!412998 (get!13895 (select (arr!26474 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1442 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412994 () Unit!30984)

(declare-fun lemmaListMapRecursiveValidKeyArray!50 (array!55055 array!55057 (_ BitVec 32) (_ BitVec 32) V!31031 V!31031 (_ BitVec 32) Int) Unit!30984)

(assert (=> b!920248 (= lt!412994 (lemmaListMapRecursiveValidKeyArray!50 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920249 () Bool)

(assert (=> b!920249 (= e!516469 true)))

(declare-fun lt!412995 () Bool)

(assert (=> b!920249 (= lt!412995 (contains!4777 Nil!18611 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920250 () Bool)

(declare-fun res!620603 () Bool)

(assert (=> b!920250 (=> (not res!620603) (not e!516471))))

(assert (=> b!920250 (= res!620603 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26934 _keys!1487))))))

(declare-fun b!920251 () Bool)

(assert (=> b!920251 (= e!516463 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920252 () Bool)

(declare-fun res!620608 () Bool)

(assert (=> b!920252 (=> (not res!620608) (not e!516467))))

(assert (=> b!920252 (= res!620608 (validKeyInArray!0 k0!1099))))

(declare-fun b!920253 () Bool)

(declare-fun res!620612 () Bool)

(assert (=> b!920253 (=> (not res!620612) (not e!516471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55055 (_ BitVec 32)) Bool)

(assert (=> b!920253 (= res!620612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31080 () Bool)

(assert (=> mapIsEmpty!31080 mapRes!31080))

(assert (= (and start!78810 res!620607) b!920243))

(assert (= (and b!920243 res!620605) b!920253))

(assert (= (and b!920253 res!620612) b!920238))

(assert (= (and b!920238 res!620615) b!920250))

(assert (= (and b!920250 res!620603) b!920236))

(assert (= (and b!920236 res!620614) b!920237))

(assert (= (and b!920237 res!620609) b!920242))

(assert (= (and b!920242 res!620613) b!920252))

(assert (= (and b!920252 res!620608) b!920244))

(assert (= (and b!920244 res!620604) b!920248))

(assert (= (and b!920248 c!95998) b!920240))

(assert (= (and b!920248 (not c!95998)) b!920251))

(assert (= (and b!920248 (not res!620610)) b!920245))

(assert (= (and b!920245 (not res!620611)) b!920247))

(assert (= (and b!920247 (not res!620606)) b!920249))

(assert (= (and b!920241 condMapEmpty!31080) mapIsEmpty!31080))

(assert (= (and b!920241 (not condMapEmpty!31080)) mapNonEmpty!31080))

(get-info :version)

(assert (= (and mapNonEmpty!31080 ((_ is ValueCellFull!9293) mapValue!31080)) b!920239))

(assert (= (and b!920241 ((_ is ValueCellFull!9293) mapDefault!31080)) b!920246))

(assert (= start!78810 b!920241))

(declare-fun b_lambda!13525 () Bool)

(assert (=> (not b_lambda!13525) (not b!920248)))

(declare-fun t!26374 () Bool)

(declare-fun tb!5613 () Bool)

(assert (=> (and start!78810 (= defaultEntry!1235 defaultEntry!1235) t!26374) tb!5613))

(declare-fun result!11057 () Bool)

(assert (=> tb!5613 (= result!11057 tp_is_empty!19549)))

(assert (=> b!920248 t!26374))

(declare-fun b_and!27795 () Bool)

(assert (= b_and!27793 (and (=> t!26374 result!11057) b_and!27795)))

(declare-fun m!853639 () Bool)

(assert (=> b!920244 m!853639))

(declare-fun m!853641 () Bool)

(assert (=> b!920244 m!853641))

(declare-fun m!853643 () Bool)

(assert (=> b!920253 m!853643))

(declare-fun m!853645 () Bool)

(assert (=> b!920247 m!853645))

(declare-fun m!853647 () Bool)

(assert (=> b!920238 m!853647))

(declare-fun m!853649 () Bool)

(assert (=> b!920249 m!853649))

(declare-fun m!853651 () Bool)

(assert (=> b!920245 m!853651))

(declare-fun m!853653 () Bool)

(assert (=> b!920240 m!853653))

(declare-fun m!853655 () Bool)

(assert (=> mapNonEmpty!31080 m!853655))

(declare-fun m!853657 () Bool)

(assert (=> b!920248 m!853657))

(declare-fun m!853659 () Bool)

(assert (=> b!920248 m!853659))

(declare-fun m!853661 () Bool)

(assert (=> b!920248 m!853661))

(declare-fun m!853663 () Bool)

(assert (=> b!920248 m!853663))

(declare-fun m!853665 () Bool)

(assert (=> b!920248 m!853665))

(declare-fun m!853667 () Bool)

(assert (=> b!920248 m!853667))

(declare-fun m!853669 () Bool)

(assert (=> b!920248 m!853669))

(declare-fun m!853671 () Bool)

(assert (=> b!920248 m!853671))

(assert (=> b!920248 m!853661))

(declare-fun m!853673 () Bool)

(assert (=> b!920248 m!853673))

(assert (=> b!920248 m!853659))

(assert (=> b!920248 m!853669))

(declare-fun m!853675 () Bool)

(assert (=> b!920248 m!853675))

(declare-fun m!853677 () Bool)

(assert (=> b!920248 m!853677))

(declare-fun m!853679 () Bool)

(assert (=> b!920248 m!853679))

(assert (=> b!920248 m!853677))

(declare-fun m!853681 () Bool)

(assert (=> b!920248 m!853681))

(declare-fun m!853683 () Bool)

(assert (=> b!920237 m!853683))

(declare-fun m!853685 () Bool)

(assert (=> b!920236 m!853685))

(declare-fun m!853687 () Bool)

(assert (=> b!920236 m!853687))

(declare-fun m!853689 () Bool)

(assert (=> start!78810 m!853689))

(declare-fun m!853691 () Bool)

(assert (=> start!78810 m!853691))

(declare-fun m!853693 () Bool)

(assert (=> start!78810 m!853693))

(declare-fun m!853695 () Bool)

(assert (=> b!920252 m!853695))

(check-sat (not b_lambda!13525) (not mapNonEmpty!31080) (not b!920244) (not b!920248) (not b!920252) (not b!920253) (not b!920240) (not start!78810) (not b_next!17041) tp_is_empty!19549 (not b!920238) (not b!920245) (not b!920249) (not b!920236) (not b!920237) (not b!920247) b_and!27795)
(check-sat b_and!27795 (not b_next!17041))
