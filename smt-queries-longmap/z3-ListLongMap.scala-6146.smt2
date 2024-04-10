; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78986 () Bool)

(assert start!78986)

(declare-fun b_free!17199 () Bool)

(declare-fun b_next!17199 () Bool)

(assert (=> start!78986 (= b_free!17199 (not b_next!17199))))

(declare-fun tp!60038 () Bool)

(declare-fun b_and!28135 () Bool)

(assert (=> start!78986 (= tp!60038 b_and!28135)))

(declare-fun b!924629 () Bool)

(declare-fun e!518886 () Bool)

(declare-fun tp_is_empty!19707 () Bool)

(assert (=> b!924629 (= e!518886 tp_is_empty!19707)))

(declare-fun b!924630 () Bool)

(declare-fun e!518895 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!924630 (= e!518895 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924631 () Bool)

(declare-datatypes ((Unit!31219 0))(
  ( (Unit!31220) )
))
(declare-fun e!518892 () Unit!31219)

(declare-fun Unit!31221 () Unit!31219)

(assert (=> b!924631 (= e!518892 Unit!31221)))

(declare-fun b!924632 () Bool)

(declare-fun res!623217 () Bool)

(declare-fun e!518894 () Bool)

(assert (=> b!924632 (=> (not res!623217) (not e!518894))))

(declare-datatypes ((array!55384 0))(
  ( (array!55385 (arr!26637 (Array (_ BitVec 32) (_ BitVec 64))) (size!27096 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55384)

(declare-datatypes ((List!18708 0))(
  ( (Nil!18705) (Cons!18704 (h!19850 (_ BitVec 64)) (t!26637 List!18708)) )
))
(declare-fun arrayNoDuplicates!0 (array!55384 (_ BitVec 32) List!18708) Bool)

(assert (=> b!924632 (= res!623217 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18705))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!924633 () Bool)

(declare-fun arrayContainsKey!0 (array!55384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924633 (= e!518895 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924634 () Bool)

(declare-fun e!518896 () Bool)

(assert (=> b!924634 (= e!518894 e!518896)))

(declare-fun res!623220 () Bool)

(assert (=> b!924634 (=> (not res!623220) (not e!518896))))

(declare-datatypes ((V!31241 0))(
  ( (V!31242 (val!9904 Int)) )
))
(declare-datatypes ((tuple2!12906 0))(
  ( (tuple2!12907 (_1!6464 (_ BitVec 64)) (_2!6464 V!31241)) )
))
(declare-datatypes ((List!18709 0))(
  ( (Nil!18706) (Cons!18705 (h!19851 tuple2!12906) (t!26638 List!18709)) )
))
(declare-datatypes ((ListLongMap!11603 0))(
  ( (ListLongMap!11604 (toList!5817 List!18709)) )
))
(declare-fun lt!415832 () ListLongMap!11603)

(declare-fun contains!4877 (ListLongMap!11603 (_ BitVec 64)) Bool)

(assert (=> b!924634 (= res!623220 (contains!4877 lt!415832 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9372 0))(
  ( (ValueCellFull!9372 (v!12422 V!31241)) (EmptyCell!9372) )
))
(declare-datatypes ((array!55386 0))(
  ( (array!55387 (arr!26638 (Array (_ BitVec 32) ValueCell!9372)) (size!27097 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55386)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31241)

(declare-fun minValue!1173 () V!31241)

(declare-fun getCurrentListMap!3068 (array!55384 array!55386 (_ BitVec 32) (_ BitVec 32) V!31241 V!31241 (_ BitVec 32) Int) ListLongMap!11603)

(assert (=> b!924634 (= lt!415832 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924635 () Bool)

(declare-fun res!623216 () Bool)

(assert (=> b!924635 (=> (not res!623216) (not e!518894))))

(assert (=> b!924635 (= res!623216 (and (= (size!27097 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27096 _keys!1487) (size!27097 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924636 () Bool)

(declare-fun e!518893 () Bool)

(declare-fun e!518888 () Bool)

(assert (=> b!924636 (= e!518893 e!518888)))

(declare-fun res!623218 () Bool)

(assert (=> b!924636 (=> (not res!623218) (not e!518888))))

(declare-fun lt!415833 () ListLongMap!11603)

(assert (=> b!924636 (= res!623218 (contains!4877 lt!415833 k0!1099))))

(assert (=> b!924636 (= lt!415833 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924637 () Bool)

(declare-fun res!623222 () Bool)

(assert (=> b!924637 (=> (not res!623222) (not e!518894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55384 (_ BitVec 32)) Bool)

(assert (=> b!924637 (= res!623222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924638 () Bool)

(declare-fun e!518887 () Unit!31219)

(assert (=> b!924638 (= e!518887 e!518892)))

(declare-fun lt!415823 () (_ BitVec 64))

(assert (=> b!924638 (= lt!415823 (select (arr!26637 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96455 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924638 (= c!96455 (validKeyInArray!0 lt!415823))))

(declare-fun b!924639 () Bool)

(declare-fun e!518891 () Bool)

(assert (=> b!924639 (= e!518891 tp_is_empty!19707)))

(declare-fun res!623219 () Bool)

(assert (=> start!78986 (=> (not res!623219) (not e!518894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78986 (= res!623219 (validMask!0 mask!1881))))

(assert (=> start!78986 e!518894))

(assert (=> start!78986 true))

(assert (=> start!78986 tp_is_empty!19707))

(declare-fun e!518885 () Bool)

(declare-fun array_inv!20744 (array!55386) Bool)

(assert (=> start!78986 (and (array_inv!20744 _values!1231) e!518885)))

(assert (=> start!78986 tp!60038))

(declare-fun array_inv!20745 (array!55384) Bool)

(assert (=> start!78986 (array_inv!20745 _keys!1487)))

(declare-fun b!924640 () Bool)

(assert (=> b!924640 (= e!518888 false)))

(declare-fun lt!415828 () V!31241)

(declare-fun apply!647 (ListLongMap!11603 (_ BitVec 64)) V!31241)

(assert (=> b!924640 (= lt!415828 (apply!647 lt!415833 k0!1099))))

(declare-fun b!924641 () Bool)

(declare-fun mapRes!31317 () Bool)

(assert (=> b!924641 (= e!518885 (and e!518886 mapRes!31317))))

(declare-fun condMapEmpty!31317 () Bool)

(declare-fun mapDefault!31317 () ValueCell!9372)

(assert (=> b!924641 (= condMapEmpty!31317 (= (arr!26638 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9372)) mapDefault!31317)))))

(declare-fun mapIsEmpty!31317 () Bool)

(assert (=> mapIsEmpty!31317 mapRes!31317))

(declare-fun b!924642 () Bool)

(declare-fun Unit!31222 () Unit!31219)

(assert (=> b!924642 (= e!518887 Unit!31222)))

(declare-fun b!924643 () Bool)

(declare-fun lt!415827 () ListLongMap!11603)

(declare-fun lt!415836 () V!31241)

(assert (=> b!924643 (= (apply!647 lt!415827 k0!1099) lt!415836)))

(declare-fun lt!415831 () V!31241)

(declare-fun lt!415829 () Unit!31219)

(declare-fun addApplyDifferent!369 (ListLongMap!11603 (_ BitVec 64) V!31241 (_ BitVec 64)) Unit!31219)

(assert (=> b!924643 (= lt!415829 (addApplyDifferent!369 lt!415832 lt!415823 lt!415831 k0!1099))))

(assert (=> b!924643 (not (= lt!415823 k0!1099))))

(declare-fun lt!415834 () Unit!31219)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55384 (_ BitVec 64) (_ BitVec 32) List!18708) Unit!31219)

(assert (=> b!924643 (= lt!415834 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18705))))

(assert (=> b!924643 e!518895))

(declare-fun c!96454 () Bool)

(assert (=> b!924643 (= c!96454 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415826 () Unit!31219)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!220 (array!55384 array!55386 (_ BitVec 32) (_ BitVec 32) V!31241 V!31241 (_ BitVec 64) (_ BitVec 32) Int) Unit!31219)

(assert (=> b!924643 (= lt!415826 (lemmaListMapContainsThenArrayContainsFrom!220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924643 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18705)))

(declare-fun lt!415835 () Unit!31219)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55384 (_ BitVec 32) (_ BitVec 32)) Unit!31219)

(assert (=> b!924643 (= lt!415835 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924643 (contains!4877 lt!415827 k0!1099)))

(declare-fun lt!415830 () tuple2!12906)

(declare-fun +!2713 (ListLongMap!11603 tuple2!12906) ListLongMap!11603)

(assert (=> b!924643 (= lt!415827 (+!2713 lt!415832 lt!415830))))

(declare-fun lt!415824 () Unit!31219)

(declare-fun addStillContains!437 (ListLongMap!11603 (_ BitVec 64) V!31241 (_ BitVec 64)) Unit!31219)

(assert (=> b!924643 (= lt!415824 (addStillContains!437 lt!415832 lt!415823 lt!415831 k0!1099))))

(assert (=> b!924643 (= (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2713 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415830))))

(assert (=> b!924643 (= lt!415830 (tuple2!12907 lt!415823 lt!415831))))

(declare-fun get!14002 (ValueCell!9372 V!31241) V!31241)

(declare-fun dynLambda!1502 (Int (_ BitVec 64)) V!31241)

(assert (=> b!924643 (= lt!415831 (get!14002 (select (arr!26638 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1502 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415825 () Unit!31219)

(declare-fun lemmaListMapRecursiveValidKeyArray!103 (array!55384 array!55386 (_ BitVec 32) (_ BitVec 32) V!31241 V!31241 (_ BitVec 32) Int) Unit!31219)

(assert (=> b!924643 (= lt!415825 (lemmaListMapRecursiveValidKeyArray!103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924643 (= e!518892 lt!415829)))

(declare-fun mapNonEmpty!31317 () Bool)

(declare-fun tp!60037 () Bool)

(assert (=> mapNonEmpty!31317 (= mapRes!31317 (and tp!60037 e!518891))))

(declare-fun mapKey!31317 () (_ BitVec 32))

(declare-fun mapRest!31317 () (Array (_ BitVec 32) ValueCell!9372))

(declare-fun mapValue!31317 () ValueCell!9372)

(assert (=> mapNonEmpty!31317 (= (arr!26638 _values!1231) (store mapRest!31317 mapKey!31317 mapValue!31317))))

(declare-fun b!924644 () Bool)

(declare-fun e!518890 () Bool)

(assert (=> b!924644 (= e!518896 e!518890)))

(declare-fun res!623223 () Bool)

(assert (=> b!924644 (=> (not res!623223) (not e!518890))))

(declare-fun v!791 () V!31241)

(assert (=> b!924644 (= res!623223 (and (= lt!415836 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924644 (= lt!415836 (apply!647 lt!415832 k0!1099))))

(declare-fun b!924645 () Bool)

(declare-fun res!623221 () Bool)

(assert (=> b!924645 (=> (not res!623221) (not e!518894))))

(assert (=> b!924645 (= res!623221 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27096 _keys!1487))))))

(declare-fun b!924646 () Bool)

(assert (=> b!924646 (= e!518890 e!518893)))

(declare-fun res!623224 () Bool)

(assert (=> b!924646 (=> (not res!623224) (not e!518893))))

(assert (=> b!924646 (= res!623224 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27096 _keys!1487)))))

(declare-fun lt!415837 () Unit!31219)

(assert (=> b!924646 (= lt!415837 e!518887)))

(declare-fun c!96456 () Bool)

(assert (=> b!924646 (= c!96456 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78986 res!623219) b!924635))

(assert (= (and b!924635 res!623216) b!924637))

(assert (= (and b!924637 res!623222) b!924632))

(assert (= (and b!924632 res!623217) b!924645))

(assert (= (and b!924645 res!623221) b!924634))

(assert (= (and b!924634 res!623220) b!924644))

(assert (= (and b!924644 res!623223) b!924646))

(assert (= (and b!924646 c!96456) b!924638))

(assert (= (and b!924646 (not c!96456)) b!924642))

(assert (= (and b!924638 c!96455) b!924643))

(assert (= (and b!924638 (not c!96455)) b!924631))

(assert (= (and b!924643 c!96454) b!924633))

(assert (= (and b!924643 (not c!96454)) b!924630))

(assert (= (and b!924646 res!623224) b!924636))

(assert (= (and b!924636 res!623218) b!924640))

(assert (= (and b!924641 condMapEmpty!31317) mapIsEmpty!31317))

(assert (= (and b!924641 (not condMapEmpty!31317)) mapNonEmpty!31317))

(get-info :version)

(assert (= (and mapNonEmpty!31317 ((_ is ValueCellFull!9372) mapValue!31317)) b!924639))

(assert (= (and b!924641 ((_ is ValueCellFull!9372) mapDefault!31317)) b!924629))

(assert (= start!78986 b!924641))

(declare-fun b_lambda!13701 () Bool)

(assert (=> (not b_lambda!13701) (not b!924643)))

(declare-fun t!26636 () Bool)

(declare-fun tb!5779 () Bool)

(assert (=> (and start!78986 (= defaultEntry!1235 defaultEntry!1235) t!26636) tb!5779))

(declare-fun result!11381 () Bool)

(assert (=> tb!5779 (= result!11381 tp_is_empty!19707)))

(assert (=> b!924643 t!26636))

(declare-fun b_and!28137 () Bool)

(assert (= b_and!28135 (and (=> t!26636 result!11381) b_and!28137)))

(declare-fun m!858959 () Bool)

(assert (=> b!924638 m!858959))

(declare-fun m!858961 () Bool)

(assert (=> b!924638 m!858961))

(declare-fun m!858963 () Bool)

(assert (=> b!924634 m!858963))

(declare-fun m!858965 () Bool)

(assert (=> b!924634 m!858965))

(declare-fun m!858967 () Bool)

(assert (=> b!924637 m!858967))

(declare-fun m!858969 () Bool)

(assert (=> mapNonEmpty!31317 m!858969))

(declare-fun m!858971 () Bool)

(assert (=> b!924646 m!858971))

(declare-fun m!858973 () Bool)

(assert (=> start!78986 m!858973))

(declare-fun m!858975 () Bool)

(assert (=> start!78986 m!858975))

(declare-fun m!858977 () Bool)

(assert (=> start!78986 m!858977))

(declare-fun m!858979 () Bool)

(assert (=> b!924633 m!858979))

(declare-fun m!858981 () Bool)

(assert (=> b!924643 m!858981))

(declare-fun m!858983 () Bool)

(assert (=> b!924643 m!858983))

(declare-fun m!858985 () Bool)

(assert (=> b!924643 m!858985))

(declare-fun m!858987 () Bool)

(assert (=> b!924643 m!858987))

(declare-fun m!858989 () Bool)

(assert (=> b!924643 m!858989))

(declare-fun m!858991 () Bool)

(assert (=> b!924643 m!858991))

(declare-fun m!858993 () Bool)

(assert (=> b!924643 m!858993))

(assert (=> b!924643 m!858989))

(declare-fun m!858995 () Bool)

(assert (=> b!924643 m!858995))

(declare-fun m!858997 () Bool)

(assert (=> b!924643 m!858997))

(declare-fun m!858999 () Bool)

(assert (=> b!924643 m!858999))

(declare-fun m!859001 () Bool)

(assert (=> b!924643 m!859001))

(declare-fun m!859003 () Bool)

(assert (=> b!924643 m!859003))

(declare-fun m!859005 () Bool)

(assert (=> b!924643 m!859005))

(declare-fun m!859007 () Bool)

(assert (=> b!924643 m!859007))

(assert (=> b!924643 m!858995))

(declare-fun m!859009 () Bool)

(assert (=> b!924643 m!859009))

(assert (=> b!924643 m!858981))

(declare-fun m!859011 () Bool)

(assert (=> b!924643 m!859011))

(declare-fun m!859013 () Bool)

(assert (=> b!924636 m!859013))

(assert (=> b!924636 m!858999))

(declare-fun m!859015 () Bool)

(assert (=> b!924644 m!859015))

(declare-fun m!859017 () Bool)

(assert (=> b!924632 m!859017))

(declare-fun m!859019 () Bool)

(assert (=> b!924640 m!859019))

(check-sat (not b!924640) (not b_next!17199) (not b!924644) (not b!924646) tp_is_empty!19707 (not b!924636) (not start!78986) (not b!924632) b_and!28137 (not b!924638) (not b_lambda!13701) (not mapNonEmpty!31317) (not b!924634) (not b!924633) (not b!924637) (not b!924643))
(check-sat b_and!28137 (not b_next!17199))
