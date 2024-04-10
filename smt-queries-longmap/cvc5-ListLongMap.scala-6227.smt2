; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79634 () Bool)

(assert start!79634)

(declare-fun b_free!17683 () Bool)

(declare-fun b_next!17683 () Bool)

(assert (=> start!79634 (= b_free!17683 (not b_next!17683))))

(declare-fun tp!61505 () Bool)

(declare-fun b_and!28957 () Bool)

(assert (=> start!79634 (= tp!61505 b_and!28957)))

(declare-fun b!936054 () Bool)

(declare-fun e!525606 () Bool)

(declare-fun tp_is_empty!20191 () Bool)

(assert (=> b!936054 (= e!525606 tp_is_empty!20191)))

(declare-fun b!936055 () Bool)

(declare-fun e!525602 () Bool)

(declare-fun e!525603 () Bool)

(assert (=> b!936055 (= e!525602 e!525603)))

(declare-fun res!630325 () Bool)

(assert (=> b!936055 (=> (not res!630325) (not e!525603))))

(declare-fun lt!421980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936055 (= res!630325 (validKeyInArray!0 lt!421980))))

(declare-datatypes ((array!56324 0))(
  ( (array!56325 (arr!27102 (Array (_ BitVec 32) (_ BitVec 64))) (size!27561 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56324)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!936055 (= lt!421980 (select (arr!27102 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936056 () Bool)

(declare-fun res!630318 () Bool)

(declare-fun e!525605 () Bool)

(assert (=> b!936056 (=> (not res!630318) (not e!525605))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31887 0))(
  ( (V!31888 (val!10146 Int)) )
))
(declare-datatypes ((ValueCell!9614 0))(
  ( (ValueCellFull!9614 (v!12671 V!31887)) (EmptyCell!9614) )
))
(declare-datatypes ((array!56326 0))(
  ( (array!56327 (arr!27103 (Array (_ BitVec 32) ValueCell!9614)) (size!27562 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56326)

(assert (=> b!936056 (= res!630318 (and (= (size!27562 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27561 _keys!1487) (size!27562 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936057 () Bool)

(declare-fun res!630319 () Bool)

(assert (=> b!936057 (=> (not res!630319) (not e!525605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56324 (_ BitVec 32)) Bool)

(assert (=> b!936057 (= res!630319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936058 () Bool)

(declare-fun res!630324 () Bool)

(assert (=> b!936058 (=> (not res!630324) (not e!525602))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!936058 (= res!630324 (validKeyInArray!0 k!1099))))

(declare-fun b!936059 () Bool)

(declare-fun res!630317 () Bool)

(assert (=> b!936059 (=> (not res!630317) (not e!525605))))

(declare-datatypes ((List!19101 0))(
  ( (Nil!19098) (Cons!19097 (h!20243 (_ BitVec 64)) (t!27328 List!19101)) )
))
(declare-fun arrayNoDuplicates!0 (array!56324 (_ BitVec 32) List!19101) Bool)

(assert (=> b!936059 (= res!630317 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19098))))

(declare-fun b!936060 () Bool)

(declare-fun res!630316 () Bool)

(assert (=> b!936060 (=> (not res!630316) (not e!525602))))

(assert (=> b!936060 (= res!630316 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936061 () Bool)

(declare-fun e!525604 () Bool)

(declare-fun arrayContainsKey!0 (array!56324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936061 (= e!525604 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!936062 () Bool)

(assert (=> b!936062 (= e!525605 e!525602)))

(declare-fun res!630320 () Bool)

(assert (=> b!936062 (=> (not res!630320) (not e!525602))))

(declare-datatypes ((tuple2!13320 0))(
  ( (tuple2!13321 (_1!6671 (_ BitVec 64)) (_2!6671 V!31887)) )
))
(declare-datatypes ((List!19102 0))(
  ( (Nil!19099) (Cons!19098 (h!20244 tuple2!13320) (t!27329 List!19102)) )
))
(declare-datatypes ((ListLongMap!12017 0))(
  ( (ListLongMap!12018 (toList!6024 List!19102)) )
))
(declare-fun lt!421975 () ListLongMap!12017)

(declare-fun contains!5085 (ListLongMap!12017 (_ BitVec 64)) Bool)

(assert (=> b!936062 (= res!630320 (contains!5085 lt!421975 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31887)

(declare-fun minValue!1173 () V!31887)

(declare-fun getCurrentListMap!3261 (array!56324 array!56326 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 32) Int) ListLongMap!12017)

(assert (=> b!936062 (= lt!421975 (getCurrentListMap!3261 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936064 () Bool)

(declare-fun res!630321 () Bool)

(assert (=> b!936064 (=> (not res!630321) (not e!525602))))

(declare-fun v!791 () V!31887)

(declare-fun apply!826 (ListLongMap!12017 (_ BitVec 64)) V!31887)

(assert (=> b!936064 (= res!630321 (= (apply!826 lt!421975 k!1099) v!791))))

(declare-fun b!936065 () Bool)

(assert (=> b!936065 (= e!525604 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936066 () Bool)

(assert (=> b!936066 (= e!525603 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27562 _values!1231))))))

(assert (=> b!936066 (not (= lt!421980 k!1099))))

(declare-datatypes ((Unit!31571 0))(
  ( (Unit!31572) )
))
(declare-fun lt!421979 () Unit!31571)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56324 (_ BitVec 64) (_ BitVec 32) List!19101) Unit!31571)

(assert (=> b!936066 (= lt!421979 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19098))))

(assert (=> b!936066 e!525604))

(declare-fun c!97356 () Bool)

(assert (=> b!936066 (= c!97356 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421982 () Unit!31571)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!290 (array!56324 array!56326 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 64) (_ BitVec 32) Int) Unit!31571)

(assert (=> b!936066 (= lt!421982 (lemmaListMapContainsThenArrayContainsFrom!290 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936066 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19098)))

(declare-fun lt!421976 () Unit!31571)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56324 (_ BitVec 32) (_ BitVec 32)) Unit!31571)

(assert (=> b!936066 (= lt!421976 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421974 () tuple2!13320)

(declare-fun +!2818 (ListLongMap!12017 tuple2!13320) ListLongMap!12017)

(assert (=> b!936066 (contains!5085 (+!2818 lt!421975 lt!421974) k!1099)))

(declare-fun lt!421978 () Unit!31571)

(declare-fun lt!421977 () V!31887)

(declare-fun addStillContains!537 (ListLongMap!12017 (_ BitVec 64) V!31887 (_ BitVec 64)) Unit!31571)

(assert (=> b!936066 (= lt!421978 (addStillContains!537 lt!421975 lt!421980 lt!421977 k!1099))))

(assert (=> b!936066 (= (getCurrentListMap!3261 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2818 (getCurrentListMap!3261 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421974))))

(assert (=> b!936066 (= lt!421974 (tuple2!13321 lt!421980 lt!421977))))

(declare-fun get!14284 (ValueCell!9614 V!31887) V!31887)

(declare-fun dynLambda!1607 (Int (_ BitVec 64)) V!31887)

(assert (=> b!936066 (= lt!421977 (get!14284 (select (arr!27103 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1607 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421981 () Unit!31571)

(declare-fun lemmaListMapRecursiveValidKeyArray!208 (array!56324 array!56326 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 32) Int) Unit!31571)

(assert (=> b!936066 (= lt!421981 (lemmaListMapRecursiveValidKeyArray!208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936067 () Bool)

(declare-fun e!525600 () Bool)

(declare-fun e!525601 () Bool)

(declare-fun mapRes!32058 () Bool)

(assert (=> b!936067 (= e!525600 (and e!525601 mapRes!32058))))

(declare-fun condMapEmpty!32058 () Bool)

(declare-fun mapDefault!32058 () ValueCell!9614)

