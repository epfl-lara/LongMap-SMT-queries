; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78994 () Bool)

(assert start!78994)

(declare-fun b_free!17207 () Bool)

(declare-fun b_next!17207 () Bool)

(assert (=> start!78994 (= b_free!17207 (not b_next!17207))))

(declare-fun tp!60061 () Bool)

(declare-fun b_and!28151 () Bool)

(assert (=> start!78994 (= tp!60061 b_and!28151)))

(declare-fun res!623325 () Bool)

(declare-fun e!519031 () Bool)

(assert (=> start!78994 (=> (not res!623325) (not e!519031))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78994 (= res!623325 (validMask!0 mask!1881))))

(assert (=> start!78994 e!519031))

(assert (=> start!78994 true))

(declare-fun tp_is_empty!19715 () Bool)

(assert (=> start!78994 tp_is_empty!19715))

(declare-datatypes ((V!31251 0))(
  ( (V!31252 (val!9908 Int)) )
))
(declare-datatypes ((ValueCell!9376 0))(
  ( (ValueCellFull!9376 (v!12426 V!31251)) (EmptyCell!9376) )
))
(declare-datatypes ((array!55398 0))(
  ( (array!55399 (arr!26644 (Array (_ BitVec 32) ValueCell!9376)) (size!27103 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55398)

(declare-fun e!519039 () Bool)

(declare-fun array_inv!20750 (array!55398) Bool)

(assert (=> start!78994 (and (array_inv!20750 _values!1231) e!519039)))

(assert (=> start!78994 tp!60061))

(declare-datatypes ((array!55400 0))(
  ( (array!55401 (arr!26645 (Array (_ BitVec 32) (_ BitVec 64))) (size!27104 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55400)

(declare-fun array_inv!20751 (array!55400) Bool)

(assert (=> start!78994 (array_inv!20751 _keys!1487)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!924853 () Bool)

(declare-fun e!519036 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924853 (= e!519036 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!924854 () Bool)

(declare-fun res!623327 () Bool)

(assert (=> b!924854 (=> (not res!623327) (not e!519031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55400 (_ BitVec 32)) Bool)

(assert (=> b!924854 (= res!623327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924855 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!924855 (= e!519036 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924856 () Bool)

(declare-datatypes ((tuple2!12912 0))(
  ( (tuple2!12913 (_1!6467 (_ BitVec 64)) (_2!6467 V!31251)) )
))
(declare-datatypes ((List!18714 0))(
  ( (Nil!18711) (Cons!18710 (h!19856 tuple2!12912) (t!26651 List!18714)) )
))
(declare-datatypes ((ListLongMap!11609 0))(
  ( (ListLongMap!11610 (toList!5820 List!18714)) )
))
(declare-fun lt!416007 () ListLongMap!11609)

(declare-fun lt!416008 () V!31251)

(declare-fun apply!650 (ListLongMap!11609 (_ BitVec 64)) V!31251)

(assert (=> b!924856 (= (apply!650 lt!416007 k!1099) lt!416008)))

(declare-fun lt!416009 () V!31251)

(declare-datatypes ((Unit!31231 0))(
  ( (Unit!31232) )
))
(declare-fun lt!416005 () Unit!31231)

(declare-fun lt!416011 () (_ BitVec 64))

(declare-fun lt!416003 () ListLongMap!11609)

(declare-fun addApplyDifferent!372 (ListLongMap!11609 (_ BitVec 64) V!31251 (_ BitVec 64)) Unit!31231)

(assert (=> b!924856 (= lt!416005 (addApplyDifferent!372 lt!416003 lt!416011 lt!416009 k!1099))))

(assert (=> b!924856 (not (= lt!416011 k!1099))))

(declare-fun lt!416014 () Unit!31231)

(declare-datatypes ((List!18715 0))(
  ( (Nil!18712) (Cons!18711 (h!19857 (_ BitVec 64)) (t!26652 List!18715)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55400 (_ BitVec 64) (_ BitVec 32) List!18715) Unit!31231)

(assert (=> b!924856 (= lt!416014 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18712))))

(assert (=> b!924856 e!519036))

(declare-fun c!96491 () Bool)

(assert (=> b!924856 (= c!96491 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416004 () Unit!31231)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31251)

(declare-fun minValue!1173 () V!31251)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!223 (array!55400 array!55398 (_ BitVec 32) (_ BitVec 32) V!31251 V!31251 (_ BitVec 64) (_ BitVec 32) Int) Unit!31231)

(assert (=> b!924856 (= lt!416004 (lemmaListMapContainsThenArrayContainsFrom!223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55400 (_ BitVec 32) List!18715) Bool)

(assert (=> b!924856 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18712)))

(declare-fun lt!416006 () Unit!31231)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55400 (_ BitVec 32) (_ BitVec 32)) Unit!31231)

(assert (=> b!924856 (= lt!416006 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4880 (ListLongMap!11609 (_ BitVec 64)) Bool)

(assert (=> b!924856 (contains!4880 lt!416007 k!1099)))

(declare-fun lt!416013 () tuple2!12912)

(declare-fun +!2716 (ListLongMap!11609 tuple2!12912) ListLongMap!11609)

(assert (=> b!924856 (= lt!416007 (+!2716 lt!416003 lt!416013))))

(declare-fun lt!416016 () Unit!31231)

(declare-fun addStillContains!440 (ListLongMap!11609 (_ BitVec 64) V!31251 (_ BitVec 64)) Unit!31231)

(assert (=> b!924856 (= lt!416016 (addStillContains!440 lt!416003 lt!416011 lt!416009 k!1099))))

(declare-fun getCurrentListMap!3071 (array!55400 array!55398 (_ BitVec 32) (_ BitVec 32) V!31251 V!31251 (_ BitVec 32) Int) ListLongMap!11609)

(assert (=> b!924856 (= (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2716 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416013))))

(assert (=> b!924856 (= lt!416013 (tuple2!12913 lt!416011 lt!416009))))

(declare-fun get!14007 (ValueCell!9376 V!31251) V!31251)

(declare-fun dynLambda!1505 (Int (_ BitVec 64)) V!31251)

(assert (=> b!924856 (= lt!416009 (get!14007 (select (arr!26644 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1505 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416012 () Unit!31231)

(declare-fun lemmaListMapRecursiveValidKeyArray!106 (array!55400 array!55398 (_ BitVec 32) (_ BitVec 32) V!31251 V!31251 (_ BitVec 32) Int) Unit!31231)

(assert (=> b!924856 (= lt!416012 (lemmaListMapRecursiveValidKeyArray!106 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519035 () Unit!31231)

(assert (=> b!924856 (= e!519035 lt!416005)))

(declare-fun b!924857 () Bool)

(declare-fun Unit!31233 () Unit!31231)

(assert (=> b!924857 (= e!519035 Unit!31233)))

(declare-fun b!924858 () Bool)

(declare-fun res!623326 () Bool)

(assert (=> b!924858 (=> (not res!623326) (not e!519031))))

(assert (=> b!924858 (= res!623326 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27104 _keys!1487))))))

(declare-fun mapNonEmpty!31329 () Bool)

(declare-fun mapRes!31329 () Bool)

(declare-fun tp!60062 () Bool)

(declare-fun e!519034 () Bool)

(assert (=> mapNonEmpty!31329 (= mapRes!31329 (and tp!60062 e!519034))))

(declare-fun mapRest!31329 () (Array (_ BitVec 32) ValueCell!9376))

(declare-fun mapValue!31329 () ValueCell!9376)

(declare-fun mapKey!31329 () (_ BitVec 32))

(assert (=> mapNonEmpty!31329 (= (arr!26644 _values!1231) (store mapRest!31329 mapKey!31329 mapValue!31329))))

(declare-fun b!924859 () Bool)

(assert (=> b!924859 (= e!519034 tp_is_empty!19715)))

(declare-fun b!924860 () Bool)

(declare-fun e!519037 () Bool)

(assert (=> b!924860 (= e!519031 e!519037)))

(declare-fun res!623329 () Bool)

(assert (=> b!924860 (=> (not res!623329) (not e!519037))))

(assert (=> b!924860 (= res!623329 (contains!4880 lt!416003 k!1099))))

(assert (=> b!924860 (= lt!416003 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31329 () Bool)

(assert (=> mapIsEmpty!31329 mapRes!31329))

(declare-fun b!924861 () Bool)

(declare-fun res!623324 () Bool)

(assert (=> b!924861 (=> (not res!623324) (not e!519031))))

(assert (=> b!924861 (= res!623324 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18712))))

(declare-fun b!924862 () Bool)

(declare-fun e!519029 () Unit!31231)

(assert (=> b!924862 (= e!519029 e!519035)))

(assert (=> b!924862 (= lt!416011 (select (arr!26645 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96492 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924862 (= c!96492 (validKeyInArray!0 lt!416011))))

(declare-fun b!924863 () Bool)

(declare-fun e!519040 () Bool)

(assert (=> b!924863 (= e!519040 false)))

(declare-fun lt!416010 () V!31251)

(declare-fun lt!416017 () ListLongMap!11609)

(assert (=> b!924863 (= lt!416010 (apply!650 lt!416017 k!1099))))

(declare-fun b!924864 () Bool)

(declare-fun res!623328 () Bool)

(assert (=> b!924864 (=> (not res!623328) (not e!519031))))

(assert (=> b!924864 (= res!623328 (and (= (size!27103 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27104 _keys!1487) (size!27103 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924865 () Bool)

(declare-fun e!519033 () Bool)

(assert (=> b!924865 (= e!519033 tp_is_empty!19715)))

(declare-fun b!924866 () Bool)

(declare-fun e!519030 () Bool)

(assert (=> b!924866 (= e!519030 e!519040)))

(declare-fun res!623332 () Bool)

(assert (=> b!924866 (=> (not res!623332) (not e!519040))))

(assert (=> b!924866 (= res!623332 (contains!4880 lt!416017 k!1099))))

(assert (=> b!924866 (= lt!416017 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924867 () Bool)

(declare-fun e!519032 () Bool)

(assert (=> b!924867 (= e!519032 e!519030)))

(declare-fun res!623330 () Bool)

(assert (=> b!924867 (=> (not res!623330) (not e!519030))))

(assert (=> b!924867 (= res!623330 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27104 _keys!1487)))))

(declare-fun lt!416015 () Unit!31231)

(assert (=> b!924867 (= lt!416015 e!519029)))

(declare-fun c!96490 () Bool)

(assert (=> b!924867 (= c!96490 (validKeyInArray!0 k!1099))))

(declare-fun b!924868 () Bool)

(declare-fun Unit!31234 () Unit!31231)

(assert (=> b!924868 (= e!519029 Unit!31234)))

(declare-fun b!924869 () Bool)

(assert (=> b!924869 (= e!519039 (and e!519033 mapRes!31329))))

(declare-fun condMapEmpty!31329 () Bool)

(declare-fun mapDefault!31329 () ValueCell!9376)

