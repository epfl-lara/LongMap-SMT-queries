; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79164 () Bool)

(assert start!79164)

(declare-fun b_free!17209 () Bool)

(declare-fun b_next!17209 () Bool)

(assert (=> start!79164 (= b_free!17209 (not b_next!17209))))

(declare-fun tp!60068 () Bool)

(declare-fun b_and!28165 () Bool)

(assert (=> start!79164 (= tp!60068 b_and!28165)))

(declare-fun b!925812 () Bool)

(declare-datatypes ((Unit!31237 0))(
  ( (Unit!31238) )
))
(declare-fun e!519655 () Unit!31237)

(declare-fun Unit!31239 () Unit!31237)

(assert (=> b!925812 (= e!519655 Unit!31239)))

(declare-fun b!925813 () Bool)

(declare-fun e!519654 () Bool)

(declare-fun e!519647 () Bool)

(assert (=> b!925813 (= e!519654 e!519647)))

(declare-fun res!623702 () Bool)

(assert (=> b!925813 (=> (not res!623702) (not e!519647))))

(declare-datatypes ((V!31255 0))(
  ( (V!31256 (val!9909 Int)) )
))
(declare-datatypes ((tuple2!12902 0))(
  ( (tuple2!12903 (_1!6462 (_ BitVec 64)) (_2!6462 V!31255)) )
))
(declare-datatypes ((List!18714 0))(
  ( (Nil!18711) (Cons!18710 (h!19862 tuple2!12902) (t!26645 List!18714)) )
))
(declare-datatypes ((ListLongMap!11601 0))(
  ( (ListLongMap!11602 (toList!5816 List!18714)) )
))
(declare-fun lt!416420 () ListLongMap!11601)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4888 (ListLongMap!11601 (_ BitVec 64)) Bool)

(assert (=> b!925813 (= res!623702 (contains!4888 lt!416420 k0!1099))))

