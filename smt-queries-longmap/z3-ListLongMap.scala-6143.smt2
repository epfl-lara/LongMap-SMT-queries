; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79134 () Bool)

(assert start!79134)

(declare-fun b_free!17179 () Bool)

(declare-fun b_next!17179 () Bool)

(assert (=> start!79134 (= b_free!17179 (not b_next!17179))))

(declare-fun tp!59978 () Bool)

(declare-fun b_and!28105 () Bool)

(assert (=> start!79134 (= tp!59978 b_and!28105)))

(declare-fun b!924972 () Bool)

(declare-fun e!519118 () Bool)

(assert (=> b!924972 (= e!519118 false)))

(declare-datatypes ((V!31215 0))(
  ( (V!31216 (val!9894 Int)) )
))
(declare-fun lt!415738 () V!31215)

(declare-datatypes ((tuple2!12880 0))(
  ( (tuple2!12881 (_1!6451 (_ BitVec 64)) (_2!6451 V!31215)) )
))
(declare-datatypes ((List!18693 0))(
  ( (Nil!18690) (Cons!18689 (h!19841 tuple2!12880) (t!26594 List!18693)) )
))
(declare-datatypes ((ListLongMap!11579 0))(
  ( (ListLongMap!11580 (toList!5805 List!18693)) )
))
(declare-fun lt!415747 () ListLongMap!11579)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!658 (ListLongMap!11579 (_ BitVec 64)) V!31215)

(assert (=> b!924972 (= lt!415738 (apply!658 lt!415747 k0!1099))))

(declare-fun b!924973 () Bool)

(declare-fun lt!415737 () ListLongMap!11579)

(declare-fun lt!415746 () V!31215)

(assert (=> b!924973 (= (apply!658 lt!415737 k0!1099) lt!415746)))

(declare-fun lt!415740 () V!31215)

(declare-fun lt!415739 () ListLongMap!11579)

(declare-datatypes ((Unit!31190 0))(
  ( (Unit!31191) )
))
(declare-fun lt!415735 () Unit!31190)

(declare-fun lt!415744 () (_ BitVec 64))

(declare-fun addApplyDifferent!361 (ListLongMap!11579 (_ BitVec 64) V!31215 (_ BitVec 64)) Unit!31190)

(assert (=> b!924973 (= lt!415735 (addApplyDifferent!361 lt!415739 lt!415744 lt!415740 k0!1099))))

