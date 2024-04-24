; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79194 () Bool)

(assert start!79194)

(declare-fun b_free!17239 () Bool)

(declare-fun b_next!17239 () Bool)

(assert (=> start!79194 (= b_free!17239 (not b_next!17239))))

(declare-fun tp!60159 () Bool)

(declare-fun b_and!28225 () Bool)

(assert (=> start!79194 (= tp!60159 b_and!28225)))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31295 0))(
  ( (V!31296 (val!9924 Int)) )
))
(declare-fun v!791 () V!31295)

(declare-fun b!926728 () Bool)

(declare-fun e!520232 () Bool)

(declare-datatypes ((tuple2!12930 0))(
  ( (tuple2!12931 (_1!6476 (_ BitVec 64)) (_2!6476 V!31295)) )
))
(declare-datatypes ((List!18741 0))(
  ( (Nil!18738) (Cons!18737 (h!19889 tuple2!12930) (t!26702 List!18741)) )
))
(declare-datatypes ((ListLongMap!11629 0))(
  ( (ListLongMap!11630 (toList!5830 List!18741)) )
))
(declare-fun lt!417130 () ListLongMap!11629)

(declare-fun apply!681 (ListLongMap!11629 (_ BitVec 64)) V!31295)

(assert (=> b!926728 (= e!520232 (= (apply!681 lt!417130 k0!1099) v!791))))

(declare-fun b!926729 () Bool)

(declare-fun res!624182 () Bool)

(declare-fun e!520231 () Bool)

(assert (=> b!926729 (=> (not res!624182) (not e!520231))))

