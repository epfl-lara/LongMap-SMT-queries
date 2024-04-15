; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78930 () Bool)

(assert start!78930)

(declare-fun b_free!17161 () Bool)

(declare-fun b_next!17161 () Bool)

(assert (=> start!78930 (= b_free!17161 (not b_next!17161))))

(declare-fun tp!59925 () Bool)

(declare-fun b_and!28033 () Bool)

(assert (=> start!78930 (= tp!59925 b_and!28033)))

(declare-fun b!923326 () Bool)

(declare-fun e!518053 () Bool)

(declare-fun e!518055 () Bool)

(assert (=> b!923326 (= e!518053 e!518055)))

(declare-fun res!622594 () Bool)

(assert (=> b!923326 (=> (not res!622594) (not e!518055))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55283 0))(
  ( (array!55284 (arr!26587 (Array (_ BitVec 32) (_ BitVec 64))) (size!27048 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55283)

(assert (=> b!923326 (= res!622594 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27048 _keys!1487)))))

(declare-datatypes ((Unit!31072 0))(
  ( (Unit!31073) )
))
(declare-fun lt!414737 () Unit!31072)

(declare-fun e!518057 () Unit!31072)

(assert (=> b!923326 (= lt!414737 e!518057)))

(declare-fun c!96220 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923326 (= c!96220 (validKeyInArray!0 k0!1099))))

(declare-fun b!923327 () Bool)

(declare-fun e!518058 () Bool)

(declare-fun tp_is_empty!19669 () Bool)

(assert (=> b!923327 (= e!518058 tp_is_empty!19669)))

(declare-fun b!923328 () Bool)

(declare-fun e!518060 () Bool)

(declare-fun e!518056 () Bool)

(assert (=> b!923328 (= e!518060 e!518056)))

(declare-fun res!622599 () Bool)

(assert (=> b!923328 (=> (not res!622599) (not e!518056))))

(declare-datatypes ((V!31191 0))(
  ( (V!31192 (val!9885 Int)) )
))
(declare-datatypes ((tuple2!12932 0))(
  ( (tuple2!12933 (_1!6477 (_ BitVec 64)) (_2!6477 V!31191)) )
))
(declare-datatypes ((List!18713 0))(
  ( (Nil!18710) (Cons!18709 (h!19855 tuple2!12932) (t!26595 List!18713)) )
))
(declare-datatypes ((ListLongMap!11619 0))(
  ( (ListLongMap!11620 (toList!5825 List!18713)) )
))
(declare-fun lt!414732 () ListLongMap!11619)

(declare-fun contains!4839 (ListLongMap!11619 (_ BitVec 64)) Bool)