(assert (=> b!924973 (not (= lt!415744 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!415745 () Unit!31190)

(declare-datatypes ((array!55395 0))(
  ( (array!55396 (arr!26638 (Array (_ BitVec 32) (_ BitVec 64))) (size!27098 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55395)

(declare-datatypes ((List!18694 0))(
  ( (Nil!18691) (Cons!18690 (h!19842 (_ BitVec 64)) (t!26595 List!18694)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55395 (_ BitVec 64) (_ BitVec 32) List!18694) Unit!31190)

(assert (=> b!924973 (= lt!415745 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18691))))

(declare-fun e!519108 () Bool)

(assert (=> b!924973 e!519108))

(declare-fun c!96648 () Bool)

(assert (=> b!924973 (= c!96648 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!415736 () Unit!31190)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9362 0))(
  ( (ValueCellFull!9362 (v!12409 V!31215)) (EmptyCell!9362) )
))
(declare-datatypes ((array!55397 0))(
  ( (array!55398 (arr!26639 (Array (_ BitVec 32) ValueCell!9362)) (size!27099 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55397)

(declare-fun zeroValue!1173 () V!31215)

(declare-fun minValue!1173 () V!31215)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!216 (array!55395 array!55397 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 64) (_ BitVec 32) Int) Unit!31190)

(assert (=> b!924973 (= lt!415736 (lemmaListMapContainsThenArrayContainsFrom!216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55395 (_ BitVec 32) List!18694) Bool)

(assert (=> b!924973 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18691)))

(declare-fun lt!415743 () Unit!31190)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55395 (_ BitVec 32) (_ BitVec 32)) Unit!31190)

(assert (=> b!924973 (= lt!415743 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4877 (ListLongMap!11579 (_ BitVec 64)) Bool)

(assert (=> b!924973 (contains!4877 lt!415737 k0!1099)))

(declare-fun lt!415742 () tuple2!12880)

(declare-fun +!2725 (ListLongMap!11579 tuple2!12880) ListLongMap!11579)

(assert (=> b!924973 (= lt!415737 (+!2725 lt!415739 lt!415742))))

(declare-fun lt!415748 () Unit!31190)

(declare-fun addStillContains!434 (ListLongMap!11579 (_ BitVec 64) V!31215 (_ BitVec 64)) Unit!31190)

(assert (=> b!924973 (= lt!415748 (addStillContains!434 lt!415739 lt!415744 lt!415740 k0!1099))))

(declare-fun getCurrentListMap!3055 (array!55395 array!55397 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 32) Int) ListLongMap!11579)

(assert (=> b!924973 (= (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2725 (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415742))))

(assert (=> b!924973 (= lt!415742 (tuple2!12881 lt!415744 lt!415740))))

(declare-fun get!14020 (ValueCell!9362 V!31215) V!31215)

(declare-fun dynLambda!1522 (Int (_ BitVec 64)) V!31215)

(assert (=> b!924973 (= lt!415740 (get!14020 (select (arr!26639 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1522 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415741 () Unit!31190)

(declare-fun lemmaListMapRecursiveValidKeyArray!105 (array!55395 array!55397 (_ BitVec 32) (_ BitVec 32) V!31215 V!31215 (_ BitVec 32) Int) Unit!31190)

(assert (=> b!924973 (= lt!415741 (lemmaListMapRecursiveValidKeyArray!105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519111 () Unit!31190)

(assert (=> b!924973 (= e!519111 lt!415735)))

(declare-fun b!924974 () Bool)

(declare-fun e!519112 () Bool)

(assert (=> b!924974 (= e!519112 e!519118)))

(declare-fun res!623293 () Bool)

(assert (=> b!924974 (=> (not res!623293) (not e!519118))))

(assert (=> b!924974 (= res!623293 (contains!4877 lt!415747 k0!1099))))

(assert (=> b!924974 (= lt!415747 (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924975 () Bool)

(declare-fun e!519116 () Bool)

(declare-fun e!519113 () Bool)

(assert (=> b!924975 (= e!519116 e!519113)))

(declare-fun res!623297 () Bool)

(assert (=> b!924975 (=> (not res!623297) (not e!519113))))

(declare-fun v!791 () V!31215)

(assert (=> b!924975 (= res!623297 (and (= lt!415746 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924975 (= lt!415746 (apply!658 lt!415739 k0!1099))))

(declare-fun b!924976 () Bool)

(declare-fun res!623298 () Bool)

(declare-fun e!519114 () Bool)

(assert (=> b!924976 (=> (not res!623298) (not e!519114))))

(assert (=> b!924976 (= res!623298 (and (= (size!27099 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27098 _keys!1487) (size!27099 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924977 () Bool)

(declare-fun arrayContainsKey!0 (array!55395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924977 (= e!519108 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!623290 () Bool)

(assert (=> start!79134 (=> (not res!623290) (not e!519114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79134 (= res!623290 (validMask!0 mask!1881))))

(assert (=> start!79134 e!519114))

(assert (=> start!79134 true))

(declare-fun tp_is_empty!19687 () Bool)

(assert (=> start!79134 tp_is_empty!19687))

(declare-fun e!519110 () Bool)

(declare-fun array_inv!20848 (array!55397) Bool)

(assert (=> start!79134 (and (array_inv!20848 _values!1231) e!519110)))

(assert (=> start!79134 tp!59978))

(declare-fun array_inv!20849 (array!55395) Bool)

(assert (=> start!79134 (array_inv!20849 _keys!1487)))

(declare-fun b!924978 () Bool)

(declare-fun res!623291 () Bool)

(assert (=> b!924978 (=> (not res!623291) (not e!519114))))

(assert (=> b!924978 (= res!623291 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18691))))

(declare-fun b!924979 () Bool)

(assert (=> b!924979 (= e!519114 e!519116)))

(declare-fun res!623294 () Bool)

(assert (=> b!924979 (=> (not res!623294) (not e!519116))))

(assert (=> b!924979 (= res!623294 (contains!4877 lt!415739 k0!1099))))

(assert (=> b!924979 (= lt!415739 (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924980 () Bool)

(declare-fun e!519117 () Bool)

(assert (=> b!924980 (= e!519117 tp_is_empty!19687)))

(declare-fun b!924981 () Bool)

(assert (=> b!924981 (= e!519108 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924982 () Bool)

(declare-fun Unit!31192 () Unit!31190)

(assert (=> b!924982 (= e!519111 Unit!31192)))

(declare-fun mapNonEmpty!31287 () Bool)

(declare-fun mapRes!31287 () Bool)

(declare-fun tp!59979 () Bool)

(assert (=> mapNonEmpty!31287 (= mapRes!31287 (and tp!59979 e!519117))))

(declare-fun mapValue!31287 () ValueCell!9362)

(declare-fun mapRest!31287 () (Array (_ BitVec 32) ValueCell!9362))

(declare-fun mapKey!31287 () (_ BitVec 32))

(assert (=> mapNonEmpty!31287 (= (arr!26639 _values!1231) (store mapRest!31287 mapKey!31287 mapValue!31287))))

(declare-fun b!924983 () Bool)

(assert (=> b!924983 (= e!519113 e!519112)))

(declare-fun res!623292 () Bool)

(assert (=> b!924983 (=> (not res!623292) (not e!519112))))

(assert (=> b!924983 (= res!623292 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27098 _keys!1487)))))

(declare-fun lt!415734 () Unit!31190)

(declare-fun e!519109 () Unit!31190)

(assert (=> b!924983 (= lt!415734 e!519109)))

(declare-fun c!96647 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924983 (= c!96647 (validKeyInArray!0 k0!1099))))

(declare-fun b!924984 () Bool)

(declare-fun e!519107 () Bool)

(assert (=> b!924984 (= e!519107 tp_is_empty!19687)))

(declare-fun b!924985 () Bool)

(declare-fun res!623296 () Bool)

(assert (=> b!924985 (=> (not res!623296) (not e!519114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55395 (_ BitVec 32)) Bool)

(assert (=> b!924985 (= res!623296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31287 () Bool)

(assert (=> mapIsEmpty!31287 mapRes!31287))

(declare-fun b!924986 () Bool)

(assert (=> b!924986 (= e!519109 e!519111)))

(assert (=> b!924986 (= lt!415744 (select (arr!26638 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96646 () Bool)

(assert (=> b!924986 (= c!96646 (validKeyInArray!0 lt!415744))))

(declare-fun b!924987 () Bool)

(assert (=> b!924987 (= e!519110 (and e!519107 mapRes!31287))))

(declare-fun condMapEmpty!31287 () Bool)

(declare-fun mapDefault!31287 () ValueCell!9362)

(assert (=> b!924987 (= condMapEmpty!31287 (= (arr!26639 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9362)) mapDefault!31287)))))

(declare-fun b!924988 () Bool)

(declare-fun res!623295 () Bool)

(assert (=> b!924988 (=> (not res!623295) (not e!519114))))

(assert (=> b!924988 (= res!623295 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27098 _keys!1487))))))

(declare-fun b!924989 () Bool)

(declare-fun Unit!31193 () Unit!31190)

(assert (=> b!924989 (= e!519109 Unit!31193)))

(assert (= (and start!79134 res!623290) b!924976))

(assert (= (and b!924976 res!623298) b!924985))

(assert (= (and b!924985 res!623296) b!924978))

(assert (= (and b!924978 res!623291) b!924988))

(assert (= (and b!924988 res!623295) b!924979))

(assert (= (and b!924979 res!623294) b!924975))

(assert (= (and b!924975 res!623297) b!924983))

(assert (= (and b!924983 c!96647) b!924986))

(assert (= (and b!924983 (not c!96647)) b!924989))

(assert (= (and b!924986 c!96646) b!924973))

(assert (= (and b!924986 (not c!96646)) b!924982))

(assert (= (and b!924973 c!96648) b!924977))

(assert (= (and b!924973 (not c!96648)) b!924981))

(assert (= (and b!924983 res!623292) b!924974))

(assert (= (and b!924974 res!623293) b!924972))

(assert (= (and b!924987 condMapEmpty!31287) mapIsEmpty!31287))

(assert (= (and b!924987 (not condMapEmpty!31287)) mapNonEmpty!31287))

(get-info :version)

(assert (= (and mapNonEmpty!31287 ((_ is ValueCellFull!9362) mapValue!31287)) b!924980))

(assert (= (and b!924987 ((_ is ValueCellFull!9362) mapDefault!31287)) b!924984))

(assert (= start!79134 b!924987))

(declare-fun b_lambda!13695 () Bool)

(assert (=> (not b_lambda!13695) (not b!924973)))

(declare-fun t!26593 () Bool)

(declare-fun tb!5751 () Bool)

(assert (=> (and start!79134 (= defaultEntry!1235 defaultEntry!1235) t!26593) tb!5751))

(declare-fun result!11333 () Bool)

(assert (=> tb!5751 (= result!11333 tp_is_empty!19687)))

(assert (=> b!924973 t!26593))

(declare-fun b_and!28107 () Bool)

(assert (= b_and!28105 (and (=> t!26593 result!11333) b_and!28107)))

(declare-fun m!859633 () Bool)

(assert (=> b!924983 m!859633))

(declare-fun m!859635 () Bool)

(assert (=> b!924986 m!859635))

(declare-fun m!859637 () Bool)

(assert (=> b!924986 m!859637))

(declare-fun m!859639 () Bool)

(assert (=> b!924978 m!859639))

(declare-fun m!859641 () Bool)

(assert (=> b!924979 m!859641))

(declare-fun m!859643 () Bool)

(assert (=> b!924979 m!859643))

(declare-fun m!859645 () Bool)

(assert (=> mapNonEmpty!31287 m!859645))

(declare-fun m!859647 () Bool)

(assert (=> b!924972 m!859647))

(declare-fun m!859649 () Bool)

(assert (=> start!79134 m!859649))

(declare-fun m!859651 () Bool)

(assert (=> start!79134 m!859651))

(declare-fun m!859653 () Bool)

(assert (=> start!79134 m!859653))

(declare-fun m!859655 () Bool)

(assert (=> b!924975 m!859655))

(declare-fun m!859657 () Bool)

(assert (=> b!924973 m!859657))

(declare-fun m!859659 () Bool)

(assert (=> b!924973 m!859659))

(declare-fun m!859661 () Bool)

(assert (=> b!924973 m!859661))

(declare-fun m!859663 () Bool)

(assert (=> b!924973 m!859663))

(declare-fun m!859665 () Bool)

(assert (=> b!924973 m!859665))

(declare-fun m!859667 () Bool)

(assert (=> b!924973 m!859667))

(assert (=> b!924973 m!859663))

(declare-fun m!859669 () Bool)

(assert (=> b!924973 m!859669))

(declare-fun m!859671 () Bool)

(assert (=> b!924973 m!859671))

(declare-fun m!859673 () Bool)

(assert (=> b!924973 m!859673))

(declare-fun m!859675 () Bool)

(assert (=> b!924973 m!859675))

(declare-fun m!859677 () Bool)

(assert (=> b!924973 m!859677))

(declare-fun m!859679 () Bool)

(assert (=> b!924973 m!859679))

(assert (=> b!924973 m!859667))

(declare-fun m!859681 () Bool)

(assert (=> b!924973 m!859681))

(declare-fun m!859683 () Bool)

(assert (=> b!924973 m!859683))

(declare-fun m!859685 () Bool)

(assert (=> b!924973 m!859685))

(assert (=> b!924973 m!859683))

(declare-fun m!859687 () Bool)

(assert (=> b!924973 m!859687))

(declare-fun m!859689 () Bool)

(assert (=> b!924985 m!859689))

(declare-fun m!859691 () Bool)

(assert (=> b!924977 m!859691))

(declare-fun m!859693 () Bool)

(assert (=> b!924974 m!859693))

(assert (=> b!924974 m!859671))

(check-sat (not b!924986) (not b_lambda!13695) (not b!924975) b_and!28107 (not b!924979) (not b_next!17179) (not mapNonEmpty!31287) (not b!924978) (not start!79134) (not b!924972) (not b!924977) (not b!924973) (not b!924983) (not b!924985) tp_is_empty!19687 (not b!924974))
(check-sat b_and!28107 (not b_next!17179))
