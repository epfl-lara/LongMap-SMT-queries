; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78852 () Bool)

(assert start!78852)

(declare-fun b_free!17083 () Bool)

(declare-fun b_next!17083 () Bool)

(assert (=> start!78852 (= b_free!17083 (not b_next!17083))))

(declare-fun tp!59690 () Bool)

(declare-fun b_and!27877 () Bool)

(assert (=> start!78852 (= tp!59690 b_and!27877)))

(declare-fun b!921412 () Bool)

(declare-fun e!517038 () Bool)

(declare-fun tp_is_empty!19591 () Bool)

(assert (=> b!921412 (= e!517038 tp_is_empty!19591)))

(declare-fun b!921413 () Bool)

(declare-fun res!621428 () Bool)

(declare-fun e!517035 () Bool)

(assert (=> b!921413 (=> (not res!621428) (not e!517035))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921413 (= res!621428 (validKeyInArray!0 k0!1099))))

(declare-fun res!621427 () Bool)

(declare-fun e!517033 () Bool)

(assert (=> start!78852 (=> (not res!621427) (not e!517033))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78852 (= res!621427 (validMask!0 mask!1881))))

(assert (=> start!78852 e!517033))

(assert (=> start!78852 true))

(assert (=> start!78852 tp_is_empty!19591))

