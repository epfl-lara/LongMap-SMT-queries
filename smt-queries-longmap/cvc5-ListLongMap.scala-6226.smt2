; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79628 () Bool)

(assert start!79628)

(declare-fun b_free!17677 () Bool)

(declare-fun b_next!17677 () Bool)

(assert (=> start!79628 (= b_free!17677 (not b_next!17677))))

(declare-fun tp!61486 () Bool)

(declare-fun b_and!28945 () Bool)

(assert (=> start!79628 (= tp!61486 b_and!28945)))

(declare-fun b!935913 () Bool)

(declare-fun e!525529 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56312 0))(
  ( (array!56313 (arr!27096 (Array (_ BitVec 32) (_ BitVec 64))) (size!27555 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56312)

(assert (=> b!935913 (= e!525529 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27555 _keys!1487))))))

(declare-fun lt!421897 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!935913 (not (= lt!421897 k!1099))))

(declare-datatypes ((Unit!31565 0))(
  ( (Unit!31566) )
))
(declare-fun lt!421896 () Unit!31565)

(declare-datatypes ((List!19095 0))(
  ( (Nil!19092) (Cons!19091 (h!20237 (_ BitVec 64)) (t!27316 List!19095)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56312 (_ BitVec 64) (_ BitVec 32) List!19095) Unit!31565)

(assert (=> b!935913 (= lt!421896 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19092))))

(declare-fun e!525534 () Bool)

(assert (=> b!935913 e!525534))

(declare-fun c!97347 () Bool)

(assert (=> b!935913 (= c!97347 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!421893 () Unit!31565)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31879 0))(
  ( (V!31880 (val!10143 Int)) )
))
(declare-datatypes ((ValueCell!9611 0))(
  ( (ValueCellFull!9611 (v!12668 V!31879)) (EmptyCell!9611) )
))
(declare-datatypes ((array!56314 0))(
  ( (array!56315 (arr!27097 (Array (_ BitVec 32) ValueCell!9611)) (size!27556 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56314)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31879)

(declare-fun minValue!1173 () V!31879)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!287 (array!56312 array!56314 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 64) (_ BitVec 32) Int) Unit!31565)

(assert (=> b!935913 (= lt!421893 (lemmaListMapContainsThenArrayContainsFrom!287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56312 (_ BitVec 32) List!19095) Bool)

(assert (=> b!935913 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19092)))

(declare-fun lt!421900 () Unit!31565)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56312 (_ BitVec 32) (_ BitVec 32)) Unit!31565)

(assert (=> b!935913 (= lt!421900 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13314 0))(
  ( (tuple2!13315 (_1!6668 (_ BitVec 64)) (_2!6668 V!31879)) )
))
(declare-datatypes ((List!19096 0))(
  ( (Nil!19093) (Cons!19092 (h!20238 tuple2!13314) (t!27317 List!19096)) )
))
(declare-datatypes ((ListLongMap!12011 0))(
  ( (ListLongMap!12012 (toList!6021 List!19096)) )
))
(declare-fun lt!421895 () ListLongMap!12011)

(declare-fun lt!421898 () tuple2!13314)

(declare-fun contains!5082 (ListLongMap!12011 (_ BitVec 64)) Bool)

(declare-fun +!2815 (ListLongMap!12011 tuple2!13314) ListLongMap!12011)

(assert (=> b!935913 (contains!5082 (+!2815 lt!421895 lt!421898) k!1099)))

(declare-fun lt!421899 () V!31879)

(declare-fun lt!421901 () Unit!31565)

(declare-fun addStillContains!534 (ListLongMap!12011 (_ BitVec 64) V!31879 (_ BitVec 64)) Unit!31565)

(assert (=> b!935913 (= lt!421901 (addStillContains!534 lt!421895 lt!421897 lt!421899 k!1099))))

(declare-fun getCurrentListMap!3258 (array!56312 array!56314 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 32) Int) ListLongMap!12011)

