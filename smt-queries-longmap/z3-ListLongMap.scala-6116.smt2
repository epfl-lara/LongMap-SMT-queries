; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78972 () Bool)

(assert start!78972)

(declare-fun b_free!17017 () Bool)

(declare-fun b_next!17017 () Bool)

(assert (=> start!78972 (= b_free!17017 (not b_next!17017))))

(declare-fun tp!59493 () Bool)

(declare-fun b_and!27781 () Bool)

(assert (=> start!78972 (= tp!59493 b_and!27781)))

(declare-fun b!920831 () Bool)

(declare-fun res!620666 () Bool)

(declare-fun e!516921 () Bool)

(assert (=> b!920831 (=> (not res!620666) (not e!516921))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55077 0))(
  ( (array!55078 (arr!26479 (Array (_ BitVec 32) (_ BitVec 64))) (size!26939 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55077)

(assert (=> b!920831 (= res!620666 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26939 _keys!1487))))))

(declare-fun b!920832 () Bool)

(declare-fun e!516919 () Bool)

(declare-fun e!516924 () Bool)

(assert (=> b!920832 (= e!516919 e!516924)))

(declare-fun res!620672 () Bool)

(assert (=> b!920832 (=> (not res!620672) (not e!516924))))

(declare-fun lt!413318 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920832 (= res!620672 (validKeyInArray!0 lt!413318))))

