; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79020 () Bool)

(assert start!79020)

(declare-fun b_free!17233 () Bool)

(declare-fun b_next!17233 () Bool)

(assert (=> start!79020 (= b_free!17233 (not b_next!17233))))

(declare-fun tp!60139 () Bool)

(declare-fun b_and!28203 () Bool)

(assert (=> start!79020 (= tp!60139 b_and!28203)))

(declare-fun b!925640 () Bool)

(declare-fun e!519529 () Bool)

(assert (=> b!925640 (= e!519529 (not true))))

(declare-fun e!519536 () Bool)

(assert (=> b!925640 e!519536))

(declare-fun res!623737 () Bool)

(assert (=> b!925640 (=> (not res!623737) (not e!519536))))

(declare-datatypes ((V!31287 0))(
  ( (V!31288 (val!9921 Int)) )
))
(declare-datatypes ((tuple2!12938 0))(
  ( (tuple2!12939 (_1!6480 (_ BitVec 64)) (_2!6480 V!31287)) )
))
(declare-datatypes ((List!18739 0))(
  ( (Nil!18736) (Cons!18735 (h!19881 tuple2!12938) (t!26702 List!18739)) )
))
(declare-datatypes ((ListLongMap!11635 0))(
  ( (ListLongMap!11636 (toList!5833 List!18739)) )
))
(declare-fun lt!416627 () ListLongMap!11635)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4892 (ListLongMap!11635 (_ BitVec 64)) Bool)

(assert (=> b!925640 (= res!623737 (contains!4892 lt!416627 k!1099))))

