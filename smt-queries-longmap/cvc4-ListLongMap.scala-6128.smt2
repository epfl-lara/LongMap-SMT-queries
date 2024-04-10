; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78880 () Bool)

(assert start!78880)

(declare-fun b_free!17093 () Bool)

(declare-fun b_next!17093 () Bool)

(assert (=> start!78880 (= b_free!17093 (not b_next!17093))))

(declare-fun tp!59719 () Bool)

(declare-fun b_and!27923 () Bool)

(assert (=> start!78880 (= tp!59719 b_and!27923)))

(declare-fun mapNonEmpty!31158 () Bool)

(declare-fun mapRes!31158 () Bool)

(declare-fun tp!59720 () Bool)

(declare-fun e!517305 () Bool)

(assert (=> mapNonEmpty!31158 (= mapRes!31158 (and tp!59720 e!517305))))

(declare-datatypes ((V!31099 0))(
  ( (V!31100 (val!9851 Int)) )
))
(declare-datatypes ((ValueCell!9319 0))(
  ( (ValueCellFull!9319 (v!12369 V!31099)) (EmptyCell!9319) )
))
(declare-fun mapRest!31158 () (Array (_ BitVec 32) ValueCell!9319))

(declare-fun mapKey!31158 () (_ BitVec 32))

