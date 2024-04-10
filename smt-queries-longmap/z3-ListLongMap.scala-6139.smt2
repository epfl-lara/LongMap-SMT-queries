; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78944 () Bool)

(assert start!78944)

(declare-fun b_free!17157 () Bool)

(declare-fun b_next!17157 () Bool)

(assert (=> start!78944 (= b_free!17157 (not b_next!17157))))

(declare-fun tp!59911 () Bool)

(declare-fun b_and!28051 () Bool)

(assert (=> start!78944 (= tp!59911 b_and!28051)))

(declare-fun b!923453 () Bool)

(declare-datatypes ((Unit!31156 0))(
  ( (Unit!31157) )
))
(declare-fun e!518132 () Unit!31156)

(declare-fun e!518134 () Unit!31156)

(assert (=> b!923453 (= e!518132 e!518134)))

(declare-fun lt!414890 () (_ BitVec 64))

(declare-datatypes ((array!55304 0))(
  ( (array!55305 (arr!26597 (Array (_ BitVec 32) (_ BitVec 64))) (size!27056 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55304)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923453 (= lt!414890 (select (arr!26597 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96267 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923453 (= c!96267 (validKeyInArray!0 lt!414890))))

(declare-fun b!923454 () Bool)

(declare-fun res!622656 () Bool)

(declare-fun e!518137 () Bool)

(assert (=> b!923454 (=> (not res!622656) (not e!518137))))

(assert (=> b!923454 (= res!622656 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27056 _keys!1487))))))

(declare-fun b!923455 () Bool)

(declare-fun Unit!31158 () Unit!31156)

(assert (=> b!923455 (= e!518134 Unit!31158)))

(declare-fun res!622650 () Bool)

(assert (=> start!78944 (=> (not res!622650) (not e!518137))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78944 (= res!622650 (validMask!0 mask!1881))))

(assert (=> start!78944 e!518137))

(assert (=> start!78944 true))

(declare-fun tp_is_empty!19665 () Bool)

(assert (=> start!78944 tp_is_empty!19665))

(declare-datatypes ((V!31185 0))(
  ( (V!31186 (val!9883 Int)) )
))
(declare-datatypes ((ValueCell!9351 0))(
  ( (ValueCellFull!9351 (v!12401 V!31185)) (EmptyCell!9351) )
))
(declare-datatypes ((array!55306 0))(
  ( (array!55307 (arr!26598 (Array (_ BitVec 32) ValueCell!9351)) (size!27057 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55306)

(declare-fun e!518136 () Bool)

(declare-fun array_inv!20714 (array!55306) Bool)

(assert (=> start!78944 (and (array_inv!20714 _values!1231) e!518136)))

(assert (=> start!78944 tp!59911))

(declare-fun array_inv!20715 (array!55304) Bool)

(assert (=> start!78944 (array_inv!20715 _keys!1487)))

(declare-fun b!923456 () Bool)

(declare-fun e!518139 () Bool)

(declare-fun e!518129 () Bool)

(assert (=> b!923456 (= e!518139 e!518129)))

(declare-fun res!622655 () Bool)

(assert (=> b!923456 (=> (not res!622655) (not e!518129))))

(declare-datatypes ((tuple2!12866 0))(
  ( (tuple2!12867 (_1!6444 (_ BitVec 64)) (_2!6444 V!31185)) )
))
(declare-datatypes ((List!18670 0))(
  ( (Nil!18667) (Cons!18666 (h!19812 tuple2!12866) (t!26557 List!18670)) )
))
(declare-datatypes ((ListLongMap!11563 0))(
  ( (ListLongMap!11564 (toList!5797 List!18670)) )
))
(declare-fun lt!414883 () ListLongMap!11563)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4859 (ListLongMap!11563 (_ BitVec 64)) Bool)

(assert (=> b!923456 (= res!622655 (contains!4859 lt!414883 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31185)

(declare-fun minValue!1173 () V!31185)

(declare-fun getCurrentListMap!3050 (array!55304 array!55306 (_ BitVec 32) (_ BitVec 32) V!31185 V!31185 (_ BitVec 32) Int) ListLongMap!11563)

(assert (=> b!923456 (= lt!414883 (getCurrentListMap!3050 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923457 () Bool)

(declare-fun e!518131 () Bool)

(assert (=> b!923457 (= e!518131 tp_is_empty!19665)))

(declare-fun mapIsEmpty!31254 () Bool)

(declare-fun mapRes!31254 () Bool)

(assert (=> mapIsEmpty!31254 mapRes!31254))

(declare-fun b!923458 () Bool)

(declare-fun Unit!31159 () Unit!31156)

(assert (=> b!923458 (= e!518132 Unit!31159)))

(declare-fun b!923459 () Bool)

(declare-fun lt!414887 () ListLongMap!11563)

(declare-fun lt!414880 () V!31185)

(declare-fun apply!627 (ListLongMap!11563 (_ BitVec 64)) V!31185)

(assert (=> b!923459 (= (apply!627 lt!414887 k0!1099) lt!414880)))

(declare-fun lt!414881 () ListLongMap!11563)

(declare-fun lt!414892 () Unit!31156)

(declare-fun lt!414884 () V!31185)

(declare-fun addApplyDifferent!355 (ListLongMap!11563 (_ BitVec 64) V!31185 (_ BitVec 64)) Unit!31156)

(assert (=> b!923459 (= lt!414892 (addApplyDifferent!355 lt!414881 lt!414890 lt!414884 k0!1099))))

(assert (=> b!923459 (not (= lt!414890 k0!1099))))

(declare-fun lt!414886 () Unit!31156)

(declare-datatypes ((List!18671 0))(
  ( (Nil!18668) (Cons!18667 (h!19813 (_ BitVec 64)) (t!26558 List!18671)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55304 (_ BitVec 64) (_ BitVec 32) List!18671) Unit!31156)

(assert (=> b!923459 (= lt!414886 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18668))))

(declare-fun e!518138 () Bool)

(assert (=> b!923459 e!518138))

(declare-fun c!96265 () Bool)

(assert (=> b!923459 (= c!96265 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414885 () Unit!31156)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!206 (array!55304 array!55306 (_ BitVec 32) (_ BitVec 32) V!31185 V!31185 (_ BitVec 64) (_ BitVec 32) Int) Unit!31156)

(assert (=> b!923459 (= lt!414885 (lemmaListMapContainsThenArrayContainsFrom!206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55304 (_ BitVec 32) List!18671) Bool)

(assert (=> b!923459 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18668)))

(declare-fun lt!414879 () Unit!31156)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55304 (_ BitVec 32) (_ BitVec 32)) Unit!31156)

(assert (=> b!923459 (= lt!414879 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923459 (contains!4859 lt!414887 k0!1099)))

(declare-fun lt!414889 () tuple2!12866)

(declare-fun +!2699 (ListLongMap!11563 tuple2!12866) ListLongMap!11563)

(assert (=> b!923459 (= lt!414887 (+!2699 lt!414881 lt!414889))))

(declare-fun lt!414882 () Unit!31156)

(declare-fun addStillContains!423 (ListLongMap!11563 (_ BitVec 64) V!31185 (_ BitVec 64)) Unit!31156)

(assert (=> b!923459 (= lt!414882 (addStillContains!423 lt!414881 lt!414890 lt!414884 k0!1099))))

(assert (=> b!923459 (= (getCurrentListMap!3050 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2699 (getCurrentListMap!3050 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414889))))

(assert (=> b!923459 (= lt!414889 (tuple2!12867 lt!414890 lt!414884))))

(declare-fun get!13974 (ValueCell!9351 V!31185) V!31185)

(declare-fun dynLambda!1488 (Int (_ BitVec 64)) V!31185)

(assert (=> b!923459 (= lt!414884 (get!13974 (select (arr!26598 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1488 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414891 () Unit!31156)

(declare-fun lemmaListMapRecursiveValidKeyArray!89 (array!55304 array!55306 (_ BitVec 32) (_ BitVec 32) V!31185 V!31185 (_ BitVec 32) Int) Unit!31156)

(assert (=> b!923459 (= lt!414891 (lemmaListMapRecursiveValidKeyArray!89 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923459 (= e!518134 lt!414892)))

(declare-fun b!923460 () Bool)

(declare-fun e!518130 () Bool)

(assert (=> b!923460 (= e!518137 e!518130)))

(declare-fun res!622653 () Bool)

(assert (=> b!923460 (=> (not res!622653) (not e!518130))))

(assert (=> b!923460 (= res!622653 (contains!4859 lt!414881 k0!1099))))

(assert (=> b!923460 (= lt!414881 (getCurrentListMap!3050 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923461 () Bool)

(assert (=> b!923461 (= e!518136 (and e!518131 mapRes!31254))))

(declare-fun condMapEmpty!31254 () Bool)

(declare-fun mapDefault!31254 () ValueCell!9351)

(assert (=> b!923461 (= condMapEmpty!31254 (= (arr!26598 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9351)) mapDefault!31254)))))

(declare-fun b!923462 () Bool)

(declare-fun res!622654 () Bool)

(assert (=> b!923462 (=> (not res!622654) (not e!518137))))

(assert (=> b!923462 (= res!622654 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18668))))

(declare-fun b!923463 () Bool)

(assert (=> b!923463 (= e!518129 false)))

(declare-fun lt!414888 () V!31185)

(assert (=> b!923463 (= lt!414888 (apply!627 lt!414883 k0!1099))))

(declare-fun b!923464 () Bool)

(declare-fun e!518133 () Bool)

(assert (=> b!923464 (= e!518130 e!518133)))

(declare-fun res!622652 () Bool)

(assert (=> b!923464 (=> (not res!622652) (not e!518133))))

(declare-fun v!791 () V!31185)

(assert (=> b!923464 (= res!622652 (and (= lt!414880 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923464 (= lt!414880 (apply!627 lt!414881 k0!1099))))

(declare-fun b!923465 () Bool)

(declare-fun arrayContainsKey!0 (array!55304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923465 (= e!518138 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923466 () Bool)

(assert (=> b!923466 (= e!518138 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31254 () Bool)

(declare-fun tp!59912 () Bool)

(declare-fun e!518140 () Bool)

(assert (=> mapNonEmpty!31254 (= mapRes!31254 (and tp!59912 e!518140))))

(declare-fun mapRest!31254 () (Array (_ BitVec 32) ValueCell!9351))

(declare-fun mapValue!31254 () ValueCell!9351)

(declare-fun mapKey!31254 () (_ BitVec 32))

(assert (=> mapNonEmpty!31254 (= (arr!26598 _values!1231) (store mapRest!31254 mapKey!31254 mapValue!31254))))

(declare-fun b!923467 () Bool)

(assert (=> b!923467 (= e!518140 tp_is_empty!19665)))

(declare-fun b!923468 () Bool)

(declare-fun res!622657 () Bool)

(assert (=> b!923468 (=> (not res!622657) (not e!518137))))

(assert (=> b!923468 (= res!622657 (and (= (size!27057 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27056 _keys!1487) (size!27057 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923469 () Bool)

(declare-fun res!622649 () Bool)

(assert (=> b!923469 (=> (not res!622649) (not e!518137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55304 (_ BitVec 32)) Bool)

(assert (=> b!923469 (= res!622649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923470 () Bool)

(assert (=> b!923470 (= e!518133 e!518139)))

(declare-fun res!622651 () Bool)

(assert (=> b!923470 (=> (not res!622651) (not e!518139))))

(assert (=> b!923470 (= res!622651 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27056 _keys!1487)))))

(declare-fun lt!414878 () Unit!31156)

(assert (=> b!923470 (= lt!414878 e!518132)))

(declare-fun c!96266 () Bool)

(assert (=> b!923470 (= c!96266 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78944 res!622650) b!923468))

(assert (= (and b!923468 res!622657) b!923469))

(assert (= (and b!923469 res!622649) b!923462))

(assert (= (and b!923462 res!622654) b!923454))

(assert (= (and b!923454 res!622656) b!923460))

(assert (= (and b!923460 res!622653) b!923464))

(assert (= (and b!923464 res!622652) b!923470))

(assert (= (and b!923470 c!96266) b!923453))

(assert (= (and b!923470 (not c!96266)) b!923458))

(assert (= (and b!923453 c!96267) b!923459))

(assert (= (and b!923453 (not c!96267)) b!923455))

(assert (= (and b!923459 c!96265) b!923465))

(assert (= (and b!923459 (not c!96265)) b!923466))

(assert (= (and b!923470 res!622651) b!923456))

(assert (= (and b!923456 res!622655) b!923463))

(assert (= (and b!923461 condMapEmpty!31254) mapIsEmpty!31254))

(assert (= (and b!923461 (not condMapEmpty!31254)) mapNonEmpty!31254))

(get-info :version)

(assert (= (and mapNonEmpty!31254 ((_ is ValueCellFull!9351) mapValue!31254)) b!923467))

(assert (= (and b!923461 ((_ is ValueCellFull!9351) mapDefault!31254)) b!923457))

(assert (= start!78944 b!923461))

(declare-fun b_lambda!13659 () Bool)

(assert (=> (not b_lambda!13659) (not b!923459)))

(declare-fun t!26556 () Bool)

(declare-fun tb!5737 () Bool)

(assert (=> (and start!78944 (= defaultEntry!1235 defaultEntry!1235) t!26556) tb!5737))

(declare-fun result!11297 () Bool)

(assert (=> tb!5737 (= result!11297 tp_is_empty!19665)))

(assert (=> b!923459 t!26556))

(declare-fun b_and!28053 () Bool)

(assert (= b_and!28051 (and (=> t!26556 result!11297) b_and!28053)))

(declare-fun m!857657 () Bool)

(assert (=> b!923453 m!857657))

(declare-fun m!857659 () Bool)

(assert (=> b!923453 m!857659))

(declare-fun m!857661 () Bool)

(assert (=> b!923456 m!857661))

(declare-fun m!857663 () Bool)

(assert (=> b!923456 m!857663))

(declare-fun m!857665 () Bool)

(assert (=> start!78944 m!857665))

(declare-fun m!857667 () Bool)

(assert (=> start!78944 m!857667))

(declare-fun m!857669 () Bool)

(assert (=> start!78944 m!857669))

(declare-fun m!857671 () Bool)

(assert (=> b!923462 m!857671))

(declare-fun m!857673 () Bool)

(assert (=> b!923459 m!857673))

(declare-fun m!857675 () Bool)

(assert (=> b!923459 m!857675))

(declare-fun m!857677 () Bool)

(assert (=> b!923459 m!857677))

(declare-fun m!857679 () Bool)

(assert (=> b!923459 m!857679))

(declare-fun m!857681 () Bool)

(assert (=> b!923459 m!857681))

(declare-fun m!857683 () Bool)

(assert (=> b!923459 m!857683))

(declare-fun m!857685 () Bool)

(assert (=> b!923459 m!857685))

(declare-fun m!857687 () Bool)

(assert (=> b!923459 m!857687))

(declare-fun m!857689 () Bool)

(assert (=> b!923459 m!857689))

(assert (=> b!923459 m!857685))

(assert (=> b!923459 m!857689))

(declare-fun m!857691 () Bool)

(assert (=> b!923459 m!857691))

(assert (=> b!923459 m!857663))

(declare-fun m!857693 () Bool)

(assert (=> b!923459 m!857693))

(declare-fun m!857695 () Bool)

(assert (=> b!923459 m!857695))

(declare-fun m!857697 () Bool)

(assert (=> b!923459 m!857697))

(declare-fun m!857699 () Bool)

(assert (=> b!923459 m!857699))

(assert (=> b!923459 m!857675))

(declare-fun m!857701 () Bool)

(assert (=> b!923459 m!857701))

(declare-fun m!857703 () Bool)

(assert (=> b!923469 m!857703))

(declare-fun m!857705 () Bool)

(assert (=> b!923464 m!857705))

(declare-fun m!857707 () Bool)

(assert (=> b!923460 m!857707))

(declare-fun m!857709 () Bool)

(assert (=> b!923460 m!857709))

(declare-fun m!857711 () Bool)

(assert (=> mapNonEmpty!31254 m!857711))

(declare-fun m!857713 () Bool)

(assert (=> b!923465 m!857713))

(declare-fun m!857715 () Bool)

(assert (=> b!923470 m!857715))

(declare-fun m!857717 () Bool)

(assert (=> b!923463 m!857717))

(check-sat b_and!28053 (not b!923464) (not b!923463) (not b!923462) (not b!923456) (not b!923465) (not b!923470) tp_is_empty!19665 (not b!923469) (not b!923453) (not b!923459) (not b!923460) (not mapNonEmpty!31254) (not start!78944) (not b_lambda!13659) (not b_next!17157))
(check-sat b_and!28053 (not b_next!17157))