(declare-datatypes ((array!55453 0))(
  ( (array!55454 (arr!26667 (Array (_ BitVec 32) (_ BitVec 64))) (size!27127 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55453)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9377 0))(
  ( (ValueCellFull!9377 (v!12424 V!31255)) (EmptyCell!9377) )
))
(declare-datatypes ((array!55455 0))(
  ( (array!55456 (arr!26668 (Array (_ BitVec 32) ValueCell!9377)) (size!27128 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55455)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31255)

(declare-fun minValue!1173 () V!31255)

(declare-fun getCurrentListMap!3066 (array!55453 array!55455 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 32) Int) ListLongMap!11601)

(assert (=> b!925813 (= lt!416420 (getCurrentListMap!3066 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!623697 () Bool)

(declare-fun e!519657 () Bool)

(assert (=> start!79164 (=> (not res!623697) (not e!519657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79164 (= res!623697 (validMask!0 mask!1881))))

(assert (=> start!79164 e!519657))

(assert (=> start!79164 true))

(declare-fun tp_is_empty!19717 () Bool)

(assert (=> start!79164 tp_is_empty!19717))

(declare-fun e!519652 () Bool)

(declare-fun array_inv!20866 (array!55455) Bool)

(assert (=> start!79164 (and (array_inv!20866 _values!1231) e!519652)))

(assert (=> start!79164 tp!60068))

(declare-fun array_inv!20867 (array!55453) Bool)

(assert (=> start!79164 (array_inv!20867 _keys!1487)))

(declare-fun b!925814 () Bool)

(declare-fun e!519658 () Bool)

(assert (=> b!925814 (= e!519658 e!519654)))

(declare-fun res!623700 () Bool)

(assert (=> b!925814 (=> (not res!623700) (not e!519654))))

(assert (=> b!925814 (= res!623700 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27127 _keys!1487)))))

(declare-fun lt!416419 () Unit!31237)

(declare-fun e!519649 () Unit!31237)

(assert (=> b!925814 (= lt!416419 e!519649)))

(declare-fun c!96783 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925814 (= c!96783 (validKeyInArray!0 k0!1099))))

(declare-fun b!925815 () Bool)

(declare-fun e!519653 () Bool)

(assert (=> b!925815 (= e!519653 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925816 () Bool)

(declare-fun e!519648 () Bool)

(declare-fun mapRes!31332 () Bool)

(assert (=> b!925816 (= e!519652 (and e!519648 mapRes!31332))))

(declare-fun condMapEmpty!31332 () Bool)

(declare-fun mapDefault!31332 () ValueCell!9377)

(assert (=> b!925816 (= condMapEmpty!31332 (= (arr!26668 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9377)) mapDefault!31332)))))

(declare-fun b!925817 () Bool)

(declare-fun res!623701 () Bool)

(assert (=> b!925817 (=> (not res!623701) (not e!519657))))

(assert (=> b!925817 (= res!623701 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27127 _keys!1487))))))

(declare-fun b!925818 () Bool)

(declare-fun arrayContainsKey!0 (array!55453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925818 (= e!519653 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925819 () Bool)

(declare-fun lt!416411 () ListLongMap!11601)

(declare-fun lt!416416 () V!31255)

(declare-fun apply!668 (ListLongMap!11601 (_ BitVec 64)) V!31255)

(assert (=> b!925819 (= (apply!668 lt!416411 k0!1099) lt!416416)))

(declare-fun lt!416417 () Unit!31237)

(declare-fun lt!416409 () V!31255)

(declare-fun lt!416413 () (_ BitVec 64))

(declare-fun lt!416410 () ListLongMap!11601)

(declare-fun addApplyDifferent!369 (ListLongMap!11601 (_ BitVec 64) V!31255 (_ BitVec 64)) Unit!31237)

(assert (=> b!925819 (= lt!416417 (addApplyDifferent!369 lt!416410 lt!416413 lt!416409 k0!1099))))

(assert (=> b!925819 (not (= lt!416413 k0!1099))))

(declare-fun lt!416418 () Unit!31237)

(declare-datatypes ((List!18715 0))(
  ( (Nil!18712) (Cons!18711 (h!19863 (_ BitVec 64)) (t!26646 List!18715)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55453 (_ BitVec 64) (_ BitVec 32) List!18715) Unit!31237)

(assert (=> b!925819 (= lt!416418 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18712))))

(assert (=> b!925819 e!519653))

(declare-fun c!96782 () Bool)

(assert (=> b!925819 (= c!96782 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416414 () Unit!31237)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!224 (array!55453 array!55455 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 64) (_ BitVec 32) Int) Unit!31237)

(assert (=> b!925819 (= lt!416414 (lemmaListMapContainsThenArrayContainsFrom!224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55453 (_ BitVec 32) List!18715) Bool)

(assert (=> b!925819 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18712)))

(declare-fun lt!416412 () Unit!31237)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55453 (_ BitVec 32) (_ BitVec 32)) Unit!31237)

(assert (=> b!925819 (= lt!416412 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925819 (contains!4888 lt!416411 k0!1099)))

(declare-fun lt!416415 () tuple2!12902)

(declare-fun +!2733 (ListLongMap!11601 tuple2!12902) ListLongMap!11601)

(assert (=> b!925819 (= lt!416411 (+!2733 lt!416410 lt!416415))))

(declare-fun lt!416423 () Unit!31237)

(declare-fun addStillContains!442 (ListLongMap!11601 (_ BitVec 64) V!31255 (_ BitVec 64)) Unit!31237)

(assert (=> b!925819 (= lt!416423 (addStillContains!442 lt!416410 lt!416413 lt!416409 k0!1099))))

(assert (=> b!925819 (= (getCurrentListMap!3066 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2733 (getCurrentListMap!3066 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416415))))

(assert (=> b!925819 (= lt!416415 (tuple2!12903 lt!416413 lt!416409))))

(declare-fun get!14038 (ValueCell!9377 V!31255) V!31255)

(declare-fun dynLambda!1530 (Int (_ BitVec 64)) V!31255)

(assert (=> b!925819 (= lt!416409 (get!14038 (select (arr!26668 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1530 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416422 () Unit!31237)

(declare-fun lemmaListMapRecursiveValidKeyArray!113 (array!55453 array!55455 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 32) Int) Unit!31237)

(assert (=> b!925819 (= lt!416422 (lemmaListMapRecursiveValidKeyArray!113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925819 (= e!519655 lt!416417)))

(declare-fun b!925820 () Bool)

(declare-fun e!519650 () Bool)

(assert (=> b!925820 (= e!519650 tp_is_empty!19717)))

(declare-fun b!925821 () Bool)

(assert (=> b!925821 (= e!519648 tp_is_empty!19717)))

(declare-fun b!925822 () Bool)

(declare-fun Unit!31240 () Unit!31237)

(assert (=> b!925822 (= e!519649 Unit!31240)))

(declare-fun mapNonEmpty!31332 () Bool)

(declare-fun tp!60069 () Bool)

(assert (=> mapNonEmpty!31332 (= mapRes!31332 (and tp!60069 e!519650))))

(declare-fun mapValue!31332 () ValueCell!9377)

(declare-fun mapRest!31332 () (Array (_ BitVec 32) ValueCell!9377))

(declare-fun mapKey!31332 () (_ BitVec 32))

(assert (=> mapNonEmpty!31332 (= (arr!26668 _values!1231) (store mapRest!31332 mapKey!31332 mapValue!31332))))

(declare-fun b!925823 () Bool)

(declare-fun res!623695 () Bool)

(assert (=> b!925823 (=> (not res!623695) (not e!519657))))

(assert (=> b!925823 (= res!623695 (and (= (size!27128 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27127 _keys!1487) (size!27128 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925824 () Bool)

(assert (=> b!925824 (= e!519649 e!519655)))

(assert (=> b!925824 (= lt!416413 (select (arr!26667 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96781 () Bool)

(assert (=> b!925824 (= c!96781 (validKeyInArray!0 lt!416413))))

(declare-fun mapIsEmpty!31332 () Bool)

(assert (=> mapIsEmpty!31332 mapRes!31332))

(declare-fun b!925825 () Bool)

(declare-fun e!519651 () Bool)

(assert (=> b!925825 (= e!519651 e!519658)))

(declare-fun res!623698 () Bool)

(assert (=> b!925825 (=> (not res!623698) (not e!519658))))

(declare-fun v!791 () V!31255)

(assert (=> b!925825 (= res!623698 (and (= lt!416416 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925825 (= lt!416416 (apply!668 lt!416410 k0!1099))))

(declare-fun b!925826 () Bool)

(assert (=> b!925826 (= e!519657 e!519651)))

(declare-fun res!623703 () Bool)

(assert (=> b!925826 (=> (not res!623703) (not e!519651))))

(assert (=> b!925826 (= res!623703 (contains!4888 lt!416410 k0!1099))))

(assert (=> b!925826 (= lt!416410 (getCurrentListMap!3066 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925827 () Bool)

(assert (=> b!925827 (= e!519647 false)))

(declare-fun lt!416421 () V!31255)

(assert (=> b!925827 (= lt!416421 (apply!668 lt!416420 k0!1099))))

(declare-fun b!925828 () Bool)

(declare-fun res!623696 () Bool)

(assert (=> b!925828 (=> (not res!623696) (not e!519657))))

(assert (=> b!925828 (= res!623696 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18712))))

(declare-fun b!925829 () Bool)

(declare-fun res!623699 () Bool)

(assert (=> b!925829 (=> (not res!623699) (not e!519657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55453 (_ BitVec 32)) Bool)

(assert (=> b!925829 (= res!623699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79164 res!623697) b!925823))

(assert (= (and b!925823 res!623695) b!925829))

(assert (= (and b!925829 res!623699) b!925828))

(assert (= (and b!925828 res!623696) b!925817))

(assert (= (and b!925817 res!623701) b!925826))

(assert (= (and b!925826 res!623703) b!925825))

(assert (= (and b!925825 res!623698) b!925814))

(assert (= (and b!925814 c!96783) b!925824))

(assert (= (and b!925814 (not c!96783)) b!925822))

(assert (= (and b!925824 c!96781) b!925819))

(assert (= (and b!925824 (not c!96781)) b!925812))

(assert (= (and b!925819 c!96782) b!925818))

(assert (= (and b!925819 (not c!96782)) b!925815))

(assert (= (and b!925814 res!623700) b!925813))

(assert (= (and b!925813 res!623702) b!925827))

(assert (= (and b!925816 condMapEmpty!31332) mapIsEmpty!31332))

(assert (= (and b!925816 (not condMapEmpty!31332)) mapNonEmpty!31332))

(get-info :version)

(assert (= (and mapNonEmpty!31332 ((_ is ValueCellFull!9377) mapValue!31332)) b!925820))

(assert (= (and b!925816 ((_ is ValueCellFull!9377) mapDefault!31332)) b!925821))

(assert (= start!79164 b!925816))

(declare-fun b_lambda!13725 () Bool)

(assert (=> (not b_lambda!13725) (not b!925819)))

(declare-fun t!26644 () Bool)

(declare-fun tb!5781 () Bool)

(assert (=> (and start!79164 (= defaultEntry!1235 defaultEntry!1235) t!26644) tb!5781))

(declare-fun result!11393 () Bool)

(assert (=> tb!5781 (= result!11393 tp_is_empty!19717)))

(assert (=> b!925819 t!26644))

(declare-fun b_and!28167 () Bool)

(assert (= b_and!28165 (and (=> t!26644 result!11393) b_and!28167)))

(declare-fun m!860563 () Bool)

(assert (=> b!925813 m!860563))

(declare-fun m!860565 () Bool)

(assert (=> b!925813 m!860565))

(declare-fun m!860567 () Bool)

(assert (=> b!925814 m!860567))

(declare-fun m!860569 () Bool)

(assert (=> b!925828 m!860569))

(declare-fun m!860571 () Bool)

(assert (=> b!925826 m!860571))

(declare-fun m!860573 () Bool)

(assert (=> b!925826 m!860573))

(declare-fun m!860575 () Bool)

(assert (=> b!925827 m!860575))

(declare-fun m!860577 () Bool)

(assert (=> b!925825 m!860577))

(declare-fun m!860579 () Bool)

(assert (=> b!925829 m!860579))

(declare-fun m!860581 () Bool)

(assert (=> b!925819 m!860581))

(declare-fun m!860583 () Bool)

(assert (=> b!925819 m!860583))

(declare-fun m!860585 () Bool)

(assert (=> b!925819 m!860585))

(declare-fun m!860587 () Bool)

(assert (=> b!925819 m!860587))

(declare-fun m!860589 () Bool)

(assert (=> b!925819 m!860589))

(declare-fun m!860591 () Bool)

(assert (=> b!925819 m!860591))

(declare-fun m!860593 () Bool)

(assert (=> b!925819 m!860593))

(assert (=> b!925819 m!860565))

(declare-fun m!860595 () Bool)

(assert (=> b!925819 m!860595))

(declare-fun m!860597 () Bool)

(assert (=> b!925819 m!860597))

(declare-fun m!860599 () Bool)

(assert (=> b!925819 m!860599))

(declare-fun m!860601 () Bool)

(assert (=> b!925819 m!860601))

(assert (=> b!925819 m!860591))

(assert (=> b!925819 m!860593))

(declare-fun m!860603 () Bool)

(assert (=> b!925819 m!860603))

(assert (=> b!925819 m!860585))

(declare-fun m!860605 () Bool)

(assert (=> b!925819 m!860605))

(declare-fun m!860607 () Bool)

(assert (=> b!925819 m!860607))

(declare-fun m!860609 () Bool)

(assert (=> b!925819 m!860609))

(declare-fun m!860611 () Bool)

(assert (=> mapNonEmpty!31332 m!860611))

(declare-fun m!860613 () Bool)

(assert (=> b!925824 m!860613))

(declare-fun m!860615 () Bool)

(assert (=> b!925824 m!860615))

(declare-fun m!860617 () Bool)

(assert (=> b!925818 m!860617))

(declare-fun m!860619 () Bool)

(assert (=> start!79164 m!860619))

(declare-fun m!860621 () Bool)

(assert (=> start!79164 m!860621))

(declare-fun m!860623 () Bool)

(assert (=> start!79164 m!860623))

(check-sat (not b!925819) (not b!925813) (not b_lambda!13725) (not b!925826) (not b!925828) tp_is_empty!19717 (not b!925825) (not mapNonEmpty!31332) (not b!925827) (not b!925824) (not b!925829) (not start!79164) b_and!28167 (not b!925814) (not b!925818) (not b_next!17209))
(check-sat b_and!28167 (not b_next!17209))
