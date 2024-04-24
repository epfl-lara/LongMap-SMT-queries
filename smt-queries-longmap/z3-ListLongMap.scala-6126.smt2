; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79032 () Bool)

(assert start!79032)

(declare-fun b_free!17077 () Bool)

(declare-fun b_next!17077 () Bool)

(assert (=> start!79032 (= b_free!17077 (not b_next!17077))))

(declare-fun tp!59672 () Bool)

(declare-fun b_and!27901 () Bool)

(assert (=> start!79032 (= tp!59672 b_and!27901)))

(declare-fun b!922386 () Bool)

(declare-fun res!621766 () Bool)

(declare-fun e!517687 () Bool)

(assert (=> b!922386 (=> res!621766 e!517687)))

(declare-datatypes ((List!18603 0))(
  ( (Nil!18600) (Cons!18599 (h!19751 (_ BitVec 64)) (t!26402 List!18603)) )
))
(declare-fun noDuplicate!1354 (List!18603) Bool)

(assert (=> b!922386 (= res!621766 (not (noDuplicate!1354 Nil!18600)))))

(declare-fun b!922387 () Bool)

(declare-fun res!621770 () Bool)

(declare-fun e!517682 () Bool)

(assert (=> b!922387 (=> (not res!621770) (not e!517682))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922387 (= res!621770 (validKeyInArray!0 k0!1099))))

(declare-fun b!922388 () Bool)

(declare-fun res!621762 () Bool)

