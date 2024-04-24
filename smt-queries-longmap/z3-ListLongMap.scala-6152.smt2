; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79188 () Bool)

(assert start!79188)

(declare-fun b_free!17233 () Bool)

(declare-fun b_next!17233 () Bool)

(assert (=> start!79188 (= b_free!17233 (not b_next!17233))))

(declare-fun tp!60140 () Bool)

(declare-fun b_and!28213 () Bool)

(assert (=> start!79188 (= tp!60140 b_and!28213)))

(declare-fun b!926542 () Bool)

(declare-datatypes ((Unit!31273 0))(
  ( (Unit!31274) )
))
(declare-fun e!520109 () Unit!31273)

(declare-fun Unit!31275 () Unit!31273)

(assert (=> b!926542 (= e!520109 Unit!31275)))

(declare-fun b!926544 () Bool)

(declare-fun res!624083 () Bool)

(declare-fun e!520119 () Bool)

(assert (=> b!926544 (=> (not res!624083) (not e!520119))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55499 0))(
  ( (array!55500 (arr!26690 (Array (_ BitVec 32) (_ BitVec 64))) (size!27150 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55499)

(assert (=> b!926544 (= res!624083 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27150 _keys!1487))))))

(declare-fun b!926545 () Bool)

(declare-fun e!520116 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!926545 (= e!520116 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926546 () Bool)

(declare-datatypes ((V!31287 0))(
  ( (V!31288 (val!9921 Int)) )
))
(declare-datatypes ((tuple2!12924 0))(
  ( (tuple2!12925 (_1!6473 (_ BitVec 64)) (_2!6473 V!31287)) )
))
(declare-datatypes ((List!18735 0))(
  ( (Nil!18732) (Cons!18731 (h!19883 tuple2!12924) (t!26690 List!18735)) )
))
(declare-datatypes ((ListLongMap!11623 0))(
  ( (ListLongMap!11624 (toList!5827 List!18735)) )
))
(declare-fun lt!416983 () ListLongMap!11623)

(declare-fun lt!416985 () V!31287)

(declare-fun apply!678 (ListLongMap!11623 (_ BitVec 64)) V!31287)

(assert (=> b!926546 (= (apply!678 lt!416983 k0!1099) lt!416985)))

(declare-fun lt!416993 () Unit!31273)

(declare-fun lt!416980 () V!31287)

(declare-fun lt!416990 () (_ BitVec 64))

(declare-fun lt!416987 () ListLongMap!11623)

(declare-fun addApplyDifferent!378 (ListLongMap!11623 (_ BitVec 64) V!31287 (_ BitVec 64)) Unit!31273)

(assert (=> b!926546 (= lt!416993 (addApplyDifferent!378 lt!416987 lt!416990 lt!416980 k0!1099))))

(assert (=> b!926546 (not (= lt!416990 k0!1099))))

(declare-fun lt!416988 () Unit!31273)

(declare-datatypes ((List!18736 0))(
  ( (Nil!18733) (Cons!18732 (h!19884 (_ BitVec 64)) (t!26691 List!18736)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55499 (_ BitVec 64) (_ BitVec 32) List!18736) Unit!31273)

(assert (=> b!926546 (= lt!416988 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18733))))

(assert (=> b!926546 e!520116))

(declare-fun c!96890 () Bool)

(assert (=> b!926546 (= c!96890 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9389 0))(
  ( (ValueCellFull!9389 (v!12436 V!31287)) (EmptyCell!9389) )
))
(declare-datatypes ((array!55501 0))(
  ( (array!55502 (arr!26691 (Array (_ BitVec 32) ValueCell!9389)) (size!27151 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55501)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!416984 () Unit!31273)

(declare-fun zeroValue!1173 () V!31287)

(declare-fun minValue!1173 () V!31287)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!233 (array!55499 array!55501 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 64) (_ BitVec 32) Int) Unit!31273)

(assert (=> b!926546 (= lt!416984 (lemmaListMapContainsThenArrayContainsFrom!233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55499 (_ BitVec 32) List!18736) Bool)

(assert (=> b!926546 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18733)))

(declare-fun lt!416986 () Unit!31273)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55499 (_ BitVec 32) (_ BitVec 32)) Unit!31273)

(assert (=> b!926546 (= lt!416986 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4899 (ListLongMap!11623 (_ BitVec 64)) Bool)

(assert (=> b!926546 (contains!4899 lt!416983 k0!1099)))

(declare-fun lt!416992 () tuple2!12924)

(declare-fun +!2742 (ListLongMap!11623 tuple2!12924) ListLongMap!11623)

(assert (=> b!926546 (= lt!416983 (+!2742 lt!416987 lt!416992))))

(declare-fun lt!416979 () Unit!31273)

(declare-fun addStillContains!451 (ListLongMap!11623 (_ BitVec 64) V!31287 (_ BitVec 64)) Unit!31273)

(assert (=> b!926546 (= lt!416979 (addStillContains!451 lt!416987 lt!416990 lt!416980 k0!1099))))

(declare-fun getCurrentListMap!3077 (array!55499 array!55501 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 32) Int) ListLongMap!11623)

(assert (=> b!926546 (= (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2742 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416992))))

(assert (=> b!926546 (= lt!416992 (tuple2!12925 lt!416990 lt!416980))))

(declare-fun get!14055 (ValueCell!9389 V!31287) V!31287)

(declare-fun dynLambda!1539 (Int (_ BitVec 64)) V!31287)

(assert (=> b!926546 (= lt!416980 (get!14055 (select (arr!26691 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1539 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416978 () Unit!31273)

(declare-fun lemmaListMapRecursiveValidKeyArray!122 (array!55499 array!55501 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 32) Int) Unit!31273)

(assert (=> b!926546 (= lt!416978 (lemmaListMapRecursiveValidKeyArray!122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926546 (= e!520109 lt!416993)))

(declare-fun b!926547 () Bool)

(declare-fun e!520115 () Bool)

(declare-fun e!520117 () Bool)

(assert (=> b!926547 (= e!520115 e!520117)))

(declare-fun res!624078 () Bool)

(assert (=> b!926547 (=> (not res!624078) (not e!520117))))

(assert (=> b!926547 (= res!624078 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27150 _keys!1487)))))

(declare-fun lt!416991 () Unit!31273)

(declare-fun e!520112 () Unit!31273)

(assert (=> b!926547 (= lt!416991 e!520112)))

(declare-fun c!96889 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926547 (= c!96889 (validKeyInArray!0 k0!1099))))

(declare-fun b!926548 () Bool)

(declare-fun e!520113 () Bool)

(assert (=> b!926548 (= e!520113 (not true))))

(declare-fun e!520111 () Bool)

(assert (=> b!926548 e!520111))

(declare-fun res!624077 () Bool)

(assert (=> b!926548 (=> (not res!624077) (not e!520111))))

(declare-fun lt!416989 () ListLongMap!11623)

(assert (=> b!926548 (= res!624077 (contains!4899 lt!416989 k0!1099))))

(assert (=> b!926548 (= lt!416989 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31287)

(declare-fun lt!416982 () Unit!31273)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!74 (array!55499 array!55501 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 64) V!31287 (_ BitVec 32) Int) Unit!31273)

(assert (=> b!926548 (= lt!416982 (lemmaListMapApplyFromThenApplyFromZero!74 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926549 () Bool)

(assert (=> b!926549 (= e!520112 e!520109)))

(assert (=> b!926549 (= lt!416990 (select (arr!26690 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96891 () Bool)

(assert (=> b!926549 (= c!96891 (validKeyInArray!0 lt!416990))))

(declare-fun mapIsEmpty!31368 () Bool)

(declare-fun mapRes!31368 () Bool)

(assert (=> mapIsEmpty!31368 mapRes!31368))

(declare-fun b!926550 () Bool)

(declare-fun e!520108 () Bool)

(assert (=> b!926550 (= e!520108 e!520115)))

(declare-fun res!624085 () Bool)

(assert (=> b!926550 (=> (not res!624085) (not e!520115))))

(assert (=> b!926550 (= res!624085 (and (= lt!416985 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926550 (= lt!416985 (apply!678 lt!416987 k0!1099))))

(declare-fun b!926551 () Bool)

(assert (=> b!926551 (= e!520111 (= (apply!678 lt!416989 k0!1099) v!791))))

(declare-fun b!926543 () Bool)

(assert (=> b!926543 (= e!520117 e!520113)))

(declare-fun res!624084 () Bool)

(assert (=> b!926543 (=> (not res!624084) (not e!520113))))

(declare-fun lt!416981 () ListLongMap!11623)

(assert (=> b!926543 (= res!624084 (contains!4899 lt!416981 k0!1099))))

(assert (=> b!926543 (= lt!416981 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!624082 () Bool)

(assert (=> start!79188 (=> (not res!624082) (not e!520119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79188 (= res!624082 (validMask!0 mask!1881))))

(assert (=> start!79188 e!520119))

(assert (=> start!79188 true))

(declare-fun tp_is_empty!19741 () Bool)

(assert (=> start!79188 tp_is_empty!19741))

(declare-fun e!520120 () Bool)

(declare-fun array_inv!20886 (array!55501) Bool)

(assert (=> start!79188 (and (array_inv!20886 _values!1231) e!520120)))

(assert (=> start!79188 tp!60140))

(declare-fun array_inv!20887 (array!55499) Bool)

(assert (=> start!79188 (array_inv!20887 _keys!1487)))

(declare-fun b!926552 () Bool)

(declare-fun e!520118 () Bool)

(assert (=> b!926552 (= e!520118 tp_is_empty!19741)))

(declare-fun b!926553 () Bool)

(assert (=> b!926553 (= e!520119 e!520108)))

(declare-fun res!624081 () Bool)

(assert (=> b!926553 (=> (not res!624081) (not e!520108))))

(assert (=> b!926553 (= res!624081 (contains!4899 lt!416987 k0!1099))))

(assert (=> b!926553 (= lt!416987 (getCurrentListMap!3077 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926554 () Bool)

(assert (=> b!926554 (= e!520120 (and e!520118 mapRes!31368))))

(declare-fun condMapEmpty!31368 () Bool)

(declare-fun mapDefault!31368 () ValueCell!9389)

(assert (=> b!926554 (= condMapEmpty!31368 (= (arr!26691 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9389)) mapDefault!31368)))))

(declare-fun mapNonEmpty!31368 () Bool)

(declare-fun tp!60141 () Bool)

(declare-fun e!520114 () Bool)

(assert (=> mapNonEmpty!31368 (= mapRes!31368 (and tp!60141 e!520114))))

(declare-fun mapRest!31368 () (Array (_ BitVec 32) ValueCell!9389))

(declare-fun mapValue!31368 () ValueCell!9389)

(declare-fun mapKey!31368 () (_ BitVec 32))

(assert (=> mapNonEmpty!31368 (= (arr!26691 _values!1231) (store mapRest!31368 mapKey!31368 mapValue!31368))))

(declare-fun b!926555 () Bool)

(declare-fun res!624087 () Bool)

(assert (=> b!926555 (=> (not res!624087) (not e!520119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55499 (_ BitVec 32)) Bool)

(assert (=> b!926555 (= res!624087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926556 () Bool)

(declare-fun res!624079 () Bool)

(assert (=> b!926556 (=> (not res!624079) (not e!520119))))

(assert (=> b!926556 (= res!624079 (and (= (size!27151 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27150 _keys!1487) (size!27151 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926557 () Bool)

(declare-fun arrayContainsKey!0 (array!55499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926557 (= e!520116 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926558 () Bool)

(declare-fun Unit!31276 () Unit!31273)

(assert (=> b!926558 (= e!520112 Unit!31276)))

(declare-fun b!926559 () Bool)

(assert (=> b!926559 (= e!520114 tp_is_empty!19741)))

(declare-fun b!926560 () Bool)

(declare-fun res!624080 () Bool)

(assert (=> b!926560 (=> (not res!624080) (not e!520119))))

(assert (=> b!926560 (= res!624080 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18733))))

(declare-fun b!926561 () Bool)

(declare-fun res!624086 () Bool)

(assert (=> b!926561 (=> (not res!624086) (not e!520113))))

(assert (=> b!926561 (= res!624086 (= (apply!678 lt!416981 k0!1099) v!791))))

(assert (= (and start!79188 res!624082) b!926556))

(assert (= (and b!926556 res!624079) b!926555))

(assert (= (and b!926555 res!624087) b!926560))

(assert (= (and b!926560 res!624080) b!926544))

(assert (= (and b!926544 res!624083) b!926553))

(assert (= (and b!926553 res!624081) b!926550))

(assert (= (and b!926550 res!624085) b!926547))

(assert (= (and b!926547 c!96889) b!926549))

(assert (= (and b!926547 (not c!96889)) b!926558))

(assert (= (and b!926549 c!96891) b!926546))

(assert (= (and b!926549 (not c!96891)) b!926542))

(assert (= (and b!926546 c!96890) b!926557))

(assert (= (and b!926546 (not c!96890)) b!926545))

(assert (= (and b!926547 res!624078) b!926543))

(assert (= (and b!926543 res!624084) b!926561))

(assert (= (and b!926561 res!624086) b!926548))

(assert (= (and b!926548 res!624077) b!926551))

(assert (= (and b!926554 condMapEmpty!31368) mapIsEmpty!31368))

(assert (= (and b!926554 (not condMapEmpty!31368)) mapNonEmpty!31368))

(get-info :version)

(assert (= (and mapNonEmpty!31368 ((_ is ValueCellFull!9389) mapValue!31368)) b!926559))

(assert (= (and b!926554 ((_ is ValueCellFull!9389) mapDefault!31368)) b!926552))

(assert (= start!79188 b!926554))

(declare-fun b_lambda!13749 () Bool)

(assert (=> (not b_lambda!13749) (not b!926546)))

(declare-fun t!26689 () Bool)

(declare-fun tb!5805 () Bool)

(assert (=> (and start!79188 (= defaultEntry!1235 defaultEntry!1235) t!26689) tb!5805))

(declare-fun result!11441 () Bool)

(assert (=> tb!5805 (= result!11441 tp_is_empty!19741)))

(assert (=> b!926546 t!26689))

(declare-fun b_and!28215 () Bool)

(assert (= b_and!28213 (and (=> t!26689 result!11441) b_and!28215)))

(declare-fun m!861379 () Bool)

(assert (=> b!926551 m!861379))

(declare-fun m!861381 () Bool)

(assert (=> b!926560 m!861381))

(declare-fun m!861383 () Bool)

(assert (=> mapNonEmpty!31368 m!861383))

(declare-fun m!861385 () Bool)

(assert (=> b!926547 m!861385))

(declare-fun m!861387 () Bool)

(assert (=> b!926549 m!861387))

(declare-fun m!861389 () Bool)

(assert (=> b!926549 m!861389))

(declare-fun m!861391 () Bool)

(assert (=> b!926548 m!861391))

(declare-fun m!861393 () Bool)

(assert (=> b!926548 m!861393))

(declare-fun m!861395 () Bool)

(assert (=> b!926548 m!861395))

(declare-fun m!861397 () Bool)

(assert (=> b!926546 m!861397))

(declare-fun m!861399 () Bool)

(assert (=> b!926546 m!861399))

(declare-fun m!861401 () Bool)

(assert (=> b!926546 m!861401))

(declare-fun m!861403 () Bool)

(assert (=> b!926546 m!861403))

(declare-fun m!861405 () Bool)

(assert (=> b!926546 m!861405))

(declare-fun m!861407 () Bool)

(assert (=> b!926546 m!861407))

(declare-fun m!861409 () Bool)

(assert (=> b!926546 m!861409))

(declare-fun m!861411 () Bool)

(assert (=> b!926546 m!861411))

(declare-fun m!861413 () Bool)

(assert (=> b!926546 m!861413))

(declare-fun m!861415 () Bool)

(assert (=> b!926546 m!861415))

(declare-fun m!861417 () Bool)

(assert (=> b!926546 m!861417))

(assert (=> b!926546 m!861399))

(assert (=> b!926546 m!861401))

(declare-fun m!861419 () Bool)

(assert (=> b!926546 m!861419))

(declare-fun m!861421 () Bool)

(assert (=> b!926546 m!861421))

(declare-fun m!861423 () Bool)

(assert (=> b!926546 m!861423))

(declare-fun m!861425 () Bool)

(assert (=> b!926546 m!861425))

(assert (=> b!926546 m!861415))

(declare-fun m!861427 () Bool)

(assert (=> b!926546 m!861427))

(declare-fun m!861429 () Bool)

(assert (=> b!926550 m!861429))

(declare-fun m!861431 () Bool)

(assert (=> b!926555 m!861431))

(declare-fun m!861433 () Bool)

(assert (=> start!79188 m!861433))

(declare-fun m!861435 () Bool)

(assert (=> start!79188 m!861435))

(declare-fun m!861437 () Bool)

(assert (=> start!79188 m!861437))

(declare-fun m!861439 () Bool)

(assert (=> b!926557 m!861439))

(declare-fun m!861441 () Bool)

(assert (=> b!926561 m!861441))

(declare-fun m!861443 () Bool)

(assert (=> b!926553 m!861443))

(declare-fun m!861445 () Bool)

(assert (=> b!926553 m!861445))

(declare-fun m!861447 () Bool)

(assert (=> b!926543 m!861447))

(assert (=> b!926543 m!861403))

(check-sat (not b!926561) (not b!926550) (not b!926549) (not b!926560) (not b!926547) (not b!926555) (not b!926546) (not b!926543) (not start!79188) (not b!926551) b_and!28215 (not b!926553) (not mapNonEmpty!31368) tp_is_empty!19741 (not b_lambda!13749) (not b!926557) (not b_next!17233) (not b!926548))
(check-sat b_and!28215 (not b_next!17233))
