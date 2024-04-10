; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79698 () Bool)

(assert start!79698)

(declare-fun b_free!17747 () Bool)

(declare-fun b_next!17747 () Bool)

(assert (=> start!79698 (= b_free!17747 (not b_next!17747))))

(declare-fun tp!61696 () Bool)

(declare-fun b_and!29085 () Bool)

(assert (=> start!79698 (= tp!61696 b_and!29085)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!937638 () Bool)

(declare-fun e!526534 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56450 0))(
  ( (array!56451 (arr!27165 (Array (_ BitVec 32) (_ BitVec 64))) (size!27624 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56450)

(declare-fun arrayContainsKey!0 (array!56450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937638 (= e!526534 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937639 () Bool)

(declare-datatypes ((Unit!31664 0))(
  ( (Unit!31665) )
))
(declare-fun e!526530 () Unit!31664)

(declare-fun e!526529 () Unit!31664)

(assert (=> b!937639 (= e!526530 e!526529)))

(declare-fun lt!423169 () (_ BitVec 64))

(assert (=> b!937639 (= lt!423169 (select (arr!27165 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97612 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937639 (= c!97612 (validKeyInArray!0 lt!423169))))

(declare-fun b!937640 () Bool)

(declare-fun e!526536 () Bool)

(declare-fun e!526531 () Bool)

(assert (=> b!937640 (= e!526536 e!526531)))

(declare-fun res!631038 () Bool)

(assert (=> b!937640 (=> (not res!631038) (not e!526531))))

(declare-datatypes ((V!31971 0))(
  ( (V!31972 (val!10178 Int)) )
))
(declare-datatypes ((tuple2!13372 0))(
  ( (tuple2!13373 (_1!6697 (_ BitVec 64)) (_2!6697 V!31971)) )
))
(declare-datatypes ((List!19151 0))(
  ( (Nil!19148) (Cons!19147 (h!20293 tuple2!13372) (t!27442 List!19151)) )
))
(declare-datatypes ((ListLongMap!12069 0))(
  ( (ListLongMap!12070 (toList!6050 List!19151)) )
))
(declare-fun lt!423158 () ListLongMap!12069)

(declare-fun contains!5109 (ListLongMap!12069 (_ BitVec 64)) Bool)

(assert (=> b!937640 (= res!631038 (contains!5109 lt!423158 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9646 0))(
  ( (ValueCellFull!9646 (v!12703 V!31971)) (EmptyCell!9646) )
))
(declare-datatypes ((array!56452 0))(
  ( (array!56453 (arr!27166 (Array (_ BitVec 32) ValueCell!9646)) (size!27625 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56452)

(declare-fun zeroValue!1173 () V!31971)

(declare-fun minValue!1173 () V!31971)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3285 (array!56450 array!56452 (_ BitVec 32) (_ BitVec 32) V!31971 V!31971 (_ BitVec 32) Int) ListLongMap!12069)

(assert (=> b!937640 (= lt!423158 (getCurrentListMap!3285 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937641 () Bool)

(declare-fun e!526533 () Bool)

(assert (=> b!937641 (= e!526533 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27624 _keys!1487)))))

(declare-fun lt!423159 () Unit!31664)

(assert (=> b!937641 (= lt!423159 e!526530)))

(declare-fun c!97613 () Bool)

(assert (=> b!937641 (= c!97613 (validKeyInArray!0 k!1099))))

(declare-fun b!937642 () Bool)

(declare-fun res!631037 () Bool)

(assert (=> b!937642 (=> (not res!631037) (not e!526536))))

(assert (=> b!937642 (= res!631037 (and (= (size!27625 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27624 _keys!1487) (size!27625 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937643 () Bool)

(declare-fun e!526528 () Bool)

(declare-fun e!526532 () Bool)

(declare-fun mapRes!32154 () Bool)

(assert (=> b!937643 (= e!526528 (and e!526532 mapRes!32154))))

(declare-fun condMapEmpty!32154 () Bool)

(declare-fun mapDefault!32154 () ValueCell!9646)