(assert (=> b!922388 (=> (not res!621762) (not e!517682))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922388 (= res!621762 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922390 () Bool)

(declare-fun e!517685 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922390 (= e!517685 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922391 () Bool)

(declare-fun res!621765 () Bool)

(declare-fun e!517686 () Bool)

(assert (=> b!922391 (=> (not res!621765) (not e!517686))))

(declare-datatypes ((array!55195 0))(
  ( (array!55196 (arr!26538 (Array (_ BitVec 32) (_ BitVec 64))) (size!26998 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55195)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55195 (_ BitVec 32)) Bool)

(assert (=> b!922391 (= res!621765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922392 () Bool)

(declare-fun res!621761 () Bool)

(assert (=> b!922392 (=> (not res!621761) (not e!517686))))

(declare-datatypes ((V!31079 0))(
  ( (V!31080 (val!9843 Int)) )
))
(declare-datatypes ((ValueCell!9311 0))(
  ( (ValueCellFull!9311 (v!12358 V!31079)) (EmptyCell!9311) )
))
(declare-datatypes ((array!55197 0))(
  ( (array!55198 (arr!26539 (Array (_ BitVec 32) ValueCell!9311)) (size!26999 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55197)

(assert (=> b!922392 (= res!621761 (and (= (size!26999 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26998 _keys!1487) (size!26999 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922393 () Bool)

(declare-fun e!517683 () Bool)

(declare-fun tp_is_empty!19585 () Bool)

(assert (=> b!922393 (= e!517683 tp_is_empty!19585)))

(declare-fun b!922394 () Bool)

(declare-fun arrayContainsKey!0 (array!55195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922394 (= e!517685 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922395 () Bool)

(declare-fun e!517679 () Bool)

(declare-fun mapRes!31134 () Bool)

(assert (=> b!922395 (= e!517679 (and e!517683 mapRes!31134))))

(declare-fun condMapEmpty!31134 () Bool)

(declare-fun mapDefault!31134 () ValueCell!9311)

(assert (=> b!922395 (= condMapEmpty!31134 (= (arr!26539 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9311)) mapDefault!31134)))))

(declare-fun b!922396 () Bool)

(declare-fun e!517680 () Bool)

(assert (=> b!922396 (= e!517680 tp_is_empty!19585)))

(declare-fun b!922397 () Bool)

(declare-fun res!621760 () Bool)

(assert (=> b!922397 (=> (not res!621760) (not e!517682))))

(declare-fun v!791 () V!31079)

(declare-datatypes ((tuple2!12786 0))(
  ( (tuple2!12787 (_1!6404 (_ BitVec 64)) (_2!6404 V!31079)) )
))
(declare-datatypes ((List!18604 0))(
  ( (Nil!18601) (Cons!18600 (h!19752 tuple2!12786) (t!26403 List!18604)) )
))
(declare-datatypes ((ListLongMap!11485 0))(
  ( (ListLongMap!11486 (toList!5758 List!18604)) )
))
(declare-fun lt!414077 () ListLongMap!11485)

(declare-fun apply!620 (ListLongMap!11485 (_ BitVec 64)) V!31079)

(assert (=> b!922397 (= res!621760 (= (apply!620 lt!414077 k0!1099) v!791))))

(declare-fun b!922398 () Bool)

(declare-fun res!621764 () Bool)

(assert (=> b!922398 (=> (not res!621764) (not e!517686))))

(assert (=> b!922398 (= res!621764 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26998 _keys!1487))))))

(declare-fun b!922399 () Bool)

(assert (=> b!922399 (= e!517687 true)))

(declare-fun lt!414082 () Bool)

(declare-fun contains!4827 (List!18603 (_ BitVec 64)) Bool)

(assert (=> b!922399 (= lt!414082 (contains!4827 Nil!18600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!621771 () Bool)

(assert (=> start!79032 (=> (not res!621771) (not e!517686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79032 (= res!621771 (validMask!0 mask!1881))))

(assert (=> start!79032 e!517686))

(assert (=> start!79032 true))

(assert (=> start!79032 tp_is_empty!19585))

(declare-fun array_inv!20778 (array!55197) Bool)

(assert (=> start!79032 (and (array_inv!20778 _values!1231) e!517679)))

(assert (=> start!79032 tp!59672))

(declare-fun array_inv!20779 (array!55195) Bool)

(assert (=> start!79032 (array_inv!20779 _keys!1487)))

(declare-fun b!922389 () Bool)

(declare-fun e!517684 () Bool)

(assert (=> b!922389 (= e!517682 e!517684)))

(declare-fun res!621767 () Bool)

(assert (=> b!922389 (=> (not res!621767) (not e!517684))))

(declare-fun lt!414076 () (_ BitVec 64))

(assert (=> b!922389 (= res!621767 (validKeyInArray!0 lt!414076))))

(assert (=> b!922389 (= lt!414076 (select (arr!26538 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922400 () Bool)

(assert (=> b!922400 (= e!517686 e!517682)))

(declare-fun res!621769 () Bool)

(assert (=> b!922400 (=> (not res!621769) (not e!517682))))

(declare-fun contains!4828 (ListLongMap!11485 (_ BitVec 64)) Bool)

(assert (=> b!922400 (= res!621769 (contains!4828 lt!414077 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31079)

(declare-fun minValue!1173 () V!31079)

(declare-fun getCurrentListMap!3011 (array!55195 array!55197 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 32) Int) ListLongMap!11485)

(assert (=> b!922400 (= lt!414077 (getCurrentListMap!3011 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922401 () Bool)

(declare-fun res!621768 () Bool)

(assert (=> b!922401 (=> (not res!621768) (not e!517686))))

(declare-fun arrayNoDuplicates!0 (array!55195 (_ BitVec 32) List!18603) Bool)

(assert (=> b!922401 (= res!621768 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18600))))

(declare-fun mapNonEmpty!31134 () Bool)

(declare-fun tp!59673 () Bool)

(assert (=> mapNonEmpty!31134 (= mapRes!31134 (and tp!59673 e!517680))))

(declare-fun mapRest!31134 () (Array (_ BitVec 32) ValueCell!9311))

(declare-fun mapKey!31134 () (_ BitVec 32))

(declare-fun mapValue!31134 () ValueCell!9311)

(assert (=> mapNonEmpty!31134 (= (arr!26539 _values!1231) (store mapRest!31134 mapKey!31134 mapValue!31134))))

(declare-fun mapIsEmpty!31134 () Bool)

(assert (=> mapIsEmpty!31134 mapRes!31134))

(declare-fun b!922402 () Bool)

(assert (=> b!922402 (= e!517684 (not e!517687))))

(declare-fun res!621759 () Bool)

(assert (=> b!922402 (=> res!621759 e!517687)))

(assert (=> b!922402 (= res!621759 (or (bvsge (size!26998 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26998 _keys!1487))))))

(assert (=> b!922402 e!517685))

(declare-fun c!96399 () Bool)

(assert (=> b!922402 (= c!96399 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31090 0))(
  ( (Unit!31091) )
))
(declare-fun lt!414075 () Unit!31090)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!180 (array!55195 array!55197 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 64) (_ BitVec 32) Int) Unit!31090)

(assert (=> b!922402 (= lt!414075 (lemmaListMapContainsThenArrayContainsFrom!180 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922402 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18600)))

(declare-fun lt!414078 () Unit!31090)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55195 (_ BitVec 32) (_ BitVec 32)) Unit!31090)

(assert (=> b!922402 (= lt!414078 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414080 () tuple2!12786)

(declare-fun +!2689 (ListLongMap!11485 tuple2!12786) ListLongMap!11485)

(assert (=> b!922402 (contains!4828 (+!2689 lt!414077 lt!414080) k0!1099)))

(declare-fun lt!414083 () Unit!31090)

(declare-fun lt!414079 () V!31079)

(declare-fun addStillContains!398 (ListLongMap!11485 (_ BitVec 64) V!31079 (_ BitVec 64)) Unit!31090)

(assert (=> b!922402 (= lt!414083 (addStillContains!398 lt!414077 lt!414076 lt!414079 k0!1099))))

(assert (=> b!922402 (= (getCurrentListMap!3011 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2689 (getCurrentListMap!3011 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414080))))

(assert (=> b!922402 (= lt!414080 (tuple2!12787 lt!414076 lt!414079))))

(declare-fun get!13950 (ValueCell!9311 V!31079) V!31079)

(declare-fun dynLambda!1486 (Int (_ BitVec 64)) V!31079)

(assert (=> b!922402 (= lt!414079 (get!13950 (select (arr!26539 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1486 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414081 () Unit!31090)

(declare-fun lemmaListMapRecursiveValidKeyArray!69 (array!55195 array!55197 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 32) Int) Unit!31090)

(assert (=> b!922402 (= lt!414081 (lemmaListMapRecursiveValidKeyArray!69 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922403 () Bool)

(declare-fun res!621763 () Bool)

(assert (=> b!922403 (=> res!621763 e!517687)))

(assert (=> b!922403 (= res!621763 (contains!4827 Nil!18600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!79032 res!621771) b!922392))

(assert (= (and b!922392 res!621761) b!922391))

(assert (= (and b!922391 res!621765) b!922401))

(assert (= (and b!922401 res!621768) b!922398))

(assert (= (and b!922398 res!621764) b!922400))

(assert (= (and b!922400 res!621769) b!922397))

(assert (= (and b!922397 res!621760) b!922388))

(assert (= (and b!922388 res!621762) b!922387))

(assert (= (and b!922387 res!621770) b!922389))

(assert (= (and b!922389 res!621767) b!922402))

(assert (= (and b!922402 c!96399) b!922394))

(assert (= (and b!922402 (not c!96399)) b!922390))

(assert (= (and b!922402 (not res!621759)) b!922386))

(assert (= (and b!922386 (not res!621766)) b!922403))

(assert (= (and b!922403 (not res!621763)) b!922399))

(assert (= (and b!922395 condMapEmpty!31134) mapIsEmpty!31134))

(assert (= (and b!922395 (not condMapEmpty!31134)) mapNonEmpty!31134))

(get-info :version)

(assert (= (and mapNonEmpty!31134 ((_ is ValueCellFull!9311) mapValue!31134)) b!922396))

(assert (= (and b!922395 ((_ is ValueCellFull!9311) mapDefault!31134)) b!922393))

(assert (= start!79032 b!922395))

(declare-fun b_lambda!13593 () Bool)

(assert (=> (not b_lambda!13593) (not b!922402)))

(declare-fun t!26401 () Bool)

(declare-fun tb!5649 () Bool)

(assert (=> (and start!79032 (= defaultEntry!1235 defaultEntry!1235) t!26401) tb!5649))

(declare-fun result!11129 () Bool)

(assert (=> tb!5649 (= result!11129 tp_is_empty!19585)))

(assert (=> b!922402 t!26401))

(declare-fun b_and!27903 () Bool)

(assert (= b_and!27901 (and (=> t!26401 result!11129) b_and!27903)))

(declare-fun m!856735 () Bool)

(assert (=> b!922394 m!856735))

(declare-fun m!856737 () Bool)

(assert (=> b!922391 m!856737))

(declare-fun m!856739 () Bool)

(assert (=> b!922387 m!856739))

(declare-fun m!856741 () Bool)

(assert (=> b!922400 m!856741))

(declare-fun m!856743 () Bool)

(assert (=> b!922400 m!856743))

(declare-fun m!856745 () Bool)

(assert (=> start!79032 m!856745))

(declare-fun m!856747 () Bool)

(assert (=> start!79032 m!856747))

(declare-fun m!856749 () Bool)

(assert (=> start!79032 m!856749))

(declare-fun m!856751 () Bool)

(assert (=> b!922389 m!856751))

(declare-fun m!856753 () Bool)

(assert (=> b!922389 m!856753))

(declare-fun m!856755 () Bool)

(assert (=> b!922401 m!856755))

(declare-fun m!856757 () Bool)

(assert (=> mapNonEmpty!31134 m!856757))

(declare-fun m!856759 () Bool)

(assert (=> b!922403 m!856759))

(declare-fun m!856761 () Bool)

(assert (=> b!922399 m!856761))

(declare-fun m!856763 () Bool)

(assert (=> b!922386 m!856763))

(declare-fun m!856765 () Bool)

(assert (=> b!922397 m!856765))

(declare-fun m!856767 () Bool)

(assert (=> b!922402 m!856767))

(declare-fun m!856769 () Bool)

(assert (=> b!922402 m!856769))

(declare-fun m!856771 () Bool)

(assert (=> b!922402 m!856771))

(declare-fun m!856773 () Bool)

(assert (=> b!922402 m!856773))

(declare-fun m!856775 () Bool)

(assert (=> b!922402 m!856775))

(assert (=> b!922402 m!856769))

(assert (=> b!922402 m!856771))

(declare-fun m!856777 () Bool)

(assert (=> b!922402 m!856777))

(declare-fun m!856779 () Bool)

(assert (=> b!922402 m!856779))

(declare-fun m!856781 () Bool)

(assert (=> b!922402 m!856781))

(declare-fun m!856783 () Bool)

(assert (=> b!922402 m!856783))

(declare-fun m!856785 () Bool)

(assert (=> b!922402 m!856785))

(declare-fun m!856787 () Bool)

(assert (=> b!922402 m!856787))

(assert (=> b!922402 m!856783))

(declare-fun m!856789 () Bool)

(assert (=> b!922402 m!856789))

(assert (=> b!922402 m!856773))

(declare-fun m!856791 () Bool)

(assert (=> b!922402 m!856791))

(check-sat (not b!922386) (not b!922397) (not b!922402) (not mapNonEmpty!31134) (not b!922399) (not b!922403) b_and!27903 (not b!922400) (not b!922394) (not b!922391) (not b!922389) (not start!79032) (not b_lambda!13593) (not b!922401) (not b!922387) tp_is_empty!19585 (not b_next!17077))
(check-sat b_and!27903 (not b_next!17077))