(declare-datatypes ((array!55180 0))(
  ( (array!55181 (arr!26535 (Array (_ BitVec 32) ValueCell!9319)) (size!26994 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55180)

(declare-fun mapValue!31158 () ValueCell!9319)

(assert (=> mapNonEmpty!31158 (= (arr!26535 _values!1231) (store mapRest!31158 mapKey!31158 mapValue!31158))))

(declare-fun b!921907 () Bool)

(declare-fun e!517311 () Bool)

(declare-fun e!517306 () Bool)

(assert (=> b!921907 (= e!517311 e!517306)))

(declare-fun res!621711 () Bool)

(assert (=> b!921907 (=> (not res!621711) (not e!517306))))

(declare-datatypes ((tuple2!12814 0))(
  ( (tuple2!12815 (_1!6418 (_ BitVec 64)) (_2!6418 V!31099)) )
))
(declare-datatypes ((List!18619 0))(
  ( (Nil!18616) (Cons!18615 (h!19761 tuple2!12814) (t!26442 List!18619)) )
))
(declare-datatypes ((ListLongMap!11511 0))(
  ( (ListLongMap!11512 (toList!5771 List!18619)) )
))
(declare-fun lt!413932 () ListLongMap!11511)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4834 (ListLongMap!11511 (_ BitVec 64)) Bool)

(assert (=> b!921907 (= res!621711 (contains!4834 lt!413932 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!55182 0))(
  ( (array!55183 (arr!26536 (Array (_ BitVec 32) (_ BitVec 64))) (size!26995 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55182)

(declare-fun zeroValue!1173 () V!31099)

(declare-fun minValue!1173 () V!31099)

(declare-fun getCurrentListMap!3025 (array!55182 array!55180 (_ BitVec 32) (_ BitVec 32) V!31099 V!31099 (_ BitVec 32) Int) ListLongMap!11511)

(assert (=> b!921907 (= lt!413932 (getCurrentListMap!3025 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!621707 () Bool)

(assert (=> start!78880 (=> (not res!621707) (not e!517311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78880 (= res!621707 (validMask!0 mask!1881))))

(assert (=> start!78880 e!517311))

(assert (=> start!78880 true))

(declare-fun tp_is_empty!19601 () Bool)

(assert (=> start!78880 tp_is_empty!19601))

(declare-fun e!517307 () Bool)

(declare-fun array_inv!20670 (array!55180) Bool)

(assert (=> start!78880 (and (array_inv!20670 _values!1231) e!517307)))

(assert (=> start!78880 tp!59719))

(declare-fun array_inv!20671 (array!55182) Bool)

(assert (=> start!78880 (array_inv!20671 _keys!1487)))

(declare-fun b!921908 () Bool)

(declare-fun e!517312 () Bool)

(declare-fun arrayContainsKey!0 (array!55182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921908 (= e!517312 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!921909 () Bool)

(declare-fun res!621709 () Bool)

(assert (=> b!921909 (=> (not res!621709) (not e!517306))))

(declare-fun v!791 () V!31099)

(declare-fun apply!609 (ListLongMap!11511 (_ BitVec 64)) V!31099)

(assert (=> b!921909 (= res!621709 (= (apply!609 lt!413932 k!1099) v!791))))

(declare-fun b!921910 () Bool)

(declare-fun res!621708 () Bool)

(assert (=> b!921910 (=> (not res!621708) (not e!517311))))

(declare-datatypes ((List!18620 0))(
  ( (Nil!18617) (Cons!18616 (h!19762 (_ BitVec 64)) (t!26443 List!18620)) )
))
(declare-fun arrayNoDuplicates!0 (array!55182 (_ BitVec 32) List!18620) Bool)

(assert (=> b!921910 (= res!621708 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18617))))

(declare-fun b!921911 () Bool)

(declare-fun e!517309 () Bool)

(assert (=> b!921911 (= e!517309 tp_is_empty!19601)))

(declare-fun b!921912 () Bool)

(declare-fun res!621704 () Bool)

(assert (=> b!921912 (=> (not res!621704) (not e!517306))))

(assert (=> b!921912 (= res!621704 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921913 () Bool)

(declare-fun res!621703 () Bool)

(assert (=> b!921913 (=> (not res!621703) (not e!517311))))

(assert (=> b!921913 (= res!621703 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26995 _keys!1487))))))

(declare-fun b!921914 () Bool)

(declare-fun e!517308 () Bool)

(assert (=> b!921914 (= e!517308 (not true))))

(declare-fun lt!413933 () (_ BitVec 64))

(assert (=> b!921914 (not (= lt!413933 k!1099))))

(declare-datatypes ((Unit!31104 0))(
  ( (Unit!31105) )
))
(declare-fun lt!413930 () Unit!31104)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55182 (_ BitVec 64) (_ BitVec 32) List!18620) Unit!31104)

(assert (=> b!921914 (= lt!413930 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18617))))

(assert (=> b!921914 e!517312))

(declare-fun c!96141 () Bool)

(assert (=> b!921914 (= c!96141 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413937 () Unit!31104)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!185 (array!55182 array!55180 (_ BitVec 32) (_ BitVec 32) V!31099 V!31099 (_ BitVec 64) (_ BitVec 32) Int) Unit!31104)

(assert (=> b!921914 (= lt!413937 (lemmaListMapContainsThenArrayContainsFrom!185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921914 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18617)))

(declare-fun lt!413936 () Unit!31104)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55182 (_ BitVec 32) (_ BitVec 32)) Unit!31104)

(assert (=> b!921914 (= lt!413936 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413934 () tuple2!12814)

(declare-fun +!2678 (ListLongMap!11511 tuple2!12814) ListLongMap!11511)

(assert (=> b!921914 (contains!4834 (+!2678 lt!413932 lt!413934) k!1099)))

(declare-fun lt!413938 () V!31099)

(declare-fun lt!413935 () Unit!31104)

(declare-fun addStillContains!402 (ListLongMap!11511 (_ BitVec 64) V!31099 (_ BitVec 64)) Unit!31104)

(assert (=> b!921914 (= lt!413935 (addStillContains!402 lt!413932 lt!413933 lt!413938 k!1099))))

(assert (=> b!921914 (= (getCurrentListMap!3025 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2678 (getCurrentListMap!3025 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413934))))

(assert (=> b!921914 (= lt!413934 (tuple2!12815 lt!413933 lt!413938))))

(declare-fun get!13931 (ValueCell!9319 V!31099) V!31099)

(declare-fun dynLambda!1467 (Int (_ BitVec 64)) V!31099)

(assert (=> b!921914 (= lt!413938 (get!13931 (select (arr!26535 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1467 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413931 () Unit!31104)

(declare-fun lemmaListMapRecursiveValidKeyArray!68 (array!55182 array!55180 (_ BitVec 32) (_ BitVec 32) V!31099 V!31099 (_ BitVec 32) Int) Unit!31104)

(assert (=> b!921914 (= lt!413931 (lemmaListMapRecursiveValidKeyArray!68 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921915 () Bool)

(declare-fun res!621712 () Bool)

(assert (=> b!921915 (=> (not res!621712) (not e!517311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55182 (_ BitVec 32)) Bool)

(assert (=> b!921915 (= res!621712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921916 () Bool)

(assert (=> b!921916 (= e!517306 e!517308)))

(declare-fun res!621706 () Bool)

(assert (=> b!921916 (=> (not res!621706) (not e!517308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921916 (= res!621706 (validKeyInArray!0 lt!413933))))

(assert (=> b!921916 (= lt!413933 (select (arr!26536 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921917 () Bool)

(assert (=> b!921917 (= e!517305 tp_is_empty!19601)))

(declare-fun b!921918 () Bool)

(declare-fun res!621710 () Bool)

(assert (=> b!921918 (=> (not res!621710) (not e!517306))))

(assert (=> b!921918 (= res!621710 (validKeyInArray!0 k!1099))))

(declare-fun b!921919 () Bool)

(assert (=> b!921919 (= e!517307 (and e!517309 mapRes!31158))))

(declare-fun condMapEmpty!31158 () Bool)

(declare-fun mapDefault!31158 () ValueCell!9319)