(assert (=> b!935913 (= (getCurrentListMap!3258 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2815 (getCurrentListMap!3258 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421898))))

(assert (=> b!935913 (= lt!421898 (tuple2!13315 lt!421897 lt!421899))))

(declare-fun get!14279 (ValueCell!9611 V!31879) V!31879)

(declare-fun dynLambda!1604 (Int (_ BitVec 64)) V!31879)

(assert (=> b!935913 (= lt!421899 (get!14279 (select (arr!27097 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1604 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421894 () Unit!31565)

(declare-fun lemmaListMapRecursiveValidKeyArray!205 (array!56312 array!56314 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 32) Int) Unit!31565)

(assert (=> b!935913 (= lt!421894 (lemmaListMapRecursiveValidKeyArray!205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935914 () Bool)

(declare-fun e!525530 () Bool)

(declare-fun tp_is_empty!20185 () Bool)

(assert (=> b!935914 (= e!525530 tp_is_empty!20185)))

(declare-fun b!935915 () Bool)

(declare-fun res!630234 () Bool)

(declare-fun e!525531 () Bool)

(assert (=> b!935915 (=> (not res!630234) (not e!525531))))

(assert (=> b!935915 (= res!630234 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935917 () Bool)

(assert (=> b!935917 (= e!525531 e!525529)))

(declare-fun res!630230 () Bool)

(assert (=> b!935917 (=> (not res!630230) (not e!525529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935917 (= res!630230 (validKeyInArray!0 lt!421897))))

(assert (=> b!935917 (= lt!421897 (select (arr!27096 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935918 () Bool)

(assert (=> b!935918 (= e!525534 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32049 () Bool)

(declare-fun mapRes!32049 () Bool)

(declare-fun tp!61487 () Bool)

(declare-fun e!525533 () Bool)

(assert (=> mapNonEmpty!32049 (= mapRes!32049 (and tp!61487 e!525533))))

(declare-fun mapKey!32049 () (_ BitVec 32))

(declare-fun mapValue!32049 () ValueCell!9611)

(declare-fun mapRest!32049 () (Array (_ BitVec 32) ValueCell!9611))

(assert (=> mapNonEmpty!32049 (= (arr!27097 _values!1231) (store mapRest!32049 mapKey!32049 mapValue!32049))))

(declare-fun b!935919 () Bool)

(declare-fun res!630232 () Bool)

(assert (=> b!935919 (=> (not res!630232) (not e!525531))))

(declare-fun v!791 () V!31879)

(declare-fun apply!823 (ListLongMap!12011 (_ BitVec 64)) V!31879)

(assert (=> b!935919 (= res!630232 (= (apply!823 lt!421895 k!1099) v!791))))

(declare-fun b!935920 () Bool)

(declare-fun res!630231 () Bool)

(declare-fun e!525527 () Bool)

(assert (=> b!935920 (=> (not res!630231) (not e!525527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56312 (_ BitVec 32)) Bool)

(assert (=> b!935920 (= res!630231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935921 () Bool)

(assert (=> b!935921 (= e!525533 tp_is_empty!20185)))

(declare-fun b!935922 () Bool)

(declare-fun res!630227 () Bool)

(assert (=> b!935922 (=> (not res!630227) (not e!525527))))

(assert (=> b!935922 (= res!630227 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27555 _keys!1487))))))

(declare-fun b!935923 () Bool)

(declare-fun res!630235 () Bool)

(assert (=> b!935923 (=> (not res!630235) (not e!525531))))

(assert (=> b!935923 (= res!630235 (validKeyInArray!0 k!1099))))

(declare-fun res!630228 () Bool)

(assert (=> start!79628 (=> (not res!630228) (not e!525527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79628 (= res!630228 (validMask!0 mask!1881))))

(assert (=> start!79628 e!525527))

(assert (=> start!79628 true))

(assert (=> start!79628 tp_is_empty!20185))

(declare-fun e!525532 () Bool)

(declare-fun array_inv!21086 (array!56314) Bool)

(assert (=> start!79628 (and (array_inv!21086 _values!1231) e!525532)))

(assert (=> start!79628 tp!61486))

(declare-fun array_inv!21087 (array!56312) Bool)

(assert (=> start!79628 (array_inv!21087 _keys!1487)))

(declare-fun b!935916 () Bool)

(assert (=> b!935916 (= e!525527 e!525531)))

(declare-fun res!630226 () Bool)

(assert (=> b!935916 (=> (not res!630226) (not e!525531))))

(assert (=> b!935916 (= res!630226 (contains!5082 lt!421895 k!1099))))

(assert (=> b!935916 (= lt!421895 (getCurrentListMap!3258 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935924 () Bool)

(declare-fun res!630229 () Bool)

(assert (=> b!935924 (=> (not res!630229) (not e!525527))))

(assert (=> b!935924 (= res!630229 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19092))))

(declare-fun b!935925 () Bool)

(assert (=> b!935925 (= e!525532 (and e!525530 mapRes!32049))))

(declare-fun condMapEmpty!32049 () Bool)

(declare-fun mapDefault!32049 () ValueCell!9611)