(assert (=> b!920832 (= lt!413318 (select (arr!26479 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920833 () Bool)

(declare-fun res!620670 () Bool)

(assert (=> b!920833 (=> (not res!620670) (not e!516919))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!920833 (= res!620670 (validKeyInArray!0 k0!1099))))

(declare-fun b!920834 () Bool)

(declare-fun res!620665 () Bool)

(assert (=> b!920834 (=> (not res!620665) (not e!516919))))

(declare-datatypes ((V!30999 0))(
  ( (V!31000 (val!9813 Int)) )
))
(declare-fun v!791 () V!30999)

(declare-datatypes ((tuple2!12736 0))(
  ( (tuple2!12737 (_1!6379 (_ BitVec 64)) (_2!6379 V!30999)) )
))
(declare-datatypes ((List!18553 0))(
  ( (Nil!18550) (Cons!18549 (h!19701 tuple2!12736) (t!26292 List!18553)) )
))
(declare-datatypes ((ListLongMap!11435 0))(
  ( (ListLongMap!11436 (toList!5733 List!18553)) )
))
(declare-fun lt!413319 () ListLongMap!11435)

(declare-fun apply!602 (ListLongMap!11435 (_ BitVec 64)) V!30999)

(assert (=> b!920834 (= res!620665 (= (apply!602 lt!413319 k0!1099) v!791))))

(declare-fun b!920835 () Bool)

(declare-fun res!620668 () Bool)

(assert (=> b!920835 (=> (not res!620668) (not e!516921))))

(declare-datatypes ((List!18554 0))(
  ( (Nil!18551) (Cons!18550 (h!19702 (_ BitVec 64)) (t!26293 List!18554)) )
))
(declare-fun arrayNoDuplicates!0 (array!55077 (_ BitVec 32) List!18554) Bool)

(assert (=> b!920835 (= res!620668 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18551))))

(declare-fun res!620667 () Bool)

(assert (=> start!78972 (=> (not res!620667) (not e!516921))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78972 (= res!620667 (validMask!0 mask!1881))))

(assert (=> start!78972 e!516921))

(assert (=> start!78972 true))

(declare-fun tp_is_empty!19525 () Bool)

(assert (=> start!78972 tp_is_empty!19525))

(declare-datatypes ((ValueCell!9281 0))(
  ( (ValueCellFull!9281 (v!12328 V!30999)) (EmptyCell!9281) )
))
(declare-datatypes ((array!55079 0))(
  ( (array!55080 (arr!26480 (Array (_ BitVec 32) ValueCell!9281)) (size!26940 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55079)

(declare-fun e!516925 () Bool)

(declare-fun array_inv!20728 (array!55079) Bool)

(assert (=> start!78972 (and (array_inv!20728 _values!1231) e!516925)))

(assert (=> start!78972 tp!59493))

(declare-fun array_inv!20729 (array!55077) Bool)

(assert (=> start!78972 (array_inv!20729 _keys!1487)))

(declare-fun b!920836 () Bool)

(declare-fun res!620673 () Bool)

(assert (=> b!920836 (=> (not res!620673) (not e!516921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55077 (_ BitVec 32)) Bool)

(assert (=> b!920836 (= res!620673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920837 () Bool)

(declare-fun e!516922 () Bool)

(assert (=> b!920837 (= e!516922 tp_is_empty!19525)))

(declare-fun b!920838 () Bool)

(declare-fun e!516920 () Bool)

(declare-fun mapRes!31044 () Bool)

(assert (=> b!920838 (= e!516925 (and e!516920 mapRes!31044))))

(declare-fun condMapEmpty!31044 () Bool)

(declare-fun mapDefault!31044 () ValueCell!9281)

(assert (=> b!920838 (= condMapEmpty!31044 (= (arr!26480 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9281)) mapDefault!31044)))))

(declare-fun b!920839 () Bool)

(assert (=> b!920839 (= e!516921 e!516919)))

(declare-fun res!620671 () Bool)

(assert (=> b!920839 (=> (not res!620671) (not e!516919))))

(declare-fun contains!4786 (ListLongMap!11435 (_ BitVec 64)) Bool)

(assert (=> b!920839 (= res!620671 (contains!4786 lt!413319 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30999)

(declare-fun minValue!1173 () V!30999)

(declare-fun getCurrentListMap!2986 (array!55077 array!55079 (_ BitVec 32) (_ BitVec 32) V!30999 V!30999 (_ BitVec 32) Int) ListLongMap!11435)

(assert (=> b!920839 (= lt!413319 (getCurrentListMap!2986 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920840 () Bool)

(declare-fun res!620664 () Bool)

(assert (=> b!920840 (=> (not res!620664) (not e!516919))))

(assert (=> b!920840 (= res!620664 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920841 () Bool)

(assert (=> b!920841 (= e!516920 tp_is_empty!19525)))

(declare-fun mapIsEmpty!31044 () Bool)

(assert (=> mapIsEmpty!31044 mapRes!31044))

(declare-fun b!920842 () Bool)

(assert (=> b!920842 (= e!516924 (not true))))

(assert (=> b!920842 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18551)))

(declare-datatypes ((Unit!31050 0))(
  ( (Unit!31051) )
))
(declare-fun lt!413317 () Unit!31050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55077 (_ BitVec 32) (_ BitVec 32)) Unit!31050)

(assert (=> b!920842 (= lt!413317 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413320 () tuple2!12736)

(declare-fun +!2669 (ListLongMap!11435 tuple2!12736) ListLongMap!11435)

(assert (=> b!920842 (contains!4786 (+!2669 lt!413319 lt!413320) k0!1099)))

(declare-fun lt!413316 () V!30999)

(declare-fun lt!413321 () Unit!31050)

(declare-fun addStillContains!378 (ListLongMap!11435 (_ BitVec 64) V!30999 (_ BitVec 64)) Unit!31050)

(assert (=> b!920842 (= lt!413321 (addStillContains!378 lt!413319 lt!413318 lt!413316 k0!1099))))

(assert (=> b!920842 (= (getCurrentListMap!2986 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2669 (getCurrentListMap!2986 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413320))))

(assert (=> b!920842 (= lt!413320 (tuple2!12737 lt!413318 lt!413316))))

(declare-fun get!13910 (ValueCell!9281 V!30999) V!30999)

(declare-fun dynLambda!1466 (Int (_ BitVec 64)) V!30999)

(assert (=> b!920842 (= lt!413316 (get!13910 (select (arr!26480 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1466 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413315 () Unit!31050)

(declare-fun lemmaListMapRecursiveValidKeyArray!49 (array!55077 array!55079 (_ BitVec 32) (_ BitVec 32) V!30999 V!30999 (_ BitVec 32) Int) Unit!31050)

(assert (=> b!920842 (= lt!413315 (lemmaListMapRecursiveValidKeyArray!49 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31044 () Bool)

(declare-fun tp!59492 () Bool)

(assert (=> mapNonEmpty!31044 (= mapRes!31044 (and tp!59492 e!516922))))

(declare-fun mapKey!31044 () (_ BitVec 32))

(declare-fun mapRest!31044 () (Array (_ BitVec 32) ValueCell!9281))

(declare-fun mapValue!31044 () ValueCell!9281)

(assert (=> mapNonEmpty!31044 (= (arr!26480 _values!1231) (store mapRest!31044 mapKey!31044 mapValue!31044))))

(declare-fun b!920843 () Bool)

(declare-fun res!620669 () Bool)

(assert (=> b!920843 (=> (not res!620669) (not e!516921))))

(assert (=> b!920843 (= res!620669 (and (= (size!26940 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26939 _keys!1487) (size!26940 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78972 res!620667) b!920843))

(assert (= (and b!920843 res!620669) b!920836))

(assert (= (and b!920836 res!620673) b!920835))

(assert (= (and b!920835 res!620668) b!920831))

(assert (= (and b!920831 res!620666) b!920839))

(assert (= (and b!920839 res!620671) b!920834))

(assert (= (and b!920834 res!620665) b!920840))

(assert (= (and b!920840 res!620664) b!920833))

(assert (= (and b!920833 res!620670) b!920832))

(assert (= (and b!920832 res!620672) b!920842))

(assert (= (and b!920838 condMapEmpty!31044) mapIsEmpty!31044))

(assert (= (and b!920838 (not condMapEmpty!31044)) mapNonEmpty!31044))

(get-info :version)

(assert (= (and mapNonEmpty!31044 ((_ is ValueCellFull!9281) mapValue!31044)) b!920837))

(assert (= (and b!920838 ((_ is ValueCellFull!9281) mapDefault!31044)) b!920841))

(assert (= start!78972 b!920838))

(declare-fun b_lambda!13533 () Bool)

(assert (=> (not b_lambda!13533) (not b!920842)))

(declare-fun t!26291 () Bool)

(declare-fun tb!5589 () Bool)

(assert (=> (and start!78972 (= defaultEntry!1235 defaultEntry!1235) t!26291) tb!5589))

(declare-fun result!11009 () Bool)

(assert (=> tb!5589 (= result!11009 tp_is_empty!19525)))

(assert (=> b!920842 t!26291))

(declare-fun b_and!27783 () Bool)

(assert (= b_and!27781 (and (=> t!26291 result!11009) b_and!27783)))

(declare-fun m!855085 () Bool)

(assert (=> b!920835 m!855085))

(declare-fun m!855087 () Bool)

(assert (=> b!920833 m!855087))

(declare-fun m!855089 () Bool)

(assert (=> b!920836 m!855089))

(declare-fun m!855091 () Bool)

(assert (=> b!920839 m!855091))

(declare-fun m!855093 () Bool)

(assert (=> b!920839 m!855093))

(declare-fun m!855095 () Bool)

(assert (=> b!920842 m!855095))

(declare-fun m!855097 () Bool)

(assert (=> b!920842 m!855097))

(declare-fun m!855099 () Bool)

(assert (=> b!920842 m!855099))

(declare-fun m!855101 () Bool)

(assert (=> b!920842 m!855101))

(assert (=> b!920842 m!855095))

(assert (=> b!920842 m!855097))

(declare-fun m!855103 () Bool)

(assert (=> b!920842 m!855103))

(declare-fun m!855105 () Bool)

(assert (=> b!920842 m!855105))

(declare-fun m!855107 () Bool)

(assert (=> b!920842 m!855107))

(declare-fun m!855109 () Bool)

(assert (=> b!920842 m!855109))

(assert (=> b!920842 m!855099))

(declare-fun m!855111 () Bool)

(assert (=> b!920842 m!855111))

(declare-fun m!855113 () Bool)

(assert (=> b!920842 m!855113))

(declare-fun m!855115 () Bool)

(assert (=> b!920842 m!855115))

(assert (=> b!920842 m!855115))

(declare-fun m!855117 () Bool)

(assert (=> b!920842 m!855117))

(declare-fun m!855119 () Bool)

(assert (=> b!920832 m!855119))

(declare-fun m!855121 () Bool)

(assert (=> b!920832 m!855121))

(declare-fun m!855123 () Bool)

(assert (=> mapNonEmpty!31044 m!855123))

(declare-fun m!855125 () Bool)

(assert (=> b!920834 m!855125))

(declare-fun m!855127 () Bool)

(assert (=> start!78972 m!855127))

(declare-fun m!855129 () Bool)

(assert (=> start!78972 m!855129))

(declare-fun m!855131 () Bool)

(assert (=> start!78972 m!855131))

(check-sat (not b!920839) (not b!920833) (not start!78972) b_and!27783 (not b!920834) (not b_next!17017) (not b!920836) (not b!920835) (not b_lambda!13533) (not mapNonEmpty!31044) tp_is_empty!19525 (not b!920832) (not b!920842))
(check-sat b_and!27783 (not b_next!17017))
