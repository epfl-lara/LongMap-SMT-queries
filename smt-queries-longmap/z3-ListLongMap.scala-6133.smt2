; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78908 () Bool)

(assert start!78908)

(declare-fun b_free!17121 () Bool)

(declare-fun b_next!17121 () Bool)

(assert (=> start!78908 (= b_free!17121 (not b_next!17121))))

(declare-fun tp!59803 () Bool)

(declare-fun b_and!27979 () Bool)

(assert (=> start!78908 (= tp!59803 b_and!27979)))

(declare-fun b!922565 () Bool)

(declare-fun e!517647 () Bool)

(assert (=> b!922565 (= e!517647 (not true))))

(declare-fun lt!414311 () (_ BitVec 64))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!922565 (not (= lt!414311 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31120 0))(
  ( (Unit!31121) )
))
(declare-fun lt!414310 () Unit!31120)

(declare-datatypes ((array!55234 0))(
  ( (array!55235 (arr!26562 (Array (_ BitVec 32) (_ BitVec 64))) (size!27021 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55234)

(declare-datatypes ((List!18638 0))(
  ( (Nil!18635) (Cons!18634 (h!19780 (_ BitVec 64)) (t!26489 List!18638)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55234 (_ BitVec 64) (_ BitVec 32) List!18638) Unit!31120)

(assert (=> b!922565 (= lt!414310 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18635))))

(declare-fun e!517648 () Bool)

(assert (=> b!922565 e!517648))

(declare-fun c!96183 () Bool)

(assert (=> b!922565 (= c!96183 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31137 0))(
  ( (V!31138 (val!9865 Int)) )
))
(declare-datatypes ((ValueCell!9333 0))(
  ( (ValueCellFull!9333 (v!12383 V!31137)) (EmptyCell!9333) )
))
(declare-datatypes ((array!55236 0))(
  ( (array!55237 (arr!26563 (Array (_ BitVec 32) ValueCell!9333)) (size!27022 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55236)

(declare-fun lt!414309 () Unit!31120)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31137)

(declare-fun minValue!1173 () V!31137)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!193 (array!55234 array!55236 (_ BitVec 32) (_ BitVec 32) V!31137 V!31137 (_ BitVec 64) (_ BitVec 32) Int) Unit!31120)

(assert (=> b!922565 (= lt!414309 (lemmaListMapContainsThenArrayContainsFrom!193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55234 (_ BitVec 32) List!18638) Bool)

(assert (=> b!922565 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18635)))

(declare-fun lt!414314 () Unit!31120)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55234 (_ BitVec 32) (_ BitVec 32)) Unit!31120)

(assert (=> b!922565 (= lt!414314 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12834 0))(
  ( (tuple2!12835 (_1!6428 (_ BitVec 64)) (_2!6428 V!31137)) )
))
(declare-datatypes ((List!18639 0))(
  ( (Nil!18636) (Cons!18635 (h!19781 tuple2!12834) (t!26490 List!18639)) )
))
(declare-datatypes ((ListLongMap!11531 0))(
  ( (ListLongMap!11532 (toList!5781 List!18639)) )
))
(declare-fun lt!414312 () ListLongMap!11531)

(declare-fun lt!414316 () tuple2!12834)

(declare-fun contains!4844 (ListLongMap!11531 (_ BitVec 64)) Bool)

(declare-fun +!2686 (ListLongMap!11531 tuple2!12834) ListLongMap!11531)

(assert (=> b!922565 (contains!4844 (+!2686 lt!414312 lt!414316) k0!1099)))

(declare-fun lt!414313 () Unit!31120)

(declare-fun lt!414315 () V!31137)

(declare-fun addStillContains!410 (ListLongMap!11531 (_ BitVec 64) V!31137 (_ BitVec 64)) Unit!31120)

(assert (=> b!922565 (= lt!414313 (addStillContains!410 lt!414312 lt!414311 lt!414315 k0!1099))))

(declare-fun getCurrentListMap!3035 (array!55234 array!55236 (_ BitVec 32) (_ BitVec 32) V!31137 V!31137 (_ BitVec 32) Int) ListLongMap!11531)

(assert (=> b!922565 (= (getCurrentListMap!3035 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2686 (getCurrentListMap!3035 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414316))))

(assert (=> b!922565 (= lt!414316 (tuple2!12835 lt!414311 lt!414315))))

(declare-fun get!13949 (ValueCell!9333 V!31137) V!31137)

(declare-fun dynLambda!1475 (Int (_ BitVec 64)) V!31137)

(assert (=> b!922565 (= lt!414315 (get!13949 (select (arr!26563 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1475 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414308 () Unit!31120)

(declare-fun lemmaListMapRecursiveValidKeyArray!76 (array!55234 array!55236 (_ BitVec 32) (_ BitVec 32) V!31137 V!31137 (_ BitVec 32) Int) Unit!31120)

(assert (=> b!922565 (= lt!414308 (lemmaListMapRecursiveValidKeyArray!76 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922566 () Bool)

(declare-fun arrayContainsKey!0 (array!55234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922566 (= e!517648 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922567 () Bool)

(declare-fun res!622127 () Bool)

(declare-fun e!517643 () Bool)

(assert (=> b!922567 (=> (not res!622127) (not e!517643))))

(assert (=> b!922567 (= res!622127 (and (= (size!27022 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27021 _keys!1487) (size!27022 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922568 () Bool)

(assert (=> b!922568 (= e!517648 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922569 () Bool)

(declare-fun res!622126 () Bool)

(assert (=> b!922569 (=> (not res!622126) (not e!517643))))

(assert (=> b!922569 (= res!622126 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18635))))

(declare-fun b!922570 () Bool)

(declare-fun e!517646 () Bool)

(declare-fun tp_is_empty!19629 () Bool)

(assert (=> b!922570 (= e!517646 tp_is_empty!19629)))

(declare-fun b!922571 () Bool)

(declare-fun res!622129 () Bool)

(declare-fun e!517644 () Bool)

(assert (=> b!922571 (=> (not res!622129) (not e!517644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922571 (= res!622129 (validKeyInArray!0 k0!1099))))

(declare-fun b!922572 () Bool)

(declare-fun res!622123 () Bool)

(assert (=> b!922572 (=> (not res!622123) (not e!517644))))

(declare-fun v!791 () V!31137)

(declare-fun apply!616 (ListLongMap!11531 (_ BitVec 64)) V!31137)

(assert (=> b!922572 (= res!622123 (= (apply!616 lt!414312 k0!1099) v!791))))

(declare-fun b!922573 () Bool)

(assert (=> b!922573 (= e!517643 e!517644)))

(declare-fun res!622132 () Bool)

(assert (=> b!922573 (=> (not res!622132) (not e!517644))))

(assert (=> b!922573 (= res!622132 (contains!4844 lt!414312 k0!1099))))

(assert (=> b!922573 (= lt!414312 (getCurrentListMap!3035 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922574 () Bool)

(declare-fun res!622128 () Bool)

(assert (=> b!922574 (=> (not res!622128) (not e!517644))))

(assert (=> b!922574 (= res!622128 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31200 () Bool)

(declare-fun mapRes!31200 () Bool)

(assert (=> mapIsEmpty!31200 mapRes!31200))

(declare-fun b!922575 () Bool)

(declare-fun res!622125 () Bool)

(assert (=> b!922575 (=> (not res!622125) (not e!517643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55234 (_ BitVec 32)) Bool)

(assert (=> b!922575 (= res!622125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!622131 () Bool)

(assert (=> start!78908 (=> (not res!622131) (not e!517643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78908 (= res!622131 (validMask!0 mask!1881))))

(assert (=> start!78908 e!517643))

(assert (=> start!78908 true))

(assert (=> start!78908 tp_is_empty!19629))

(declare-fun e!517642 () Bool)

(declare-fun array_inv!20688 (array!55236) Bool)

(assert (=> start!78908 (and (array_inv!20688 _values!1231) e!517642)))

(assert (=> start!78908 tp!59803))

(declare-fun array_inv!20689 (array!55234) Bool)

(assert (=> start!78908 (array_inv!20689 _keys!1487)))

(declare-fun b!922576 () Bool)

(declare-fun e!517641 () Bool)

(assert (=> b!922576 (= e!517642 (and e!517641 mapRes!31200))))

(declare-fun condMapEmpty!31200 () Bool)

(declare-fun mapDefault!31200 () ValueCell!9333)

(assert (=> b!922576 (= condMapEmpty!31200 (= (arr!26563 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9333)) mapDefault!31200)))))

(declare-fun b!922577 () Bool)

(assert (=> b!922577 (= e!517644 e!517647)))

(declare-fun res!622124 () Bool)

(assert (=> b!922577 (=> (not res!622124) (not e!517647))))

(assert (=> b!922577 (= res!622124 (validKeyInArray!0 lt!414311))))

(assert (=> b!922577 (= lt!414311 (select (arr!26562 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31200 () Bool)

(declare-fun tp!59804 () Bool)

(assert (=> mapNonEmpty!31200 (= mapRes!31200 (and tp!59804 e!517646))))

(declare-fun mapRest!31200 () (Array (_ BitVec 32) ValueCell!9333))

(declare-fun mapKey!31200 () (_ BitVec 32))

(declare-fun mapValue!31200 () ValueCell!9333)

(assert (=> mapNonEmpty!31200 (= (arr!26563 _values!1231) (store mapRest!31200 mapKey!31200 mapValue!31200))))

(declare-fun b!922578 () Bool)

(assert (=> b!922578 (= e!517641 tp_is_empty!19629)))

(declare-fun b!922579 () Bool)

(declare-fun res!622130 () Bool)

(assert (=> b!922579 (=> (not res!622130) (not e!517643))))

(assert (=> b!922579 (= res!622130 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27021 _keys!1487))))))

(assert (= (and start!78908 res!622131) b!922567))

(assert (= (and b!922567 res!622127) b!922575))

(assert (= (and b!922575 res!622125) b!922569))

(assert (= (and b!922569 res!622126) b!922579))

(assert (= (and b!922579 res!622130) b!922573))

(assert (= (and b!922573 res!622132) b!922572))

(assert (= (and b!922572 res!622123) b!922574))

(assert (= (and b!922574 res!622128) b!922571))

(assert (= (and b!922571 res!622129) b!922577))

(assert (= (and b!922577 res!622124) b!922565))

(assert (= (and b!922565 c!96183) b!922566))

(assert (= (and b!922565 (not c!96183)) b!922568))

(assert (= (and b!922576 condMapEmpty!31200) mapIsEmpty!31200))

(assert (= (and b!922576 (not condMapEmpty!31200)) mapNonEmpty!31200))

(get-info :version)

(assert (= (and mapNonEmpty!31200 ((_ is ValueCellFull!9333) mapValue!31200)) b!922570))

(assert (= (and b!922576 ((_ is ValueCellFull!9333) mapDefault!31200)) b!922578))

(assert (= start!78908 b!922576))

(declare-fun b_lambda!13623 () Bool)

(assert (=> (not b_lambda!13623) (not b!922565)))

(declare-fun t!26488 () Bool)

(declare-fun tb!5701 () Bool)

(assert (=> (and start!78908 (= defaultEntry!1235 defaultEntry!1235) t!26488) tb!5701))

(declare-fun result!11225 () Bool)

(assert (=> tb!5701 (= result!11225 tp_is_empty!19629)))

(assert (=> b!922565 t!26488))

(declare-fun b_and!27981 () Bool)

(assert (= b_and!27979 (and (=> t!26488 result!11225) b_and!27981)))

(declare-fun m!856653 () Bool)

(assert (=> b!922566 m!856653))

(declare-fun m!856655 () Bool)

(assert (=> start!78908 m!856655))

(declare-fun m!856657 () Bool)

(assert (=> start!78908 m!856657))

(declare-fun m!856659 () Bool)

(assert (=> start!78908 m!856659))

(declare-fun m!856661 () Bool)

(assert (=> b!922569 m!856661))

(declare-fun m!856663 () Bool)

(assert (=> b!922571 m!856663))

(declare-fun m!856665 () Bool)

(assert (=> b!922565 m!856665))

(declare-fun m!856667 () Bool)

(assert (=> b!922565 m!856667))

(declare-fun m!856669 () Bool)

(assert (=> b!922565 m!856669))

(declare-fun m!856671 () Bool)

(assert (=> b!922565 m!856671))

(declare-fun m!856673 () Bool)

(assert (=> b!922565 m!856673))

(declare-fun m!856675 () Bool)

(assert (=> b!922565 m!856675))

(declare-fun m!856677 () Bool)

(assert (=> b!922565 m!856677))

(declare-fun m!856679 () Bool)

(assert (=> b!922565 m!856679))

(assert (=> b!922565 m!856677))

(assert (=> b!922565 m!856679))

(declare-fun m!856681 () Bool)

(assert (=> b!922565 m!856681))

(declare-fun m!856683 () Bool)

(assert (=> b!922565 m!856683))

(declare-fun m!856685 () Bool)

(assert (=> b!922565 m!856685))

(assert (=> b!922565 m!856671))

(declare-fun m!856687 () Bool)

(assert (=> b!922565 m!856687))

(declare-fun m!856689 () Bool)

(assert (=> b!922565 m!856689))

(assert (=> b!922565 m!856665))

(declare-fun m!856691 () Bool)

(assert (=> b!922565 m!856691))

(declare-fun m!856693 () Bool)

(assert (=> b!922573 m!856693))

(declare-fun m!856695 () Bool)

(assert (=> b!922573 m!856695))

(declare-fun m!856697 () Bool)

(assert (=> b!922577 m!856697))

(declare-fun m!856699 () Bool)

(assert (=> b!922577 m!856699))

(declare-fun m!856701 () Bool)

(assert (=> b!922575 m!856701))

(declare-fun m!856703 () Bool)

(assert (=> b!922572 m!856703))

(declare-fun m!856705 () Bool)

(assert (=> mapNonEmpty!31200 m!856705))

(check-sat (not b_next!17121) (not mapNonEmpty!31200) (not b!922571) (not b!922577) (not b!922573) (not b!922575) tp_is_empty!19629 (not b!922566) (not b!922565) (not b_lambda!13623) (not b!922569) (not b!922572) b_and!27981 (not start!78908))
(check-sat b_and!27981 (not b_next!17121))
