; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78878 () Bool)

(assert start!78878)

(declare-fun b_free!17091 () Bool)

(declare-fun b_next!17091 () Bool)

(assert (=> start!78878 (= b_free!17091 (not b_next!17091))))

(declare-fun tp!59714 () Bool)

(declare-fun b_and!27919 () Bool)

(assert (=> start!78878 (= tp!59714 b_and!27919)))

(declare-fun b!921860 () Bool)

(declare-fun e!517287 () Bool)

(declare-fun e!517282 () Bool)

(assert (=> b!921860 (= e!517287 e!517282)))

(declare-fun res!621679 () Bool)

(assert (=> b!921860 (=> (not res!621679) (not e!517282))))

(declare-datatypes ((V!31097 0))(
  ( (V!31098 (val!9850 Int)) )
))
(declare-datatypes ((tuple2!12812 0))(
  ( (tuple2!12813 (_1!6417 (_ BitVec 64)) (_2!6417 V!31097)) )
))
(declare-datatypes ((List!18617 0))(
  ( (Nil!18614) (Cons!18613 (h!19759 tuple2!12812) (t!26438 List!18617)) )
))
(declare-datatypes ((ListLongMap!11509 0))(
  ( (ListLongMap!11510 (toList!5770 List!18617)) )
))
(declare-fun lt!413910 () ListLongMap!11509)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4833 (ListLongMap!11509 (_ BitVec 64)) Bool)

