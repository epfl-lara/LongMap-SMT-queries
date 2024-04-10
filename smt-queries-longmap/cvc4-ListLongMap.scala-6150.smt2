; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79012 () Bool)

(assert start!79012)

(declare-fun b_free!17225 () Bool)

(declare-fun b_next!17225 () Bool)

(assert (=> start!79012 (= b_free!17225 (not b_next!17225))))

(declare-fun tp!60116 () Bool)

(declare-fun b_and!28187 () Bool)

(assert (=> start!79012 (= tp!60116 b_and!28187)))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31275 0))(
  ( (V!31276 (val!9917 Int)) )
))
(declare-fun v!791 () V!31275)

(declare-datatypes ((tuple2!12930 0))(
  ( (tuple2!12931 (_1!6476 (_ BitVec 64)) (_2!6476 V!31275)) )
))
(declare-datatypes ((List!18732 0))(
  ( (Nil!18729) (Cons!18728 (h!19874 tuple2!12930) (t!26687 List!18732)) )
))
(declare-datatypes ((ListLongMap!11627 0))(
  ( (ListLongMap!11628 (toList!5829 List!18732)) )
))
(declare-fun lt!416439 () ListLongMap!11627)

(declare-fun b!925391 () Bool)

(declare-fun e!519377 () Bool)

(declare-fun apply!659 (ListLongMap!11627 (_ BitVec 64)) V!31275)

(assert (=> b!925391 (= e!519377 (= (apply!659 lt!416439 k!1099) v!791))))

(declare-fun b!925392 () Bool)

(declare-fun res!623601 () Bool)

(declare-fun e!519373 () Bool)

(assert (=> b!925392 (=> (not res!623601) (not e!519373))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55434 0))(
  ( (array!55435 (arr!26662 (Array (_ BitVec 32) (_ BitVec 64))) (size!27121 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55434)

(assert (=> b!925392 (= res!623601 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27121 _keys!1487))))))

(declare-fun b!925393 () Bool)

(declare-datatypes ((Unit!31265 0))(
  ( (Unit!31266) )
))
(declare-fun e!519376 () Unit!31265)

(declare-fun Unit!31267 () Unit!31265)

(assert (=> b!925393 (= e!519376 Unit!31267)))

(declare-fun b!925394 () Bool)

(declare-fun e!519380 () Bool)

(declare-fun e!519370 () Bool)

(assert (=> b!925394 (= e!519380 e!519370)))

(declare-fun res!623602 () Bool)

(assert (=> b!925394 (=> (not res!623602) (not e!519370))))

(declare-fun lt!416438 () V!31275)

