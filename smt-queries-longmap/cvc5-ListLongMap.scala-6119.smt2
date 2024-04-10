; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78822 () Bool)

(assert start!78822)

(declare-fun b_free!17035 () Bool)

(declare-fun b_next!17035 () Bool)

(assert (=> start!78822 (= b_free!17035 (not b_next!17035))))

(declare-fun tp!59545 () Bool)

(declare-fun b_and!27807 () Bool)

(assert (=> start!78822 (= tp!59545 b_and!27807)))

(declare-fun b!920307 () Bool)

(declare-fun res!620601 () Bool)

(declare-fun e!516532 () Bool)

(assert (=> b!920307 (=> (not res!620601) (not e!516532))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31023 0))(
  ( (V!31024 (val!9822 Int)) )
))
(declare-fun v!791 () V!31023)

(declare-datatypes ((tuple2!12768 0))(
  ( (tuple2!12769 (_1!6395 (_ BitVec 64)) (_2!6395 V!31023)) )
))
(declare-datatypes ((List!18571 0))(
  ( (Nil!18568) (Cons!18567 (h!19713 tuple2!12768) (t!26336 List!18571)) )
))
(declare-datatypes ((ListLongMap!11465 0))(
  ( (ListLongMap!11466 (toList!5748 List!18571)) )
))
(declare-fun lt!413152 () ListLongMap!11465)

(declare-fun apply!590 (ListLongMap!11465 (_ BitVec 64)) V!31023)

(assert (=> b!920307 (= res!620601 (= (apply!590 lt!413152 k!1099) v!791))))

(declare-fun b!920308 () Bool)

(declare-fun e!516536 () Bool)

(assert (=> b!920308 (= e!516536 e!516532)))

(declare-fun res!620599 () Bool)

(assert (=> b!920308 (=> (not res!620599) (not e!516532))))

(declare-fun contains!4793 (ListLongMap!11465 (_ BitVec 64)) Bool)

(assert (=> b!920308 (= res!620599 (contains!4793 lt!413152 k!1099))))