(assert (=> b!921860 (= res!621679 (contains!4833 lt!413910 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9318 0))(
  ( (ValueCellFull!9318 (v!12368 V!31097)) (EmptyCell!9318) )
))
(declare-datatypes ((array!55176 0))(
  ( (array!55177 (arr!26533 (Array (_ BitVec 32) ValueCell!9318)) (size!26992 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55176)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!55178 0))(
  ( (array!55179 (arr!26534 (Array (_ BitVec 32) (_ BitVec 64))) (size!26993 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55178)

(declare-fun zeroValue!1173 () V!31097)

(declare-fun minValue!1173 () V!31097)

(declare-fun getCurrentListMap!3024 (array!55178 array!55176 (_ BitVec 32) (_ BitVec 32) V!31097 V!31097 (_ BitVec 32) Int) ListLongMap!11509)

(assert (=> b!921860 (= lt!413910 (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921861 () Bool)

(declare-fun e!517283 () Bool)

(assert (=> b!921861 (= e!517283 (not true))))

(declare-fun lt!413905 () (_ BitVec 64))

(assert (=> b!921861 (not (= lt!413905 k0!1099))))

(declare-datatypes ((Unit!31102 0))(
  ( (Unit!31103) )
))
(declare-fun lt!413904 () Unit!31102)

(declare-datatypes ((List!18618 0))(
  ( (Nil!18615) (Cons!18614 (h!19760 (_ BitVec 64)) (t!26439 List!18618)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55178 (_ BitVec 64) (_ BitVec 32) List!18618) Unit!31102)

(assert (=> b!921861 (= lt!413904 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18615))))

(declare-fun e!517285 () Bool)

(assert (=> b!921861 e!517285))

(declare-fun c!96138 () Bool)

(assert (=> b!921861 (= c!96138 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413906 () Unit!31102)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!184 (array!55178 array!55176 (_ BitVec 32) (_ BitVec 32) V!31097 V!31097 (_ BitVec 64) (_ BitVec 32) Int) Unit!31102)

(assert (=> b!921861 (= lt!413906 (lemmaListMapContainsThenArrayContainsFrom!184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55178 (_ BitVec 32) List!18618) Bool)

(assert (=> b!921861 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18615)))

(declare-fun lt!413903 () Unit!31102)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55178 (_ BitVec 32) (_ BitVec 32)) Unit!31102)

(assert (=> b!921861 (= lt!413903 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413908 () tuple2!12812)

(declare-fun +!2677 (ListLongMap!11509 tuple2!12812) ListLongMap!11509)

(assert (=> b!921861 (contains!4833 (+!2677 lt!413910 lt!413908) k0!1099)))

(declare-fun lt!413911 () V!31097)

(declare-fun lt!413907 () Unit!31102)

(declare-fun addStillContains!401 (ListLongMap!11509 (_ BitVec 64) V!31097 (_ BitVec 64)) Unit!31102)

(assert (=> b!921861 (= lt!413907 (addStillContains!401 lt!413910 lt!413905 lt!413911 k0!1099))))

(assert (=> b!921861 (= (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2677 (getCurrentListMap!3024 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413908))))

(assert (=> b!921861 (= lt!413908 (tuple2!12813 lt!413905 lt!413911))))

(declare-fun get!13930 (ValueCell!9318 V!31097) V!31097)

(declare-fun dynLambda!1466 (Int (_ BitVec 64)) V!31097)

(assert (=> b!921861 (= lt!413911 (get!13930 (select (arr!26533 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1466 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413909 () Unit!31102)

(declare-fun lemmaListMapRecursiveValidKeyArray!67 (array!55178 array!55176 (_ BitVec 32) (_ BitVec 32) V!31097 V!31097 (_ BitVec 32) Int) Unit!31102)

(assert (=> b!921861 (= lt!413909 (lemmaListMapRecursiveValidKeyArray!67 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921862 () Bool)

(declare-fun e!517288 () Bool)

(declare-fun e!517281 () Bool)

(declare-fun mapRes!31155 () Bool)

(assert (=> b!921862 (= e!517288 (and e!517281 mapRes!31155))))

(declare-fun condMapEmpty!31155 () Bool)

(declare-fun mapDefault!31155 () ValueCell!9318)

(assert (=> b!921862 (= condMapEmpty!31155 (= (arr!26533 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9318)) mapDefault!31155)))))

(declare-fun b!921863 () Bool)

(declare-fun arrayContainsKey!0 (array!55178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921863 (= e!517285 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921864 () Bool)

(assert (=> b!921864 (= e!517282 e!517283)))

(declare-fun res!621681 () Bool)

(assert (=> b!921864 (=> (not res!621681) (not e!517283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921864 (= res!621681 (validKeyInArray!0 lt!413905))))

(assert (=> b!921864 (= lt!413905 (select (arr!26534 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31155 () Bool)

(declare-fun tp!59713 () Bool)

(declare-fun e!517284 () Bool)

(assert (=> mapNonEmpty!31155 (= mapRes!31155 (and tp!59713 e!517284))))

(declare-fun mapValue!31155 () ValueCell!9318)

(declare-fun mapKey!31155 () (_ BitVec 32))

(declare-fun mapRest!31155 () (Array (_ BitVec 32) ValueCell!9318))

(assert (=> mapNonEmpty!31155 (= (arr!26533 _values!1231) (store mapRest!31155 mapKey!31155 mapValue!31155))))

(declare-fun mapIsEmpty!31155 () Bool)

(assert (=> mapIsEmpty!31155 mapRes!31155))

(declare-fun b!921866 () Bool)

(declare-fun res!621676 () Bool)

(assert (=> b!921866 (=> (not res!621676) (not e!517287))))

(assert (=> b!921866 (= res!621676 (and (= (size!26992 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26993 _keys!1487) (size!26992 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921867 () Bool)

(declare-fun res!621674 () Bool)

(assert (=> b!921867 (=> (not res!621674) (not e!517287))))

(assert (=> b!921867 (= res!621674 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18615))))

(declare-fun b!921868 () Bool)

(declare-fun tp_is_empty!19599 () Bool)

(assert (=> b!921868 (= e!517284 tp_is_empty!19599)))

(declare-fun b!921869 () Bool)

(assert (=> b!921869 (= e!517285 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921870 () Bool)

(assert (=> b!921870 (= e!517281 tp_is_empty!19599)))

(declare-fun b!921871 () Bool)

(declare-fun res!621677 () Bool)

(assert (=> b!921871 (=> (not res!621677) (not e!517287))))

(assert (=> b!921871 (= res!621677 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26993 _keys!1487))))))

(declare-fun b!921872 () Bool)

(declare-fun res!621675 () Bool)

(assert (=> b!921872 (=> (not res!621675) (not e!517287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55178 (_ BitVec 32)) Bool)

(assert (=> b!921872 (= res!621675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921873 () Bool)

(declare-fun res!621680 () Bool)

(assert (=> b!921873 (=> (not res!621680) (not e!517282))))

(declare-fun v!791 () V!31097)

(declare-fun apply!608 (ListLongMap!11509 (_ BitVec 64)) V!31097)

(assert (=> b!921873 (= res!621680 (= (apply!608 lt!413910 k0!1099) v!791))))

(declare-fun b!921874 () Bool)

(declare-fun res!621673 () Bool)

(assert (=> b!921874 (=> (not res!621673) (not e!517282))))

(assert (=> b!921874 (= res!621673 (validKeyInArray!0 k0!1099))))

(declare-fun res!621678 () Bool)

(assert (=> start!78878 (=> (not res!621678) (not e!517287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78878 (= res!621678 (validMask!0 mask!1881))))

(assert (=> start!78878 e!517287))

(assert (=> start!78878 true))

(assert (=> start!78878 tp_is_empty!19599))

(declare-fun array_inv!20668 (array!55176) Bool)

(assert (=> start!78878 (and (array_inv!20668 _values!1231) e!517288)))

(assert (=> start!78878 tp!59714))

(declare-fun array_inv!20669 (array!55178) Bool)

(assert (=> start!78878 (array_inv!20669 _keys!1487)))

(declare-fun b!921865 () Bool)

(declare-fun res!621682 () Bool)

(assert (=> b!921865 (=> (not res!621682) (not e!517282))))

(assert (=> b!921865 (= res!621682 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78878 res!621678) b!921866))

(assert (= (and b!921866 res!621676) b!921872))

(assert (= (and b!921872 res!621675) b!921867))

(assert (= (and b!921867 res!621674) b!921871))

(assert (= (and b!921871 res!621677) b!921860))

(assert (= (and b!921860 res!621679) b!921873))

(assert (= (and b!921873 res!621680) b!921865))

(assert (= (and b!921865 res!621682) b!921874))

(assert (= (and b!921874 res!621673) b!921864))

(assert (= (and b!921864 res!621681) b!921861))

(assert (= (and b!921861 c!96138) b!921863))

(assert (= (and b!921861 (not c!96138)) b!921869))

(assert (= (and b!921862 condMapEmpty!31155) mapIsEmpty!31155))

(assert (= (and b!921862 (not condMapEmpty!31155)) mapNonEmpty!31155))

(get-info :version)

(assert (= (and mapNonEmpty!31155 ((_ is ValueCellFull!9318) mapValue!31155)) b!921868))

(assert (= (and b!921862 ((_ is ValueCellFull!9318) mapDefault!31155)) b!921870))

(assert (= start!78878 b!921862))

(declare-fun b_lambda!13593 () Bool)

(assert (=> (not b_lambda!13593) (not b!921861)))

(declare-fun t!26437 () Bool)

(declare-fun tb!5671 () Bool)

(assert (=> (and start!78878 (= defaultEntry!1235 defaultEntry!1235) t!26437) tb!5671))

(declare-fun result!11165 () Bool)

(assert (=> tb!5671 (= result!11165 tp_is_empty!19599)))

(assert (=> b!921861 t!26437))

(declare-fun b_and!27921 () Bool)

(assert (= b_and!27919 (and (=> t!26437 result!11165) b_and!27921)))

(declare-fun m!855843 () Bool)

(assert (=> b!921860 m!855843))

(declare-fun m!855845 () Bool)

(assert (=> b!921860 m!855845))

(declare-fun m!855847 () Bool)

(assert (=> b!921861 m!855847))

(declare-fun m!855849 () Bool)

(assert (=> b!921861 m!855849))

(declare-fun m!855851 () Bool)

(assert (=> b!921861 m!855851))

(declare-fun m!855853 () Bool)

(assert (=> b!921861 m!855853))

(declare-fun m!855855 () Bool)

(assert (=> b!921861 m!855855))

(assert (=> b!921861 m!855847))

(assert (=> b!921861 m!855853))

(assert (=> b!921861 m!855855))

(declare-fun m!855857 () Bool)

(assert (=> b!921861 m!855857))

(declare-fun m!855859 () Bool)

(assert (=> b!921861 m!855859))

(declare-fun m!855861 () Bool)

(assert (=> b!921861 m!855861))

(declare-fun m!855863 () Bool)

(assert (=> b!921861 m!855863))

(declare-fun m!855865 () Bool)

(assert (=> b!921861 m!855865))

(declare-fun m!855867 () Bool)

(assert (=> b!921861 m!855867))

(declare-fun m!855869 () Bool)

(assert (=> b!921861 m!855869))

(declare-fun m!855871 () Bool)

(assert (=> b!921861 m!855871))

(assert (=> b!921861 m!855869))

(declare-fun m!855873 () Bool)

(assert (=> b!921861 m!855873))

(declare-fun m!855875 () Bool)

(assert (=> b!921874 m!855875))

(declare-fun m!855877 () Bool)

(assert (=> b!921864 m!855877))

(declare-fun m!855879 () Bool)

(assert (=> b!921864 m!855879))

(declare-fun m!855881 () Bool)

(assert (=> start!78878 m!855881))

(declare-fun m!855883 () Bool)

(assert (=> start!78878 m!855883))

(declare-fun m!855885 () Bool)

(assert (=> start!78878 m!855885))

(declare-fun m!855887 () Bool)

(assert (=> b!921867 m!855887))

(declare-fun m!855889 () Bool)

(assert (=> b!921872 m!855889))

(declare-fun m!855891 () Bool)

(assert (=> b!921863 m!855891))

(declare-fun m!855893 () Bool)

(assert (=> b!921873 m!855893))

(declare-fun m!855895 () Bool)

(assert (=> mapNonEmpty!31155 m!855895))

(check-sat tp_is_empty!19599 (not b!921861) (not start!78878) (not b!921874) (not b!921864) (not b!921872) (not mapNonEmpty!31155) (not b!921867) (not b!921863) (not b_lambda!13593) (not b!921873) (not b_next!17091) (not b!921860) b_and!27921)
(check-sat b_and!27921 (not b_next!17091))
