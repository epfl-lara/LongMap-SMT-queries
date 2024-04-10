; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78978 () Bool)

(assert start!78978)

(declare-fun b_free!17191 () Bool)

(declare-fun b_next!17191 () Bool)

(assert (=> start!78978 (= b_free!17191 (not b_next!17191))))

(declare-fun tp!60014 () Bool)

(declare-fun b_and!28119 () Bool)

(assert (=> start!78978 (= tp!60014 b_and!28119)))

(declare-fun b!924405 () Bool)

(declare-fun res!623114 () Bool)

(declare-fun e!518748 () Bool)

(assert (=> b!924405 (=> (not res!623114) (not e!518748))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55368 0))(
  ( (array!55369 (arr!26629 (Array (_ BitVec 32) (_ BitVec 64))) (size!27088 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55368)

(assert (=> b!924405 (= res!623114 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27088 _keys!1487))))))

(declare-fun b!924406 () Bool)

(declare-datatypes ((Unit!31205 0))(
  ( (Unit!31206) )
))
(declare-fun e!518751 () Unit!31205)

(declare-fun Unit!31207 () Unit!31205)

(assert (=> b!924406 (= e!518751 Unit!31207)))

(declare-fun b!924407 () Bool)

(declare-fun e!518742 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!924407 (= e!518742 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924408 () Bool)

(declare-datatypes ((V!31231 0))(
  ( (V!31232 (val!9900 Int)) )
))
(declare-datatypes ((tuple2!12898 0))(
  ( (tuple2!12899 (_1!6460 (_ BitVec 64)) (_2!6460 V!31231)) )
))
(declare-datatypes ((List!18700 0))(
  ( (Nil!18697) (Cons!18696 (h!19842 tuple2!12898) (t!26621 List!18700)) )
))
(declare-datatypes ((ListLongMap!11595 0))(
  ( (ListLongMap!11596 (toList!5813 List!18700)) )
))
(declare-fun lt!415655 () ListLongMap!11595)

(declare-fun lt!415646 () V!31231)

(declare-fun apply!643 (ListLongMap!11595 (_ BitVec 64)) V!31231)

(assert (=> b!924408 (= (apply!643 lt!415655 k!1099) lt!415646)))

(declare-fun lt!415650 () ListLongMap!11595)

(declare-fun lt!415653 () Unit!31205)

(declare-fun lt!415645 () V!31231)

(declare-fun lt!415643 () (_ BitVec 64))

(declare-fun addApplyDifferent!365 (ListLongMap!11595 (_ BitVec 64) V!31231 (_ BitVec 64)) Unit!31205)

(assert (=> b!924408 (= lt!415653 (addApplyDifferent!365 lt!415650 lt!415643 lt!415645 k!1099))))

(assert (=> b!924408 (not (= lt!415643 k!1099))))

(declare-fun lt!415652 () Unit!31205)

(declare-datatypes ((List!18701 0))(
  ( (Nil!18698) (Cons!18697 (h!19843 (_ BitVec 64)) (t!26622 List!18701)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55368 (_ BitVec 64) (_ BitVec 32) List!18701) Unit!31205)

(assert (=> b!924408 (= lt!415652 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18698))))

(assert (=> b!924408 e!518742))

(declare-fun c!96419 () Bool)

(assert (=> b!924408 (= c!96419 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415654 () Unit!31205)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9368 0))(
  ( (ValueCellFull!9368 (v!12418 V!31231)) (EmptyCell!9368) )
))
(declare-datatypes ((array!55370 0))(
  ( (array!55371 (arr!26630 (Array (_ BitVec 32) ValueCell!9368)) (size!27089 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55370)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31231)

(declare-fun minValue!1173 () V!31231)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!216 (array!55368 array!55370 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 64) (_ BitVec 32) Int) Unit!31205)

(assert (=> b!924408 (= lt!415654 (lemmaListMapContainsThenArrayContainsFrom!216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55368 (_ BitVec 32) List!18701) Bool)

(assert (=> b!924408 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18698)))

(declare-fun lt!415649 () Unit!31205)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55368 (_ BitVec 32) (_ BitVec 32)) Unit!31205)

(assert (=> b!924408 (= lt!415649 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4873 (ListLongMap!11595 (_ BitVec 64)) Bool)

(assert (=> b!924408 (contains!4873 lt!415655 k!1099)))

(declare-fun lt!415647 () tuple2!12898)

(declare-fun +!2709 (ListLongMap!11595 tuple2!12898) ListLongMap!11595)

(assert (=> b!924408 (= lt!415655 (+!2709 lt!415650 lt!415647))))

(declare-fun lt!415651 () Unit!31205)

(declare-fun addStillContains!433 (ListLongMap!11595 (_ BitVec 64) V!31231 (_ BitVec 64)) Unit!31205)

(assert (=> b!924408 (= lt!415651 (addStillContains!433 lt!415650 lt!415643 lt!415645 k!1099))))

(declare-fun getCurrentListMap!3064 (array!55368 array!55370 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 32) Int) ListLongMap!11595)

(assert (=> b!924408 (= (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2709 (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415647))))

(assert (=> b!924408 (= lt!415647 (tuple2!12899 lt!415643 lt!415645))))

(declare-fun get!13996 (ValueCell!9368 V!31231) V!31231)

(declare-fun dynLambda!1498 (Int (_ BitVec 64)) V!31231)

(assert (=> b!924408 (= lt!415645 (get!13996 (select (arr!26630 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1498 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415657 () Unit!31205)

(declare-fun lemmaListMapRecursiveValidKeyArray!99 (array!55368 array!55370 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 32) Int) Unit!31205)

(assert (=> b!924408 (= lt!415657 (lemmaListMapRecursiveValidKeyArray!99 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924408 (= e!518751 lt!415653)))

(declare-fun b!924409 () Bool)

(declare-fun e!518743 () Bool)

(declare-fun e!518747 () Bool)

(assert (=> b!924409 (= e!518743 e!518747)))

(declare-fun res!623116 () Bool)

(assert (=> b!924409 (=> (not res!623116) (not e!518747))))

(declare-fun lt!415648 () ListLongMap!11595)

(assert (=> b!924409 (= res!623116 (contains!4873 lt!415648 k!1099))))

(assert (=> b!924409 (= lt!415648 (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924410 () Bool)

(declare-fun res!623108 () Bool)

(assert (=> b!924410 (=> (not res!623108) (not e!518748))))

(assert (=> b!924410 (= res!623108 (and (= (size!27089 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27088 _keys!1487) (size!27089 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924411 () Bool)

(declare-fun e!518746 () Bool)

(declare-fun tp_is_empty!19699 () Bool)

(assert (=> b!924411 (= e!518746 tp_is_empty!19699)))

(declare-fun b!924412 () Bool)

(declare-fun e!518750 () Unit!31205)

(assert (=> b!924412 (= e!518750 e!518751)))

(assert (=> b!924412 (= lt!415643 (select (arr!26629 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96420 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924412 (= c!96420 (validKeyInArray!0 lt!415643))))

(declare-fun b!924414 () Bool)

(declare-fun res!623113 () Bool)

(assert (=> b!924414 (=> (not res!623113) (not e!518748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55368 (_ BitVec 32)) Bool)

(assert (=> b!924414 (= res!623113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924415 () Bool)

(declare-fun e!518744 () Bool)

(assert (=> b!924415 (= e!518744 e!518743)))

(declare-fun res!623111 () Bool)

(assert (=> b!924415 (=> (not res!623111) (not e!518743))))

(assert (=> b!924415 (= res!623111 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27088 _keys!1487)))))

(declare-fun lt!415644 () Unit!31205)

(assert (=> b!924415 (= lt!415644 e!518750)))

(declare-fun c!96418 () Bool)

(assert (=> b!924415 (= c!96418 (validKeyInArray!0 k!1099))))

(declare-fun b!924416 () Bool)

(declare-fun e!518749 () Bool)

(assert (=> b!924416 (= e!518749 e!518744)))

(declare-fun res!623115 () Bool)

(assert (=> b!924416 (=> (not res!623115) (not e!518744))))

(declare-fun v!791 () V!31231)

(assert (=> b!924416 (= res!623115 (and (= lt!415646 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924416 (= lt!415646 (apply!643 lt!415650 k!1099))))

(declare-fun b!924417 () Bool)

(declare-fun arrayContainsKey!0 (array!55368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924417 (= e!518742 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!924418 () Bool)

(assert (=> b!924418 (= e!518748 e!518749)))

(declare-fun res!623110 () Bool)

(assert (=> b!924418 (=> (not res!623110) (not e!518749))))

(assert (=> b!924418 (= res!623110 (contains!4873 lt!415650 k!1099))))

(assert (=> b!924418 (= lt!415650 (getCurrentListMap!3064 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924419 () Bool)

(declare-fun Unit!31208 () Unit!31205)

(assert (=> b!924419 (= e!518750 Unit!31208)))

(declare-fun b!924420 () Bool)

(declare-fun e!518752 () Bool)

(declare-fun e!518741 () Bool)

(declare-fun mapRes!31305 () Bool)

(assert (=> b!924420 (= e!518752 (and e!518741 mapRes!31305))))

(declare-fun condMapEmpty!31305 () Bool)

(declare-fun mapDefault!31305 () ValueCell!9368)

