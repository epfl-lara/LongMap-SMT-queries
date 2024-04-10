; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79028 () Bool)

(assert start!79028)

(declare-fun b_free!17241 () Bool)

(declare-fun b_next!17241 () Bool)

(assert (=> start!79028 (= b_free!17241 (not b_next!17241))))

(declare-fun tp!60164 () Bool)

(declare-fun b_and!28219 () Bool)

(assert (=> start!79028 (= tp!60164 b_and!28219)))

(declare-fun b!925887 () Bool)

(declare-fun res!623875 () Bool)

(declare-fun e!519689 () Bool)

(assert (=> b!925887 (=> (not res!623875) (not e!519689))))

(declare-datatypes ((array!55464 0))(
  ( (array!55465 (arr!26677 (Array (_ BitVec 32) (_ BitVec 64))) (size!27136 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55464)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55464 (_ BitVec 32)) Bool)

(assert (=> b!925887 (= res!623875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925888 () Bool)

(declare-fun e!519690 () Bool)

(assert (=> b!925888 (= e!519690 (not true))))

(declare-fun e!519691 () Bool)

(assert (=> b!925888 e!519691))

(declare-fun res!623872 () Bool)

(assert (=> b!925888 (=> (not res!623872) (not e!519691))))

(declare-datatypes ((V!31297 0))(
  ( (V!31298 (val!9925 Int)) )
))
(declare-datatypes ((tuple2!12944 0))(
  ( (tuple2!12945 (_1!6483 (_ BitVec 64)) (_2!6483 V!31297)) )
))
(declare-datatypes ((List!18746 0))(
  ( (Nil!18743) (Cons!18742 (h!19888 tuple2!12944) (t!26717 List!18746)) )
))
(declare-datatypes ((ListLongMap!11641 0))(
  ( (ListLongMap!11642 (toList!5836 List!18746)) )
))
(declare-fun lt!416810 () ListLongMap!11641)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4895 (ListLongMap!11641 (_ BitVec 64)) Bool)

(assert (=> b!925888 (= res!623872 (contains!4895 lt!416810 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9393 0))(
  ( (ValueCellFull!9393 (v!12443 V!31297)) (EmptyCell!9393) )
))
(declare-datatypes ((array!55466 0))(
  ( (array!55467 (arr!26678 (Array (_ BitVec 32) ValueCell!9393)) (size!27137 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55466)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31297)

(declare-fun minValue!1173 () V!31297)

(declare-fun getCurrentListMap!3086 (array!55464 array!55466 (_ BitVec 32) (_ BitVec 32) V!31297 V!31297 (_ BitVec 32) Int) ListLongMap!11641)

(assert (=> b!925888 (= lt!416810 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31297)

(declare-datatypes ((Unit!31291 0))(
  ( (Unit!31292) )
))
(declare-fun lt!416822 () Unit!31291)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!74 (array!55464 array!55466 (_ BitVec 32) (_ BitVec 32) V!31297 V!31297 (_ BitVec 64) V!31297 (_ BitVec 32) Int) Unit!31291)

(assert (=> b!925888 (= lt!416822 (lemmaListMapApplyFromThenApplyFromZero!74 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925889 () Bool)

(declare-fun e!519682 () Unit!31291)

(declare-fun Unit!31293 () Unit!31291)

(assert (=> b!925889 (= e!519682 Unit!31293)))

(declare-fun b!925890 () Bool)

(declare-fun res!623869 () Bool)

(assert (=> b!925890 (=> (not res!623869) (not e!519689))))

(declare-datatypes ((List!18747 0))(
  ( (Nil!18744) (Cons!18743 (h!19889 (_ BitVec 64)) (t!26718 List!18747)) )
))
(declare-fun arrayNoDuplicates!0 (array!55464 (_ BitVec 32) List!18747) Bool)

(assert (=> b!925890 (= res!623869 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18744))))

(declare-fun b!925891 () Bool)

(declare-fun e!519684 () Bool)

(assert (=> b!925891 (= e!519689 e!519684)))

(declare-fun res!623867 () Bool)

(assert (=> b!925891 (=> (not res!623867) (not e!519684))))

(declare-fun lt!416815 () ListLongMap!11641)

(assert (=> b!925891 (= res!623867 (contains!4895 lt!416815 k0!1099))))

(assert (=> b!925891 (= lt!416815 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925892 () Bool)

(declare-fun e!519687 () Bool)

(assert (=> b!925892 (= e!519687 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925893 () Bool)

(declare-fun e!519688 () Bool)

(declare-fun tp_is_empty!19749 () Bool)

(assert (=> b!925893 (= e!519688 tp_is_empty!19749)))

(declare-fun b!925894 () Bool)

(declare-fun e!519692 () Bool)

(assert (=> b!925894 (= e!519692 tp_is_empty!19749)))

(declare-fun b!925895 () Bool)

(declare-fun res!623866 () Bool)

(assert (=> b!925895 (=> (not res!623866) (not e!519689))))

(assert (=> b!925895 (= res!623866 (and (= (size!27137 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27136 _keys!1487) (size!27137 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31380 () Bool)

(declare-fun mapRes!31380 () Bool)

(assert (=> mapIsEmpty!31380 mapRes!31380))

(declare-fun b!925896 () Bool)

(declare-fun apply!666 (ListLongMap!11641 (_ BitVec 64)) V!31297)

(assert (=> b!925896 (= e!519691 (= (apply!666 lt!416810 k0!1099) v!791))))

(declare-fun b!925897 () Bool)

(declare-fun e!519686 () Bool)

(assert (=> b!925897 (= e!519684 e!519686)))

(declare-fun res!623868 () Bool)

(assert (=> b!925897 (=> (not res!623868) (not e!519686))))

(declare-fun lt!416818 () V!31297)

(assert (=> b!925897 (= res!623868 (and (= lt!416818 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925897 (= lt!416818 (apply!666 lt!416815 k0!1099))))

(declare-fun mapNonEmpty!31380 () Bool)

(declare-fun tp!60163 () Bool)

(assert (=> mapNonEmpty!31380 (= mapRes!31380 (and tp!60163 e!519688))))

(declare-fun mapValue!31380 () ValueCell!9393)

(declare-fun mapKey!31380 () (_ BitVec 32))

(declare-fun mapRest!31380 () (Array (_ BitVec 32) ValueCell!9393))

(assert (=> mapNonEmpty!31380 (= (arr!26678 _values!1231) (store mapRest!31380 mapKey!31380 mapValue!31380))))

(declare-fun b!925898 () Bool)

(declare-fun e!519693 () Bool)

(assert (=> b!925898 (= e!519693 e!519690)))

(declare-fun res!623870 () Bool)

(assert (=> b!925898 (=> (not res!623870) (not e!519690))))

(declare-fun lt!416809 () ListLongMap!11641)

(assert (=> b!925898 (= res!623870 (contains!4895 lt!416809 k0!1099))))

(assert (=> b!925898 (= lt!416809 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925899 () Bool)

(declare-fun res!623865 () Bool)

(assert (=> b!925899 (=> (not res!623865) (not e!519689))))

(assert (=> b!925899 (= res!623865 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27136 _keys!1487))))))

(declare-fun b!925900 () Bool)

(declare-fun e!519683 () Bool)

(assert (=> b!925900 (= e!519683 (and e!519692 mapRes!31380))))

(declare-fun condMapEmpty!31380 () Bool)

(declare-fun mapDefault!31380 () ValueCell!9393)

(assert (=> b!925900 (= condMapEmpty!31380 (= (arr!26678 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9393)) mapDefault!31380)))))

(declare-fun res!623873 () Bool)

(assert (=> start!79028 (=> (not res!623873) (not e!519689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79028 (= res!623873 (validMask!0 mask!1881))))

(assert (=> start!79028 e!519689))

(assert (=> start!79028 true))

(assert (=> start!79028 tp_is_empty!19749))

(declare-fun array_inv!20776 (array!55466) Bool)

(assert (=> start!79028 (and (array_inv!20776 _values!1231) e!519683)))

(assert (=> start!79028 tp!60164))

(declare-fun array_inv!20777 (array!55464) Bool)

(assert (=> start!79028 (array_inv!20777 _keys!1487)))

(declare-fun b!925901 () Bool)

(declare-fun lt!416819 () ListLongMap!11641)

(assert (=> b!925901 (= (apply!666 lt!416819 k0!1099) lt!416818)))

(declare-fun lt!416821 () Unit!31291)

(declare-fun lt!416816 () (_ BitVec 64))

(declare-fun lt!416813 () V!31297)

(declare-fun addApplyDifferent!386 (ListLongMap!11641 (_ BitVec 64) V!31297 (_ BitVec 64)) Unit!31291)

(assert (=> b!925901 (= lt!416821 (addApplyDifferent!386 lt!416815 lt!416816 lt!416813 k0!1099))))

(assert (=> b!925901 (not (= lt!416816 k0!1099))))

(declare-fun lt!416811 () Unit!31291)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55464 (_ BitVec 64) (_ BitVec 32) List!18747) Unit!31291)

(assert (=> b!925901 (= lt!416811 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18744))))

(assert (=> b!925901 e!519687))

(declare-fun c!96645 () Bool)

(assert (=> b!925901 (= c!96645 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416823 () Unit!31291)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!237 (array!55464 array!55466 (_ BitVec 32) (_ BitVec 32) V!31297 V!31297 (_ BitVec 64) (_ BitVec 32) Int) Unit!31291)

(assert (=> b!925901 (= lt!416823 (lemmaListMapContainsThenArrayContainsFrom!237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925901 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18744)))

(declare-fun lt!416817 () Unit!31291)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55464 (_ BitVec 32) (_ BitVec 32)) Unit!31291)

(assert (=> b!925901 (= lt!416817 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925901 (contains!4895 lt!416819 k0!1099)))

(declare-fun lt!416812 () tuple2!12944)

(declare-fun +!2730 (ListLongMap!11641 tuple2!12944) ListLongMap!11641)

(assert (=> b!925901 (= lt!416819 (+!2730 lt!416815 lt!416812))))

(declare-fun lt!416820 () Unit!31291)

(declare-fun addStillContains!454 (ListLongMap!11641 (_ BitVec 64) V!31297 (_ BitVec 64)) Unit!31291)

(assert (=> b!925901 (= lt!416820 (addStillContains!454 lt!416815 lt!416816 lt!416813 k0!1099))))

(assert (=> b!925901 (= (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2730 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416812))))

(assert (=> b!925901 (= lt!416812 (tuple2!12945 lt!416816 lt!416813))))

(declare-fun get!14033 (ValueCell!9393 V!31297) V!31297)

(declare-fun dynLambda!1519 (Int (_ BitVec 64)) V!31297)

(assert (=> b!925901 (= lt!416813 (get!14033 (select (arr!26678 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1519 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416814 () Unit!31291)

(declare-fun lemmaListMapRecursiveValidKeyArray!120 (array!55464 array!55466 (_ BitVec 32) (_ BitVec 32) V!31297 V!31297 (_ BitVec 32) Int) Unit!31291)

(assert (=> b!925901 (= lt!416814 (lemmaListMapRecursiveValidKeyArray!120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519685 () Unit!31291)

(assert (=> b!925901 (= e!519685 lt!416821)))

(declare-fun b!925902 () Bool)

(declare-fun res!623871 () Bool)

(assert (=> b!925902 (=> (not res!623871) (not e!519690))))

(assert (=> b!925902 (= res!623871 (= (apply!666 lt!416809 k0!1099) v!791))))

(declare-fun b!925903 () Bool)

(assert (=> b!925903 (= e!519682 e!519685)))

(assert (=> b!925903 (= lt!416816 (select (arr!26677 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96644 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925903 (= c!96644 (validKeyInArray!0 lt!416816))))

(declare-fun b!925904 () Bool)

(declare-fun arrayContainsKey!0 (array!55464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925904 (= e!519687 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925905 () Bool)

(assert (=> b!925905 (= e!519686 e!519693)))

(declare-fun res!623874 () Bool)

(assert (=> b!925905 (=> (not res!623874) (not e!519693))))

(assert (=> b!925905 (= res!623874 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27136 _keys!1487)))))

(declare-fun lt!416824 () Unit!31291)

(assert (=> b!925905 (= lt!416824 e!519682)))

(declare-fun c!96643 () Bool)

(assert (=> b!925905 (= c!96643 (validKeyInArray!0 k0!1099))))

(declare-fun b!925906 () Bool)

(declare-fun Unit!31294 () Unit!31291)

(assert (=> b!925906 (= e!519685 Unit!31294)))

(assert (= (and start!79028 res!623873) b!925895))

(assert (= (and b!925895 res!623866) b!925887))

(assert (= (and b!925887 res!623875) b!925890))

(assert (= (and b!925890 res!623869) b!925899))

(assert (= (and b!925899 res!623865) b!925891))

(assert (= (and b!925891 res!623867) b!925897))

(assert (= (and b!925897 res!623868) b!925905))

(assert (= (and b!925905 c!96643) b!925903))

(assert (= (and b!925905 (not c!96643)) b!925889))

(assert (= (and b!925903 c!96644) b!925901))

(assert (= (and b!925903 (not c!96644)) b!925906))

(assert (= (and b!925901 c!96645) b!925904))

(assert (= (and b!925901 (not c!96645)) b!925892))

(assert (= (and b!925905 res!623874) b!925898))

(assert (= (and b!925898 res!623870) b!925902))

(assert (= (and b!925902 res!623871) b!925888))

(assert (= (and b!925888 res!623872) b!925896))

(assert (= (and b!925900 condMapEmpty!31380) mapIsEmpty!31380))

(assert (= (and b!925900 (not condMapEmpty!31380)) mapNonEmpty!31380))

(get-info :version)

(assert (= (and mapNonEmpty!31380 ((_ is ValueCellFull!9393) mapValue!31380)) b!925893))

(assert (= (and b!925900 ((_ is ValueCellFull!9393) mapDefault!31380)) b!925894))

(assert (= start!79028 b!925900))

(declare-fun b_lambda!13743 () Bool)

(assert (=> (not b_lambda!13743) (not b!925901)))

(declare-fun t!26716 () Bool)

(declare-fun tb!5821 () Bool)

(assert (=> (and start!79028 (= defaultEntry!1235 defaultEntry!1235) t!26716) tb!5821))

(declare-fun result!11465 () Bool)

(assert (=> tb!5821 (= result!11465 tp_is_empty!19749)))

(assert (=> b!925901 t!26716))

(declare-fun b_and!28221 () Bool)

(assert (= b_and!28219 (and (=> t!26716 result!11465) b_and!28221)))

(declare-fun m!860365 () Bool)

(assert (=> b!925903 m!860365))

(declare-fun m!860367 () Bool)

(assert (=> b!925903 m!860367))

(declare-fun m!860369 () Bool)

(assert (=> mapNonEmpty!31380 m!860369))

(declare-fun m!860371 () Bool)

(assert (=> start!79028 m!860371))

(declare-fun m!860373 () Bool)

(assert (=> start!79028 m!860373))

(declare-fun m!860375 () Bool)

(assert (=> start!79028 m!860375))

(declare-fun m!860377 () Bool)

(assert (=> b!925898 m!860377))

(declare-fun m!860379 () Bool)

(assert (=> b!925898 m!860379))

(declare-fun m!860381 () Bool)

(assert (=> b!925891 m!860381))

(declare-fun m!860383 () Bool)

(assert (=> b!925891 m!860383))

(declare-fun m!860385 () Bool)

(assert (=> b!925896 m!860385))

(declare-fun m!860387 () Bool)

(assert (=> b!925888 m!860387))

(declare-fun m!860389 () Bool)

(assert (=> b!925888 m!860389))

(declare-fun m!860391 () Bool)

(assert (=> b!925888 m!860391))

(declare-fun m!860393 () Bool)

(assert (=> b!925902 m!860393))

(declare-fun m!860395 () Bool)

(assert (=> b!925904 m!860395))

(declare-fun m!860397 () Bool)

(assert (=> b!925887 m!860397))

(declare-fun m!860399 () Bool)

(assert (=> b!925901 m!860399))

(declare-fun m!860401 () Bool)

(assert (=> b!925901 m!860401))

(declare-fun m!860403 () Bool)

(assert (=> b!925901 m!860403))

(declare-fun m!860405 () Bool)

(assert (=> b!925901 m!860405))

(declare-fun m!860407 () Bool)

(assert (=> b!925901 m!860407))

(declare-fun m!860409 () Bool)

(assert (=> b!925901 m!860409))

(assert (=> b!925901 m!860403))

(assert (=> b!925901 m!860407))

(declare-fun m!860411 () Bool)

(assert (=> b!925901 m!860411))

(assert (=> b!925901 m!860379))

(declare-fun m!860413 () Bool)

(assert (=> b!925901 m!860413))

(declare-fun m!860415 () Bool)

(assert (=> b!925901 m!860415))

(declare-fun m!860417 () Bool)

(assert (=> b!925901 m!860417))

(declare-fun m!860419 () Bool)

(assert (=> b!925901 m!860419))

(declare-fun m!860421 () Bool)

(assert (=> b!925901 m!860421))

(declare-fun m!860423 () Bool)

(assert (=> b!925901 m!860423))

(assert (=> b!925901 m!860419))

(declare-fun m!860425 () Bool)

(assert (=> b!925901 m!860425))

(declare-fun m!860427 () Bool)

(assert (=> b!925901 m!860427))

(declare-fun m!860429 () Bool)

(assert (=> b!925897 m!860429))

(declare-fun m!860431 () Bool)

(assert (=> b!925905 m!860431))

(declare-fun m!860433 () Bool)

(assert (=> b!925890 m!860433))

(check-sat (not b!925897) (not b!925901) b_and!28221 (not b!925903) (not b!925890) (not b!925904) (not b!925888) (not b!925902) (not b!925905) (not start!79028) (not b_lambda!13743) (not b_next!17241) (not b!925898) tp_is_empty!19749 (not b!925896) (not b!925887) (not b!925891) (not mapNonEmpty!31380))
(check-sat b_and!28221 (not b_next!17241))
