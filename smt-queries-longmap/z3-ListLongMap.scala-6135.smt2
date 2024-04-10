; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78920 () Bool)

(assert start!78920)

(declare-fun b_free!17133 () Bool)

(declare-fun b_next!17133 () Bool)

(assert (=> start!78920 (= b_free!17133 (not b_next!17133))))

(declare-fun tp!59839 () Bool)

(declare-fun b_and!28003 () Bool)

(assert (=> start!78920 (= tp!59839 b_and!28003)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!922847 () Bool)

(declare-fun e!517789 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55258 0))(
  ( (array!55259 (arr!26574 (Array (_ BitVec 32) (_ BitVec 64))) (size!27033 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55258)

(declare-fun arrayContainsKey!0 (array!55258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922847 (= e!517789 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922848 () Bool)

(declare-fun e!517791 () Bool)

(assert (=> b!922848 (= e!517791 (not true))))

(declare-fun lt!414475 () (_ BitVec 64))

(assert (=> b!922848 (not (= lt!414475 k0!1099))))

(declare-datatypes ((Unit!31128 0))(
  ( (Unit!31129) )
))
(declare-fun lt!414470 () Unit!31128)

(declare-datatypes ((List!18649 0))(
  ( (Nil!18646) (Cons!18645 (h!19791 (_ BitVec 64)) (t!26512 List!18649)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55258 (_ BitVec 64) (_ BitVec 32) List!18649) Unit!31128)

(assert (=> b!922848 (= lt!414470 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18646))))

(assert (=> b!922848 e!517789))

(declare-fun c!96201 () Bool)

(assert (=> b!922848 (= c!96201 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31153 0))(
  ( (V!31154 (val!9871 Int)) )
))
(declare-datatypes ((ValueCell!9339 0))(
  ( (ValueCellFull!9339 (v!12389 V!31153)) (EmptyCell!9339) )
))
(declare-datatypes ((array!55260 0))(
  ( (array!55261 (arr!26575 (Array (_ BitVec 32) ValueCell!9339)) (size!27034 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55260)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414474 () Unit!31128)

(declare-fun zeroValue!1173 () V!31153)

(declare-fun minValue!1173 () V!31153)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!197 (array!55258 array!55260 (_ BitVec 32) (_ BitVec 32) V!31153 V!31153 (_ BitVec 64) (_ BitVec 32) Int) Unit!31128)

(assert (=> b!922848 (= lt!414474 (lemmaListMapContainsThenArrayContainsFrom!197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55258 (_ BitVec 32) List!18649) Bool)

(assert (=> b!922848 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18646)))

(declare-fun lt!414478 () Unit!31128)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55258 (_ BitVec 32) (_ BitVec 32)) Unit!31128)

(assert (=> b!922848 (= lt!414478 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12844 0))(
  ( (tuple2!12845 (_1!6433 (_ BitVec 64)) (_2!6433 V!31153)) )
))
(declare-datatypes ((List!18650 0))(
  ( (Nil!18647) (Cons!18646 (h!19792 tuple2!12844) (t!26513 List!18650)) )
))
(declare-datatypes ((ListLongMap!11541 0))(
  ( (ListLongMap!11542 (toList!5786 List!18650)) )
))
(declare-fun lt!414471 () ListLongMap!11541)

(declare-fun lt!414473 () tuple2!12844)

(declare-fun contains!4849 (ListLongMap!11541 (_ BitVec 64)) Bool)

(declare-fun +!2690 (ListLongMap!11541 tuple2!12844) ListLongMap!11541)

(assert (=> b!922848 (contains!4849 (+!2690 lt!414471 lt!414473) k0!1099)))

(declare-fun lt!414472 () V!31153)

(declare-fun lt!414477 () Unit!31128)

(declare-fun addStillContains!414 (ListLongMap!11541 (_ BitVec 64) V!31153 (_ BitVec 64)) Unit!31128)

(assert (=> b!922848 (= lt!414477 (addStillContains!414 lt!414471 lt!414475 lt!414472 k0!1099))))

(declare-fun getCurrentListMap!3040 (array!55258 array!55260 (_ BitVec 32) (_ BitVec 32) V!31153 V!31153 (_ BitVec 32) Int) ListLongMap!11541)

(assert (=> b!922848 (= (getCurrentListMap!3040 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2690 (getCurrentListMap!3040 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414473))))

(assert (=> b!922848 (= lt!414473 (tuple2!12845 lt!414475 lt!414472))))

(declare-fun get!13957 (ValueCell!9339 V!31153) V!31153)

(declare-fun dynLambda!1479 (Int (_ BitVec 64)) V!31153)

(assert (=> b!922848 (= lt!414472 (get!13957 (select (arr!26575 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1479 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414476 () Unit!31128)

(declare-fun lemmaListMapRecursiveValidKeyArray!80 (array!55258 array!55260 (_ BitVec 32) (_ BitVec 32) V!31153 V!31153 (_ BitVec 32) Int) Unit!31128)

(assert (=> b!922848 (= lt!414476 (lemmaListMapRecursiveValidKeyArray!80 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922849 () Bool)

(declare-fun res!622311 () Bool)

(declare-fun e!517792 () Bool)

(assert (=> b!922849 (=> (not res!622311) (not e!517792))))

(assert (=> b!922849 (= res!622311 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922850 () Bool)

(declare-fun e!517786 () Bool)

(declare-fun tp_is_empty!19641 () Bool)

(assert (=> b!922850 (= e!517786 tp_is_empty!19641)))

(declare-fun mapNonEmpty!31218 () Bool)

(declare-fun mapRes!31218 () Bool)

(declare-fun tp!59840 () Bool)

(assert (=> mapNonEmpty!31218 (= mapRes!31218 (and tp!59840 e!517786))))

(declare-fun mapValue!31218 () ValueCell!9339)

(declare-fun mapKey!31218 () (_ BitVec 32))

(declare-fun mapRest!31218 () (Array (_ BitVec 32) ValueCell!9339))

(assert (=> mapNonEmpty!31218 (= (arr!26575 _values!1231) (store mapRest!31218 mapKey!31218 mapValue!31218))))

(declare-fun b!922851 () Bool)

(assert (=> b!922851 (= e!517789 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922852 () Bool)

(declare-fun e!517788 () Bool)

(assert (=> b!922852 (= e!517788 tp_is_empty!19641)))

(declare-fun b!922853 () Bool)

(declare-fun res!622303 () Bool)

(declare-fun e!517790 () Bool)

(assert (=> b!922853 (=> (not res!622303) (not e!517790))))

(assert (=> b!922853 (= res!622303 (and (= (size!27034 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27033 _keys!1487) (size!27034 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922854 () Bool)

(declare-fun res!622304 () Bool)

(assert (=> b!922854 (=> (not res!622304) (not e!517790))))

(assert (=> b!922854 (= res!622304 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18646))))

(declare-fun mapIsEmpty!31218 () Bool)

(assert (=> mapIsEmpty!31218 mapRes!31218))

(declare-fun b!922855 () Bool)

(declare-fun res!622309 () Bool)

(assert (=> b!922855 (=> (not res!622309) (not e!517792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922855 (= res!622309 (validKeyInArray!0 k0!1099))))

(declare-fun b!922857 () Bool)

(declare-fun res!622307 () Bool)

(assert (=> b!922857 (=> (not res!622307) (not e!517790))))

(assert (=> b!922857 (= res!622307 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27033 _keys!1487))))))

(declare-fun b!922858 () Bool)

(assert (=> b!922858 (= e!517790 e!517792)))

(declare-fun res!622310 () Bool)

(assert (=> b!922858 (=> (not res!622310) (not e!517792))))

(assert (=> b!922858 (= res!622310 (contains!4849 lt!414471 k0!1099))))

(assert (=> b!922858 (= lt!414471 (getCurrentListMap!3040 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922859 () Bool)

(declare-fun e!517787 () Bool)

(assert (=> b!922859 (= e!517787 (and e!517788 mapRes!31218))))

(declare-fun condMapEmpty!31218 () Bool)

(declare-fun mapDefault!31218 () ValueCell!9339)

(assert (=> b!922859 (= condMapEmpty!31218 (= (arr!26575 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9339)) mapDefault!31218)))))

(declare-fun b!922860 () Bool)

(assert (=> b!922860 (= e!517792 e!517791)))

(declare-fun res!622306 () Bool)

(assert (=> b!922860 (=> (not res!622306) (not e!517791))))

(assert (=> b!922860 (= res!622306 (validKeyInArray!0 lt!414475))))

(assert (=> b!922860 (= lt!414475 (select (arr!26574 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922861 () Bool)

(declare-fun res!622312 () Bool)

(assert (=> b!922861 (=> (not res!622312) (not e!517792))))

(declare-fun v!791 () V!31153)

(declare-fun apply!619 (ListLongMap!11541 (_ BitVec 64)) V!31153)

(assert (=> b!922861 (= res!622312 (= (apply!619 lt!414471 k0!1099) v!791))))

(declare-fun res!622308 () Bool)

(assert (=> start!78920 (=> (not res!622308) (not e!517790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78920 (= res!622308 (validMask!0 mask!1881))))

(assert (=> start!78920 e!517790))

(assert (=> start!78920 true))

(assert (=> start!78920 tp_is_empty!19641))

(declare-fun array_inv!20698 (array!55260) Bool)

(assert (=> start!78920 (and (array_inv!20698 _values!1231) e!517787)))

(assert (=> start!78920 tp!59839))

(declare-fun array_inv!20699 (array!55258) Bool)

(assert (=> start!78920 (array_inv!20699 _keys!1487)))

(declare-fun b!922856 () Bool)

(declare-fun res!622305 () Bool)

(assert (=> b!922856 (=> (not res!622305) (not e!517790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55258 (_ BitVec 32)) Bool)

(assert (=> b!922856 (= res!622305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78920 res!622308) b!922853))

(assert (= (and b!922853 res!622303) b!922856))

(assert (= (and b!922856 res!622305) b!922854))

(assert (= (and b!922854 res!622304) b!922857))

(assert (= (and b!922857 res!622307) b!922858))

(assert (= (and b!922858 res!622310) b!922861))

(assert (= (and b!922861 res!622312) b!922849))

(assert (= (and b!922849 res!622311) b!922855))

(assert (= (and b!922855 res!622309) b!922860))

(assert (= (and b!922860 res!622306) b!922848))

(assert (= (and b!922848 c!96201) b!922847))

(assert (= (and b!922848 (not c!96201)) b!922851))

(assert (= (and b!922859 condMapEmpty!31218) mapIsEmpty!31218))

(assert (= (and b!922859 (not condMapEmpty!31218)) mapNonEmpty!31218))

(get-info :version)

(assert (= (and mapNonEmpty!31218 ((_ is ValueCellFull!9339) mapValue!31218)) b!922850))

(assert (= (and b!922859 ((_ is ValueCellFull!9339) mapDefault!31218)) b!922852))

(assert (= start!78920 b!922859))

(declare-fun b_lambda!13635 () Bool)

(assert (=> (not b_lambda!13635) (not b!922848)))

(declare-fun t!26511 () Bool)

(declare-fun tb!5713 () Bool)

(assert (=> (and start!78920 (= defaultEntry!1235 defaultEntry!1235) t!26511) tb!5713))

(declare-fun result!11249 () Bool)

(assert (=> tb!5713 (= result!11249 tp_is_empty!19641)))

(assert (=> b!922848 t!26511))

(declare-fun b_and!28005 () Bool)

(assert (= b_and!28003 (and (=> t!26511 result!11249) b_and!28005)))

(declare-fun m!856977 () Bool)

(assert (=> b!922861 m!856977))

(declare-fun m!856979 () Bool)

(assert (=> mapNonEmpty!31218 m!856979))

(declare-fun m!856981 () Bool)

(assert (=> b!922848 m!856981))

(declare-fun m!856983 () Bool)

(assert (=> b!922848 m!856983))

(declare-fun m!856985 () Bool)

(assert (=> b!922848 m!856985))

(declare-fun m!856987 () Bool)

(assert (=> b!922848 m!856987))

(declare-fun m!856989 () Bool)

(assert (=> b!922848 m!856989))

(declare-fun m!856991 () Bool)

(assert (=> b!922848 m!856991))

(assert (=> b!922848 m!856989))

(declare-fun m!856993 () Bool)

(assert (=> b!922848 m!856993))

(declare-fun m!856995 () Bool)

(assert (=> b!922848 m!856995))

(assert (=> b!922848 m!856981))

(declare-fun m!856997 () Bool)

(assert (=> b!922848 m!856997))

(declare-fun m!856999 () Bool)

(assert (=> b!922848 m!856999))

(declare-fun m!857001 () Bool)

(assert (=> b!922848 m!857001))

(declare-fun m!857003 () Bool)

(assert (=> b!922848 m!857003))

(declare-fun m!857005 () Bool)

(assert (=> b!922848 m!857005))

(assert (=> b!922848 m!856991))

(assert (=> b!922848 m!857003))

(declare-fun m!857007 () Bool)

(assert (=> b!922848 m!857007))

(declare-fun m!857009 () Bool)

(assert (=> b!922858 m!857009))

(declare-fun m!857011 () Bool)

(assert (=> b!922858 m!857011))

(declare-fun m!857013 () Bool)

(assert (=> b!922855 m!857013))

(declare-fun m!857015 () Bool)

(assert (=> start!78920 m!857015))

(declare-fun m!857017 () Bool)

(assert (=> start!78920 m!857017))

(declare-fun m!857019 () Bool)

(assert (=> start!78920 m!857019))

(declare-fun m!857021 () Bool)

(assert (=> b!922856 m!857021))

(declare-fun m!857023 () Bool)

(assert (=> b!922847 m!857023))

(declare-fun m!857025 () Bool)

(assert (=> b!922860 m!857025))

(declare-fun m!857027 () Bool)

(assert (=> b!922860 m!857027))

(declare-fun m!857029 () Bool)

(assert (=> b!922854 m!857029))

(check-sat (not b!922848) (not b!922856) (not b!922860) (not b!922854) (not b!922858) (not b!922855) (not b!922861) (not b_lambda!13635) (not mapNonEmpty!31218) (not start!78920) tp_is_empty!19641 (not b!922847) (not b_next!17133) b_and!28005)
(check-sat b_and!28005 (not b_next!17133))
