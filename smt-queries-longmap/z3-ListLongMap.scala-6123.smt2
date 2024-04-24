; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79014 () Bool)

(assert start!79014)

(declare-fun b_free!17059 () Bool)

(declare-fun b_next!17059 () Bool)

(assert (=> start!79014 (= b_free!17059 (not b_next!17059))))

(declare-fun tp!59619 () Bool)

(declare-fun b_and!27865 () Bool)

(assert (=> start!79014 (= tp!59619 b_and!27865)))

(declare-fun b!921882 () Bool)

(declare-fun e!517438 () Bool)

(assert (=> b!921882 (= e!517438 true)))

(declare-fun lt!413837 () Bool)

(declare-datatypes ((List!18587 0))(
  ( (Nil!18584) (Cons!18583 (h!19735 (_ BitVec 64)) (t!26368 List!18587)) )
))
(declare-fun contains!4813 (List!18587 (_ BitVec 64)) Bool)

(assert (=> b!921882 (= lt!413837 (contains!4813 Nil!18584 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921883 () Bool)

(declare-fun e!517439 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921883 (= e!517439 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921884 () Bool)

(declare-fun res!621417 () Bool)

(declare-fun e!517437 () Bool)

(assert (=> b!921884 (=> (not res!621417) (not e!517437))))

(declare-datatypes ((array!55159 0))(
  ( (array!55160 (arr!26520 (Array (_ BitVec 32) (_ BitVec 64))) (size!26980 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55159)

(declare-fun arrayNoDuplicates!0 (array!55159 (_ BitVec 32) List!18587) Bool)

(assert (=> b!921884 (= res!621417 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18584))))

(declare-fun b!921885 () Bool)

(declare-fun res!621419 () Bool)

(declare-fun e!517444 () Bool)

(assert (=> b!921885 (=> (not res!621419) (not e!517444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921885 (= res!621419 (validKeyInArray!0 k0!1099))))

(declare-fun b!921886 () Bool)

(declare-fun e!517443 () Bool)

(declare-fun tp_is_empty!19567 () Bool)

(assert (=> b!921886 (= e!517443 tp_is_empty!19567)))

(declare-fun b!921887 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!55159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921887 (= e!517439 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921888 () Bool)

(declare-fun res!621416 () Bool)

(assert (=> b!921888 (=> res!621416 e!517438)))

(assert (=> b!921888 (= res!621416 (contains!4813 Nil!18584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921889 () Bool)

(declare-fun e!517442 () Bool)

(assert (=> b!921889 (= e!517442 tp_is_empty!19567)))

(declare-fun b!921890 () Bool)

(declare-fun res!621410 () Bool)

(assert (=> b!921890 (=> (not res!621410) (not e!517444))))

(declare-datatypes ((V!31055 0))(
  ( (V!31056 (val!9834 Int)) )
))
(declare-datatypes ((tuple2!12772 0))(
  ( (tuple2!12773 (_1!6397 (_ BitVec 64)) (_2!6397 V!31055)) )
))
(declare-datatypes ((List!18588 0))(
  ( (Nil!18585) (Cons!18584 (h!19736 tuple2!12772) (t!26369 List!18588)) )
))
(declare-datatypes ((ListLongMap!11471 0))(
  ( (ListLongMap!11472 (toList!5751 List!18588)) )
))
(declare-fun lt!413833 () ListLongMap!11471)

(declare-fun v!791 () V!31055)

(declare-fun apply!614 (ListLongMap!11471 (_ BitVec 64)) V!31055)

(assert (=> b!921890 (= res!621410 (= (apply!614 lt!413833 k0!1099) v!791))))

(declare-fun res!621415 () Bool)

(assert (=> start!79014 (=> (not res!621415) (not e!517437))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79014 (= res!621415 (validMask!0 mask!1881))))

(assert (=> start!79014 e!517437))

(assert (=> start!79014 true))

(assert (=> start!79014 tp_is_empty!19567))

(declare-datatypes ((ValueCell!9302 0))(
  ( (ValueCellFull!9302 (v!12349 V!31055)) (EmptyCell!9302) )
))
(declare-datatypes ((array!55161 0))(
  ( (array!55162 (arr!26521 (Array (_ BitVec 32) ValueCell!9302)) (size!26981 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55161)

(declare-fun e!517441 () Bool)

(declare-fun array_inv!20764 (array!55161) Bool)

(assert (=> start!79014 (and (array_inv!20764 _values!1231) e!517441)))

(assert (=> start!79014 tp!59619))

(declare-fun array_inv!20765 (array!55159) Bool)

(assert (=> start!79014 (array_inv!20765 _keys!1487)))

(declare-fun b!921891 () Bool)

(declare-fun e!517440 () Bool)

(assert (=> b!921891 (= e!517444 e!517440)))

(declare-fun res!621412 () Bool)

(assert (=> b!921891 (=> (not res!621412) (not e!517440))))

(declare-fun lt!413834 () (_ BitVec 64))

(assert (=> b!921891 (= res!621412 (validKeyInArray!0 lt!413834))))

(assert (=> b!921891 (= lt!413834 (select (arr!26520 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921892 () Bool)

(assert (=> b!921892 (= e!517437 e!517444)))

(declare-fun res!621420 () Bool)

(assert (=> b!921892 (=> (not res!621420) (not e!517444))))

(declare-fun contains!4814 (ListLongMap!11471 (_ BitVec 64)) Bool)

(assert (=> b!921892 (= res!621420 (contains!4814 lt!413833 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31055)

(declare-fun minValue!1173 () V!31055)

(declare-fun getCurrentListMap!3004 (array!55159 array!55161 (_ BitVec 32) (_ BitVec 32) V!31055 V!31055 (_ BitVec 32) Int) ListLongMap!11471)

(assert (=> b!921892 (= lt!413833 (getCurrentListMap!3004 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921893 () Bool)

(declare-fun res!621409 () Bool)

(assert (=> b!921893 (=> (not res!621409) (not e!517444))))

(assert (=> b!921893 (= res!621409 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31107 () Bool)

(declare-fun mapRes!31107 () Bool)

(declare-fun tp!59618 () Bool)

(assert (=> mapNonEmpty!31107 (= mapRes!31107 (and tp!59618 e!517442))))

(declare-fun mapRest!31107 () (Array (_ BitVec 32) ValueCell!9302))

(declare-fun mapValue!31107 () ValueCell!9302)

(declare-fun mapKey!31107 () (_ BitVec 32))

(assert (=> mapNonEmpty!31107 (= (arr!26521 _values!1231) (store mapRest!31107 mapKey!31107 mapValue!31107))))

(declare-fun b!921894 () Bool)

(assert (=> b!921894 (= e!517441 (and e!517443 mapRes!31107))))

(declare-fun condMapEmpty!31107 () Bool)

(declare-fun mapDefault!31107 () ValueCell!9302)

(assert (=> b!921894 (= condMapEmpty!31107 (= (arr!26521 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9302)) mapDefault!31107)))))

(declare-fun mapIsEmpty!31107 () Bool)

(assert (=> mapIsEmpty!31107 mapRes!31107))

(declare-fun b!921895 () Bool)

(assert (=> b!921895 (= e!517440 (not e!517438))))

(declare-fun res!621418 () Bool)

(assert (=> b!921895 (=> res!621418 e!517438)))

(assert (=> b!921895 (= res!621418 (or (bvsge (size!26980 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26980 _keys!1487))))))

(assert (=> b!921895 e!517439))

(declare-fun c!96372 () Bool)

(assert (=> b!921895 (= c!96372 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31076 0))(
  ( (Unit!31077) )
))
(declare-fun lt!413832 () Unit!31076)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!173 (array!55159 array!55161 (_ BitVec 32) (_ BitVec 32) V!31055 V!31055 (_ BitVec 64) (_ BitVec 32) Int) Unit!31076)

(assert (=> b!921895 (= lt!413832 (lemmaListMapContainsThenArrayContainsFrom!173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921895 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18584)))

(declare-fun lt!413836 () Unit!31076)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55159 (_ BitVec 32) (_ BitVec 32)) Unit!31076)

(assert (=> b!921895 (= lt!413836 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413835 () tuple2!12772)

(declare-fun +!2682 (ListLongMap!11471 tuple2!12772) ListLongMap!11471)

(assert (=> b!921895 (contains!4814 (+!2682 lt!413833 lt!413835) k0!1099)))

(declare-fun lt!413838 () Unit!31076)

(declare-fun lt!413839 () V!31055)

(declare-fun addStillContains!391 (ListLongMap!11471 (_ BitVec 64) V!31055 (_ BitVec 64)) Unit!31076)

(assert (=> b!921895 (= lt!413838 (addStillContains!391 lt!413833 lt!413834 lt!413839 k0!1099))))

(assert (=> b!921895 (= (getCurrentListMap!3004 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2682 (getCurrentListMap!3004 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413835))))

(assert (=> b!921895 (= lt!413835 (tuple2!12773 lt!413834 lt!413839))))

(declare-fun get!13937 (ValueCell!9302 V!31055) V!31055)

(declare-fun dynLambda!1479 (Int (_ BitVec 64)) V!31055)

(assert (=> b!921895 (= lt!413839 (get!13937 (select (arr!26521 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1479 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413840 () Unit!31076)

(declare-fun lemmaListMapRecursiveValidKeyArray!62 (array!55159 array!55161 (_ BitVec 32) (_ BitVec 32) V!31055 V!31055 (_ BitVec 32) Int) Unit!31076)

(assert (=> b!921895 (= lt!413840 (lemmaListMapRecursiveValidKeyArray!62 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921896 () Bool)

(declare-fun res!621414 () Bool)

(assert (=> b!921896 (=> (not res!621414) (not e!517437))))

(assert (=> b!921896 (= res!621414 (and (= (size!26981 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26980 _keys!1487) (size!26981 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921897 () Bool)

(declare-fun res!621408 () Bool)

(assert (=> b!921897 (=> (not res!621408) (not e!517437))))

(assert (=> b!921897 (= res!621408 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26980 _keys!1487))))))

(declare-fun b!921898 () Bool)

(declare-fun res!621413 () Bool)

(assert (=> b!921898 (=> res!621413 e!517438)))

(declare-fun noDuplicate!1348 (List!18587) Bool)

(assert (=> b!921898 (= res!621413 (not (noDuplicate!1348 Nil!18584)))))

(declare-fun b!921899 () Bool)

(declare-fun res!621411 () Bool)

(assert (=> b!921899 (=> (not res!621411) (not e!517437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55159 (_ BitVec 32)) Bool)

(assert (=> b!921899 (= res!621411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79014 res!621415) b!921896))

(assert (= (and b!921896 res!621414) b!921899))

(assert (= (and b!921899 res!621411) b!921884))

(assert (= (and b!921884 res!621417) b!921897))

(assert (= (and b!921897 res!621408) b!921892))

(assert (= (and b!921892 res!621420) b!921890))

(assert (= (and b!921890 res!621410) b!921893))

(assert (= (and b!921893 res!621409) b!921885))

(assert (= (and b!921885 res!621419) b!921891))

(assert (= (and b!921891 res!621412) b!921895))

(assert (= (and b!921895 c!96372) b!921887))

(assert (= (and b!921895 (not c!96372)) b!921883))

(assert (= (and b!921895 (not res!621418)) b!921898))

(assert (= (and b!921898 (not res!621413)) b!921888))

(assert (= (and b!921888 (not res!621416)) b!921882))

(assert (= (and b!921894 condMapEmpty!31107) mapIsEmpty!31107))

(assert (= (and b!921894 (not condMapEmpty!31107)) mapNonEmpty!31107))

(get-info :version)

(assert (= (and mapNonEmpty!31107 ((_ is ValueCellFull!9302) mapValue!31107)) b!921889))

(assert (= (and b!921894 ((_ is ValueCellFull!9302) mapDefault!31107)) b!921886))

(assert (= start!79014 b!921894))

(declare-fun b_lambda!13575 () Bool)

(assert (=> (not b_lambda!13575) (not b!921895)))

(declare-fun t!26367 () Bool)

(declare-fun tb!5631 () Bool)

(assert (=> (and start!79014 (= defaultEntry!1235 defaultEntry!1235) t!26367) tb!5631))

(declare-fun result!11093 () Bool)

(assert (=> tb!5631 (= result!11093 tp_is_empty!19567)))

(assert (=> b!921895 t!26367))

(declare-fun b_and!27867 () Bool)

(assert (= b_and!27865 (and (=> t!26367 result!11093) b_and!27867)))

(declare-fun m!856213 () Bool)

(assert (=> start!79014 m!856213))

(declare-fun m!856215 () Bool)

(assert (=> start!79014 m!856215))

(declare-fun m!856217 () Bool)

(assert (=> start!79014 m!856217))

(declare-fun m!856219 () Bool)

(assert (=> b!921888 m!856219))

(declare-fun m!856221 () Bool)

(assert (=> b!921899 m!856221))

(declare-fun m!856223 () Bool)

(assert (=> b!921890 m!856223))

(declare-fun m!856225 () Bool)

(assert (=> b!921884 m!856225))

(declare-fun m!856227 () Bool)

(assert (=> b!921882 m!856227))

(declare-fun m!856229 () Bool)

(assert (=> b!921885 m!856229))

(declare-fun m!856231 () Bool)

(assert (=> mapNonEmpty!31107 m!856231))

(declare-fun m!856233 () Bool)

(assert (=> b!921887 m!856233))

(declare-fun m!856235 () Bool)

(assert (=> b!921895 m!856235))

(declare-fun m!856237 () Bool)

(assert (=> b!921895 m!856237))

(declare-fun m!856239 () Bool)

(assert (=> b!921895 m!856239))

(declare-fun m!856241 () Bool)

(assert (=> b!921895 m!856241))

(assert (=> b!921895 m!856237))

(assert (=> b!921895 m!856239))

(declare-fun m!856243 () Bool)

(assert (=> b!921895 m!856243))

(declare-fun m!856245 () Bool)

(assert (=> b!921895 m!856245))

(declare-fun m!856247 () Bool)

(assert (=> b!921895 m!856247))

(declare-fun m!856249 () Bool)

(assert (=> b!921895 m!856249))

(declare-fun m!856251 () Bool)

(assert (=> b!921895 m!856251))

(declare-fun m!856253 () Bool)

(assert (=> b!921895 m!856253))

(declare-fun m!856255 () Bool)

(assert (=> b!921895 m!856255))

(assert (=> b!921895 m!856241))

(declare-fun m!856257 () Bool)

(assert (=> b!921895 m!856257))

(assert (=> b!921895 m!856247))

(declare-fun m!856259 () Bool)

(assert (=> b!921895 m!856259))

(declare-fun m!856261 () Bool)

(assert (=> b!921898 m!856261))

(declare-fun m!856263 () Bool)

(assert (=> b!921892 m!856263))

(declare-fun m!856265 () Bool)

(assert (=> b!921892 m!856265))

(declare-fun m!856267 () Bool)

(assert (=> b!921891 m!856267))

(declare-fun m!856269 () Bool)

(assert (=> b!921891 m!856269))

(check-sat (not b!921890) (not b!921884) tp_is_empty!19567 (not b!921882) (not b!921892) (not b!921898) (not mapNonEmpty!31107) b_and!27867 (not b!921891) (not b!921888) (not b!921895) (not start!79014) (not b!921899) (not b!921887) (not b_lambda!13575) (not b_next!17059) (not b!921885))
(check-sat b_and!27867 (not b_next!17059))