(assert (=> b!925394 (= res!623602 (and (= lt!416438 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!416428 () ListLongMap!11627)

(assert (=> b!925394 (= lt!416438 (apply!659 lt!416428 k!1099))))

(declare-fun b!925395 () Bool)

(declare-fun lt!416429 () ListLongMap!11627)

(assert (=> b!925395 (= (apply!659 lt!416429 k!1099) lt!416438)))

(declare-fun lt!416430 () V!31275)

(declare-fun lt!416437 () Unit!31265)

(declare-fun lt!416435 () (_ BitVec 64))

(declare-fun addApplyDifferent!380 (ListLongMap!11627 (_ BitVec 64) V!31275 (_ BitVec 64)) Unit!31265)

(assert (=> b!925395 (= lt!416437 (addApplyDifferent!380 lt!416428 lt!416435 lt!416430 k!1099))))

(assert (=> b!925395 (not (= lt!416435 k!1099))))

(declare-fun lt!416425 () Unit!31265)

(declare-datatypes ((List!18733 0))(
  ( (Nil!18730) (Cons!18729 (h!19875 (_ BitVec 64)) (t!26688 List!18733)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55434 (_ BitVec 64) (_ BitVec 32) List!18733) Unit!31265)

(assert (=> b!925395 (= lt!416425 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18730))))

(declare-fun e!519374 () Bool)

(assert (=> b!925395 e!519374))

(declare-fun c!96572 () Bool)

(assert (=> b!925395 (= c!96572 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!416426 () Unit!31265)

(declare-datatypes ((ValueCell!9385 0))(
  ( (ValueCellFull!9385 (v!12435 V!31275)) (EmptyCell!9385) )
))
(declare-datatypes ((array!55436 0))(
  ( (array!55437 (arr!26663 (Array (_ BitVec 32) ValueCell!9385)) (size!27122 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55436)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31275)

(declare-fun minValue!1173 () V!31275)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!231 (array!55434 array!55436 (_ BitVec 32) (_ BitVec 32) V!31275 V!31275 (_ BitVec 64) (_ BitVec 32) Int) Unit!31265)

(assert (=> b!925395 (= lt!416426 (lemmaListMapContainsThenArrayContainsFrom!231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55434 (_ BitVec 32) List!18733) Bool)

(assert (=> b!925395 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18730)))

(declare-fun lt!416433 () Unit!31265)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55434 (_ BitVec 32) (_ BitVec 32)) Unit!31265)

(assert (=> b!925395 (= lt!416433 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4889 (ListLongMap!11627 (_ BitVec 64)) Bool)

(assert (=> b!925395 (contains!4889 lt!416429 k!1099)))

(declare-fun lt!416440 () tuple2!12930)

(declare-fun +!2724 (ListLongMap!11627 tuple2!12930) ListLongMap!11627)

(assert (=> b!925395 (= lt!416429 (+!2724 lt!416428 lt!416440))))

(declare-fun lt!416427 () Unit!31265)

(declare-fun addStillContains!448 (ListLongMap!11627 (_ BitVec 64) V!31275 (_ BitVec 64)) Unit!31265)

(assert (=> b!925395 (= lt!416427 (addStillContains!448 lt!416428 lt!416435 lt!416430 k!1099))))

(declare-fun getCurrentListMap!3080 (array!55434 array!55436 (_ BitVec 32) (_ BitVec 32) V!31275 V!31275 (_ BitVec 32) Int) ListLongMap!11627)

(assert (=> b!925395 (= (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2724 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416440))))

(assert (=> b!925395 (= lt!416440 (tuple2!12931 lt!416435 lt!416430))))

(declare-fun get!14021 (ValueCell!9385 V!31275) V!31275)

(declare-fun dynLambda!1513 (Int (_ BitVec 64)) V!31275)

(assert (=> b!925395 (= lt!416430 (get!14021 (select (arr!26663 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1513 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416432 () Unit!31265)

(declare-fun lemmaListMapRecursiveValidKeyArray!114 (array!55434 array!55436 (_ BitVec 32) (_ BitVec 32) V!31275 V!31275 (_ BitVec 32) Int) Unit!31265)

(assert (=> b!925395 (= lt!416432 (lemmaListMapRecursiveValidKeyArray!114 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925395 (= e!519376 lt!416437)))

(declare-fun b!925396 () Bool)

(declare-fun res!623603 () Bool)

(assert (=> b!925396 (=> (not res!623603) (not e!519373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55434 (_ BitVec 32)) Bool)

(assert (=> b!925396 (= res!623603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925397 () Bool)

(declare-fun e!519372 () Unit!31265)

(declare-fun Unit!31268 () Unit!31265)

(assert (=> b!925397 (= e!519372 Unit!31268)))

(declare-fun b!925398 () Bool)

(declare-fun e!519379 () Bool)

(declare-fun e!519375 () Bool)

(assert (=> b!925398 (= e!519379 e!519375)))

(declare-fun res!623608 () Bool)

(assert (=> b!925398 (=> (not res!623608) (not e!519375))))

(declare-fun lt!416436 () ListLongMap!11627)

(assert (=> b!925398 (= res!623608 (contains!4889 lt!416436 k!1099))))

(assert (=> b!925398 (= lt!416436 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925399 () Bool)

(assert (=> b!925399 (= e!519374 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925400 () Bool)

(declare-fun res!623606 () Bool)

(assert (=> b!925400 (=> (not res!623606) (not e!519375))))

(assert (=> b!925400 (= res!623606 (= (apply!659 lt!416436 k!1099) v!791))))

(declare-fun b!925401 () Bool)

(declare-fun arrayContainsKey!0 (array!55434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925401 (= e!519374 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!925402 () Bool)

(declare-fun res!623609 () Bool)

(assert (=> b!925402 (=> (not res!623609) (not e!519373))))

(assert (=> b!925402 (= res!623609 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18730))))

(declare-fun b!925403 () Bool)

(assert (=> b!925403 (= e!519373 e!519380)))

(declare-fun res!623611 () Bool)

(assert (=> b!925403 (=> (not res!623611) (not e!519380))))

(assert (=> b!925403 (= res!623611 (contains!4889 lt!416428 k!1099))))

(assert (=> b!925403 (= lt!416428 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31356 () Bool)

(declare-fun mapRes!31356 () Bool)

(assert (=> mapIsEmpty!31356 mapRes!31356))

(declare-fun res!623610 () Bool)

(assert (=> start!79012 (=> (not res!623610) (not e!519373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79012 (= res!623610 (validMask!0 mask!1881))))

(assert (=> start!79012 e!519373))

(assert (=> start!79012 true))

(declare-fun tp_is_empty!19733 () Bool)

(assert (=> start!79012 tp_is_empty!19733))

(declare-fun e!519371 () Bool)

(declare-fun array_inv!20766 (array!55436) Bool)

(assert (=> start!79012 (and (array_inv!20766 _values!1231) e!519371)))

(assert (=> start!79012 tp!60116))

(declare-fun array_inv!20767 (array!55434) Bool)

(assert (=> start!79012 (array_inv!20767 _keys!1487)))

(declare-fun b!925404 () Bool)

(declare-fun e!519382 () Bool)

(assert (=> b!925404 (= e!519371 (and e!519382 mapRes!31356))))

(declare-fun condMapEmpty!31356 () Bool)

(declare-fun mapDefault!31356 () ValueCell!9385)

