; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78966 () Bool)

(assert start!78966)

(declare-fun b_free!17197 () Bool)

(declare-fun b_next!17197 () Bool)

(assert (=> start!78966 (= b_free!17197 (not b_next!17197))))

(declare-fun tp!60033 () Bool)

(declare-fun b_and!28105 () Bool)

(assert (=> start!78966 (= tp!60033 b_and!28105)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!518710 () Bool)

(declare-fun b!924334 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55355 0))(
  ( (array!55356 (arr!26623 (Array (_ BitVec 32) (_ BitVec 64))) (size!27084 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55355)

(declare-fun arrayContainsKey!0 (array!55355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924334 (= e!518710 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924335 () Bool)

(declare-datatypes ((Unit!31134 0))(
  ( (Unit!31135) )
))
(declare-fun e!518706 () Unit!31134)

(declare-fun Unit!31136 () Unit!31134)

(assert (=> b!924335 (= e!518706 Unit!31136)))

(declare-fun b!924336 () Bool)

(declare-fun e!518709 () Bool)

(declare-fun e!518703 () Bool)

(assert (=> b!924336 (= e!518709 e!518703)))

(declare-fun res!623086 () Bool)

(assert (=> b!924336 (=> (not res!623086) (not e!518703))))

(declare-datatypes ((V!31239 0))(
  ( (V!31240 (val!9903 Int)) )
))
(declare-datatypes ((tuple2!12966 0))(
  ( (tuple2!12967 (_1!6494 (_ BitVec 64)) (_2!6494 V!31239)) )
))
(declare-datatypes ((List!18744 0))(
  ( (Nil!18741) (Cons!18740 (h!19886 tuple2!12966) (t!26662 List!18744)) )
))
(declare-datatypes ((ListLongMap!11653 0))(
  ( (ListLongMap!11654 (toList!5842 List!18744)) )
))
(declare-fun lt!415551 () ListLongMap!11653)

(declare-fun contains!4855 (ListLongMap!11653 (_ BitVec 64)) Bool)

(assert (=> b!924336 (= res!623086 (contains!4855 lt!415551 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9371 0))(
  ( (ValueCellFull!9371 (v!12420 V!31239)) (EmptyCell!9371) )
))
(declare-datatypes ((array!55357 0))(
  ( (array!55358 (arr!26624 (Array (_ BitVec 32) ValueCell!9371)) (size!27085 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55357)

(declare-fun zeroValue!1173 () V!31239)

(declare-fun minValue!1173 () V!31239)

(declare-fun getCurrentListMap!3029 (array!55355 array!55357 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 32) Int) ListLongMap!11653)

(assert (=> b!924336 (= lt!415551 (getCurrentListMap!3029 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924337 () Bool)

(declare-fun res!623084 () Bool)

(declare-fun e!518701 () Bool)

(assert (=> b!924337 (=> (not res!623084) (not e!518701))))

(declare-datatypes ((List!18745 0))(
  ( (Nil!18742) (Cons!18741 (h!19887 (_ BitVec 64)) (t!26663 List!18745)) )
))
(declare-fun arrayNoDuplicates!0 (array!55355 (_ BitVec 32) List!18745) Bool)

(assert (=> b!924337 (= res!623084 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18742))))

(declare-fun b!924338 () Bool)

(declare-fun e!518708 () Unit!31134)

(declare-fun Unit!31137 () Unit!31134)

(assert (=> b!924338 (= e!518708 Unit!31137)))

(declare-fun b!924339 () Bool)

(declare-fun res!623082 () Bool)

(assert (=> b!924339 (=> (not res!623082) (not e!518701))))

(assert (=> b!924339 (= res!623082 (and (= (size!27085 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27084 _keys!1487) (size!27085 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31314 () Bool)

(declare-fun mapRes!31314 () Bool)

(declare-fun tp!60032 () Bool)

(declare-fun e!518704 () Bool)

(assert (=> mapNonEmpty!31314 (= mapRes!31314 (and tp!60032 e!518704))))

(declare-fun mapValue!31314 () ValueCell!9371)

(declare-fun mapRest!31314 () (Array (_ BitVec 32) ValueCell!9371))

(declare-fun mapKey!31314 () (_ BitVec 32))

(assert (=> mapNonEmpty!31314 (= (arr!26624 _values!1231) (store mapRest!31314 mapKey!31314 mapValue!31314))))

(declare-fun b!924340 () Bool)

(declare-fun tp_is_empty!19705 () Bool)

(assert (=> b!924340 (= e!518704 tp_is_empty!19705)))

(declare-fun b!924341 () Bool)

(declare-fun e!518705 () Bool)

(declare-fun e!518711 () Bool)

(assert (=> b!924341 (= e!518705 e!518711)))

(declare-fun res!623083 () Bool)

(assert (=> b!924341 (=> (not res!623083) (not e!518711))))

(declare-fun lt!415546 () V!31239)

(declare-fun v!791 () V!31239)

(assert (=> b!924341 (= res!623083 (and (= lt!415546 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415554 () ListLongMap!11653)

(declare-fun apply!653 (ListLongMap!11653 (_ BitVec 64)) V!31239)

(assert (=> b!924341 (= lt!415546 (apply!653 lt!415554 k0!1099))))

(declare-fun b!924342 () Bool)

(declare-fun res!623080 () Bool)

(assert (=> b!924342 (=> (not res!623080) (not e!518701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55355 (_ BitVec 32)) Bool)

(assert (=> b!924342 (= res!623080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924343 () Bool)

(assert (=> b!924343 (= e!518711 e!518709)))

(declare-fun res!623087 () Bool)

(assert (=> b!924343 (=> (not res!623087) (not e!518709))))

(assert (=> b!924343 (= res!623087 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27084 _keys!1487)))))

(declare-fun lt!415544 () Unit!31134)

(assert (=> b!924343 (= lt!415544 e!518706)))

(declare-fun c!96382 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924343 (= c!96382 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31314 () Bool)

(assert (=> mapIsEmpty!31314 mapRes!31314))

(declare-fun res!623079 () Bool)

(assert (=> start!78966 (=> (not res!623079) (not e!518701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78966 (= res!623079 (validMask!0 mask!1881))))

(assert (=> start!78966 e!518701))

(assert (=> start!78966 true))

(assert (=> start!78966 tp_is_empty!19705))

(declare-fun e!518712 () Bool)

(declare-fun array_inv!20820 (array!55357) Bool)

(assert (=> start!78966 (and (array_inv!20820 _values!1231) e!518712)))

(assert (=> start!78966 tp!60033))

(declare-fun array_inv!20821 (array!55355) Bool)

(assert (=> start!78966 (array_inv!20821 _keys!1487)))

(declare-fun b!924344 () Bool)

(assert (=> b!924344 (= e!518701 e!518705)))

(declare-fun res!623085 () Bool)

(assert (=> b!924344 (=> (not res!623085) (not e!518705))))

(assert (=> b!924344 (= res!623085 (contains!4855 lt!415554 k0!1099))))

(assert (=> b!924344 (= lt!415554 (getCurrentListMap!3029 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924345 () Bool)

(assert (=> b!924345 (= e!518706 e!518708)))

(declare-fun lt!415548 () (_ BitVec 64))

(assert (=> b!924345 (= lt!415548 (select (arr!26623 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96380 () Bool)

(assert (=> b!924345 (= c!96380 (validKeyInArray!0 lt!415548))))

(declare-fun b!924346 () Bool)

(declare-fun e!518707 () Bool)

(assert (=> b!924346 (= e!518707 tp_is_empty!19705)))

(declare-fun b!924347 () Bool)

(assert (=> b!924347 (= e!518710 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924348 () Bool)

(declare-fun res!623081 () Bool)

(assert (=> b!924348 (=> (not res!623081) (not e!518701))))

(assert (=> b!924348 (= res!623081 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27084 _keys!1487))))))

(declare-fun b!924349 () Bool)

(assert (=> b!924349 (= e!518712 (and e!518707 mapRes!31314))))

(declare-fun condMapEmpty!31314 () Bool)

(declare-fun mapDefault!31314 () ValueCell!9371)

(assert (=> b!924349 (= condMapEmpty!31314 (= (arr!26624 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9371)) mapDefault!31314)))))

(declare-fun b!924350 () Bool)

(assert (=> b!924350 (= e!518703 false)))

(declare-fun lt!415549 () V!31239)

(assert (=> b!924350 (= lt!415549 (apply!653 lt!415551 k0!1099))))

(declare-fun b!924351 () Bool)

(declare-fun lt!415555 () ListLongMap!11653)

(assert (=> b!924351 (= (apply!653 lt!415555 k0!1099) lt!415546)))

(declare-fun lt!415543 () Unit!31134)

(declare-fun lt!415553 () V!31239)

(declare-fun addApplyDifferent!369 (ListLongMap!11653 (_ BitVec 64) V!31239 (_ BitVec 64)) Unit!31134)

(assert (=> b!924351 (= lt!415543 (addApplyDifferent!369 lt!415554 lt!415548 lt!415553 k0!1099))))

(assert (=> b!924351 (not (= lt!415548 k0!1099))))

(declare-fun lt!415542 () Unit!31134)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55355 (_ BitVec 64) (_ BitVec 32) List!18745) Unit!31134)

(assert (=> b!924351 (= lt!415542 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18742))))

(assert (=> b!924351 e!518710))

(declare-fun c!96381 () Bool)

(assert (=> b!924351 (= c!96381 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415547 () Unit!31134)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!229 (array!55355 array!55357 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 64) (_ BitVec 32) Int) Unit!31134)

(assert (=> b!924351 (= lt!415547 (lemmaListMapContainsThenArrayContainsFrom!229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924351 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18742)))

(declare-fun lt!415550 () Unit!31134)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55355 (_ BitVec 32) (_ BitVec 32)) Unit!31134)

(assert (=> b!924351 (= lt!415550 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924351 (contains!4855 lt!415555 k0!1099)))

(declare-fun lt!415556 () tuple2!12966)

(declare-fun +!2741 (ListLongMap!11653 tuple2!12966) ListLongMap!11653)

(assert (=> b!924351 (= lt!415555 (+!2741 lt!415554 lt!415556))))

(declare-fun lt!415545 () Unit!31134)

(declare-fun addStillContains!438 (ListLongMap!11653 (_ BitVec 64) V!31239 (_ BitVec 64)) Unit!31134)

(assert (=> b!924351 (= lt!415545 (addStillContains!438 lt!415554 lt!415548 lt!415553 k0!1099))))

(assert (=> b!924351 (= (getCurrentListMap!3029 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2741 (getCurrentListMap!3029 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415556))))

(assert (=> b!924351 (= lt!415556 (tuple2!12967 lt!415548 lt!415553))))

(declare-fun get!14002 (ValueCell!9371 V!31239) V!31239)

(declare-fun dynLambda!1497 (Int (_ BitVec 64)) V!31239)

(assert (=> b!924351 (= lt!415553 (get!14002 (select (arr!26624 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1497 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415552 () Unit!31134)

(declare-fun lemmaListMapRecursiveValidKeyArray!105 (array!55355 array!55357 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 32) Int) Unit!31134)

(assert (=> b!924351 (= lt!415552 (lemmaListMapRecursiveValidKeyArray!105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924351 (= e!518708 lt!415543)))

(assert (= (and start!78966 res!623079) b!924339))

(assert (= (and b!924339 res!623082) b!924342))

(assert (= (and b!924342 res!623080) b!924337))

(assert (= (and b!924337 res!623084) b!924348))

(assert (= (and b!924348 res!623081) b!924344))

(assert (= (and b!924344 res!623085) b!924341))

(assert (= (and b!924341 res!623083) b!924343))

(assert (= (and b!924343 c!96382) b!924345))

(assert (= (and b!924343 (not c!96382)) b!924335))

(assert (= (and b!924345 c!96380) b!924351))

(assert (= (and b!924345 (not c!96380)) b!924338))

(assert (= (and b!924351 c!96381) b!924334))

(assert (= (and b!924351 (not c!96381)) b!924347))

(assert (= (and b!924343 res!623087) b!924336))

(assert (= (and b!924336 res!623086) b!924350))

(assert (= (and b!924349 condMapEmpty!31314) mapIsEmpty!31314))

(assert (= (and b!924349 (not condMapEmpty!31314)) mapNonEmpty!31314))

(get-info :version)

(assert (= (and mapNonEmpty!31314 ((_ is ValueCellFull!9371) mapValue!31314)) b!924340))

(assert (= (and b!924349 ((_ is ValueCellFull!9371) mapDefault!31314)) b!924346))

(assert (= start!78966 b!924349))

(declare-fun b_lambda!13681 () Bool)

(assert (=> (not b_lambda!13681) (not b!924351)))

(declare-fun t!26661 () Bool)

(declare-fun tb!5769 () Bool)

(assert (=> (and start!78966 (= defaultEntry!1235 defaultEntry!1235) t!26661) tb!5769))

(declare-fun result!11369 () Bool)

(assert (=> tb!5769 (= result!11369 tp_is_empty!19705)))

(assert (=> b!924351 t!26661))

(declare-fun b_and!28107 () Bool)

(assert (= b_and!28105 (and (=> t!26661 result!11369) b_and!28107)))

(declare-fun m!858139 () Bool)

(assert (=> b!924341 m!858139))

(declare-fun m!858141 () Bool)

(assert (=> b!924343 m!858141))

(declare-fun m!858143 () Bool)

(assert (=> b!924351 m!858143))

(declare-fun m!858145 () Bool)

(assert (=> b!924351 m!858145))

(declare-fun m!858147 () Bool)

(assert (=> b!924351 m!858147))

(declare-fun m!858149 () Bool)

(assert (=> b!924351 m!858149))

(declare-fun m!858151 () Bool)

(assert (=> b!924351 m!858151))

(declare-fun m!858153 () Bool)

(assert (=> b!924351 m!858153))

(declare-fun m!858155 () Bool)

(assert (=> b!924351 m!858155))

(assert (=> b!924351 m!858147))

(assert (=> b!924351 m!858149))

(declare-fun m!858157 () Bool)

(assert (=> b!924351 m!858157))

(declare-fun m!858159 () Bool)

(assert (=> b!924351 m!858159))

(declare-fun m!858161 () Bool)

(assert (=> b!924351 m!858161))

(declare-fun m!858163 () Bool)

(assert (=> b!924351 m!858163))

(declare-fun m!858165 () Bool)

(assert (=> b!924351 m!858165))

(declare-fun m!858167 () Bool)

(assert (=> b!924351 m!858167))

(declare-fun m!858169 () Bool)

(assert (=> b!924351 m!858169))

(assert (=> b!924351 m!858153))

(declare-fun m!858171 () Bool)

(assert (=> b!924351 m!858171))

(declare-fun m!858173 () Bool)

(assert (=> b!924351 m!858173))

(declare-fun m!858175 () Bool)

(assert (=> mapNonEmpty!31314 m!858175))

(declare-fun m!858177 () Bool)

(assert (=> b!924337 m!858177))

(declare-fun m!858179 () Bool)

(assert (=> start!78966 m!858179))

(declare-fun m!858181 () Bool)

(assert (=> start!78966 m!858181))

(declare-fun m!858183 () Bool)

(assert (=> start!78966 m!858183))

(declare-fun m!858185 () Bool)

(assert (=> b!924350 m!858185))

(declare-fun m!858187 () Bool)

(assert (=> b!924344 m!858187))

(declare-fun m!858189 () Bool)

(assert (=> b!924344 m!858189))

(declare-fun m!858191 () Bool)

(assert (=> b!924342 m!858191))

(declare-fun m!858193 () Bool)

(assert (=> b!924334 m!858193))

(declare-fun m!858195 () Bool)

(assert (=> b!924345 m!858195))

(declare-fun m!858197 () Bool)

(assert (=> b!924345 m!858197))

(declare-fun m!858199 () Bool)

(assert (=> b!924336 m!858199))

(assert (=> b!924336 m!858159))

(check-sat (not b!924341) (not b_next!17197) (not b!924350) (not b!924342) (not b!924343) b_and!28107 (not b!924351) (not mapNonEmpty!31314) (not b!924345) (not b!924344) (not b!924334) (not b!924336) (not start!78966) tp_is_empty!19705 (not b_lambda!13681) (not b!924337))
(check-sat b_and!28107 (not b_next!17197))
