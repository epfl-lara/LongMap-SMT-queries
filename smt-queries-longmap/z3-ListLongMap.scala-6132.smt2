; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78882 () Bool)

(assert start!78882)

(declare-fun b_free!17113 () Bool)

(declare-fun b_next!17113 () Bool)

(assert (=> start!78882 (= b_free!17113 (not b_next!17113))))

(declare-fun tp!59780 () Bool)

(declare-fun b_and!27937 () Bool)

(assert (=> start!78882 (= tp!59780 b_and!27937)))

(declare-fun b!922138 () Bool)

(declare-fun res!621895 () Bool)

(declare-fun e!517401 () Bool)

(assert (=> b!922138 (=> (not res!621895) (not e!517401))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922138 (= res!621895 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922139 () Bool)

(declare-fun e!517404 () Bool)

(declare-fun tp_is_empty!19621 () Bool)

(assert (=> b!922139 (= e!517404 tp_is_empty!19621)))

(declare-fun b!922140 () Bool)

(declare-fun res!621900 () Bool)

(declare-fun e!517403 () Bool)

(assert (=> b!922140 (=> (not res!621900) (not e!517403))))

(declare-datatypes ((array!55193 0))(
  ( (array!55194 (arr!26542 (Array (_ BitVec 32) (_ BitVec 64))) (size!27003 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55193)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55193 (_ BitVec 32)) Bool)

(assert (=> b!922140 (= res!621900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922141 () Bool)

(declare-fun e!517402 () Bool)

(assert (=> b!922141 (= e!517402 tp_is_empty!19621)))

(declare-fun b!922142 () Bool)

(declare-fun res!621894 () Bool)

(assert (=> b!922142 (=> (not res!621894) (not e!517401))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922142 (= res!621894 (validKeyInArray!0 k0!1099))))

(declare-fun b!922143 () Bool)

(assert (=> b!922143 (= e!517403 e!517401)))

(declare-fun res!621893 () Bool)

(assert (=> b!922143 (=> (not res!621893) (not e!517401))))

(declare-datatypes ((V!31127 0))(
  ( (V!31128 (val!9861 Int)) )
))
(declare-datatypes ((tuple2!12894 0))(
  ( (tuple2!12895 (_1!6458 (_ BitVec 64)) (_2!6458 V!31127)) )
))
(declare-datatypes ((List!18677 0))(
  ( (Nil!18674) (Cons!18673 (h!19819 tuple2!12894) (t!26511 List!18677)) )
))
(declare-datatypes ((ListLongMap!11581 0))(
  ( (ListLongMap!11582 (toList!5806 List!18677)) )
))
(declare-fun lt!413966 () ListLongMap!11581)

(declare-fun contains!4822 (ListLongMap!11581 (_ BitVec 64)) Bool)

(assert (=> b!922143 (= res!621893 (contains!4822 lt!413966 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9329 0))(
  ( (ValueCellFull!9329 (v!12378 V!31127)) (EmptyCell!9329) )
))
(declare-datatypes ((array!55195 0))(
  ( (array!55196 (arr!26543 (Array (_ BitVec 32) ValueCell!9329)) (size!27004 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55195)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31127)

(declare-fun minValue!1173 () V!31127)

(declare-fun getCurrentListMap!2996 (array!55193 array!55195 (_ BitVec 32) (_ BitVec 32) V!31127 V!31127 (_ BitVec 32) Int) ListLongMap!11581)

(assert (=> b!922143 (= lt!413966 (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!621901 () Bool)

(assert (=> start!78882 (=> (not res!621901) (not e!517403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78882 (= res!621901 (validMask!0 mask!1881))))

(assert (=> start!78882 e!517403))

(assert (=> start!78882 true))

(assert (=> start!78882 tp_is_empty!19621))

(declare-fun e!517399 () Bool)

(declare-fun array_inv!20762 (array!55195) Bool)

(assert (=> start!78882 (and (array_inv!20762 _values!1231) e!517399)))

(assert (=> start!78882 tp!59780))

(declare-fun array_inv!20763 (array!55193) Bool)

(assert (=> start!78882 (array_inv!20763 _keys!1487)))

(declare-fun b!922144 () Bool)

(declare-fun res!621896 () Bool)

(assert (=> b!922144 (=> (not res!621896) (not e!517403))))

(assert (=> b!922144 (= res!621896 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27003 _keys!1487))))))

(declare-fun b!922145 () Bool)

(declare-fun res!621897 () Bool)

(assert (=> b!922145 (=> (not res!621897) (not e!517403))))

(assert (=> b!922145 (= res!621897 (and (= (size!27004 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27003 _keys!1487) (size!27004 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922146 () Bool)

(declare-fun res!621902 () Bool)

(assert (=> b!922146 (=> (not res!621902) (not e!517401))))

(declare-fun v!791 () V!31127)

(declare-fun apply!622 (ListLongMap!11581 (_ BitVec 64)) V!31127)

(assert (=> b!922146 (= res!621902 (= (apply!622 lt!413966 k0!1099) v!791))))

(declare-fun mapNonEmpty!31188 () Bool)

(declare-fun mapRes!31188 () Bool)

(declare-fun tp!59781 () Bool)

(assert (=> mapNonEmpty!31188 (= mapRes!31188 (and tp!59781 e!517402))))

(declare-fun mapValue!31188 () ValueCell!9329)

(declare-fun mapRest!31188 () (Array (_ BitVec 32) ValueCell!9329))

(declare-fun mapKey!31188 () (_ BitVec 32))

(assert (=> mapNonEmpty!31188 (= (arr!26543 _values!1231) (store mapRest!31188 mapKey!31188 mapValue!31188))))

(declare-fun b!922147 () Bool)

(declare-fun e!517398 () Bool)

(assert (=> b!922147 (= e!517401 e!517398)))

(declare-fun res!621899 () Bool)

(assert (=> b!922147 (=> (not res!621899) (not e!517398))))

(declare-fun lt!413972 () (_ BitVec 64))

(assert (=> b!922147 (= res!621899 (validKeyInArray!0 lt!413972))))

(assert (=> b!922147 (= lt!413972 (select (arr!26542 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922148 () Bool)

(declare-fun res!621898 () Bool)

(assert (=> b!922148 (=> (not res!621898) (not e!517403))))

(declare-datatypes ((List!18678 0))(
  ( (Nil!18675) (Cons!18674 (h!19820 (_ BitVec 64)) (t!26512 List!18678)) )
))
(declare-fun arrayNoDuplicates!0 (array!55193 (_ BitVec 32) List!18678) Bool)

(assert (=> b!922148 (= res!621898 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18675))))

(declare-fun b!922149 () Bool)

(assert (=> b!922149 (= e!517398 (not true))))

(assert (=> b!922149 (not (= lt!413972 k0!1099))))

(declare-datatypes ((Unit!31040 0))(
  ( (Unit!31041) )
))
(declare-fun lt!413970 () Unit!31040)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55193 (_ BitVec 64) (_ BitVec 32) List!18678) Unit!31040)

(assert (=> b!922149 (= lt!413970 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18675))))

(declare-fun e!517400 () Bool)

(assert (=> b!922149 e!517400))

(declare-fun c!96106 () Bool)

(assert (=> b!922149 (= c!96106 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!413965 () Unit!31040)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!202 (array!55193 array!55195 (_ BitVec 32) (_ BitVec 32) V!31127 V!31127 (_ BitVec 64) (_ BitVec 32) Int) Unit!31040)

(assert (=> b!922149 (= lt!413965 (lemmaListMapContainsThenArrayContainsFrom!202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922149 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18675)))

(declare-fun lt!413968 () Unit!31040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55193 (_ BitVec 32) (_ BitVec 32)) Unit!31040)

(assert (=> b!922149 (= lt!413968 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413969 () tuple2!12894)

(declare-fun +!2714 (ListLongMap!11581 tuple2!12894) ListLongMap!11581)

(assert (=> b!922149 (contains!4822 (+!2714 lt!413966 lt!413969) k0!1099)))

(declare-fun lt!413971 () V!31127)

(declare-fun lt!413964 () Unit!31040)

(declare-fun addStillContains!411 (ListLongMap!11581 (_ BitVec 64) V!31127 (_ BitVec 64)) Unit!31040)

(assert (=> b!922149 (= lt!413964 (addStillContains!411 lt!413966 lt!413972 lt!413971 k0!1099))))

(assert (=> b!922149 (= (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2714 (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413969))))

(assert (=> b!922149 (= lt!413969 (tuple2!12895 lt!413972 lt!413971))))

(declare-fun get!13947 (ValueCell!9329 V!31127) V!31127)

(declare-fun dynLambda!1470 (Int (_ BitVec 64)) V!31127)

(assert (=> b!922149 (= lt!413971 (get!13947 (select (arr!26543 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1470 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413967 () Unit!31040)

(declare-fun lemmaListMapRecursiveValidKeyArray!78 (array!55193 array!55195 (_ BitVec 32) (_ BitVec 32) V!31127 V!31127 (_ BitVec 32) Int) Unit!31040)

(assert (=> b!922149 (= lt!413967 (lemmaListMapRecursiveValidKeyArray!78 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922150 () Bool)

(assert (=> b!922150 (= e!517399 (and e!517404 mapRes!31188))))

(declare-fun condMapEmpty!31188 () Bool)

(declare-fun mapDefault!31188 () ValueCell!9329)

(assert (=> b!922150 (= condMapEmpty!31188 (= (arr!26543 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9329)) mapDefault!31188)))))

(declare-fun b!922151 () Bool)

(declare-fun arrayContainsKey!0 (array!55193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922151 (= e!517400 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31188 () Bool)

(assert (=> mapIsEmpty!31188 mapRes!31188))

(declare-fun b!922152 () Bool)

(assert (=> b!922152 (= e!517400 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78882 res!621901) b!922145))

(assert (= (and b!922145 res!621897) b!922140))

(assert (= (and b!922140 res!621900) b!922148))

(assert (= (and b!922148 res!621898) b!922144))

(assert (= (and b!922144 res!621896) b!922143))

(assert (= (and b!922143 res!621893) b!922146))

(assert (= (and b!922146 res!621902) b!922138))

(assert (= (and b!922138 res!621895) b!922142))

(assert (= (and b!922142 res!621894) b!922147))

(assert (= (and b!922147 res!621899) b!922149))

(assert (= (and b!922149 c!96106) b!922151))

(assert (= (and b!922149 (not c!96106)) b!922152))

(assert (= (and b!922150 condMapEmpty!31188) mapIsEmpty!31188))

(assert (= (and b!922150 (not condMapEmpty!31188)) mapNonEmpty!31188))

(get-info :version)

(assert (= (and mapNonEmpty!31188 ((_ is ValueCellFull!9329) mapValue!31188)) b!922141))

(assert (= (and b!922150 ((_ is ValueCellFull!9329) mapDefault!31188)) b!922139))

(assert (= start!78882 b!922150))

(declare-fun b_lambda!13597 () Bool)

(assert (=> (not b_lambda!13597) (not b!922149)))

(declare-fun t!26510 () Bool)

(declare-fun tb!5685 () Bool)

(assert (=> (and start!78882 (= defaultEntry!1235 defaultEntry!1235) t!26510) tb!5685))

(declare-fun result!11201 () Bool)

(assert (=> tb!5685 (= result!11201 tp_is_empty!19621)))

(assert (=> b!922149 t!26510))

(declare-fun b_and!27939 () Bool)

(assert (= b_and!27937 (and (=> t!26510 result!11201) b_and!27939)))

(declare-fun m!855679 () Bool)

(assert (=> b!922147 m!855679))

(declare-fun m!855681 () Bool)

(assert (=> b!922147 m!855681))

(declare-fun m!855683 () Bool)

(assert (=> b!922146 m!855683))

(declare-fun m!855685 () Bool)

(assert (=> b!922148 m!855685))

(declare-fun m!855687 () Bool)

(assert (=> b!922151 m!855687))

(declare-fun m!855689 () Bool)

(assert (=> b!922149 m!855689))

(declare-fun m!855691 () Bool)

(assert (=> b!922149 m!855691))

(declare-fun m!855693 () Bool)

(assert (=> b!922149 m!855693))

(declare-fun m!855695 () Bool)

(assert (=> b!922149 m!855695))

(declare-fun m!855697 () Bool)

(assert (=> b!922149 m!855697))

(declare-fun m!855699 () Bool)

(assert (=> b!922149 m!855699))

(assert (=> b!922149 m!855695))

(assert (=> b!922149 m!855697))

(declare-fun m!855701 () Bool)

(assert (=> b!922149 m!855701))

(declare-fun m!855703 () Bool)

(assert (=> b!922149 m!855703))

(declare-fun m!855705 () Bool)

(assert (=> b!922149 m!855705))

(declare-fun m!855707 () Bool)

(assert (=> b!922149 m!855707))

(declare-fun m!855709 () Bool)

(assert (=> b!922149 m!855709))

(assert (=> b!922149 m!855699))

(declare-fun m!855711 () Bool)

(assert (=> b!922149 m!855711))

(declare-fun m!855713 () Bool)

(assert (=> b!922149 m!855713))

(assert (=> b!922149 m!855689))

(declare-fun m!855715 () Bool)

(assert (=> b!922149 m!855715))

(declare-fun m!855717 () Bool)

(assert (=> start!78882 m!855717))

(declare-fun m!855719 () Bool)

(assert (=> start!78882 m!855719))

(declare-fun m!855721 () Bool)

(assert (=> start!78882 m!855721))

(declare-fun m!855723 () Bool)

(assert (=> mapNonEmpty!31188 m!855723))

(declare-fun m!855725 () Bool)

(assert (=> b!922142 m!855725))

(declare-fun m!855727 () Bool)

(assert (=> b!922140 m!855727))

(declare-fun m!855729 () Bool)

(assert (=> b!922143 m!855729))

(declare-fun m!855731 () Bool)

(assert (=> b!922143 m!855731))

(check-sat b_and!27939 (not b!922148) (not b_lambda!13597) (not b!922143) (not b!922146) (not b!922147) (not b!922149) (not b!922151) (not mapNonEmpty!31188) tp_is_empty!19621 (not b!922140) (not b_next!17113) (not start!78882) (not b!922142))
(check-sat b_and!27939 (not b_next!17113))
