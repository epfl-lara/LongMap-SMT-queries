; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78984 () Bool)

(assert start!78984)

(declare-fun b_free!17197 () Bool)

(declare-fun b_next!17197 () Bool)

(assert (=> start!78984 (= b_free!17197 (not b_next!17197))))

(declare-fun tp!60032 () Bool)

(declare-fun b_and!28131 () Bool)

(assert (=> start!78984 (= tp!60032 b_and!28131)))

(declare-fun b!924574 () Bool)

(declare-fun res!623189 () Bool)

(declare-fun e!518855 () Bool)

(assert (=> b!924574 (=> (not res!623189) (not e!518855))))

(declare-datatypes ((array!55380 0))(
  ( (array!55381 (arr!26635 (Array (_ BitVec 32) (_ BitVec 64))) (size!27094 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55380)

(declare-datatypes ((List!18706 0))(
  ( (Nil!18703) (Cons!18702 (h!19848 (_ BitVec 64)) (t!26633 List!18706)) )
))
(declare-fun arrayNoDuplicates!0 (array!55380 (_ BitVec 32) List!18706) Bool)

(assert (=> b!924574 (= res!623189 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18703))))

(declare-fun mapNonEmpty!31314 () Bool)

(declare-fun mapRes!31314 () Bool)

(declare-fun tp!60031 () Bool)

(declare-fun e!518853 () Bool)

(assert (=> mapNonEmpty!31314 (= mapRes!31314 (and tp!60031 e!518853))))

(declare-fun mapKey!31314 () (_ BitVec 32))

(declare-datatypes ((V!31239 0))(
  ( (V!31240 (val!9903 Int)) )
))
(declare-datatypes ((ValueCell!9371 0))(
  ( (ValueCellFull!9371 (v!12421 V!31239)) (EmptyCell!9371) )
))
(declare-fun mapRest!31314 () (Array (_ BitVec 32) ValueCell!9371))

(declare-fun mapValue!31314 () ValueCell!9371)

(declare-datatypes ((array!55382 0))(
  ( (array!55383 (arr!26636 (Array (_ BitVec 32) ValueCell!9371)) (size!27095 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55382)

(assert (=> mapNonEmpty!31314 (= (arr!26636 _values!1231) (store mapRest!31314 mapKey!31314 mapValue!31314))))

(declare-fun b!924575 () Bool)

(declare-fun res!623197 () Bool)

(assert (=> b!924575 (=> (not res!623197) (not e!518855))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55380 (_ BitVec 32)) Bool)

(assert (=> b!924575 (= res!623197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924576 () Bool)

(declare-datatypes ((tuple2!12904 0))(
  ( (tuple2!12905 (_1!6463 (_ BitVec 64)) (_2!6463 V!31239)) )
))
(declare-datatypes ((List!18707 0))(
  ( (Nil!18704) (Cons!18703 (h!19849 tuple2!12904) (t!26634 List!18707)) )
))
(declare-datatypes ((ListLongMap!11601 0))(
  ( (ListLongMap!11602 (toList!5816 List!18707)) )
))
(declare-fun lt!415788 () ListLongMap!11601)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!415783 () V!31239)

(declare-fun apply!646 (ListLongMap!11601 (_ BitVec 64)) V!31239)

(assert (=> b!924576 (= (apply!646 lt!415788 k!1099) lt!415783)))

(declare-fun lt!415782 () ListLongMap!11601)

(declare-fun lt!415790 () (_ BitVec 64))

(declare-datatypes ((Unit!31216 0))(
  ( (Unit!31217) )
))
(declare-fun lt!415779 () Unit!31216)

(declare-fun lt!415778 () V!31239)

(declare-fun addApplyDifferent!368 (ListLongMap!11601 (_ BitVec 64) V!31239 (_ BitVec 64)) Unit!31216)

(assert (=> b!924576 (= lt!415779 (addApplyDifferent!368 lt!415782 lt!415790 lt!415778 k!1099))))

(assert (=> b!924576 (not (= lt!415790 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!415785 () Unit!31216)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55380 (_ BitVec 64) (_ BitVec 32) List!18706) Unit!31216)

(assert (=> b!924576 (= lt!415785 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18703))))

(declare-fun e!518858 () Bool)

(assert (=> b!924576 e!518858))

(declare-fun c!96445 () Bool)

(assert (=> b!924576 (= c!96445 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415786 () Unit!31216)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31239)

(declare-fun minValue!1173 () V!31239)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!219 (array!55380 array!55382 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 64) (_ BitVec 32) Int) Unit!31216)

(assert (=> b!924576 (= lt!415786 (lemmaListMapContainsThenArrayContainsFrom!219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924576 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18703)))

(declare-fun lt!415780 () Unit!31216)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55380 (_ BitVec 32) (_ BitVec 32)) Unit!31216)

(assert (=> b!924576 (= lt!415780 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4876 (ListLongMap!11601 (_ BitVec 64)) Bool)

(assert (=> b!924576 (contains!4876 lt!415788 k!1099)))

(declare-fun lt!415787 () tuple2!12904)

(declare-fun +!2712 (ListLongMap!11601 tuple2!12904) ListLongMap!11601)

(assert (=> b!924576 (= lt!415788 (+!2712 lt!415782 lt!415787))))

(declare-fun lt!415791 () Unit!31216)

(declare-fun addStillContains!436 (ListLongMap!11601 (_ BitVec 64) V!31239 (_ BitVec 64)) Unit!31216)

(assert (=> b!924576 (= lt!415791 (addStillContains!436 lt!415782 lt!415790 lt!415778 k!1099))))

(declare-fun getCurrentListMap!3067 (array!55380 array!55382 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 32) Int) ListLongMap!11601)

(assert (=> b!924576 (= (getCurrentListMap!3067 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2712 (getCurrentListMap!3067 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415787))))

(assert (=> b!924576 (= lt!415787 (tuple2!12905 lt!415790 lt!415778))))

(declare-fun get!14001 (ValueCell!9371 V!31239) V!31239)

(declare-fun dynLambda!1501 (Int (_ BitVec 64)) V!31239)

(assert (=> b!924576 (= lt!415778 (get!14001 (select (arr!26636 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1501 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415781 () Unit!31216)

(declare-fun lemmaListMapRecursiveValidKeyArray!102 (array!55380 array!55382 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 32) Int) Unit!31216)

(assert (=> b!924576 (= lt!415781 (lemmaListMapRecursiveValidKeyArray!102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518857 () Unit!31216)

(assert (=> b!924576 (= e!518857 lt!415779)))

(declare-fun b!924577 () Bool)

(declare-fun Unit!31218 () Unit!31216)

(assert (=> b!924577 (= e!518857 Unit!31218)))

(declare-fun b!924578 () Bool)

(declare-fun e!518851 () Bool)

(declare-fun e!518854 () Bool)

(assert (=> b!924578 (= e!518851 e!518854)))

(declare-fun res!623193 () Bool)

(assert (=> b!924578 (=> (not res!623193) (not e!518854))))

(declare-fun v!791 () V!31239)

(assert (=> b!924578 (= res!623193 (and (= lt!415783 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924578 (= lt!415783 (apply!646 lt!415782 k!1099))))

(declare-fun b!924579 () Bool)

(declare-fun res!623196 () Bool)

(assert (=> b!924579 (=> (not res!623196) (not e!518855))))

(assert (=> b!924579 (= res!623196 (and (= (size!27095 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27094 _keys!1487) (size!27095 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924580 () Bool)

(declare-fun tp_is_empty!19705 () Bool)

(assert (=> b!924580 (= e!518853 tp_is_empty!19705)))

(declare-fun b!924581 () Bool)

(declare-fun e!518856 () Bool)

(declare-fun e!518849 () Bool)

(assert (=> b!924581 (= e!518856 (and e!518849 mapRes!31314))))

(declare-fun condMapEmpty!31314 () Bool)

(declare-fun mapDefault!31314 () ValueCell!9371)

