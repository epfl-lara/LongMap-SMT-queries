; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79084 () Bool)

(assert start!79084)

(declare-fun b_free!17297 () Bool)

(declare-fun b_next!17297 () Bool)

(assert (=> start!79084 (= b_free!17297 (not b_next!17297))))

(declare-fun tp!60331 () Bool)

(declare-fun b_and!28331 () Bool)

(assert (=> start!79084 (= tp!60331 b_and!28331)))

(declare-fun b!927623 () Bool)

(declare-datatypes ((Unit!31378 0))(
  ( (Unit!31379) )
))
(declare-fun e!520776 () Unit!31378)

(declare-fun Unit!31380 () Unit!31378)

(assert (=> b!927623 (= e!520776 Unit!31380)))

(declare-fun b!927624 () Bool)

(declare-fun e!520774 () Unit!31378)

(assert (=> b!927624 (= e!520776 e!520774)))

(declare-fun lt!418163 () (_ BitVec 64))

(declare-datatypes ((array!55570 0))(
  ( (array!55571 (arr!26730 (Array (_ BitVec 32) (_ BitVec 64))) (size!27189 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55570)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!927624 (= lt!418163 (select (arr!26730 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96895 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927624 (= c!96895 (validKeyInArray!0 lt!418163))))

(declare-fun b!927625 () Bool)

(declare-fun e!520785 () Bool)

(assert (=> b!927625 (= e!520785 (not true))))

(declare-fun e!520786 () Bool)

(assert (=> b!927625 e!520786))

(declare-fun res!624797 () Bool)

(assert (=> b!927625 (=> (not res!624797) (not e!520786))))

(declare-datatypes ((V!31371 0))(
  ( (V!31372 (val!9953 Int)) )
))
(declare-datatypes ((tuple2!12994 0))(
  ( (tuple2!12995 (_1!6508 (_ BitVec 64)) (_2!6508 V!31371)) )
))
(declare-datatypes ((List!18795 0))(
  ( (Nil!18792) (Cons!18791 (h!19937 tuple2!12994) (t!26822 List!18795)) )
))
(declare-datatypes ((ListLongMap!11691 0))(
  ( (ListLongMap!11692 (toList!5861 List!18795)) )
))
(declare-fun lt!418159 () ListLongMap!11691)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4919 (ListLongMap!11691 (_ BitVec 64)) Bool)

(assert (=> b!927625 (= res!624797 (contains!4919 lt!418159 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9421 0))(
  ( (ValueCellFull!9421 (v!12471 V!31371)) (EmptyCell!9421) )
))
(declare-datatypes ((array!55572 0))(
  ( (array!55573 (arr!26731 (Array (_ BitVec 32) ValueCell!9421)) (size!27190 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55572)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31371)

(declare-fun minValue!1173 () V!31371)

(declare-fun getCurrentListMap!3110 (array!55570 array!55572 (_ BitVec 32) (_ BitVec 32) V!31371 V!31371 (_ BitVec 32) Int) ListLongMap!11691)

(assert (=> b!927625 (= lt!418159 (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31371)

(declare-fun lt!418161 () Unit!31378)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!91 (array!55570 array!55572 (_ BitVec 32) (_ BitVec 32) V!31371 V!31371 (_ BitVec 64) V!31371 (_ BitVec 32) Int) Unit!31378)

(assert (=> b!927625 (= lt!418161 (lemmaListMapApplyFromThenApplyFromZero!91 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927626 () Bool)

(declare-fun e!520781 () Bool)

(declare-fun e!520778 () Bool)

(assert (=> b!927626 (= e!520781 e!520778)))

(declare-fun res!624798 () Bool)

(assert (=> b!927626 (=> (not res!624798) (not e!520778))))

(declare-fun lt!418154 () ListLongMap!11691)

(assert (=> b!927626 (= res!624798 (contains!4919 lt!418154 k!1099))))

(assert (=> b!927626 (= lt!418154 (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927627 () Bool)

(declare-fun e!520775 () Bool)

(assert (=> b!927627 (= e!520778 e!520775)))

(declare-fun res!624791 () Bool)

(assert (=> b!927627 (=> (not res!624791) (not e!520775))))

(declare-fun lt!418160 () V!31371)

(assert (=> b!927627 (= res!624791 (and (= lt!418160 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!691 (ListLongMap!11691 (_ BitVec 64)) V!31371)

(assert (=> b!927627 (= lt!418160 (apply!691 lt!418154 k!1099))))

(declare-fun b!927629 () Bool)

(declare-fun res!624795 () Bool)

(assert (=> b!927629 (=> (not res!624795) (not e!520785))))

(declare-fun lt!418157 () ListLongMap!11691)

(assert (=> b!927629 (= res!624795 (= (apply!691 lt!418157 k!1099) v!791))))

(declare-fun b!927630 () Bool)

(declare-fun res!624799 () Bool)

(assert (=> b!927630 (=> (not res!624799) (not e!520781))))

(declare-datatypes ((List!18796 0))(
  ( (Nil!18793) (Cons!18792 (h!19938 (_ BitVec 64)) (t!26823 List!18796)) )
))
(declare-fun arrayNoDuplicates!0 (array!55570 (_ BitVec 32) List!18796) Bool)

(assert (=> b!927630 (= res!624799 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18793))))

(declare-fun b!927631 () Bool)

(declare-fun Unit!31381 () Unit!31378)

(assert (=> b!927631 (= e!520774 Unit!31381)))

(declare-fun b!927632 () Bool)

(declare-fun e!520784 () Bool)

(assert (=> b!927632 (= e!520784 e!520785)))

(declare-fun res!624789 () Bool)

(assert (=> b!927632 (=> (not res!624789) (not e!520785))))

(assert (=> b!927632 (= res!624789 (contains!4919 lt!418157 k!1099))))

(assert (=> b!927632 (= lt!418157 (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927633 () Bool)

(declare-fun e!520779 () Bool)

(assert (=> b!927633 (= e!520779 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31464 () Bool)

(declare-fun mapRes!31464 () Bool)

(declare-fun tp!60332 () Bool)

(declare-fun e!520780 () Bool)

(assert (=> mapNonEmpty!31464 (= mapRes!31464 (and tp!60332 e!520780))))

(declare-fun mapRest!31464 () (Array (_ BitVec 32) ValueCell!9421))

(declare-fun mapValue!31464 () ValueCell!9421)

(declare-fun mapKey!31464 () (_ BitVec 32))

(assert (=> mapNonEmpty!31464 (= (arr!26731 _values!1231) (store mapRest!31464 mapKey!31464 mapValue!31464))))

(declare-fun b!927634 () Bool)

(declare-fun res!624796 () Bool)

(assert (=> b!927634 (=> (not res!624796) (not e!520781))))

(assert (=> b!927634 (= res!624796 (and (= (size!27190 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27189 _keys!1487) (size!27190 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927635 () Bool)

(declare-fun res!624792 () Bool)

(assert (=> b!927635 (=> (not res!624792) (not e!520781))))

(assert (=> b!927635 (= res!624792 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27189 _keys!1487))))))

(declare-fun b!927636 () Bool)

(declare-fun tp_is_empty!19805 () Bool)

(assert (=> b!927636 (= e!520780 tp_is_empty!19805)))

(declare-fun b!927637 () Bool)

(declare-fun arrayContainsKey!0 (array!55570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927637 (= e!520779 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!927638 () Bool)

(assert (=> b!927638 (= e!520786 (= (apply!691 lt!418159 k!1099) v!791))))

(declare-fun b!927639 () Bool)

(assert (=> b!927639 (= e!520775 e!520784)))

(declare-fun res!624794 () Bool)

(assert (=> b!927639 (=> (not res!624794) (not e!520784))))

(assert (=> b!927639 (= res!624794 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27189 _keys!1487)))))

(declare-fun lt!418167 () Unit!31378)

(assert (=> b!927639 (= lt!418167 e!520776)))

(declare-fun c!96897 () Bool)

(assert (=> b!927639 (= c!96897 (validKeyInArray!0 k!1099))))

(declare-fun b!927640 () Bool)

(declare-fun res!624793 () Bool)

(assert (=> b!927640 (=> (not res!624793) (not e!520781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55570 (_ BitVec 32)) Bool)

(assert (=> b!927640 (= res!624793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927641 () Bool)

(declare-fun e!520782 () Bool)

(assert (=> b!927641 (= e!520782 tp_is_empty!19805)))

(declare-fun b!927642 () Bool)

(declare-fun lt!418155 () ListLongMap!11691)

(assert (=> b!927642 (= (apply!691 lt!418155 k!1099) lt!418160)))

(declare-fun lt!418166 () V!31371)

(declare-fun lt!418168 () Unit!31378)

(declare-fun addApplyDifferent!406 (ListLongMap!11691 (_ BitVec 64) V!31371 (_ BitVec 64)) Unit!31378)

(assert (=> b!927642 (= lt!418168 (addApplyDifferent!406 lt!418154 lt!418163 lt!418166 k!1099))))

(assert (=> b!927642 (not (= lt!418163 k!1099))))

(declare-fun lt!418162 () Unit!31378)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55570 (_ BitVec 64) (_ BitVec 32) List!18796) Unit!31378)

(assert (=> b!927642 (= lt!418162 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18793))))

(assert (=> b!927642 e!520779))

(declare-fun c!96896 () Bool)

(assert (=> b!927642 (= c!96896 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418164 () Unit!31378)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!257 (array!55570 array!55572 (_ BitVec 32) (_ BitVec 32) V!31371 V!31371 (_ BitVec 64) (_ BitVec 32) Int) Unit!31378)

(assert (=> b!927642 (= lt!418164 (lemmaListMapContainsThenArrayContainsFrom!257 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927642 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18793)))

(declare-fun lt!418165 () Unit!31378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55570 (_ BitVec 32) (_ BitVec 32)) Unit!31378)

(assert (=> b!927642 (= lt!418165 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927642 (contains!4919 lt!418155 k!1099)))

(declare-fun lt!418156 () tuple2!12994)

(declare-fun +!2750 (ListLongMap!11691 tuple2!12994) ListLongMap!11691)

(assert (=> b!927642 (= lt!418155 (+!2750 lt!418154 lt!418156))))

(declare-fun lt!418158 () Unit!31378)

(declare-fun addStillContains!474 (ListLongMap!11691 (_ BitVec 64) V!31371 (_ BitVec 64)) Unit!31378)

(assert (=> b!927642 (= lt!418158 (addStillContains!474 lt!418154 lt!418163 lt!418166 k!1099))))

(assert (=> b!927642 (= (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2750 (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418156))))

(assert (=> b!927642 (= lt!418156 (tuple2!12995 lt!418163 lt!418166))))

(declare-fun get!14071 (ValueCell!9421 V!31371) V!31371)

(declare-fun dynLambda!1539 (Int (_ BitVec 64)) V!31371)

(assert (=> b!927642 (= lt!418166 (get!14071 (select (arr!26731 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1539 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418153 () Unit!31378)

(declare-fun lemmaListMapRecursiveValidKeyArray!140 (array!55570 array!55572 (_ BitVec 32) (_ BitVec 32) V!31371 V!31371 (_ BitVec 32) Int) Unit!31378)

(assert (=> b!927642 (= lt!418153 (lemmaListMapRecursiveValidKeyArray!140 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927642 (= e!520774 lt!418168)))

(declare-fun mapIsEmpty!31464 () Bool)

(assert (=> mapIsEmpty!31464 mapRes!31464))

(declare-fun b!927628 () Bool)

(declare-fun e!520777 () Bool)

(assert (=> b!927628 (= e!520777 (and e!520782 mapRes!31464))))

(declare-fun condMapEmpty!31464 () Bool)

(declare-fun mapDefault!31464 () ValueCell!9421)

