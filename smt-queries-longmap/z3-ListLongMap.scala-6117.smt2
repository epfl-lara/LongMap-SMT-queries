; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78978 () Bool)

(assert start!78978)

(declare-fun b_free!17023 () Bool)

(declare-fun b_next!17023 () Bool)

(assert (=> start!78978 (= b_free!17023 (not b_next!17023))))

(declare-fun tp!59510 () Bool)

(declare-fun b_and!27793 () Bool)

(assert (=> start!78978 (= tp!59510 b_and!27793)))

(declare-fun b!920954 () Bool)

(declare-fun e!516988 () Bool)

(declare-fun e!516985 () Bool)

(assert (=> b!920954 (= e!516988 e!516985)))

(declare-fun res!620758 () Bool)

(assert (=> b!920954 (=> (not res!620758) (not e!516985))))

(declare-datatypes ((V!31007 0))(
  ( (V!31008 (val!9816 Int)) )
))
(declare-datatypes ((tuple2!12742 0))(
  ( (tuple2!12743 (_1!6382 (_ BitVec 64)) (_2!6382 V!31007)) )
))
(declare-datatypes ((List!18558 0))(
  ( (Nil!18555) (Cons!18554 (h!19706 tuple2!12742) (t!26303 List!18558)) )
))
(declare-datatypes ((ListLongMap!11441 0))(
  ( (ListLongMap!11442 (toList!5736 List!18558)) )
))
(declare-fun lt!413381 () ListLongMap!11441)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4789 (ListLongMap!11441 (_ BitVec 64)) Bool)

(assert (=> b!920954 (= res!620758 (contains!4789 lt!413381 k0!1099))))

