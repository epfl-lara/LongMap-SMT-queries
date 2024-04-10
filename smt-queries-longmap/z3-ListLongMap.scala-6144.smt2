; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78974 () Bool)

(assert start!78974)

(declare-fun b_free!17187 () Bool)

(declare-fun b_next!17187 () Bool)

(assert (=> start!78974 (= b_free!17187 (not b_next!17187))))

(declare-fun tp!60002 () Bool)

(declare-fun b_and!28111 () Bool)

(assert (=> start!78974 (= tp!60002 b_and!28111)))

(declare-fun b!924293 () Bool)

(declare-fun e!518679 () Bool)

(declare-fun tp_is_empty!19695 () Bool)

(assert (=> b!924293 (= e!518679 tp_is_empty!19695)))

(declare-fun b!924294 () Bool)

(declare-datatypes ((Unit!31198 0))(
  ( (Unit!31199) )
))
(declare-fun e!518678 () Unit!31198)

(declare-fun Unit!31200 () Unit!31198)

(assert (=> b!924294 (= e!518678 Unit!31200)))

(declare-fun b!924295 () Bool)

(declare-fun res!623057 () Bool)

(declare-fun e!518676 () Bool)

(assert (=> b!924295 (=> (not res!623057) (not e!518676))))

(declare-datatypes ((array!55360 0))(
  ( (array!55361 (arr!26625 (Array (_ BitVec 32) (_ BitVec 64))) (size!27084 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55360)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55360 (_ BitVec 32)) Bool)

(assert (=> b!924295 (= res!623057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924296 () Bool)

(declare-fun e!518674 () Bool)

(declare-fun e!518671 () Bool)

(assert (=> b!924296 (= e!518674 e!518671)))

(declare-fun res!623058 () Bool)

(assert (=> b!924296 (=> (not res!623058) (not e!518671))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31225 0))(
  ( (V!31226 (val!9898 Int)) )
))
(declare-fun v!791 () V!31225)

(declare-fun lt!415567 () V!31225)

(assert (=> b!924296 (= res!623058 (and (= lt!415567 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12894 0))(
  ( (tuple2!12895 (_1!6458 (_ BitVec 64)) (_2!6458 V!31225)) )
))
(declare-datatypes ((List!18696 0))(
  ( (Nil!18693) (Cons!18692 (h!19838 tuple2!12894) (t!26613 List!18696)) )
))
(declare-datatypes ((ListLongMap!11591 0))(
  ( (ListLongMap!11592 (toList!5811 List!18696)) )
))
(declare-fun lt!415553 () ListLongMap!11591)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!641 (ListLongMap!11591 (_ BitVec 64)) V!31225)

(assert (=> b!924296 (= lt!415567 (apply!641 lt!415553 k0!1099))))

(declare-fun b!924297 () Bool)

(declare-fun e!518680 () Bool)

(declare-fun e!518677 () Bool)

(assert (=> b!924297 (= e!518680 e!518677)))

(declare-fun res!623061 () Bool)

(assert (=> b!924297 (=> (not res!623061) (not e!518677))))

(declare-fun lt!415564 () ListLongMap!11591)

(declare-fun contains!4871 (ListLongMap!11591 (_ BitVec 64)) Bool)

(assert (=> b!924297 (= res!623061 (contains!4871 lt!415564 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9366 0))(
  ( (ValueCellFull!9366 (v!12416 V!31225)) (EmptyCell!9366) )
))
(declare-datatypes ((array!55362 0))(
  ( (array!55363 (arr!26626 (Array (_ BitVec 32) ValueCell!9366)) (size!27085 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55362)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31225)

(declare-fun minValue!1173 () V!31225)

(declare-fun getCurrentListMap!3062 (array!55360 array!55362 (_ BitVec 32) (_ BitVec 32) V!31225 V!31225 (_ BitVec 32) Int) ListLongMap!11591)

(assert (=> b!924297 (= lt!415564 (getCurrentListMap!3062 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!623059 () Bool)

(assert (=> start!78974 (=> (not res!623059) (not e!518676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78974 (= res!623059 (validMask!0 mask!1881))))

(assert (=> start!78974 e!518676))

(assert (=> start!78974 true))

(assert (=> start!78974 tp_is_empty!19695))

(declare-fun e!518669 () Bool)

(declare-fun array_inv!20738 (array!55362) Bool)

(assert (=> start!78974 (and (array_inv!20738 _values!1231) e!518669)))

(assert (=> start!78974 tp!60002))

(declare-fun array_inv!20739 (array!55360) Bool)

(assert (=> start!78974 (array_inv!20739 _keys!1487)))

(declare-fun b!924298 () Bool)

(declare-fun e!518672 () Bool)

(assert (=> b!924298 (= e!518672 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924299 () Bool)

(assert (=> b!924299 (= e!518671 e!518680)))

(declare-fun res!623056 () Bool)

(assert (=> b!924299 (=> (not res!623056) (not e!518680))))

(assert (=> b!924299 (= res!623056 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27084 _keys!1487)))))

(declare-fun lt!415563 () Unit!31198)

(declare-fun e!518673 () Unit!31198)

(assert (=> b!924299 (= lt!415563 e!518673)))

(declare-fun c!96401 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924299 (= c!96401 (validKeyInArray!0 k0!1099))))

(declare-fun b!924300 () Bool)

(assert (=> b!924300 (= e!518673 e!518678)))

(declare-fun lt!415560 () (_ BitVec 64))

(assert (=> b!924300 (= lt!415560 (select (arr!26625 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96400 () Bool)

(assert (=> b!924300 (= c!96400 (validKeyInArray!0 lt!415560))))

(declare-fun b!924301 () Bool)

(declare-fun res!623062 () Bool)

(assert (=> b!924301 (=> (not res!623062) (not e!518676))))

(declare-datatypes ((List!18697 0))(
  ( (Nil!18694) (Cons!18693 (h!19839 (_ BitVec 64)) (t!26614 List!18697)) )
))
(declare-fun arrayNoDuplicates!0 (array!55360 (_ BitVec 32) List!18697) Bool)

(assert (=> b!924301 (= res!623062 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18694))))

(declare-fun b!924302 () Bool)

(assert (=> b!924302 (= e!518676 e!518674)))

(declare-fun res!623054 () Bool)

(assert (=> b!924302 (=> (not res!623054) (not e!518674))))

(assert (=> b!924302 (= res!623054 (contains!4871 lt!415553 k0!1099))))

(assert (=> b!924302 (= lt!415553 (getCurrentListMap!3062 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31299 () Bool)

(declare-fun mapRes!31299 () Bool)

(assert (=> mapIsEmpty!31299 mapRes!31299))

(declare-fun mapNonEmpty!31299 () Bool)

(declare-fun tp!60001 () Bool)

(declare-fun e!518675 () Bool)

(assert (=> mapNonEmpty!31299 (= mapRes!31299 (and tp!60001 e!518675))))

(declare-fun mapRest!31299 () (Array (_ BitVec 32) ValueCell!9366))

(declare-fun mapValue!31299 () ValueCell!9366)

(declare-fun mapKey!31299 () (_ BitVec 32))

(assert (=> mapNonEmpty!31299 (= (arr!26626 _values!1231) (store mapRest!31299 mapKey!31299 mapValue!31299))))

(declare-fun b!924303 () Bool)

(declare-fun Unit!31201 () Unit!31198)

(assert (=> b!924303 (= e!518673 Unit!31201)))

(declare-fun b!924304 () Bool)

(assert (=> b!924304 (= e!518669 (and e!518679 mapRes!31299))))

(declare-fun condMapEmpty!31299 () Bool)

(declare-fun mapDefault!31299 () ValueCell!9366)

(assert (=> b!924304 (= condMapEmpty!31299 (= (arr!26626 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9366)) mapDefault!31299)))))

(declare-fun b!924305 () Bool)

(declare-fun res!623055 () Bool)

(assert (=> b!924305 (=> (not res!623055) (not e!518676))))

(assert (=> b!924305 (= res!623055 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27084 _keys!1487))))))

(declare-fun b!924306 () Bool)

(declare-fun arrayContainsKey!0 (array!55360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924306 (= e!518672 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924307 () Bool)

(declare-fun lt!415559 () ListLongMap!11591)

(assert (=> b!924307 (= (apply!641 lt!415559 k0!1099) lt!415567)))

(declare-fun lt!415554 () V!31225)

(declare-fun lt!415555 () Unit!31198)

(declare-fun addApplyDifferent!363 (ListLongMap!11591 (_ BitVec 64) V!31225 (_ BitVec 64)) Unit!31198)

(assert (=> b!924307 (= lt!415555 (addApplyDifferent!363 lt!415553 lt!415560 lt!415554 k0!1099))))

(assert (=> b!924307 (not (= lt!415560 k0!1099))))

(declare-fun lt!415557 () Unit!31198)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55360 (_ BitVec 64) (_ BitVec 32) List!18697) Unit!31198)

(assert (=> b!924307 (= lt!415557 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18694))))

(assert (=> b!924307 e!518672))

(declare-fun c!96402 () Bool)

(assert (=> b!924307 (= c!96402 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415565 () Unit!31198)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!214 (array!55360 array!55362 (_ BitVec 32) (_ BitVec 32) V!31225 V!31225 (_ BitVec 64) (_ BitVec 32) Int) Unit!31198)

(assert (=> b!924307 (= lt!415565 (lemmaListMapContainsThenArrayContainsFrom!214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924307 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18694)))

(declare-fun lt!415562 () Unit!31198)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55360 (_ BitVec 32) (_ BitVec 32)) Unit!31198)

(assert (=> b!924307 (= lt!415562 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924307 (contains!4871 lt!415559 k0!1099)))

(declare-fun lt!415556 () tuple2!12894)

(declare-fun +!2707 (ListLongMap!11591 tuple2!12894) ListLongMap!11591)

(assert (=> b!924307 (= lt!415559 (+!2707 lt!415553 lt!415556))))

(declare-fun lt!415561 () Unit!31198)

(declare-fun addStillContains!431 (ListLongMap!11591 (_ BitVec 64) V!31225 (_ BitVec 64)) Unit!31198)

(assert (=> b!924307 (= lt!415561 (addStillContains!431 lt!415553 lt!415560 lt!415554 k0!1099))))

(assert (=> b!924307 (= (getCurrentListMap!3062 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2707 (getCurrentListMap!3062 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415556))))

(assert (=> b!924307 (= lt!415556 (tuple2!12895 lt!415560 lt!415554))))

(declare-fun get!13992 (ValueCell!9366 V!31225) V!31225)

(declare-fun dynLambda!1496 (Int (_ BitVec 64)) V!31225)

(assert (=> b!924307 (= lt!415554 (get!13992 (select (arr!26626 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1496 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415558 () Unit!31198)

(declare-fun lemmaListMapRecursiveValidKeyArray!97 (array!55360 array!55362 (_ BitVec 32) (_ BitVec 32) V!31225 V!31225 (_ BitVec 32) Int) Unit!31198)

(assert (=> b!924307 (= lt!415558 (lemmaListMapRecursiveValidKeyArray!97 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924307 (= e!518678 lt!415555)))

(declare-fun b!924308 () Bool)

(assert (=> b!924308 (= e!518677 false)))

(declare-fun lt!415566 () V!31225)

(assert (=> b!924308 (= lt!415566 (apply!641 lt!415564 k0!1099))))

(declare-fun b!924309 () Bool)

(assert (=> b!924309 (= e!518675 tp_is_empty!19695)))

(declare-fun b!924310 () Bool)

(declare-fun res!623060 () Bool)

(assert (=> b!924310 (=> (not res!623060) (not e!518676))))

(assert (=> b!924310 (= res!623060 (and (= (size!27085 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27084 _keys!1487) (size!27085 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78974 res!623059) b!924310))

(assert (= (and b!924310 res!623060) b!924295))

(assert (= (and b!924295 res!623057) b!924301))

(assert (= (and b!924301 res!623062) b!924305))

(assert (= (and b!924305 res!623055) b!924302))

(assert (= (and b!924302 res!623054) b!924296))

(assert (= (and b!924296 res!623058) b!924299))

(assert (= (and b!924299 c!96401) b!924300))

(assert (= (and b!924299 (not c!96401)) b!924303))

(assert (= (and b!924300 c!96400) b!924307))

(assert (= (and b!924300 (not c!96400)) b!924294))

(assert (= (and b!924307 c!96402) b!924306))

(assert (= (and b!924307 (not c!96402)) b!924298))

(assert (= (and b!924299 res!623056) b!924297))

(assert (= (and b!924297 res!623061) b!924308))

(assert (= (and b!924304 condMapEmpty!31299) mapIsEmpty!31299))

(assert (= (and b!924304 (not condMapEmpty!31299)) mapNonEmpty!31299))

(get-info :version)

(assert (= (and mapNonEmpty!31299 ((_ is ValueCellFull!9366) mapValue!31299)) b!924309))

(assert (= (and b!924304 ((_ is ValueCellFull!9366) mapDefault!31299)) b!924293))

(assert (= start!78974 b!924304))

(declare-fun b_lambda!13689 () Bool)

(assert (=> (not b_lambda!13689) (not b!924307)))

(declare-fun t!26612 () Bool)

(declare-fun tb!5767 () Bool)

(assert (=> (and start!78974 (= defaultEntry!1235 defaultEntry!1235) t!26612) tb!5767))

(declare-fun result!11357 () Bool)

(assert (=> tb!5767 (= result!11357 tp_is_empty!19695)))

(assert (=> b!924307 t!26612))

(declare-fun b_and!28113 () Bool)

(assert (= b_and!28111 (and (=> t!26612 result!11357) b_and!28113)))

(declare-fun m!858587 () Bool)

(assert (=> b!924300 m!858587))

(declare-fun m!858589 () Bool)

(assert (=> b!924300 m!858589))

(declare-fun m!858591 () Bool)

(assert (=> b!924297 m!858591))

(declare-fun m!858593 () Bool)

(assert (=> b!924297 m!858593))

(declare-fun m!858595 () Bool)

(assert (=> b!924308 m!858595))

(declare-fun m!858597 () Bool)

(assert (=> b!924307 m!858597))

(declare-fun m!858599 () Bool)

(assert (=> b!924307 m!858599))

(declare-fun m!858601 () Bool)

(assert (=> b!924307 m!858601))

(declare-fun m!858603 () Bool)

(assert (=> b!924307 m!858603))

(declare-fun m!858605 () Bool)

(assert (=> b!924307 m!858605))

(declare-fun m!858607 () Bool)

(assert (=> b!924307 m!858607))

(declare-fun m!858609 () Bool)

(assert (=> b!924307 m!858609))

(declare-fun m!858611 () Bool)

(assert (=> b!924307 m!858611))

(assert (=> b!924307 m!858605))

(assert (=> b!924307 m!858609))

(declare-fun m!858613 () Bool)

(assert (=> b!924307 m!858613))

(assert (=> b!924307 m!858593))

(declare-fun m!858615 () Bool)

(assert (=> b!924307 m!858615))

(declare-fun m!858617 () Bool)

(assert (=> b!924307 m!858617))

(declare-fun m!858619 () Bool)

(assert (=> b!924307 m!858619))

(declare-fun m!858621 () Bool)

(assert (=> b!924307 m!858621))

(declare-fun m!858623 () Bool)

(assert (=> b!924307 m!858623))

(assert (=> b!924307 m!858599))

(declare-fun m!858625 () Bool)

(assert (=> b!924307 m!858625))

(declare-fun m!858627 () Bool)

(assert (=> mapNonEmpty!31299 m!858627))

(declare-fun m!858629 () Bool)

(assert (=> b!924295 m!858629))

(declare-fun m!858631 () Bool)

(assert (=> b!924306 m!858631))

(declare-fun m!858633 () Bool)

(assert (=> start!78974 m!858633))

(declare-fun m!858635 () Bool)

(assert (=> start!78974 m!858635))

(declare-fun m!858637 () Bool)

(assert (=> start!78974 m!858637))

(declare-fun m!858639 () Bool)

(assert (=> b!924296 m!858639))

(declare-fun m!858641 () Bool)

(assert (=> b!924299 m!858641))

(declare-fun m!858643 () Bool)

(assert (=> b!924301 m!858643))

(declare-fun m!858645 () Bool)

(assert (=> b!924302 m!858645))

(declare-fun m!858647 () Bool)

(assert (=> b!924302 m!858647))

(check-sat (not b!924307) (not b!924299) (not b!924306) (not b!924296) (not start!78974) (not b_lambda!13689) (not b!924302) b_and!28113 tp_is_empty!19695 (not b!924295) (not b!924297) (not b_next!17187) (not b!924300) (not b!924308) (not b!924301) (not mapNonEmpty!31299))
(check-sat b_and!28113 (not b_next!17187))
