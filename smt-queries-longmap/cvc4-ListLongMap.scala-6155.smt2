; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79042 () Bool)

(assert start!79042)

(declare-fun b_free!17255 () Bool)

(declare-fun b_next!17255 () Bool)

(assert (=> start!79042 (= b_free!17255 (not b_next!17255))))

(declare-fun tp!60205 () Bool)

(declare-fun b_and!28247 () Bool)

(assert (=> start!79042 (= tp!60205 b_and!28247)))

(declare-fun b!926321 () Bool)

(declare-fun res!624105 () Bool)

(declare-fun e!519963 () Bool)

(assert (=> b!926321 (=> (not res!624105) (not e!519963))))

(declare-datatypes ((array!55492 0))(
  ( (array!55493 (arr!26691 (Array (_ BitVec 32) (_ BitVec 64))) (size!27150 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55492)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31315 0))(
  ( (V!31316 (val!9932 Int)) )
))
(declare-datatypes ((ValueCell!9400 0))(
  ( (ValueCellFull!9400 (v!12450 V!31315)) (EmptyCell!9400) )
))
(declare-datatypes ((array!55494 0))(
  ( (array!55495 (arr!26692 (Array (_ BitVec 32) ValueCell!9400)) (size!27151 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55494)

(assert (=> b!926321 (= res!624105 (and (= (size!27151 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27150 _keys!1487) (size!27151 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926322 () Bool)

(declare-fun res!624098 () Bool)

(assert (=> b!926322 (=> (not res!624098) (not e!519963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55492 (_ BitVec 32)) Bool)

(assert (=> b!926322 (= res!624098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926323 () Bool)

(declare-fun res!624100 () Bool)

(declare-fun e!519958 () Bool)

(assert (=> b!926323 (=> (not res!624100) (not e!519958))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31315)

(declare-datatypes ((tuple2!12958 0))(
  ( (tuple2!12959 (_1!6490 (_ BitVec 64)) (_2!6490 V!31315)) )
))
(declare-datatypes ((List!18760 0))(
  ( (Nil!18757) (Cons!18756 (h!19902 tuple2!12958) (t!26745 List!18760)) )
))
(declare-datatypes ((ListLongMap!11655 0))(
  ( (ListLongMap!11656 (toList!5843 List!18760)) )
))
(declare-fun lt!417147 () ListLongMap!11655)

(declare-fun apply!673 (ListLongMap!11655 (_ BitVec 64)) V!31315)

(assert (=> b!926323 (= res!624100 (= (apply!673 lt!417147 k!1099) v!791))))

(declare-fun b!926324 () Bool)

(declare-datatypes ((Unit!31316 0))(
  ( (Unit!31317) )
))
(declare-fun e!519966 () Unit!31316)

(declare-fun Unit!31318 () Unit!31316)

(assert (=> b!926324 (= e!519966 Unit!31318)))

(declare-fun b!926325 () Bool)

(declare-fun e!519959 () Unit!31316)

(assert (=> b!926325 (= e!519959 e!519966)))

(declare-fun lt!417150 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!926325 (= lt!417150 (select (arr!26691 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96706 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926325 (= c!96706 (validKeyInArray!0 lt!417150))))

(declare-fun e!519967 () Bool)

(declare-fun b!926326 () Bool)

(declare-fun arrayContainsKey!0 (array!55492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926326 (= e!519967 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapNonEmpty!31401 () Bool)

(declare-fun mapRes!31401 () Bool)

(declare-fun tp!60206 () Bool)

(declare-fun e!519965 () Bool)

(assert (=> mapNonEmpty!31401 (= mapRes!31401 (and tp!60206 e!519965))))

(declare-fun mapRest!31401 () (Array (_ BitVec 32) ValueCell!9400))

(declare-fun mapValue!31401 () ValueCell!9400)

(declare-fun mapKey!31401 () (_ BitVec 32))

(assert (=> mapNonEmpty!31401 (= (arr!26692 _values!1231) (store mapRest!31401 mapKey!31401 mapValue!31401))))

(declare-fun b!926327 () Bool)

(declare-fun e!519964 () Bool)

(assert (=> b!926327 (= e!519964 e!519958)))

(declare-fun res!624104 () Bool)

(assert (=> b!926327 (=> (not res!624104) (not e!519958))))

(declare-fun contains!4902 (ListLongMap!11655 (_ BitVec 64)) Bool)

(assert (=> b!926327 (= res!624104 (contains!4902 lt!417147 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31315)

(declare-fun minValue!1173 () V!31315)

(declare-fun getCurrentListMap!3093 (array!55492 array!55494 (_ BitVec 32) (_ BitVec 32) V!31315 V!31315 (_ BitVec 32) Int) ListLongMap!11655)

(assert (=> b!926327 (= lt!417147 (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926328 () Bool)

(declare-fun e!519955 () Bool)

(declare-fun e!519962 () Bool)

(assert (=> b!926328 (= e!519955 (and e!519962 mapRes!31401))))

(declare-fun condMapEmpty!31401 () Bool)

(declare-fun mapDefault!31401 () ValueCell!9400)