(assert (=> b!923328 (= res!622599 (contains!4839 lt!414732 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9353 0))(
  ( (ValueCellFull!9353 (v!12402 V!31191)) (EmptyCell!9353) )
))
(declare-datatypes ((array!55285 0))(
  ( (array!55286 (arr!26588 (Array (_ BitVec 32) ValueCell!9353)) (size!27049 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55285)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31191)

(declare-fun minValue!1173 () V!31191)

(declare-fun getCurrentListMap!3013 (array!55283 array!55285 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 32) Int) ListLongMap!11619)

(assert (=> b!923328 (= lt!414732 (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31260 () Bool)

(declare-fun mapRes!31260 () Bool)

(assert (=> mapIsEmpty!31260 mapRes!31260))

(declare-fun mapNonEmpty!31260 () Bool)

(declare-fun tp!59924 () Bool)

(declare-fun e!518054 () Bool)

(assert (=> mapNonEmpty!31260 (= mapRes!31260 (and tp!59924 e!518054))))

(declare-fun mapRest!31260 () (Array (_ BitVec 32) ValueCell!9353))

(declare-fun mapValue!31260 () ValueCell!9353)

(declare-fun mapKey!31260 () (_ BitVec 32))

(assert (=> mapNonEmpty!31260 (= (arr!26588 _values!1231) (store mapRest!31260 mapKey!31260 mapValue!31260))))

(declare-fun b!923329 () Bool)

(declare-fun e!518062 () Bool)

(assert (=> b!923329 (= e!518055 e!518062)))

(declare-fun res!622593 () Bool)

(assert (=> b!923329 (=> (not res!622593) (not e!518062))))

(declare-fun lt!414742 () ListLongMap!11619)

(assert (=> b!923329 (= res!622593 (contains!4839 lt!414742 k0!1099))))

(assert (=> b!923329 (= lt!414742 (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923330 () Bool)

(declare-fun e!518064 () Bool)

(assert (=> b!923330 (= e!518064 (and e!518058 mapRes!31260))))

(declare-fun condMapEmpty!31260 () Bool)

(declare-fun mapDefault!31260 () ValueCell!9353)

(assert (=> b!923330 (= condMapEmpty!31260 (= (arr!26588 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9353)) mapDefault!31260)))))

(declare-fun b!923331 () Bool)

(declare-fun res!622598 () Bool)

(assert (=> b!923331 (=> (not res!622598) (not e!518060))))

(assert (=> b!923331 (= res!622598 (and (= (size!27049 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27048 _keys!1487) (size!27049 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923332 () Bool)

(declare-fun res!622596 () Bool)

(assert (=> b!923332 (=> (not res!622596) (not e!518060))))

(declare-datatypes ((List!18714 0))(
  ( (Nil!18711) (Cons!18710 (h!19856 (_ BitVec 64)) (t!26596 List!18714)) )
))
(declare-fun arrayNoDuplicates!0 (array!55283 (_ BitVec 32) List!18714) Bool)

(assert (=> b!923332 (= res!622596 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18711))))

(declare-fun b!923333 () Bool)

(declare-fun e!518063 () Unit!31072)

(declare-fun Unit!31074 () Unit!31072)

(assert (=> b!923333 (= e!518063 Unit!31074)))

(declare-fun b!923334 () Bool)

(declare-fun lt!414734 () ListLongMap!11619)

(declare-fun lt!414733 () V!31191)

(declare-fun apply!638 (ListLongMap!11619 (_ BitVec 64)) V!31191)

(assert (=> b!923334 (= (apply!638 lt!414734 k0!1099) lt!414733)))

(declare-fun lt!414736 () Unit!31072)

(declare-fun lt!414740 () V!31191)

(declare-fun lt!414744 () (_ BitVec 64))

(declare-fun addApplyDifferent!356 (ListLongMap!11619 (_ BitVec 64) V!31191 (_ BitVec 64)) Unit!31072)

(assert (=> b!923334 (= lt!414736 (addApplyDifferent!356 lt!414732 lt!414744 lt!414740 k0!1099))))

(assert (=> b!923334 (not (= lt!414744 k0!1099))))

(declare-fun lt!414746 () Unit!31072)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55283 (_ BitVec 64) (_ BitVec 32) List!18714) Unit!31072)

(assert (=> b!923334 (= lt!414746 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18711))))

(declare-fun e!518061 () Bool)

(assert (=> b!923334 e!518061))

(declare-fun c!96218 () Bool)

(assert (=> b!923334 (= c!96218 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414739 () Unit!31072)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!216 (array!55283 array!55285 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 64) (_ BitVec 32) Int) Unit!31072)

(assert (=> b!923334 (= lt!414739 (lemmaListMapContainsThenArrayContainsFrom!216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923334 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18711)))

(declare-fun lt!414743 () Unit!31072)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55283 (_ BitVec 32) (_ BitVec 32)) Unit!31072)

(assert (=> b!923334 (= lt!414743 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923334 (contains!4839 lt!414734 k0!1099)))

(declare-fun lt!414735 () tuple2!12932)

(declare-fun +!2728 (ListLongMap!11619 tuple2!12932) ListLongMap!11619)

(assert (=> b!923334 (= lt!414734 (+!2728 lt!414732 lt!414735))))

(declare-fun lt!414738 () Unit!31072)

(declare-fun addStillContains!425 (ListLongMap!11619 (_ BitVec 64) V!31191 (_ BitVec 64)) Unit!31072)

(assert (=> b!923334 (= lt!414738 (addStillContains!425 lt!414732 lt!414744 lt!414740 k0!1099))))

(assert (=> b!923334 (= (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2728 (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414735))))

(assert (=> b!923334 (= lt!414735 (tuple2!12933 lt!414744 lt!414740))))

(declare-fun get!13977 (ValueCell!9353 V!31191) V!31191)

(declare-fun dynLambda!1484 (Int (_ BitVec 64)) V!31191)

(assert (=> b!923334 (= lt!414740 (get!13977 (select (arr!26588 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1484 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414741 () Unit!31072)

(declare-fun lemmaListMapRecursiveValidKeyArray!92 (array!55283 array!55285 (_ BitVec 32) (_ BitVec 32) V!31191 V!31191 (_ BitVec 32) Int) Unit!31072)

(assert (=> b!923334 (= lt!414741 (lemmaListMapRecursiveValidKeyArray!92 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923334 (= e!518063 lt!414736)))

(declare-fun b!923335 () Bool)

(declare-fun Unit!31075 () Unit!31072)

(assert (=> b!923335 (= e!518057 Unit!31075)))

(declare-fun b!923336 () Bool)

(assert (=> b!923336 (= e!518054 tp_is_empty!19669)))

(declare-fun b!923337 () Bool)

(declare-fun res!622595 () Bool)

(assert (=> b!923337 (=> (not res!622595) (not e!518060))))

(assert (=> b!923337 (= res!622595 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27048 _keys!1487))))))

(declare-fun b!923338 () Bool)

(assert (=> b!923338 (= e!518062 false)))

(declare-fun lt!414745 () V!31191)

(assert (=> b!923338 (= lt!414745 (apply!638 lt!414742 k0!1099))))

(declare-fun b!923339 () Bool)

(declare-fun res!622597 () Bool)

(assert (=> b!923339 (=> (not res!622597) (not e!518060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55283 (_ BitVec 32)) Bool)

(assert (=> b!923339 (= res!622597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923340 () Bool)

(assert (=> b!923340 (= e!518057 e!518063)))

(assert (=> b!923340 (= lt!414744 (select (arr!26587 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96219 () Bool)

(assert (=> b!923340 (= c!96219 (validKeyInArray!0 lt!414744))))

(declare-fun res!622601 () Bool)

(assert (=> start!78930 (=> (not res!622601) (not e!518060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78930 (= res!622601 (validMask!0 mask!1881))))

(assert (=> start!78930 e!518060))

(assert (=> start!78930 true))

(assert (=> start!78930 tp_is_empty!19669))

(declare-fun array_inv!20792 (array!55285) Bool)

(assert (=> start!78930 (and (array_inv!20792 _values!1231) e!518064)))

(assert (=> start!78930 tp!59925))

(declare-fun array_inv!20793 (array!55283) Bool)

(assert (=> start!78930 (array_inv!20793 _keys!1487)))

(declare-fun b!923341 () Bool)

(declare-fun arrayContainsKey!0 (array!55283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923341 (= e!518061 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923342 () Bool)

(assert (=> b!923342 (= e!518061 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923343 () Bool)

(assert (=> b!923343 (= e!518056 e!518053)))

(declare-fun res!622600 () Bool)

(assert (=> b!923343 (=> (not res!622600) (not e!518053))))

(declare-fun v!791 () V!31191)

(assert (=> b!923343 (= res!622600 (and (= lt!414733 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923343 (= lt!414733 (apply!638 lt!414732 k0!1099))))

(assert (= (and start!78930 res!622601) b!923331))

(assert (= (and b!923331 res!622598) b!923339))

(assert (= (and b!923339 res!622597) b!923332))

(assert (= (and b!923332 res!622596) b!923337))

(assert (= (and b!923337 res!622595) b!923328))

(assert (= (and b!923328 res!622599) b!923343))

(assert (= (and b!923343 res!622600) b!923326))

(assert (= (and b!923326 c!96220) b!923340))

(assert (= (and b!923326 (not c!96220)) b!923335))

(assert (= (and b!923340 c!96219) b!923334))

(assert (= (and b!923340 (not c!96219)) b!923333))

(assert (= (and b!923334 c!96218) b!923341))

(assert (= (and b!923334 (not c!96218)) b!923342))

(assert (= (and b!923326 res!622594) b!923329))

(assert (= (and b!923329 res!622593) b!923338))

(assert (= (and b!923330 condMapEmpty!31260) mapIsEmpty!31260))

(assert (= (and b!923330 (not condMapEmpty!31260)) mapNonEmpty!31260))

(get-info :version)

(assert (= (and mapNonEmpty!31260 ((_ is ValueCellFull!9353) mapValue!31260)) b!923336))

(assert (= (and b!923330 ((_ is ValueCellFull!9353) mapDefault!31260)) b!923327))

(assert (= start!78930 b!923330))

(declare-fun b_lambda!13645 () Bool)

(assert (=> (not b_lambda!13645) (not b!923334)))

(declare-fun t!26594 () Bool)

(declare-fun tb!5733 () Bool)

(assert (=> (and start!78930 (= defaultEntry!1235 defaultEntry!1235) t!26594) tb!5733))

(declare-fun result!11297 () Bool)

(assert (=> tb!5733 (= result!11297 tp_is_empty!19669)))

(assert (=> b!923334 t!26594))

(declare-fun b_and!28035 () Bool)

(assert (= b_and!28033 (and (=> t!26594 result!11297) b_and!28035)))

(declare-fun m!857023 () Bool)

(assert (=> b!923326 m!857023))

(declare-fun m!857025 () Bool)

(assert (=> b!923340 m!857025))

(declare-fun m!857027 () Bool)

(assert (=> b!923340 m!857027))

(declare-fun m!857029 () Bool)

(assert (=> b!923338 m!857029))

(declare-fun m!857031 () Bool)

(assert (=> mapNonEmpty!31260 m!857031))

(declare-fun m!857033 () Bool)

(assert (=> b!923328 m!857033))

(declare-fun m!857035 () Bool)

(assert (=> b!923328 m!857035))

(declare-fun m!857037 () Bool)

(assert (=> b!923341 m!857037))

(declare-fun m!857039 () Bool)

(assert (=> b!923329 m!857039))

(declare-fun m!857041 () Bool)

(assert (=> b!923329 m!857041))

(declare-fun m!857043 () Bool)

(assert (=> b!923334 m!857043))

(declare-fun m!857045 () Bool)

(assert (=> b!923334 m!857045))

(declare-fun m!857047 () Bool)

(assert (=> b!923334 m!857047))

(declare-fun m!857049 () Bool)

(assert (=> b!923334 m!857049))

(declare-fun m!857051 () Bool)

(assert (=> b!923334 m!857051))

(declare-fun m!857053 () Bool)

(assert (=> b!923334 m!857053))

(declare-fun m!857055 () Bool)

(assert (=> b!923334 m!857055))

(assert (=> b!923334 m!857051))

(assert (=> b!923334 m!857053))

(declare-fun m!857057 () Bool)

(assert (=> b!923334 m!857057))

(assert (=> b!923334 m!857041))

(declare-fun m!857059 () Bool)

(assert (=> b!923334 m!857059))

(declare-fun m!857061 () Bool)

(assert (=> b!923334 m!857061))

(declare-fun m!857063 () Bool)

(assert (=> b!923334 m!857063))

(declare-fun m!857065 () Bool)

(assert (=> b!923334 m!857065))

(assert (=> b!923334 m!857047))

(declare-fun m!857067 () Bool)

(assert (=> b!923334 m!857067))

(declare-fun m!857069 () Bool)

(assert (=> b!923334 m!857069))

(declare-fun m!857071 () Bool)

(assert (=> b!923334 m!857071))

(declare-fun m!857073 () Bool)

(assert (=> b!923332 m!857073))

(declare-fun m!857075 () Bool)

(assert (=> b!923339 m!857075))

(declare-fun m!857077 () Bool)

(assert (=> b!923343 m!857077))

(declare-fun m!857079 () Bool)

(assert (=> start!78930 m!857079))

(declare-fun m!857081 () Bool)

(assert (=> start!78930 m!857081))

(declare-fun m!857083 () Bool)

(assert (=> start!78930 m!857083))

(check-sat (not b!923343) (not b!923334) (not b!923326) (not b!923339) (not mapNonEmpty!31260) (not b!923340) (not b_lambda!13645) (not b!923332) tp_is_empty!19669 b_and!28035 (not b!923329) (not b!923341) (not start!78930) (not b_next!17161) (not b!923338) (not b!923328))
(check-sat b_and!28035 (not b_next!17161))