(declare-datatypes ((array!55511 0))(
  ( (array!55512 (arr!26696 (Array (_ BitVec 32) (_ BitVec 64))) (size!27156 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55511)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55511 (_ BitVec 32)) Bool)

(assert (=> b!926729 (= res!624182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926730 () Bool)

(declare-fun res!624178 () Bool)

(assert (=> b!926730 (=> (not res!624178) (not e!520231))))

(declare-datatypes ((List!18742 0))(
  ( (Nil!18739) (Cons!18738 (h!19890 (_ BitVec 64)) (t!26703 List!18742)) )
))
(declare-fun arrayNoDuplicates!0 (array!55511 (_ BitVec 32) List!18742) Bool)

(assert (=> b!926730 (= res!624178 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18739))))

(declare-fun b!926731 () Bool)

(declare-fun res!624177 () Bool)

(declare-fun e!520229 () Bool)

(assert (=> b!926731 (=> (not res!624177) (not e!520229))))

(declare-fun lt!417125 () ListLongMap!11629)

(assert (=> b!926731 (= res!624177 (= (apply!681 lt!417125 k0!1099) v!791))))

(declare-fun mapIsEmpty!31377 () Bool)

(declare-fun mapRes!31377 () Bool)

(assert (=> mapIsEmpty!31377 mapRes!31377))

(declare-fun b!926732 () Bool)

(declare-fun e!520225 () Bool)

(declare-fun tp_is_empty!19747 () Bool)

(assert (=> b!926732 (= e!520225 tp_is_empty!19747)))

(declare-fun res!624180 () Bool)

(assert (=> start!79194 (=> (not res!624180) (not e!520231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79194 (= res!624180 (validMask!0 mask!1881))))

(assert (=> start!79194 e!520231))

(assert (=> start!79194 true))

(assert (=> start!79194 tp_is_empty!19747))

(declare-datatypes ((ValueCell!9392 0))(
  ( (ValueCellFull!9392 (v!12439 V!31295)) (EmptyCell!9392) )
))
(declare-datatypes ((array!55513 0))(
  ( (array!55514 (arr!26697 (Array (_ BitVec 32) ValueCell!9392)) (size!27157 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55513)

(declare-fun e!520236 () Bool)

(declare-fun array_inv!20892 (array!55513) Bool)

(assert (=> start!79194 (and (array_inv!20892 _values!1231) e!520236)))

(assert (=> start!79194 tp!60159))

(declare-fun array_inv!20893 (array!55511) Bool)

(assert (=> start!79194 (array_inv!20893 _keys!1487)))

(declare-fun b!926733 () Bool)

(declare-fun e!520226 () Bool)

(declare-fun e!520228 () Bool)

(assert (=> b!926733 (= e!520226 e!520228)))

(declare-fun res!624186 () Bool)

(assert (=> b!926733 (=> (not res!624186) (not e!520228))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!926733 (= res!624186 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27156 _keys!1487)))))

(declare-datatypes ((Unit!31283 0))(
  ( (Unit!31284) )
))
(declare-fun lt!417127 () Unit!31283)

(declare-fun e!520237 () Unit!31283)

(assert (=> b!926733 (= lt!417127 e!520237)))

(declare-fun c!96918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926733 (= c!96918 (validKeyInArray!0 k0!1099))))

(declare-fun e!520230 () Bool)

(declare-fun b!926734 () Bool)

(declare-fun arrayContainsKey!0 (array!55511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926734 (= e!520230 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926735 () Bool)

(declare-fun e!520233 () Bool)

(assert (=> b!926735 (= e!520236 (and e!520233 mapRes!31377))))

(declare-fun condMapEmpty!31377 () Bool)

(declare-fun mapDefault!31377 () ValueCell!9392)

(assert (=> b!926735 (= condMapEmpty!31377 (= (arr!26697 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9392)) mapDefault!31377)))))

(declare-fun b!926736 () Bool)

(assert (=> b!926736 (= e!520233 tp_is_empty!19747)))

(declare-fun b!926737 () Bool)

(declare-fun e!520227 () Bool)

(assert (=> b!926737 (= e!520231 e!520227)))

(declare-fun res!624179 () Bool)

(assert (=> b!926737 (=> (not res!624179) (not e!520227))))

(declare-fun lt!417136 () ListLongMap!11629)

(declare-fun contains!4902 (ListLongMap!11629 (_ BitVec 64)) Bool)

(assert (=> b!926737 (= res!624179 (contains!4902 lt!417136 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31295)

(declare-fun minValue!1173 () V!31295)

(declare-fun getCurrentListMap!3080 (array!55511 array!55513 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 32) Int) ListLongMap!11629)

(assert (=> b!926737 (= lt!417136 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926738 () Bool)

(assert (=> b!926738 (= e!520228 e!520229)))

(declare-fun res!624184 () Bool)

(assert (=> b!926738 (=> (not res!624184) (not e!520229))))

(assert (=> b!926738 (= res!624184 (contains!4902 lt!417125 k0!1099))))

(assert (=> b!926738 (= lt!417125 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926739 () Bool)

(declare-fun e!520235 () Unit!31283)

(declare-fun Unit!31285 () Unit!31283)

(assert (=> b!926739 (= e!520235 Unit!31285)))

(declare-fun b!926740 () Bool)

(assert (=> b!926740 (= e!520229 (not true))))

(assert (=> b!926740 e!520232))

(declare-fun res!624185 () Bool)

(assert (=> b!926740 (=> (not res!624185) (not e!520232))))

(assert (=> b!926740 (= res!624185 (contains!4902 lt!417130 k0!1099))))

(assert (=> b!926740 (= lt!417130 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417132 () Unit!31283)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!76 (array!55511 array!55513 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 64) V!31295 (_ BitVec 32) Int) Unit!31283)

(assert (=> b!926740 (= lt!417132 (lemmaListMapApplyFromThenApplyFromZero!76 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926741 () Bool)

(assert (=> b!926741 (= e!520227 e!520226)))

(declare-fun res!624183 () Bool)

(assert (=> b!926741 (=> (not res!624183) (not e!520226))))

(declare-fun lt!417128 () V!31295)

(assert (=> b!926741 (= res!624183 (and (= lt!417128 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926741 (= lt!417128 (apply!681 lt!417136 k0!1099))))

(declare-fun b!926742 () Bool)

(declare-fun res!624181 () Bool)

(assert (=> b!926742 (=> (not res!624181) (not e!520231))))

(assert (=> b!926742 (= res!624181 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27156 _keys!1487))))))

(declare-fun b!926743 () Bool)

(assert (=> b!926743 (= e!520237 e!520235)))

(declare-fun lt!417126 () (_ BitVec 64))

(assert (=> b!926743 (= lt!417126 (select (arr!26696 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96916 () Bool)

(assert (=> b!926743 (= c!96916 (validKeyInArray!0 lt!417126))))

(declare-fun b!926744 () Bool)

(assert (=> b!926744 (= e!520230 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926745 () Bool)

(declare-fun lt!417137 () ListLongMap!11629)

(assert (=> b!926745 (= (apply!681 lt!417137 k0!1099) lt!417128)))

(declare-fun lt!417133 () V!31295)

(declare-fun lt!417124 () Unit!31283)

(declare-fun addApplyDifferent!381 (ListLongMap!11629 (_ BitVec 64) V!31295 (_ BitVec 64)) Unit!31283)

(assert (=> b!926745 (= lt!417124 (addApplyDifferent!381 lt!417136 lt!417126 lt!417133 k0!1099))))

(assert (=> b!926745 (not (= lt!417126 k0!1099))))

(declare-fun lt!417122 () Unit!31283)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55511 (_ BitVec 64) (_ BitVec 32) List!18742) Unit!31283)

(assert (=> b!926745 (= lt!417122 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18739))))

(assert (=> b!926745 e!520230))

(declare-fun c!96917 () Bool)

(assert (=> b!926745 (= c!96917 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417123 () Unit!31283)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!236 (array!55511 array!55513 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 64) (_ BitVec 32) Int) Unit!31283)

(assert (=> b!926745 (= lt!417123 (lemmaListMapContainsThenArrayContainsFrom!236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926745 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18739)))

(declare-fun lt!417135 () Unit!31283)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55511 (_ BitVec 32) (_ BitVec 32)) Unit!31283)

(assert (=> b!926745 (= lt!417135 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926745 (contains!4902 lt!417137 k0!1099)))

(declare-fun lt!417134 () tuple2!12930)

(declare-fun +!2745 (ListLongMap!11629 tuple2!12930) ListLongMap!11629)

(assert (=> b!926745 (= lt!417137 (+!2745 lt!417136 lt!417134))))

(declare-fun lt!417129 () Unit!31283)

(declare-fun addStillContains!454 (ListLongMap!11629 (_ BitVec 64) V!31295 (_ BitVec 64)) Unit!31283)

(assert (=> b!926745 (= lt!417129 (addStillContains!454 lt!417136 lt!417126 lt!417133 k0!1099))))

(assert (=> b!926745 (= (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2745 (getCurrentListMap!3080 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417134))))

(assert (=> b!926745 (= lt!417134 (tuple2!12931 lt!417126 lt!417133))))

(declare-fun get!14060 (ValueCell!9392 V!31295) V!31295)

(declare-fun dynLambda!1542 (Int (_ BitVec 64)) V!31295)

(assert (=> b!926745 (= lt!417133 (get!14060 (select (arr!26697 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1542 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417131 () Unit!31283)

(declare-fun lemmaListMapRecursiveValidKeyArray!125 (array!55511 array!55513 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 32) Int) Unit!31283)

(assert (=> b!926745 (= lt!417131 (lemmaListMapRecursiveValidKeyArray!125 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926745 (= e!520235 lt!417124)))

(declare-fun b!926746 () Bool)

(declare-fun res!624176 () Bool)

(assert (=> b!926746 (=> (not res!624176) (not e!520231))))

(assert (=> b!926746 (= res!624176 (and (= (size!27157 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27156 _keys!1487) (size!27157 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926747 () Bool)

(declare-fun Unit!31286 () Unit!31283)

(assert (=> b!926747 (= e!520237 Unit!31286)))

(declare-fun mapNonEmpty!31377 () Bool)

(declare-fun tp!60158 () Bool)

(assert (=> mapNonEmpty!31377 (= mapRes!31377 (and tp!60158 e!520225))))

(declare-fun mapRest!31377 () (Array (_ BitVec 32) ValueCell!9392))

(declare-fun mapKey!31377 () (_ BitVec 32))

(declare-fun mapValue!31377 () ValueCell!9392)

(assert (=> mapNonEmpty!31377 (= (arr!26697 _values!1231) (store mapRest!31377 mapKey!31377 mapValue!31377))))

(assert (= (and start!79194 res!624180) b!926746))

(assert (= (and b!926746 res!624176) b!926729))

(assert (= (and b!926729 res!624182) b!926730))

(assert (= (and b!926730 res!624178) b!926742))

(assert (= (and b!926742 res!624181) b!926737))

(assert (= (and b!926737 res!624179) b!926741))

(assert (= (and b!926741 res!624183) b!926733))

(assert (= (and b!926733 c!96918) b!926743))

(assert (= (and b!926733 (not c!96918)) b!926747))

(assert (= (and b!926743 c!96916) b!926745))

(assert (= (and b!926743 (not c!96916)) b!926739))

(assert (= (and b!926745 c!96917) b!926734))

(assert (= (and b!926745 (not c!96917)) b!926744))

(assert (= (and b!926733 res!624186) b!926738))

(assert (= (and b!926738 res!624184) b!926731))

(assert (= (and b!926731 res!624177) b!926740))

(assert (= (and b!926740 res!624185) b!926728))

(assert (= (and b!926735 condMapEmpty!31377) mapIsEmpty!31377))

(assert (= (and b!926735 (not condMapEmpty!31377)) mapNonEmpty!31377))

(get-info :version)

(assert (= (and mapNonEmpty!31377 ((_ is ValueCellFull!9392) mapValue!31377)) b!926732))

(assert (= (and b!926735 ((_ is ValueCellFull!9392) mapDefault!31377)) b!926736))

(assert (= start!79194 b!926735))

(declare-fun b_lambda!13755 () Bool)

(assert (=> (not b_lambda!13755) (not b!926745)))

(declare-fun t!26701 () Bool)

(declare-fun tb!5811 () Bool)

(assert (=> (and start!79194 (= defaultEntry!1235 defaultEntry!1235) t!26701) tb!5811))

(declare-fun result!11453 () Bool)

(assert (=> tb!5811 (= result!11453 tp_is_empty!19747)))

(assert (=> b!926745 t!26701))

(declare-fun b_and!28227 () Bool)

(assert (= b_and!28225 (and (=> t!26701 result!11453) b_and!28227)))

(declare-fun m!861589 () Bool)

(assert (=> b!926743 m!861589))

(declare-fun m!861591 () Bool)

(assert (=> b!926743 m!861591))

(declare-fun m!861593 () Bool)

(assert (=> b!926731 m!861593))

(declare-fun m!861595 () Bool)

(assert (=> b!926730 m!861595))

(declare-fun m!861597 () Bool)

(assert (=> b!926729 m!861597))

(declare-fun m!861599 () Bool)

(assert (=> b!926740 m!861599))

(declare-fun m!861601 () Bool)

(assert (=> b!926740 m!861601))

(declare-fun m!861603 () Bool)

(assert (=> b!926740 m!861603))

(declare-fun m!861605 () Bool)

(assert (=> b!926745 m!861605))

(declare-fun m!861607 () Bool)

(assert (=> b!926745 m!861607))

(declare-fun m!861609 () Bool)

(assert (=> b!926745 m!861609))

(declare-fun m!861611 () Bool)

(assert (=> b!926745 m!861611))

(declare-fun m!861613 () Bool)

(assert (=> b!926745 m!861613))

(declare-fun m!861615 () Bool)

(assert (=> b!926745 m!861615))

(declare-fun m!861617 () Bool)

(assert (=> b!926745 m!861617))

(declare-fun m!861619 () Bool)

(assert (=> b!926745 m!861619))

(declare-fun m!861621 () Bool)

(assert (=> b!926745 m!861621))

(declare-fun m!861623 () Bool)

(assert (=> b!926745 m!861623))

(declare-fun m!861625 () Bool)

(assert (=> b!926745 m!861625))

(declare-fun m!861627 () Bool)

(assert (=> b!926745 m!861627))

(declare-fun m!861629 () Bool)

(assert (=> b!926745 m!861629))

(assert (=> b!926745 m!861609))

(assert (=> b!926745 m!861611))

(declare-fun m!861631 () Bool)

(assert (=> b!926745 m!861631))

(assert (=> b!926745 m!861627))

(declare-fun m!861633 () Bool)

(assert (=> b!926745 m!861633))

(declare-fun m!861635 () Bool)

(assert (=> b!926745 m!861635))

(declare-fun m!861637 () Bool)

(assert (=> b!926734 m!861637))

(declare-fun m!861639 () Bool)

(assert (=> b!926728 m!861639))

(declare-fun m!861641 () Bool)

(assert (=> b!926737 m!861641))

(declare-fun m!861643 () Bool)

(assert (=> b!926737 m!861643))

(declare-fun m!861645 () Bool)

(assert (=> b!926741 m!861645))

(declare-fun m!861647 () Bool)

(assert (=> b!926733 m!861647))

(declare-fun m!861649 () Bool)

(assert (=> mapNonEmpty!31377 m!861649))

(declare-fun m!861651 () Bool)

(assert (=> b!926738 m!861651))

(assert (=> b!926738 m!861617))

(declare-fun m!861653 () Bool)

(assert (=> start!79194 m!861653))

(declare-fun m!861655 () Bool)

(assert (=> start!79194 m!861655))

(declare-fun m!861657 () Bool)

(assert (=> start!79194 m!861657))

(check-sat (not start!79194) (not b_next!17239) (not b!926737) (not b!926728) (not b!926731) (not b!926740) (not b!926738) b_and!28227 (not b!926730) tp_is_empty!19747 (not b!926741) (not b!926743) (not b!926733) (not b_lambda!13755) (not mapNonEmpty!31377) (not b!926745) (not b!926729) (not b!926734))
(check-sat b_and!28227 (not b_next!17239))
