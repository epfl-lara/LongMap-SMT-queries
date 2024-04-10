; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79104 () Bool)

(assert start!79104)

(declare-fun b_free!17317 () Bool)

(declare-fun b_next!17317 () Bool)

(assert (=> start!79104 (= b_free!17317 (not b_next!17317))))

(declare-fun tp!60391 () Bool)

(declare-fun b_and!28371 () Bool)

(assert (=> start!79104 (= tp!60391 b_and!28371)))

(declare-fun b!928244 () Bool)

(declare-fun res!625128 () Bool)

(declare-fun e!521175 () Bool)

(assert (=> b!928244 (=> (not res!625128) (not e!521175))))

(declare-datatypes ((array!55610 0))(
  ( (array!55611 (arr!26750 (Array (_ BitVec 32) (_ BitVec 64))) (size!27209 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55610)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31399 0))(
  ( (V!31400 (val!9963 Int)) )
))
(declare-datatypes ((ValueCell!9431 0))(
  ( (ValueCellFull!9431 (v!12481 V!31399)) (EmptyCell!9431) )
))
(declare-datatypes ((array!55612 0))(
  ( (array!55613 (arr!26751 (Array (_ BitVec 32) ValueCell!9431)) (size!27210 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55612)

(assert (=> b!928244 (= res!625128 (and (= (size!27210 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27209 _keys!1487) (size!27210 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928245 () Bool)

(declare-fun e!521172 () Bool)

(assert (=> b!928245 (= e!521172 (not (bvsle #b00000000000000000000000000000000 (size!27209 _keys!1487))))))

(declare-fun e!521168 () Bool)

(assert (=> b!928245 e!521168))

(declare-fun res!625123 () Bool)

(assert (=> b!928245 (=> (not res!625123) (not e!521168))))

(declare-datatypes ((tuple2!13014 0))(
  ( (tuple2!13015 (_1!6518 (_ BitVec 64)) (_2!6518 V!31399)) )
))
(declare-datatypes ((List!18812 0))(
  ( (Nil!18809) (Cons!18808 (h!19954 tuple2!13014) (t!26859 List!18812)) )
))
(declare-datatypes ((ListLongMap!11711 0))(
  ( (ListLongMap!11712 (toList!5871 List!18812)) )
))
(declare-fun lt!418639 () ListLongMap!11711)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4928 (ListLongMap!11711 (_ BitVec 64)) Bool)

(assert (=> b!928245 (= res!625123 (contains!4928 lt!418639 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31399)

(declare-fun minValue!1173 () V!31399)

(declare-fun getCurrentListMap!3119 (array!55610 array!55612 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 32) Int) ListLongMap!11711)

(assert (=> b!928245 (= lt!418639 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31399)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31411 0))(
  ( (Unit!31412) )
))
(declare-fun lt!418647 () Unit!31411)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!98 (array!55610 array!55612 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 64) V!31399 (_ BitVec 32) Int) Unit!31411)

(assert (=> b!928245 (= lt!418647 (lemmaListMapApplyFromThenApplyFromZero!98 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31494 () Bool)

(declare-fun mapRes!31494 () Bool)

(assert (=> mapIsEmpty!31494 mapRes!31494))

(declare-fun b!928246 () Bool)

(declare-fun e!521171 () Unit!31411)

(declare-fun Unit!31413 () Unit!31411)

(assert (=> b!928246 (= e!521171 Unit!31413)))

(declare-fun b!928247 () Bool)

(declare-fun e!521165 () Bool)

(assert (=> b!928247 (= e!521165 e!521172)))

(declare-fun res!625126 () Bool)

(assert (=> b!928247 (=> (not res!625126) (not e!521172))))

(declare-fun lt!418638 () ListLongMap!11711)

(assert (=> b!928247 (= res!625126 (contains!4928 lt!418638 k!1099))))

(assert (=> b!928247 (= lt!418638 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928248 () Bool)

(declare-fun apply!701 (ListLongMap!11711 (_ BitVec 64)) V!31399)

(assert (=> b!928248 (= e!521168 (= (apply!701 lt!418639 k!1099) v!791))))

(declare-fun mapNonEmpty!31494 () Bool)

(declare-fun tp!60392 () Bool)

(declare-fun e!521166 () Bool)

(assert (=> mapNonEmpty!31494 (= mapRes!31494 (and tp!60392 e!521166))))

(declare-fun mapRest!31494 () (Array (_ BitVec 32) ValueCell!9431))

(declare-fun mapKey!31494 () (_ BitVec 32))

(declare-fun mapValue!31494 () ValueCell!9431)

(assert (=> mapNonEmpty!31494 (= (arr!26751 _values!1231) (store mapRest!31494 mapKey!31494 mapValue!31494))))

(declare-fun b!928249 () Bool)

(declare-fun e!521167 () Bool)

(declare-fun tp_is_empty!19825 () Bool)

(assert (=> b!928249 (= e!521167 tp_is_empty!19825)))

(declare-fun b!928250 () Bool)

(declare-fun res!625129 () Bool)

(assert (=> b!928250 (=> (not res!625129) (not e!521175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55610 (_ BitVec 32)) Bool)

(assert (=> b!928250 (= res!625129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!625122 () Bool)

(assert (=> start!79104 (=> (not res!625122) (not e!521175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79104 (= res!625122 (validMask!0 mask!1881))))

(assert (=> start!79104 e!521175))

(assert (=> start!79104 true))

(assert (=> start!79104 tp_is_empty!19825))

(declare-fun e!521169 () Bool)

(declare-fun array_inv!20828 (array!55612) Bool)

(assert (=> start!79104 (and (array_inv!20828 _values!1231) e!521169)))

(assert (=> start!79104 tp!60391))

(declare-fun array_inv!20829 (array!55610) Bool)

(assert (=> start!79104 (array_inv!20829 _keys!1487)))

(declare-fun b!928243 () Bool)

(declare-fun res!625124 () Bool)

(assert (=> b!928243 (=> (not res!625124) (not e!521172))))

(assert (=> b!928243 (= res!625124 (= (apply!701 lt!418638 k!1099) v!791))))

(declare-fun b!928251 () Bool)

(declare-fun lt!418633 () ListLongMap!11711)

(declare-fun lt!418642 () V!31399)

(assert (=> b!928251 (= (apply!701 lt!418633 k!1099) lt!418642)))

(declare-fun lt!418644 () (_ BitVec 64))

(declare-fun lt!418648 () V!31399)

(declare-fun lt!418636 () ListLongMap!11711)

(declare-fun lt!418643 () Unit!31411)

(declare-fun addApplyDifferent!413 (ListLongMap!11711 (_ BitVec 64) V!31399 (_ BitVec 64)) Unit!31411)

(assert (=> b!928251 (= lt!418643 (addApplyDifferent!413 lt!418636 lt!418644 lt!418648 k!1099))))

(assert (=> b!928251 (not (= lt!418644 k!1099))))

(declare-fun lt!418640 () Unit!31411)

(declare-datatypes ((List!18813 0))(
  ( (Nil!18810) (Cons!18809 (h!19955 (_ BitVec 64)) (t!26860 List!18813)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55610 (_ BitVec 64) (_ BitVec 32) List!18813) Unit!31411)

(assert (=> b!928251 (= lt!418640 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18810))))

(declare-fun e!521173 () Bool)

(assert (=> b!928251 e!521173))

(declare-fun c!96985 () Bool)

(assert (=> b!928251 (= c!96985 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418637 () Unit!31411)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!264 (array!55610 array!55612 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 64) (_ BitVec 32) Int) Unit!31411)

(assert (=> b!928251 (= lt!418637 (lemmaListMapContainsThenArrayContainsFrom!264 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55610 (_ BitVec 32) List!18813) Bool)

(assert (=> b!928251 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18810)))

(declare-fun lt!418645 () Unit!31411)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55610 (_ BitVec 32) (_ BitVec 32)) Unit!31411)

(assert (=> b!928251 (= lt!418645 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928251 (contains!4928 lt!418633 k!1099)))

(declare-fun lt!418635 () tuple2!13014)

(declare-fun +!2757 (ListLongMap!11711 tuple2!13014) ListLongMap!11711)

(assert (=> b!928251 (= lt!418633 (+!2757 lt!418636 lt!418635))))

(declare-fun lt!418634 () Unit!31411)

(declare-fun addStillContains!481 (ListLongMap!11711 (_ BitVec 64) V!31399 (_ BitVec 64)) Unit!31411)

(assert (=> b!928251 (= lt!418634 (addStillContains!481 lt!418636 lt!418644 lt!418648 k!1099))))

(assert (=> b!928251 (= (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2757 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418635))))

(assert (=> b!928251 (= lt!418635 (tuple2!13015 lt!418644 lt!418648))))

(declare-fun get!14086 (ValueCell!9431 V!31399) V!31399)

(declare-fun dynLambda!1546 (Int (_ BitVec 64)) V!31399)

(assert (=> b!928251 (= lt!418648 (get!14086 (select (arr!26751 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1546 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418646 () Unit!31411)

(declare-fun lemmaListMapRecursiveValidKeyArray!147 (array!55610 array!55612 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 32) Int) Unit!31411)

(assert (=> b!928251 (= lt!418646 (lemmaListMapRecursiveValidKeyArray!147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521164 () Unit!31411)

(assert (=> b!928251 (= e!521164 lt!418643)))

(declare-fun b!928252 () Bool)

(assert (=> b!928252 (= e!521173 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928253 () Bool)

(declare-fun res!625121 () Bool)

(assert (=> b!928253 (=> (not res!625121) (not e!521175))))

(assert (=> b!928253 (= res!625121 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27209 _keys!1487))))))

(declare-fun b!928254 () Bool)

(declare-fun res!625119 () Bool)

(assert (=> b!928254 (=> (not res!625119) (not e!521175))))

(assert (=> b!928254 (= res!625119 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18810))))

(declare-fun b!928255 () Bool)

(assert (=> b!928255 (= e!521166 tp_is_empty!19825)))

(declare-fun b!928256 () Bool)

(declare-fun arrayContainsKey!0 (array!55610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928256 (= e!521173 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!928257 () Bool)

(declare-fun Unit!31414 () Unit!31411)

(assert (=> b!928257 (= e!521164 Unit!31414)))

(declare-fun b!928258 () Bool)

(declare-fun e!521174 () Bool)

(assert (=> b!928258 (= e!521175 e!521174)))

(declare-fun res!625120 () Bool)

(assert (=> b!928258 (=> (not res!625120) (not e!521174))))

(assert (=> b!928258 (= res!625120 (contains!4928 lt!418636 k!1099))))

(assert (=> b!928258 (= lt!418636 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928259 () Bool)

(assert (=> b!928259 (= e!521171 e!521164)))

(assert (=> b!928259 (= lt!418644 (select (arr!26750 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96987 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928259 (= c!96987 (validKeyInArray!0 lt!418644))))

(declare-fun b!928260 () Bool)

(declare-fun e!521170 () Bool)

(assert (=> b!928260 (= e!521170 e!521165)))

(declare-fun res!625125 () Bool)

(assert (=> b!928260 (=> (not res!625125) (not e!521165))))

(assert (=> b!928260 (= res!625125 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27209 _keys!1487)))))

(declare-fun lt!418641 () Unit!31411)

(assert (=> b!928260 (= lt!418641 e!521171)))

(declare-fun c!96986 () Bool)

(assert (=> b!928260 (= c!96986 (validKeyInArray!0 k!1099))))

(declare-fun b!928261 () Bool)

(assert (=> b!928261 (= e!521169 (and e!521167 mapRes!31494))))

(declare-fun condMapEmpty!31494 () Bool)

(declare-fun mapDefault!31494 () ValueCell!9431)