(declare-datatypes ((V!31087 0))(
  ( (V!31088 (val!9846 Int)) )
))
(declare-datatypes ((ValueCell!9314 0))(
  ( (ValueCellFull!9314 (v!12363 V!31087)) (EmptyCell!9314) )
))
(declare-datatypes ((array!55133 0))(
  ( (array!55134 (arr!26512 (Array (_ BitVec 32) ValueCell!9314)) (size!26973 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55133)

(declare-fun e!517034 () Bool)

(declare-fun array_inv!20740 (array!55133) Bool)

(assert (=> start!78852 (and (array_inv!20740 _values!1231) e!517034)))

(assert (=> start!78852 tp!59690))

(declare-datatypes ((array!55135 0))(
  ( (array!55136 (arr!26513 (Array (_ BitVec 32) (_ BitVec 64))) (size!26974 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55135)

(declare-fun array_inv!20741 (array!55135) Bool)

(assert (=> start!78852 (array_inv!20741 _keys!1487)))

(declare-fun mapIsEmpty!31143 () Bool)

(declare-fun mapRes!31143 () Bool)

(assert (=> mapIsEmpty!31143 mapRes!31143))

(declare-fun b!921414 () Bool)

(declare-fun res!621434 () Bool)

(assert (=> b!921414 (=> (not res!621434) (not e!517033))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921414 (= res!621434 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26974 _keys!1487))))))

(declare-fun b!921415 () Bool)

(declare-fun e!517036 () Bool)

(assert (=> b!921415 (= e!517036 true)))

(declare-fun lt!413565 () Bool)

(declare-datatypes ((List!18648 0))(
  ( (Nil!18645) (Cons!18644 (h!19790 (_ BitVec 64)) (t!26452 List!18648)) )
))
(declare-fun contains!4806 (List!18648 (_ BitVec 64)) Bool)

(assert (=> b!921415 (= lt!413565 (contains!4806 Nil!18645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921416 () Bool)

(declare-fun e!517030 () Bool)

(assert (=> b!921416 (= e!517030 tp_is_empty!19591)))

(declare-fun b!921417 () Bool)

(declare-fun e!517037 () Bool)

(assert (=> b!921417 (= e!517037 (not e!517036))))

(declare-fun res!621430 () Bool)

(assert (=> b!921417 (=> res!621430 e!517036)))

(assert (=> b!921417 (= res!621430 (or (bvsge (size!26974 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26974 _keys!1487))))))

(declare-fun e!517031 () Bool)

(assert (=> b!921417 e!517031))

(declare-fun c!96061 () Bool)

(assert (=> b!921417 (= c!96061 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31014 0))(
  ( (Unit!31015) )
))
(declare-fun lt!413562 () Unit!31014)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31087)

(declare-fun minValue!1173 () V!31087)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!189 (array!55135 array!55133 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 64) (_ BitVec 32) Int) Unit!31014)

(assert (=> b!921417 (= lt!413562 (lemmaListMapContainsThenArrayContainsFrom!189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55135 (_ BitVec 32) List!18648) Bool)

(assert (=> b!921417 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18645)))

(declare-fun lt!413560 () Unit!31014)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55135 (_ BitVec 32) (_ BitVec 32)) Unit!31014)

(assert (=> b!921417 (= lt!413560 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12864 0))(
  ( (tuple2!12865 (_1!6443 (_ BitVec 64)) (_2!6443 V!31087)) )
))
(declare-datatypes ((List!18649 0))(
  ( (Nil!18646) (Cons!18645 (h!19791 tuple2!12864) (t!26453 List!18649)) )
))
(declare-datatypes ((ListLongMap!11551 0))(
  ( (ListLongMap!11552 (toList!5791 List!18649)) )
))
(declare-fun lt!413567 () ListLongMap!11551)

(declare-fun lt!413561 () tuple2!12864)

(declare-fun contains!4807 (ListLongMap!11551 (_ BitVec 64)) Bool)

(declare-fun +!2701 (ListLongMap!11551 tuple2!12864) ListLongMap!11551)

(assert (=> b!921417 (contains!4807 (+!2701 lt!413567 lt!413561) k0!1099)))

(declare-fun lt!413559 () V!31087)

(declare-fun lt!413564 () Unit!31014)

(declare-fun lt!413566 () (_ BitVec 64))

(declare-fun addStillContains!398 (ListLongMap!11551 (_ BitVec 64) V!31087 (_ BitVec 64)) Unit!31014)

(assert (=> b!921417 (= lt!413564 (addStillContains!398 lt!413567 lt!413566 lt!413559 k0!1099))))

(declare-fun getCurrentListMap!2982 (array!55135 array!55133 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 32) Int) ListLongMap!11551)

(assert (=> b!921417 (= (getCurrentListMap!2982 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2701 (getCurrentListMap!2982 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413561))))

(assert (=> b!921417 (= lt!413561 (tuple2!12865 lt!413566 lt!413559))))

(declare-fun get!13924 (ValueCell!9314 V!31087) V!31087)

(declare-fun dynLambda!1457 (Int (_ BitVec 64)) V!31087)

(assert (=> b!921417 (= lt!413559 (get!13924 (select (arr!26512 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1457 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413563 () Unit!31014)

(declare-fun lemmaListMapRecursiveValidKeyArray!65 (array!55135 array!55133 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 32) Int) Unit!31014)

(assert (=> b!921417 (= lt!413563 (lemmaListMapRecursiveValidKeyArray!65 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921418 () Bool)

(declare-fun res!621426 () Bool)

(assert (=> b!921418 (=> (not res!621426) (not e!517033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55135 (_ BitVec 32)) Bool)

(assert (=> b!921418 (= res!621426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921419 () Bool)

(declare-fun arrayContainsKey!0 (array!55135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921419 (= e!517031 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921420 () Bool)

(declare-fun res!621425 () Bool)

(assert (=> b!921420 (=> (not res!621425) (not e!517035))))

(assert (=> b!921420 (= res!621425 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921421 () Bool)

(assert (=> b!921421 (= e!517031 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921422 () Bool)

(declare-fun res!621432 () Bool)

(assert (=> b!921422 (=> (not res!621432) (not e!517035))))

(declare-fun v!791 () V!31087)

(declare-fun apply!610 (ListLongMap!11551 (_ BitVec 64)) V!31087)

(assert (=> b!921422 (= res!621432 (= (apply!610 lt!413567 k0!1099) v!791))))

(declare-fun b!921423 () Bool)

(declare-fun res!621433 () Bool)

(assert (=> b!921423 (=> res!621433 e!517036)))

(declare-fun noDuplicate!1355 (List!18648) Bool)

(assert (=> b!921423 (= res!621433 (not (noDuplicate!1355 Nil!18645)))))

(declare-fun b!921424 () Bool)

(declare-fun res!621423 () Bool)

(assert (=> b!921424 (=> (not res!621423) (not e!517033))))

(assert (=> b!921424 (= res!621423 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18645))))

(declare-fun b!921425 () Bool)

(declare-fun res!621429 () Bool)

(assert (=> b!921425 (=> (not res!621429) (not e!517033))))

(assert (=> b!921425 (= res!621429 (and (= (size!26973 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26974 _keys!1487) (size!26973 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921426 () Bool)

(declare-fun res!621422 () Bool)

(assert (=> b!921426 (=> res!621422 e!517036)))

(assert (=> b!921426 (= res!621422 (contains!4806 Nil!18645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921427 () Bool)

(assert (=> b!921427 (= e!517033 e!517035)))

(declare-fun res!621424 () Bool)

(assert (=> b!921427 (=> (not res!621424) (not e!517035))))

(assert (=> b!921427 (= res!621424 (contains!4807 lt!413567 k0!1099))))

(assert (=> b!921427 (= lt!413567 (getCurrentListMap!2982 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31143 () Bool)

(declare-fun tp!59691 () Bool)

(assert (=> mapNonEmpty!31143 (= mapRes!31143 (and tp!59691 e!517038))))

(declare-fun mapKey!31143 () (_ BitVec 32))

(declare-fun mapValue!31143 () ValueCell!9314)

(declare-fun mapRest!31143 () (Array (_ BitVec 32) ValueCell!9314))

(assert (=> mapNonEmpty!31143 (= (arr!26512 _values!1231) (store mapRest!31143 mapKey!31143 mapValue!31143))))

(declare-fun b!921428 () Bool)

(assert (=> b!921428 (= e!517035 e!517037)))

(declare-fun res!621431 () Bool)

(assert (=> b!921428 (=> (not res!621431) (not e!517037))))

(assert (=> b!921428 (= res!621431 (validKeyInArray!0 lt!413566))))

(assert (=> b!921428 (= lt!413566 (select (arr!26513 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921429 () Bool)

(assert (=> b!921429 (= e!517034 (and e!517030 mapRes!31143))))

(declare-fun condMapEmpty!31143 () Bool)

(declare-fun mapDefault!31143 () ValueCell!9314)

(assert (=> b!921429 (= condMapEmpty!31143 (= (arr!26512 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9314)) mapDefault!31143)))))

(assert (= (and start!78852 res!621427) b!921425))

(assert (= (and b!921425 res!621429) b!921418))

(assert (= (and b!921418 res!621426) b!921424))

(assert (= (and b!921424 res!621423) b!921414))

(assert (= (and b!921414 res!621434) b!921427))

(assert (= (and b!921427 res!621424) b!921422))

(assert (= (and b!921422 res!621432) b!921420))

(assert (= (and b!921420 res!621425) b!921413))

(assert (= (and b!921413 res!621428) b!921428))

(assert (= (and b!921428 res!621431) b!921417))

(assert (= (and b!921417 c!96061) b!921419))

(assert (= (and b!921417 (not c!96061)) b!921421))

(assert (= (and b!921417 (not res!621430)) b!921423))

(assert (= (and b!921423 (not res!621433)) b!921426))

(assert (= (and b!921426 (not res!621422)) b!921415))

(assert (= (and b!921429 condMapEmpty!31143) mapIsEmpty!31143))

(assert (= (and b!921429 (not condMapEmpty!31143)) mapNonEmpty!31143))

(get-info :version)

(assert (= (and mapNonEmpty!31143 ((_ is ValueCellFull!9314) mapValue!31143)) b!921412))

(assert (= (and b!921429 ((_ is ValueCellFull!9314) mapDefault!31143)) b!921416))

(assert (= start!78852 b!921429))

(declare-fun b_lambda!13567 () Bool)

(assert (=> (not b_lambda!13567) (not b!921417)))

(declare-fun t!26451 () Bool)

(declare-fun tb!5655 () Bool)

(assert (=> (and start!78852 (= defaultEntry!1235 defaultEntry!1235) t!26451) tb!5655))

(declare-fun result!11141 () Bool)

(assert (=> tb!5655 (= result!11141 tp_is_empty!19591)))

(assert (=> b!921417 t!26451))

(declare-fun b_and!27879 () Bool)

(assert (= b_and!27877 (and (=> t!26451 result!11141) b_and!27879)))

(declare-fun m!854857 () Bool)

(assert (=> b!921428 m!854857))

(declare-fun m!854859 () Bool)

(assert (=> b!921428 m!854859))

(declare-fun m!854861 () Bool)

(assert (=> b!921417 m!854861))

(declare-fun m!854863 () Bool)

(assert (=> b!921417 m!854863))

(declare-fun m!854865 () Bool)

(assert (=> b!921417 m!854865))

(declare-fun m!854867 () Bool)

(assert (=> b!921417 m!854867))

(declare-fun m!854869 () Bool)

(assert (=> b!921417 m!854869))

(declare-fun m!854871 () Bool)

(assert (=> b!921417 m!854871))

(assert (=> b!921417 m!854869))

(assert (=> b!921417 m!854871))

(declare-fun m!854873 () Bool)

(assert (=> b!921417 m!854873))

(declare-fun m!854875 () Bool)

(assert (=> b!921417 m!854875))

(declare-fun m!854877 () Bool)

(assert (=> b!921417 m!854877))

(declare-fun m!854879 () Bool)

(assert (=> b!921417 m!854879))

(declare-fun m!854881 () Bool)

(assert (=> b!921417 m!854881))

(assert (=> b!921417 m!854863))

(declare-fun m!854883 () Bool)

(assert (=> b!921417 m!854883))

(assert (=> b!921417 m!854861))

(declare-fun m!854885 () Bool)

(assert (=> b!921417 m!854885))

(declare-fun m!854887 () Bool)

(assert (=> start!78852 m!854887))

(declare-fun m!854889 () Bool)

(assert (=> start!78852 m!854889))

(declare-fun m!854891 () Bool)

(assert (=> start!78852 m!854891))

(declare-fun m!854893 () Bool)

(assert (=> b!921424 m!854893))

(declare-fun m!854895 () Bool)

(assert (=> b!921419 m!854895))

(declare-fun m!854897 () Bool)

(assert (=> b!921415 m!854897))

(declare-fun m!854899 () Bool)

(assert (=> b!921427 m!854899))

(declare-fun m!854901 () Bool)

(assert (=> b!921427 m!854901))

(declare-fun m!854903 () Bool)

(assert (=> b!921423 m!854903))

(declare-fun m!854905 () Bool)

(assert (=> b!921418 m!854905))

(declare-fun m!854907 () Bool)

(assert (=> b!921413 m!854907))

(declare-fun m!854909 () Bool)

(assert (=> b!921426 m!854909))

(declare-fun m!854911 () Bool)

(assert (=> mapNonEmpty!31143 m!854911))

(declare-fun m!854913 () Bool)

(assert (=> b!921422 m!854913))

(check-sat (not b!921428) (not b!921426) (not b!921423) (not b!921415) (not b!921424) (not b!921417) (not b!921413) tp_is_empty!19591 (not b!921422) (not b!921427) (not b!921418) (not b_lambda!13567) (not b_next!17083) (not b!921419) (not start!78852) b_and!27879 (not mapNonEmpty!31143))
(check-sat b_and!27879 (not b_next!17083))