(declare-datatypes ((array!55448 0))(
  ( (array!55449 (arr!26669 (Array (_ BitVec 32) (_ BitVec 64))) (size!27128 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55448)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9389 0))(
  ( (ValueCellFull!9389 (v!12439 V!31287)) (EmptyCell!9389) )
))
(declare-datatypes ((array!55450 0))(
  ( (array!55451 (arr!26670 (Array (_ BitVec 32) ValueCell!9389)) (size!27129 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55450)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31287)

(declare-fun minValue!1173 () V!31287)

(declare-fun getCurrentListMap!3083 (array!55448 array!55450 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 32) Int) ListLongMap!11635)

(assert (=> b!925640 (= lt!416627 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31287)

(declare-datatypes ((Unit!31280 0))(
  ( (Unit!31281) )
))
(declare-fun lt!416622 () Unit!31280)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!72 (array!55448 array!55450 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 64) V!31287 (_ BitVec 32) Int) Unit!31280)

(assert (=> b!925640 (= lt!416622 (lemmaListMapApplyFromThenApplyFromZero!72 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925641 () Bool)

(declare-fun res!623743 () Bool)

(declare-fun e!519526 () Bool)

(assert (=> b!925641 (=> (not res!623743) (not e!519526))))

(declare-datatypes ((List!18740 0))(
  ( (Nil!18737) (Cons!18736 (h!19882 (_ BitVec 64)) (t!26703 List!18740)) )
))
(declare-fun arrayNoDuplicates!0 (array!55448 (_ BitVec 32) List!18740) Bool)

(assert (=> b!925641 (= res!623743 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18737))))

(declare-fun b!925642 () Bool)

(declare-fun res!623739 () Bool)

(assert (=> b!925642 (=> (not res!623739) (not e!519529))))

(declare-fun lt!416621 () ListLongMap!11635)

(declare-fun apply!663 (ListLongMap!11635 (_ BitVec 64)) V!31287)

(assert (=> b!925642 (= res!623739 (= (apply!663 lt!416621 k!1099) v!791))))

(declare-fun b!925643 () Bool)

(declare-fun e!519538 () Bool)

(declare-fun tp_is_empty!19741 () Bool)

(assert (=> b!925643 (= e!519538 tp_is_empty!19741)))

(declare-fun b!925644 () Bool)

(declare-fun e!519537 () Bool)

(assert (=> b!925644 (= e!519537 e!519529)))

(declare-fun res!623734 () Bool)

(assert (=> b!925644 (=> (not res!623734) (not e!519529))))

(assert (=> b!925644 (= res!623734 (contains!4892 lt!416621 k!1099))))

(assert (=> b!925644 (= lt!416621 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925645 () Bool)

(declare-fun lt!416630 () ListLongMap!11635)

(declare-fun lt!416628 () V!31287)

(assert (=> b!925645 (= (apply!663 lt!416630 k!1099) lt!416628)))

(declare-fun lt!416625 () Unit!31280)

(declare-fun lt!416623 () V!31287)

(declare-fun lt!416629 () ListLongMap!11635)

(declare-fun lt!416618 () (_ BitVec 64))

(declare-fun addApplyDifferent!383 (ListLongMap!11635 (_ BitVec 64) V!31287 (_ BitVec 64)) Unit!31280)

(assert (=> b!925645 (= lt!416625 (addApplyDifferent!383 lt!416629 lt!416618 lt!416623 k!1099))))

(assert (=> b!925645 (not (= lt!416618 k!1099))))

(declare-fun lt!416619 () Unit!31280)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55448 (_ BitVec 64) (_ BitVec 32) List!18740) Unit!31280)

(assert (=> b!925645 (= lt!416619 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18737))))

(declare-fun e!519535 () Bool)

(assert (=> b!925645 e!519535))

(declare-fun c!96608 () Bool)

(assert (=> b!925645 (= c!96608 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416617 () Unit!31280)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!234 (array!55448 array!55450 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 64) (_ BitVec 32) Int) Unit!31280)

(assert (=> b!925645 (= lt!416617 (lemmaListMapContainsThenArrayContainsFrom!234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925645 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18737)))

(declare-fun lt!416626 () Unit!31280)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55448 (_ BitVec 32) (_ BitVec 32)) Unit!31280)

(assert (=> b!925645 (= lt!416626 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925645 (contains!4892 lt!416630 k!1099)))

(declare-fun lt!416631 () tuple2!12938)

(declare-fun +!2727 (ListLongMap!11635 tuple2!12938) ListLongMap!11635)

(assert (=> b!925645 (= lt!416630 (+!2727 lt!416629 lt!416631))))

(declare-fun lt!416632 () Unit!31280)

(declare-fun addStillContains!451 (ListLongMap!11635 (_ BitVec 64) V!31287 (_ BitVec 64)) Unit!31280)

(assert (=> b!925645 (= lt!416632 (addStillContains!451 lt!416629 lt!416618 lt!416623 k!1099))))

(assert (=> b!925645 (= (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2727 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416631))))

(assert (=> b!925645 (= lt!416631 (tuple2!12939 lt!416618 lt!416623))))

(declare-fun get!14028 (ValueCell!9389 V!31287) V!31287)

(declare-fun dynLambda!1516 (Int (_ BitVec 64)) V!31287)

(assert (=> b!925645 (= lt!416623 (get!14028 (select (arr!26670 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1516 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416620 () Unit!31280)

(declare-fun lemmaListMapRecursiveValidKeyArray!117 (array!55448 array!55450 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 32) Int) Unit!31280)

(assert (=> b!925645 (= lt!416620 (lemmaListMapRecursiveValidKeyArray!117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519533 () Unit!31280)

(assert (=> b!925645 (= e!519533 lt!416625)))

(declare-fun b!925646 () Bool)

(declare-fun e!519527 () Unit!31280)

(declare-fun Unit!31282 () Unit!31280)

(assert (=> b!925646 (= e!519527 Unit!31282)))

(declare-fun b!925647 () Bool)

(declare-fun e!519530 () Bool)

(assert (=> b!925647 (= e!519530 tp_is_empty!19741)))

(declare-fun b!925648 () Bool)

(assert (=> b!925648 (= e!519536 (= (apply!663 lt!416627 k!1099) v!791))))

(declare-fun b!925649 () Bool)

(declare-fun e!519531 () Bool)

(declare-fun mapRes!31368 () Bool)

(assert (=> b!925649 (= e!519531 (and e!519530 mapRes!31368))))

(declare-fun condMapEmpty!31368 () Bool)

(declare-fun mapDefault!31368 () ValueCell!9389)

