; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79068 () Bool)

(assert start!79068)

(declare-fun b_free!17299 () Bool)

(declare-fun b_next!17299 () Bool)

(assert (=> start!79068 (= b_free!17299 (not b_next!17299))))

(declare-fun tp!60338 () Bool)

(declare-fun b_and!28309 () Bool)

(assert (=> start!79068 (= tp!60338 b_and!28309)))

(declare-fun res!624717 () Bool)

(declare-fun e!520676 () Bool)

(assert (=> start!79068 (=> (not res!624717) (not e!520676))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79068 (= res!624717 (validMask!0 mask!1881))))

(assert (=> start!79068 e!520676))

(assert (=> start!79068 true))

(declare-fun tp_is_empty!19807 () Bool)

(assert (=> start!79068 tp_is_empty!19807))

(declare-datatypes ((V!31375 0))(
  ( (V!31376 (val!9954 Int)) )
))
(declare-datatypes ((ValueCell!9422 0))(
  ( (ValueCellFull!9422 (v!12471 V!31375)) (EmptyCell!9422) )
))
(declare-datatypes ((array!55549 0))(
  ( (array!55550 (arr!26720 (Array (_ BitVec 32) ValueCell!9422)) (size!27181 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55549)

(declare-fun e!520665 () Bool)

(declare-fun array_inv!20892 (array!55549) Bool)

(assert (=> start!79068 (and (array_inv!20892 _values!1231) e!520665)))

(assert (=> start!79068 tp!60338))

(declare-datatypes ((array!55551 0))(
  ( (array!55552 (arr!26721 (Array (_ BitVec 32) (_ BitVec 64))) (size!27182 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55551)

(declare-fun array_inv!20893 (array!55551) Bool)

(assert (=> start!79068 (array_inv!20893 _keys!1487)))

(declare-fun b!927446 () Bool)

(declare-fun res!624720 () Bool)

(declare-fun e!520666 () Bool)

(assert (=> b!927446 (=> (not res!624720) (not e!520666))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31375)

(declare-datatypes ((tuple2!13054 0))(
  ( (tuple2!13055 (_1!6538 (_ BitVec 64)) (_2!6538 V!31375)) )
))
(declare-datatypes ((List!18823 0))(
  ( (Nil!18820) (Cons!18819 (h!19965 tuple2!13054) (t!26843 List!18823)) )
))
(declare-datatypes ((ListLongMap!11741 0))(
  ( (ListLongMap!11742 (toList!5886 List!18823)) )
))
(declare-fun lt!417969 () ListLongMap!11741)

(declare-fun apply!696 (ListLongMap!11741 (_ BitVec 64)) V!31375)

(assert (=> b!927446 (= res!624720 (= (apply!696 lt!417969 k0!1099) v!791))))

(declare-fun mapIsEmpty!31467 () Bool)

(declare-fun mapRes!31467 () Bool)

(assert (=> mapIsEmpty!31467 mapRes!31467))

(declare-fun b!927447 () Bool)

(declare-fun res!624722 () Bool)

(assert (=> b!927447 (=> (not res!624722) (not e!520676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55551 (_ BitVec 32)) Bool)

(assert (=> b!927447 (= res!624722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31467 () Bool)

(declare-fun tp!60339 () Bool)

(declare-fun e!520674 () Bool)

(assert (=> mapNonEmpty!31467 (= mapRes!31467 (and tp!60339 e!520674))))

(declare-fun mapRest!31467 () (Array (_ BitVec 32) ValueCell!9422))

(declare-fun mapKey!31467 () (_ BitVec 32))

(declare-fun mapValue!31467 () ValueCell!9422)

(assert (=> mapNonEmpty!31467 (= (arr!26720 _values!1231) (store mapRest!31467 mapKey!31467 mapValue!31467))))

(declare-fun b!927448 () Bool)

(declare-fun lt!417979 () ListLongMap!11741)

(declare-fun lt!417965 () V!31375)

(assert (=> b!927448 (= (apply!696 lt!417979 k0!1099) lt!417965)))

(declare-datatypes ((Unit!31288 0))(
  ( (Unit!31289) )
))
(declare-fun lt!417976 () Unit!31288)

(declare-fun lt!417973 () (_ BitVec 64))

(declare-fun lt!417980 () V!31375)

(declare-fun lt!417978 () ListLongMap!11741)

(declare-fun addApplyDifferent!401 (ListLongMap!11741 (_ BitVec 64) V!31375 (_ BitVec 64)) Unit!31288)

(assert (=> b!927448 (= lt!417976 (addApplyDifferent!401 lt!417978 lt!417973 lt!417980 k0!1099))))

(assert (=> b!927448 (not (= lt!417973 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417974 () Unit!31288)

(declare-datatypes ((List!18824 0))(
  ( (Nil!18821) (Cons!18820 (h!19966 (_ BitVec 64)) (t!26844 List!18824)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55551 (_ BitVec 64) (_ BitVec 32) List!18824) Unit!31288)

(assert (=> b!927448 (= lt!417974 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18821))))

(declare-fun e!520671 () Bool)

(assert (=> b!927448 e!520671))

(declare-fun c!96840 () Bool)

(assert (=> b!927448 (= c!96840 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417970 () Unit!31288)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31375)

(declare-fun minValue!1173 () V!31375)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!261 (array!55551 array!55549 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 64) (_ BitVec 32) Int) Unit!31288)

(assert (=> b!927448 (= lt!417970 (lemmaListMapContainsThenArrayContainsFrom!261 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55551 (_ BitVec 32) List!18824) Bool)

(assert (=> b!927448 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18821)))

(declare-fun lt!417975 () Unit!31288)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55551 (_ BitVec 32) (_ BitVec 32)) Unit!31288)

(assert (=> b!927448 (= lt!417975 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4897 (ListLongMap!11741 (_ BitVec 64)) Bool)

(assert (=> b!927448 (contains!4897 lt!417979 k0!1099)))

(declare-fun lt!417972 () tuple2!13054)

(declare-fun +!2773 (ListLongMap!11741 tuple2!13054) ListLongMap!11741)

(assert (=> b!927448 (= lt!417979 (+!2773 lt!417978 lt!417972))))

(declare-fun lt!417968 () Unit!31288)

(declare-fun addStillContains!470 (ListLongMap!11741 (_ BitVec 64) V!31375 (_ BitVec 64)) Unit!31288)

(assert (=> b!927448 (= lt!417968 (addStillContains!470 lt!417978 lt!417973 lt!417980 k0!1099))))

(declare-fun getCurrentListMap!3071 (array!55551 array!55549 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 32) Int) ListLongMap!11741)

(assert (=> b!927448 (= (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2773 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417972))))

(assert (=> b!927448 (= lt!417972 (tuple2!13055 lt!417973 lt!417980))))

(declare-fun get!14068 (ValueCell!9422 V!31375) V!31375)

(declare-fun dynLambda!1529 (Int (_ BitVec 64)) V!31375)

(assert (=> b!927448 (= lt!417980 (get!14068 (select (arr!26720 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1529 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417977 () Unit!31288)

(declare-fun lemmaListMapRecursiveValidKeyArray!137 (array!55551 array!55549 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 32) Int) Unit!31288)

(assert (=> b!927448 (= lt!417977 (lemmaListMapRecursiveValidKeyArray!137 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520673 () Unit!31288)

(assert (=> b!927448 (= e!520673 lt!417976)))

(declare-fun b!927449 () Bool)

(declare-fun res!624719 () Bool)

(assert (=> b!927449 (=> (not res!624719) (not e!520676))))

(assert (=> b!927449 (= res!624719 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18821))))

(declare-fun b!927450 () Bool)

(declare-fun e!520668 () Unit!31288)

(declare-fun Unit!31290 () Unit!31288)

(assert (=> b!927450 (= e!520668 Unit!31290)))

(declare-fun b!927451 () Bool)

(declare-fun res!624716 () Bool)

(assert (=> b!927451 (=> (not res!624716) (not e!520676))))

(assert (=> b!927451 (= res!624716 (and (= (size!27181 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27182 _keys!1487) (size!27181 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun e!520675 () Bool)

(declare-fun lt!417967 () ListLongMap!11741)

(declare-fun b!927452 () Bool)

(assert (=> b!927452 (= e!520675 (= (apply!696 lt!417967 k0!1099) v!791))))

(declare-fun b!927453 () Bool)

(assert (=> b!927453 (= e!520674 tp_is_empty!19807)))

(declare-fun b!927454 () Bool)

(declare-fun arrayContainsKey!0 (array!55551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927454 (= e!520671 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927455 () Bool)

(declare-fun e!520670 () Bool)

(declare-fun e!520677 () Bool)

(assert (=> b!927455 (= e!520670 e!520677)))

(declare-fun res!624714 () Bool)

(assert (=> b!927455 (=> (not res!624714) (not e!520677))))

(assert (=> b!927455 (= res!624714 (and (= lt!417965 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927455 (= lt!417965 (apply!696 lt!417978 k0!1099))))

(declare-fun b!927456 () Bool)

(assert (=> b!927456 (= e!520668 e!520673)))

(assert (=> b!927456 (= lt!417973 (select (arr!26721 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96841 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927456 (= c!96841 (validKeyInArray!0 lt!417973))))

(declare-fun b!927457 () Bool)

(assert (=> b!927457 (= e!520676 e!520670)))

(declare-fun res!624718 () Bool)

(assert (=> b!927457 (=> (not res!624718) (not e!520670))))

(assert (=> b!927457 (= res!624718 (contains!4897 lt!417978 k0!1099))))

(assert (=> b!927457 (= lt!417978 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927458 () Bool)

(declare-fun e!520672 () Bool)

(assert (=> b!927458 (= e!520665 (and e!520672 mapRes!31467))))

(declare-fun condMapEmpty!31467 () Bool)

(declare-fun mapDefault!31467 () ValueCell!9422)

(assert (=> b!927458 (= condMapEmpty!31467 (= (arr!26720 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9422)) mapDefault!31467)))))

(declare-fun b!927459 () Bool)

(assert (=> b!927459 (= e!520671 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927460 () Bool)

(assert (=> b!927460 (= e!520666 (not true))))

(assert (=> b!927460 e!520675))

(declare-fun res!624715 () Bool)

(assert (=> b!927460 (=> (not res!624715) (not e!520675))))

(assert (=> b!927460 (= res!624715 (contains!4897 lt!417967 k0!1099))))

(assert (=> b!927460 (= lt!417967 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417966 () Unit!31288)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!98 (array!55551 array!55549 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 64) V!31375 (_ BitVec 32) Int) Unit!31288)

(assert (=> b!927460 (= lt!417966 (lemmaListMapApplyFromThenApplyFromZero!98 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927461 () Bool)

(assert (=> b!927461 (= e!520672 tp_is_empty!19807)))

(declare-fun b!927462 () Bool)

(declare-fun Unit!31291 () Unit!31288)

(assert (=> b!927462 (= e!520673 Unit!31291)))

(declare-fun b!927463 () Bool)

(declare-fun res!624713 () Bool)

(assert (=> b!927463 (=> (not res!624713) (not e!520676))))

(assert (=> b!927463 (= res!624713 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27182 _keys!1487))))))

(declare-fun b!927464 () Bool)

(declare-fun e!520669 () Bool)

(assert (=> b!927464 (= e!520669 e!520666)))

(declare-fun res!624721 () Bool)

(assert (=> b!927464 (=> (not res!624721) (not e!520666))))

(assert (=> b!927464 (= res!624721 (contains!4897 lt!417969 k0!1099))))

(assert (=> b!927464 (= lt!417969 (getCurrentListMap!3071 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927465 () Bool)

(assert (=> b!927465 (= e!520677 e!520669)))

(declare-fun res!624712 () Bool)

(assert (=> b!927465 (=> (not res!624712) (not e!520669))))

(assert (=> b!927465 (= res!624712 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27182 _keys!1487)))))

(declare-fun lt!417971 () Unit!31288)

(assert (=> b!927465 (= lt!417971 e!520668)))

(declare-fun c!96839 () Bool)

(assert (=> b!927465 (= c!96839 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79068 res!624717) b!927451))

(assert (= (and b!927451 res!624716) b!927447))

(assert (= (and b!927447 res!624722) b!927449))

(assert (= (and b!927449 res!624719) b!927463))

(assert (= (and b!927463 res!624713) b!927457))

(assert (= (and b!927457 res!624718) b!927455))

(assert (= (and b!927455 res!624714) b!927465))

(assert (= (and b!927465 c!96839) b!927456))

(assert (= (and b!927465 (not c!96839)) b!927450))

(assert (= (and b!927456 c!96841) b!927448))

(assert (= (and b!927456 (not c!96841)) b!927462))

(assert (= (and b!927448 c!96840) b!927454))

(assert (= (and b!927448 (not c!96840)) b!927459))

(assert (= (and b!927465 res!624712) b!927464))

(assert (= (and b!927464 res!624721) b!927446))

(assert (= (and b!927446 res!624720) b!927460))

(assert (= (and b!927460 res!624715) b!927452))

(assert (= (and b!927458 condMapEmpty!31467) mapIsEmpty!31467))

(assert (= (and b!927458 (not condMapEmpty!31467)) mapNonEmpty!31467))

(get-info :version)

(assert (= (and mapNonEmpty!31467 ((_ is ValueCellFull!9422) mapValue!31467)) b!927453))

(assert (= (and b!927458 ((_ is ValueCellFull!9422) mapDefault!31467)) b!927461))

(assert (= start!79068 b!927458))

(declare-fun b_lambda!13783 () Bool)

(assert (=> (not b_lambda!13783) (not b!927448)))

(declare-fun t!26842 () Bool)

(declare-fun tb!5871 () Bool)

(assert (=> (and start!79068 (= defaultEntry!1235 defaultEntry!1235) t!26842) tb!5871))

(declare-fun result!11573 () Bool)

(assert (=> tb!5871 (= result!11573 tp_is_empty!19807)))

(assert (=> b!927448 t!26842))

(declare-fun b_and!28311 () Bool)

(assert (= b_and!28309 (and (=> t!26842 result!11573) b_and!28311)))

(declare-fun m!861637 () Bool)

(assert (=> b!927452 m!861637))

(declare-fun m!861639 () Bool)

(assert (=> b!927449 m!861639))

(declare-fun m!861641 () Bool)

(assert (=> b!927456 m!861641))

(declare-fun m!861643 () Bool)

(assert (=> b!927456 m!861643))

(declare-fun m!861645 () Bool)

(assert (=> b!927447 m!861645))

(declare-fun m!861647 () Bool)

(assert (=> start!79068 m!861647))

(declare-fun m!861649 () Bool)

(assert (=> start!79068 m!861649))

(declare-fun m!861651 () Bool)

(assert (=> start!79068 m!861651))

(declare-fun m!861653 () Bool)

(assert (=> b!927455 m!861653))

(declare-fun m!861655 () Bool)

(assert (=> b!927460 m!861655))

(declare-fun m!861657 () Bool)

(assert (=> b!927460 m!861657))

(declare-fun m!861659 () Bool)

(assert (=> b!927460 m!861659))

(declare-fun m!861661 () Bool)

(assert (=> b!927446 m!861661))

(declare-fun m!861663 () Bool)

(assert (=> b!927448 m!861663))

(declare-fun m!861665 () Bool)

(assert (=> b!927448 m!861665))

(declare-fun m!861667 () Bool)

(assert (=> b!927448 m!861667))

(declare-fun m!861669 () Bool)

(assert (=> b!927448 m!861669))

(declare-fun m!861671 () Bool)

(assert (=> b!927448 m!861671))

(declare-fun m!861673 () Bool)

(assert (=> b!927448 m!861673))

(declare-fun m!861675 () Bool)

(assert (=> b!927448 m!861675))

(declare-fun m!861677 () Bool)

(assert (=> b!927448 m!861677))

(declare-fun m!861679 () Bool)

(assert (=> b!927448 m!861679))

(declare-fun m!861681 () Bool)

(assert (=> b!927448 m!861681))

(declare-fun m!861683 () Bool)

(assert (=> b!927448 m!861683))

(declare-fun m!861685 () Bool)

(assert (=> b!927448 m!861685))

(declare-fun m!861687 () Bool)

(assert (=> b!927448 m!861687))

(declare-fun m!861689 () Bool)

(assert (=> b!927448 m!861689))

(assert (=> b!927448 m!861669))

(assert (=> b!927448 m!861671))

(declare-fun m!861691 () Bool)

(assert (=> b!927448 m!861691))

(assert (=> b!927448 m!861663))

(declare-fun m!861693 () Bool)

(assert (=> b!927448 m!861693))

(declare-fun m!861695 () Bool)

(assert (=> b!927454 m!861695))

(declare-fun m!861697 () Bool)

(assert (=> b!927465 m!861697))

(declare-fun m!861699 () Bool)

(assert (=> b!927457 m!861699))

(declare-fun m!861701 () Bool)

(assert (=> b!927457 m!861701))

(declare-fun m!861703 () Bool)

(assert (=> b!927464 m!861703))

(assert (=> b!927464 m!861675))

(declare-fun m!861705 () Bool)

(assert (=> mapNonEmpty!31467 m!861705))

(check-sat (not b!927460) (not b!927455) (not b!927447) (not b!927457) tp_is_empty!19807 (not start!79068) (not b!927464) (not b!927446) (not b!927456) (not b!927454) (not b!927449) (not b!927452) (not b_lambda!13783) (not b!927448) b_and!28311 (not mapNonEmpty!31467) (not b!927465) (not b_next!17299))
(check-sat b_and!28311 (not b_next!17299))
