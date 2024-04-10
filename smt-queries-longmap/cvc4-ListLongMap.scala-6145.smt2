; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78982 () Bool)

(assert start!78982)

(declare-fun b_free!17195 () Bool)

(declare-fun b_next!17195 () Bool)

(assert (=> start!78982 (= b_free!17195 (not b_next!17195))))

(declare-fun tp!60025 () Bool)

(declare-fun b_and!28127 () Bool)

(assert (=> start!78982 (= tp!60025 b_and!28127)))

(declare-fun mapIsEmpty!31311 () Bool)

(declare-fun mapRes!31311 () Bool)

(assert (=> mapIsEmpty!31311 mapRes!31311))

(declare-fun b!924517 () Bool)

(declare-fun res!623170 () Bool)

(declare-fun e!518820 () Bool)

(assert (=> b!924517 (=> (not res!623170) (not e!518820))))

(declare-datatypes ((array!55376 0))(
  ( (array!55377 (arr!26633 (Array (_ BitVec 32) (_ BitVec 64))) (size!27092 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55376)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31235 0))(
  ( (V!31236 (val!9902 Int)) )
))
(declare-datatypes ((ValueCell!9370 0))(
  ( (ValueCellFull!9370 (v!12420 V!31235)) (EmptyCell!9370) )
))
(declare-datatypes ((array!55378 0))(
  ( (array!55379 (arr!26634 (Array (_ BitVec 32) ValueCell!9370)) (size!27093 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55378)

(assert (=> b!924517 (= res!623170 (and (= (size!27093 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27092 _keys!1487) (size!27093 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!623169 () Bool)

(assert (=> start!78982 (=> (not res!623169) (not e!518820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78982 (= res!623169 (validMask!0 mask!1881))))

(assert (=> start!78982 e!518820))

(assert (=> start!78982 true))

(declare-fun tp_is_empty!19703 () Bool)

(assert (=> start!78982 tp_is_empty!19703))

(declare-fun e!518821 () Bool)

(declare-fun array_inv!20742 (array!55378) Bool)

(assert (=> start!78982 (and (array_inv!20742 _values!1231) e!518821)))

(assert (=> start!78982 tp!60025))

(declare-fun array_inv!20743 (array!55376) Bool)

(assert (=> start!78982 (array_inv!20743 _keys!1487)))

(declare-fun b!924518 () Bool)

(declare-datatypes ((Unit!31213 0))(
  ( (Unit!31214) )
))
(declare-fun e!518814 () Unit!31213)

(declare-fun Unit!31215 () Unit!31213)

(assert (=> b!924518 (= e!518814 Unit!31215)))

(declare-fun b!924519 () Bool)

(declare-fun res!623163 () Bool)

(assert (=> b!924519 (=> (not res!623163) (not e!518820))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!924519 (= res!623163 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27092 _keys!1487))))))

(declare-fun b!924520 () Bool)

(declare-fun res!623164 () Bool)

(assert (=> b!924520 (=> (not res!623164) (not e!518820))))

(declare-datatypes ((List!18704 0))(
  ( (Nil!18701) (Cons!18700 (h!19846 (_ BitVec 64)) (t!26629 List!18704)) )
))
(declare-fun arrayNoDuplicates!0 (array!55376 (_ BitVec 32) List!18704) Bool)

(assert (=> b!924520 (= res!623164 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18701))))

(declare-fun b!924521 () Bool)

(declare-fun e!518823 () Bool)

(assert (=> b!924521 (= e!518823 tp_is_empty!19703)))

(declare-fun b!924522 () Bool)

(declare-fun e!518824 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!924522 (= e!518824 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924523 () Bool)

(declare-fun e!518817 () Bool)

(assert (=> b!924523 (= e!518817 tp_is_empty!19703)))

(declare-fun b!924524 () Bool)

(declare-datatypes ((tuple2!12902 0))(
  ( (tuple2!12903 (_1!6462 (_ BitVec 64)) (_2!6462 V!31235)) )
))
(declare-datatypes ((List!18705 0))(
  ( (Nil!18702) (Cons!18701 (h!19847 tuple2!12902) (t!26630 List!18705)) )
))
(declare-datatypes ((ListLongMap!11599 0))(
  ( (ListLongMap!11600 (toList!5815 List!18705)) )
))
(declare-fun lt!415743 () ListLongMap!11599)

(declare-fun lt!415734 () V!31235)

(declare-fun apply!645 (ListLongMap!11599 (_ BitVec 64)) V!31235)

(assert (=> b!924524 (= (apply!645 lt!415743 k!1099) lt!415734)))

(declare-fun lt!415744 () Unit!31213)

(declare-fun lt!415742 () (_ BitVec 64))

(declare-fun lt!415735 () ListLongMap!11599)

(declare-fun lt!415733 () V!31235)

(declare-fun addApplyDifferent!367 (ListLongMap!11599 (_ BitVec 64) V!31235 (_ BitVec 64)) Unit!31213)

(assert (=> b!924524 (= lt!415744 (addApplyDifferent!367 lt!415735 lt!415742 lt!415733 k!1099))))

(assert (=> b!924524 (not (= lt!415742 k!1099))))

(declare-fun lt!415736 () Unit!31213)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55376 (_ BitVec 64) (_ BitVec 32) List!18704) Unit!31213)

(assert (=> b!924524 (= lt!415736 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18701))))

(assert (=> b!924524 e!518824))

(declare-fun c!96438 () Bool)

(assert (=> b!924524 (= c!96438 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415739 () Unit!31213)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31235)

(declare-fun minValue!1173 () V!31235)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!218 (array!55376 array!55378 (_ BitVec 32) (_ BitVec 32) V!31235 V!31235 (_ BitVec 64) (_ BitVec 32) Int) Unit!31213)

(assert (=> b!924524 (= lt!415739 (lemmaListMapContainsThenArrayContainsFrom!218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924524 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18701)))

(declare-fun lt!415745 () Unit!31213)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55376 (_ BitVec 32) (_ BitVec 32)) Unit!31213)

(assert (=> b!924524 (= lt!415745 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4875 (ListLongMap!11599 (_ BitVec 64)) Bool)

(assert (=> b!924524 (contains!4875 lt!415743 k!1099)))

(declare-fun lt!415738 () tuple2!12902)

(declare-fun +!2711 (ListLongMap!11599 tuple2!12902) ListLongMap!11599)

(assert (=> b!924524 (= lt!415743 (+!2711 lt!415735 lt!415738))))

(declare-fun lt!415747 () Unit!31213)

(declare-fun addStillContains!435 (ListLongMap!11599 (_ BitVec 64) V!31235 (_ BitVec 64)) Unit!31213)

(assert (=> b!924524 (= lt!415747 (addStillContains!435 lt!415735 lt!415742 lt!415733 k!1099))))

(declare-fun getCurrentListMap!3066 (array!55376 array!55378 (_ BitVec 32) (_ BitVec 32) V!31235 V!31235 (_ BitVec 32) Int) ListLongMap!11599)

(assert (=> b!924524 (= (getCurrentListMap!3066 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2711 (getCurrentListMap!3066 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415738))))

(assert (=> b!924524 (= lt!415738 (tuple2!12903 lt!415742 lt!415733))))

(declare-fun get!13998 (ValueCell!9370 V!31235) V!31235)

(declare-fun dynLambda!1500 (Int (_ BitVec 64)) V!31235)

(assert (=> b!924524 (= lt!415733 (get!13998 (select (arr!26634 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1500 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415746 () Unit!31213)

(declare-fun lemmaListMapRecursiveValidKeyArray!101 (array!55376 array!55378 (_ BitVec 32) (_ BitVec 32) V!31235 V!31235 (_ BitVec 32) Int) Unit!31213)

(assert (=> b!924524 (= lt!415746 (lemmaListMapRecursiveValidKeyArray!101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924524 (= e!518814 lt!415744)))

(declare-fun b!924525 () Bool)

(declare-fun e!518816 () Unit!31213)

(assert (=> b!924525 (= e!518816 e!518814)))

(assert (=> b!924525 (= lt!415742 (select (arr!26633 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96437 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924525 (= c!96437 (validKeyInArray!0 lt!415742))))

(declare-fun b!924526 () Bool)

(declare-fun e!518819 () Bool)

(declare-fun e!518822 () Bool)

(assert (=> b!924526 (= e!518819 e!518822)))

(declare-fun res!623168 () Bool)

(assert (=> b!924526 (=> (not res!623168) (not e!518822))))

(declare-fun v!791 () V!31235)

(assert (=> b!924526 (= res!623168 (and (= lt!415734 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924526 (= lt!415734 (apply!645 lt!415735 k!1099))))

(declare-fun b!924527 () Bool)

(declare-fun res!623162 () Bool)

(assert (=> b!924527 (=> (not res!623162) (not e!518820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55376 (_ BitVec 32)) Bool)

(assert (=> b!924527 (= res!623162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924528 () Bool)

(declare-fun arrayContainsKey!0 (array!55376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924528 (= e!518824 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!924529 () Bool)

(assert (=> b!924529 (= e!518821 (and e!518823 mapRes!31311))))

(declare-fun condMapEmpty!31311 () Bool)

(declare-fun mapDefault!31311 () ValueCell!9370)

