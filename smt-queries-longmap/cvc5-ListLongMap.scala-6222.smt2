; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79498 () Bool)

(assert start!79498)

(declare-fun b_free!17653 () Bool)

(declare-fun b_next!17653 () Bool)

(assert (=> start!79498 (= b_free!17653 (not b_next!17653))))

(declare-fun tp!61405 () Bool)

(declare-fun b_and!28873 () Bool)

(assert (=> start!79498 (= tp!61405 b_and!28873)))

(declare-fun b!934655 () Bool)

(declare-fun e!524798 () Bool)

(declare-fun tp_is_empty!20161 () Bool)

(assert (=> b!934655 (= e!524798 tp_is_empty!20161)))

(declare-fun b!934656 () Bool)

(declare-fun e!524799 () Bool)

(declare-fun e!524791 () Bool)

(assert (=> b!934656 (= e!524799 (not e!524791))))

(declare-fun res!629487 () Bool)

(assert (=> b!934656 (=> res!629487 e!524791)))

(declare-datatypes ((array!56260 0))(
  ( (array!56261 (arr!27073 (Array (_ BitVec 32) (_ BitVec 64))) (size!27532 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56260)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934656 (= res!629487 (or (bvsge (size!27532 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27532 _keys!1487))))))

(declare-fun e!524795 () Bool)

(assert (=> b!934656 e!524795))

(declare-fun c!97170 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!934656 (= c!97170 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((Unit!31534 0))(
  ( (Unit!31535) )
))
(declare-fun lt!421094 () Unit!31534)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31847 0))(
  ( (V!31848 (val!10131 Int)) )
))
(declare-datatypes ((ValueCell!9599 0))(
  ( (ValueCellFull!9599 (v!12651 V!31847)) (EmptyCell!9599) )
))
(declare-datatypes ((array!56262 0))(
  ( (array!56263 (arr!27074 (Array (_ BitVec 32) ValueCell!9599)) (size!27533 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56262)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31847)

(declare-fun minValue!1173 () V!31847)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!279 (array!56260 array!56262 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 64) (_ BitVec 32) Int) Unit!31534)

(assert (=> b!934656 (= lt!421094 (lemmaListMapContainsThenArrayContainsFrom!279 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19072 0))(
  ( (Nil!19069) (Cons!19068 (h!20214 (_ BitVec 64)) (t!27269 List!19072)) )
))
(declare-fun arrayNoDuplicates!0 (array!56260 (_ BitVec 32) List!19072) Bool)

(assert (=> b!934656 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19069)))

(declare-fun lt!421090 () Unit!31534)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56260 (_ BitVec 32) (_ BitVec 32)) Unit!31534)

(assert (=> b!934656 (= lt!421090 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13292 0))(
  ( (tuple2!13293 (_1!6657 (_ BitVec 64)) (_2!6657 V!31847)) )
))
(declare-datatypes ((List!19073 0))(
  ( (Nil!19070) (Cons!19069 (h!20215 tuple2!13292) (t!27270 List!19073)) )
))
(declare-datatypes ((ListLongMap!11989 0))(
  ( (ListLongMap!11990 (toList!6010 List!19073)) )
))
(declare-fun lt!421089 () ListLongMap!11989)

(declare-fun lt!421095 () tuple2!13292)

(declare-fun contains!5060 (ListLongMap!11989 (_ BitVec 64)) Bool)

(declare-fun +!2807 (ListLongMap!11989 tuple2!13292) ListLongMap!11989)

(assert (=> b!934656 (contains!5060 (+!2807 lt!421089 lt!421095) k!1099)))

(declare-fun lt!421092 () (_ BitVec 64))

(declare-fun lt!421093 () V!31847)

(declare-fun lt!421091 () Unit!31534)

(declare-fun addStillContains!526 (ListLongMap!11989 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31534)

(assert (=> b!934656 (= lt!421091 (addStillContains!526 lt!421089 lt!421092 lt!421093 k!1099))))

(declare-fun getCurrentListMap!3247 (array!56260 array!56262 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) ListLongMap!11989)

(assert (=> b!934656 (= (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2807 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421095))))

(assert (=> b!934656 (= lt!421095 (tuple2!13293 lt!421092 lt!421093))))

(declare-fun get!14254 (ValueCell!9599 V!31847) V!31847)

(declare-fun dynLambda!1596 (Int (_ BitVec 64)) V!31847)

(assert (=> b!934656 (= lt!421093 (get!14254 (select (arr!27074 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1596 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421088 () Unit!31534)

(declare-fun lemmaListMapRecursiveValidKeyArray!197 (array!56260 array!56262 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) Unit!31534)

(assert (=> b!934656 (= lt!421088 (lemmaListMapRecursiveValidKeyArray!197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934657 () Bool)

(declare-fun e!524793 () Bool)

(declare-fun e!524792 () Bool)

(assert (=> b!934657 (= e!524793 e!524792)))

(declare-fun res!629482 () Bool)

(assert (=> b!934657 (=> (not res!629482) (not e!524792))))

(assert (=> b!934657 (= res!629482 (contains!5060 lt!421089 k!1099))))

(assert (=> b!934657 (= lt!421089 (getCurrentListMap!3247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934658 () Bool)

(declare-fun res!629488 () Bool)

(assert (=> b!934658 (=> (not res!629488) (not e!524792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934658 (= res!629488 (validKeyInArray!0 k!1099))))

(declare-fun b!934659 () Bool)

(declare-fun e!524797 () Bool)

(declare-fun e!524794 () Bool)

(declare-fun mapRes!32004 () Bool)

(assert (=> b!934659 (= e!524797 (and e!524794 mapRes!32004))))

(declare-fun condMapEmpty!32004 () Bool)

(declare-fun mapDefault!32004 () ValueCell!9599)