(declare-datatypes ((array!55089 0))(
  ( (array!55090 (arr!26485 (Array (_ BitVec 32) (_ BitVec 64))) (size!26945 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55089)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9284 0))(
  ( (ValueCellFull!9284 (v!12331 V!31007)) (EmptyCell!9284) )
))
(declare-datatypes ((array!55091 0))(
  ( (array!55092 (arr!26486 (Array (_ BitVec 32) ValueCell!9284)) (size!26946 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55091)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31007)

(declare-fun minValue!1173 () V!31007)

(declare-fun getCurrentListMap!2989 (array!55089 array!55091 (_ BitVec 32) (_ BitVec 32) V!31007 V!31007 (_ BitVec 32) Int) ListLongMap!11441)

(assert (=> b!920954 (= lt!413381 (getCurrentListMap!2989 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31053 () Bool)

(declare-fun mapRes!31053 () Bool)

(assert (=> mapIsEmpty!31053 mapRes!31053))

(declare-fun b!920955 () Bool)

(declare-fun e!516987 () Bool)

(declare-fun tp_is_empty!19531 () Bool)

(assert (=> b!920955 (= e!516987 tp_is_empty!19531)))

(declare-fun b!920956 () Bool)

(declare-fun res!620754 () Bool)

(assert (=> b!920956 (=> (not res!620754) (not e!516988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55089 (_ BitVec 32)) Bool)

(assert (=> b!920956 (= res!620754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920957 () Bool)

(declare-fun res!620763 () Bool)

(assert (=> b!920957 (=> (not res!620763) (not e!516985))))

(declare-fun v!791 () V!31007)

(declare-fun apply!604 (ListLongMap!11441 (_ BitVec 64)) V!31007)

(assert (=> b!920957 (= res!620763 (= (apply!604 lt!413381 k0!1099) v!791))))

(declare-fun res!620761 () Bool)

(assert (=> start!78978 (=> (not res!620761) (not e!516988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78978 (= res!620761 (validMask!0 mask!1881))))

(assert (=> start!78978 e!516988))

(assert (=> start!78978 true))

(assert (=> start!78978 tp_is_empty!19531))

(declare-fun e!516983 () Bool)

(declare-fun array_inv!20734 (array!55091) Bool)

(assert (=> start!78978 (and (array_inv!20734 _values!1231) e!516983)))

(assert (=> start!78978 tp!59510))

(declare-fun array_inv!20735 (array!55089) Bool)

(assert (=> start!78978 (array_inv!20735 _keys!1487)))

(declare-fun b!920958 () Bool)

(declare-fun e!516982 () Bool)

(assert (=> b!920958 (= e!516982 tp_is_empty!19531)))

(declare-fun b!920959 () Bool)

(declare-fun res!620755 () Bool)

(assert (=> b!920959 (=> (not res!620755) (not e!516985))))

(assert (=> b!920959 (= res!620755 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920960 () Bool)

(declare-fun e!516984 () Bool)

(assert (=> b!920960 (= e!516985 e!516984)))

(declare-fun res!620762 () Bool)

(assert (=> b!920960 (=> (not res!620762) (not e!516984))))

(declare-fun lt!413383 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920960 (= res!620762 (validKeyInArray!0 lt!413383))))

(assert (=> b!920960 (= lt!413383 (select (arr!26485 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920961 () Bool)

(assert (=> b!920961 (= e!516984 (not true))))

(declare-datatypes ((List!18559 0))(
  ( (Nil!18556) (Cons!18555 (h!19707 (_ BitVec 64)) (t!26304 List!18559)) )
))
(declare-fun arrayNoDuplicates!0 (array!55089 (_ BitVec 32) List!18559) Bool)

(assert (=> b!920961 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18556)))

(declare-datatypes ((Unit!31054 0))(
  ( (Unit!31055) )
))
(declare-fun lt!413384 () Unit!31054)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55089 (_ BitVec 32) (_ BitVec 32)) Unit!31054)

(assert (=> b!920961 (= lt!413384 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413378 () tuple2!12742)

(declare-fun +!2671 (ListLongMap!11441 tuple2!12742) ListLongMap!11441)

(assert (=> b!920961 (contains!4789 (+!2671 lt!413381 lt!413378) k0!1099)))

(declare-fun lt!413379 () Unit!31054)

(declare-fun lt!413380 () V!31007)

(declare-fun addStillContains!380 (ListLongMap!11441 (_ BitVec 64) V!31007 (_ BitVec 64)) Unit!31054)

(assert (=> b!920961 (= lt!413379 (addStillContains!380 lt!413381 lt!413383 lt!413380 k0!1099))))

(assert (=> b!920961 (= (getCurrentListMap!2989 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2671 (getCurrentListMap!2989 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413378))))

(assert (=> b!920961 (= lt!413378 (tuple2!12743 lt!413383 lt!413380))))

(declare-fun get!13914 (ValueCell!9284 V!31007) V!31007)

(declare-fun dynLambda!1468 (Int (_ BitVec 64)) V!31007)

(assert (=> b!920961 (= lt!413380 (get!13914 (select (arr!26486 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1468 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413382 () Unit!31054)

(declare-fun lemmaListMapRecursiveValidKeyArray!51 (array!55089 array!55091 (_ BitVec 32) (_ BitVec 32) V!31007 V!31007 (_ BitVec 32) Int) Unit!31054)

(assert (=> b!920961 (= lt!413382 (lemmaListMapRecursiveValidKeyArray!51 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920962 () Bool)

(declare-fun res!620756 () Bool)

(assert (=> b!920962 (=> (not res!620756) (not e!516988))))

(assert (=> b!920962 (= res!620756 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26945 _keys!1487))))))

(declare-fun b!920963 () Bool)

(assert (=> b!920963 (= e!516983 (and e!516982 mapRes!31053))))

(declare-fun condMapEmpty!31053 () Bool)

(declare-fun mapDefault!31053 () ValueCell!9284)

(assert (=> b!920963 (= condMapEmpty!31053 (= (arr!26486 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9284)) mapDefault!31053)))))

(declare-fun b!920964 () Bool)

(declare-fun res!620759 () Bool)

(assert (=> b!920964 (=> (not res!620759) (not e!516985))))

(assert (=> b!920964 (= res!620759 (validKeyInArray!0 k0!1099))))

(declare-fun b!920965 () Bool)

(declare-fun res!620757 () Bool)

(assert (=> b!920965 (=> (not res!620757) (not e!516988))))

(assert (=> b!920965 (= res!620757 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18556))))

(declare-fun mapNonEmpty!31053 () Bool)

(declare-fun tp!59511 () Bool)

(assert (=> mapNonEmpty!31053 (= mapRes!31053 (and tp!59511 e!516987))))

(declare-fun mapKey!31053 () (_ BitVec 32))

(declare-fun mapValue!31053 () ValueCell!9284)

(declare-fun mapRest!31053 () (Array (_ BitVec 32) ValueCell!9284))

(assert (=> mapNonEmpty!31053 (= (arr!26486 _values!1231) (store mapRest!31053 mapKey!31053 mapValue!31053))))

(declare-fun b!920966 () Bool)

(declare-fun res!620760 () Bool)

(assert (=> b!920966 (=> (not res!620760) (not e!516988))))

(assert (=> b!920966 (= res!620760 (and (= (size!26946 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26945 _keys!1487) (size!26946 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78978 res!620761) b!920966))

(assert (= (and b!920966 res!620760) b!920956))

(assert (= (and b!920956 res!620754) b!920965))

(assert (= (and b!920965 res!620757) b!920962))

(assert (= (and b!920962 res!620756) b!920954))

(assert (= (and b!920954 res!620758) b!920957))

(assert (= (and b!920957 res!620763) b!920959))

(assert (= (and b!920959 res!620755) b!920964))

(assert (= (and b!920964 res!620759) b!920960))

(assert (= (and b!920960 res!620762) b!920961))

(assert (= (and b!920963 condMapEmpty!31053) mapIsEmpty!31053))

(assert (= (and b!920963 (not condMapEmpty!31053)) mapNonEmpty!31053))

(get-info :version)

(assert (= (and mapNonEmpty!31053 ((_ is ValueCellFull!9284) mapValue!31053)) b!920955))

(assert (= (and b!920963 ((_ is ValueCellFull!9284) mapDefault!31053)) b!920958))

(assert (= start!78978 b!920963))

(declare-fun b_lambda!13539 () Bool)

(assert (=> (not b_lambda!13539) (not b!920961)))

(declare-fun t!26302 () Bool)

(declare-fun tb!5595 () Bool)

(assert (=> (and start!78978 (= defaultEntry!1235 defaultEntry!1235) t!26302) tb!5595))

(declare-fun result!11021 () Bool)

(assert (=> tb!5595 (= result!11021 tp_is_empty!19531)))

(assert (=> b!920961 t!26302))

(declare-fun b_and!27795 () Bool)

(assert (= b_and!27793 (and (=> t!26302 result!11021) b_and!27795)))

(declare-fun m!855229 () Bool)

(assert (=> b!920956 m!855229))

(declare-fun m!855231 () Bool)

(assert (=> b!920961 m!855231))

(declare-fun m!855233 () Bool)

(assert (=> b!920961 m!855233))

(declare-fun m!855235 () Bool)

(assert (=> b!920961 m!855235))

(declare-fun m!855237 () Bool)

(assert (=> b!920961 m!855237))

(declare-fun m!855239 () Bool)

(assert (=> b!920961 m!855239))

(declare-fun m!855241 () Bool)

(assert (=> b!920961 m!855241))

(assert (=> b!920961 m!855239))

(assert (=> b!920961 m!855241))

(declare-fun m!855243 () Bool)

(assert (=> b!920961 m!855243))

(declare-fun m!855245 () Bool)

(assert (=> b!920961 m!855245))

(declare-fun m!855247 () Bool)

(assert (=> b!920961 m!855247))

(assert (=> b!920961 m!855235))

(declare-fun m!855249 () Bool)

(assert (=> b!920961 m!855249))

(declare-fun m!855251 () Bool)

(assert (=> b!920961 m!855251))

(assert (=> b!920961 m!855231))

(declare-fun m!855253 () Bool)

(assert (=> b!920961 m!855253))

(declare-fun m!855255 () Bool)

(assert (=> b!920965 m!855255))

(declare-fun m!855257 () Bool)

(assert (=> b!920954 m!855257))

(declare-fun m!855259 () Bool)

(assert (=> b!920954 m!855259))

(declare-fun m!855261 () Bool)

(assert (=> b!920964 m!855261))

(declare-fun m!855263 () Bool)

(assert (=> start!78978 m!855263))

(declare-fun m!855265 () Bool)

(assert (=> start!78978 m!855265))

(declare-fun m!855267 () Bool)

(assert (=> start!78978 m!855267))

(declare-fun m!855269 () Bool)

(assert (=> b!920957 m!855269))

(declare-fun m!855271 () Bool)

(assert (=> b!920960 m!855271))

(declare-fun m!855273 () Bool)

(assert (=> b!920960 m!855273))

(declare-fun m!855275 () Bool)

(assert (=> mapNonEmpty!31053 m!855275))

(check-sat tp_is_empty!19531 (not b!920964) (not b!920956) (not b_next!17023) (not start!78978) (not b!920957) (not b_lambda!13539) (not b!920961) (not mapNonEmpty!31053) (not b!920954) (not b!920960) (not b!920965) b_and!27795)
(check-sat b_and!27795 (not b_next!17023))