(declare-datatypes ((array!55066 0))(
  ( (array!55067 (arr!26478 (Array (_ BitVec 32) (_ BitVec 64))) (size!26937 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55066)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9290 0))(
  ( (ValueCellFull!9290 (v!12340 V!31023)) (EmptyCell!9290) )
))
(declare-datatypes ((array!55068 0))(
  ( (array!55069 (arr!26479 (Array (_ BitVec 32) ValueCell!9290)) (size!26938 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55068)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31023)

(declare-fun minValue!1173 () V!31023)

(declare-fun getCurrentListMap!3003 (array!55066 array!55068 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 32) Int) ListLongMap!11465)

(assert (=> b!920308 (= lt!413152 (getCurrentListMap!3003 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920309 () Bool)

(declare-fun e!516538 () Bool)

(assert (=> b!920309 (= e!516532 e!516538)))

(declare-fun res!620600 () Bool)

(assert (=> b!920309 (=> (not res!620600) (not e!516538))))

(declare-fun lt!413151 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920309 (= res!620600 (validKeyInArray!0 lt!413151))))

(assert (=> b!920309 (= lt!413151 (select (arr!26478 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920310 () Bool)

(declare-fun res!620607 () Bool)

(assert (=> b!920310 (=> (not res!620607) (not e!516536))))

(assert (=> b!920310 (= res!620607 (and (= (size!26938 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26937 _keys!1487) (size!26938 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920311 () Bool)

(declare-fun res!620602 () Bool)

(assert (=> b!920311 (=> (not res!620602) (not e!516536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55066 (_ BitVec 32)) Bool)

(assert (=> b!920311 (= res!620602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920312 () Bool)

(declare-fun e!516534 () Bool)

(declare-fun tp_is_empty!19543 () Bool)

(assert (=> b!920312 (= e!516534 tp_is_empty!19543)))

(declare-fun b!920313 () Bool)

(declare-fun res!620597 () Bool)

(declare-fun e!516531 () Bool)

(assert (=> b!920313 (=> res!620597 e!516531)))

(declare-datatypes ((List!18572 0))(
  ( (Nil!18569) (Cons!18568 (h!19714 (_ BitVec 64)) (t!26337 List!18572)) )
))
(declare-fun noDuplicate!1331 (List!18572) Bool)

(assert (=> b!920313 (= res!620597 (not (noDuplicate!1331 Nil!18569)))))

(declare-fun b!920315 () Bool)

(declare-fun e!516535 () Bool)

(assert (=> b!920315 (= e!516535 tp_is_empty!19543)))

(declare-fun e!516533 () Bool)

(declare-fun b!920316 () Bool)

(declare-fun arrayContainsKey!0 (array!55066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920316 (= e!516533 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!920317 () Bool)

(declare-fun res!620605 () Bool)

(assert (=> b!920317 (=> (not res!620605) (not e!516536))))

(declare-fun arrayNoDuplicates!0 (array!55066 (_ BitVec 32) List!18572) Bool)

(assert (=> b!920317 (= res!620605 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18569))))

(declare-fun b!920318 () Bool)

(declare-fun res!620604 () Bool)

(assert (=> b!920318 (=> res!620604 e!516531)))

(declare-fun contains!4794 (List!18572 (_ BitVec 64)) Bool)

(assert (=> b!920318 (= res!620604 (contains!4794 Nil!18569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920319 () Bool)

(assert (=> b!920319 (= e!516538 (not e!516531))))

(declare-fun res!620606 () Bool)

(assert (=> b!920319 (=> res!620606 e!516531)))

(assert (=> b!920319 (= res!620606 (or (bvsge (size!26937 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26937 _keys!1487))))))

(assert (=> b!920319 e!516533))

(declare-fun c!96054 () Bool)

(assert (=> b!920319 (= c!96054 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31060 0))(
  ( (Unit!31061) )
))
(declare-fun lt!413154 () Unit!31060)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!163 (array!55066 array!55068 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 64) (_ BitVec 32) Int) Unit!31060)

(assert (=> b!920319 (= lt!413154 (lemmaListMapContainsThenArrayContainsFrom!163 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920319 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18569)))

(declare-fun lt!413155 () Unit!31060)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55066 (_ BitVec 32) (_ BitVec 32)) Unit!31060)

(assert (=> b!920319 (= lt!413155 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413153 () tuple2!12768)

(declare-fun +!2656 (ListLongMap!11465 tuple2!12768) ListLongMap!11465)

(assert (=> b!920319 (contains!4793 (+!2656 lt!413152 lt!413153) k!1099)))

(declare-fun lt!413147 () V!31023)

(declare-fun lt!413149 () Unit!31060)

(declare-fun addStillContains!380 (ListLongMap!11465 (_ BitVec 64) V!31023 (_ BitVec 64)) Unit!31060)

(assert (=> b!920319 (= lt!413149 (addStillContains!380 lt!413152 lt!413151 lt!413147 k!1099))))

(assert (=> b!920319 (= (getCurrentListMap!3003 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2656 (getCurrentListMap!3003 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413153))))

(assert (=> b!920319 (= lt!413153 (tuple2!12769 lt!413151 lt!413147))))

(declare-fun get!13891 (ValueCell!9290 V!31023) V!31023)

(declare-fun dynLambda!1445 (Int (_ BitVec 64)) V!31023)

(assert (=> b!920319 (= lt!413147 (get!13891 (select (arr!26479 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1445 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413150 () Unit!31060)

(declare-fun lemmaListMapRecursiveValidKeyArray!46 (array!55066 array!55068 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 32) Int) Unit!31060)

(assert (=> b!920319 (= lt!413150 (lemmaListMapRecursiveValidKeyArray!46 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31071 () Bool)

(declare-fun mapRes!31071 () Bool)

(assert (=> mapIsEmpty!31071 mapRes!31071))

(declare-fun mapNonEmpty!31071 () Bool)

(declare-fun tp!59546 () Bool)

(assert (=> mapNonEmpty!31071 (= mapRes!31071 (and tp!59546 e!516534))))

(declare-fun mapRest!31071 () (Array (_ BitVec 32) ValueCell!9290))

(declare-fun mapValue!31071 () ValueCell!9290)

(declare-fun mapKey!31071 () (_ BitVec 32))

(assert (=> mapNonEmpty!31071 (= (arr!26479 _values!1231) (store mapRest!31071 mapKey!31071 mapValue!31071))))

(declare-fun b!920320 () Bool)

(assert (=> b!920320 (= e!516533 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920321 () Bool)

(declare-fun res!620603 () Bool)

(assert (=> b!920321 (=> (not res!620603) (not e!516532))))

(assert (=> b!920321 (= res!620603 (validKeyInArray!0 k!1099))))

(declare-fun b!920322 () Bool)

(assert (=> b!920322 (= e!516531 true)))

(declare-fun lt!413148 () Bool)

(assert (=> b!920322 (= lt!413148 (contains!4794 Nil!18569 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920323 () Bool)

(declare-fun res!620608 () Bool)

(assert (=> b!920323 (=> (not res!620608) (not e!516536))))

(assert (=> b!920323 (= res!620608 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26937 _keys!1487))))))

(declare-fun b!920324 () Bool)

(declare-fun e!516530 () Bool)

(assert (=> b!920324 (= e!516530 (and e!516535 mapRes!31071))))

(declare-fun condMapEmpty!31071 () Bool)

(declare-fun mapDefault!31071 () ValueCell!9290)

