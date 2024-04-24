; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20458 () Bool)

(assert start!20458)

(declare-fun b_free!5113 () Bool)

(declare-fun b_next!5113 () Bool)

(assert (=> start!20458 (= b_free!5113 (not b_next!5113))))

(declare-fun tp!18370 () Bool)

(declare-fun b_and!11873 () Bool)

(assert (=> start!20458 (= tp!18370 b_and!11873)))

(declare-fun mapIsEmpty!8522 () Bool)

(declare-fun mapRes!8522 () Bool)

(assert (=> mapIsEmpty!8522 mapRes!8522))

(declare-fun b!202718 () Bool)

(declare-fun e!132763 () Bool)

(declare-fun e!132758 () Bool)

(assert (=> b!202718 (= e!132763 e!132758)))

(declare-fun res!97201 () Bool)

(assert (=> b!202718 (=> res!97201 e!132758)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!202718 (= res!97201 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6273 0))(
  ( (V!6274 (val!2529 Int)) )
))
(declare-datatypes ((tuple2!3770 0))(
  ( (tuple2!3771 (_1!1896 (_ BitVec 64)) (_2!1896 V!6273)) )
))
(declare-datatypes ((List!2675 0))(
  ( (Nil!2672) (Cons!2671 (h!3313 tuple2!3770) (t!7598 List!2675)) )
))
(declare-datatypes ((ListLongMap!2685 0))(
  ( (ListLongMap!2686 (toList!1358 List!2675)) )
))
(declare-fun lt!101910 () ListLongMap!2685)

(declare-fun lt!101915 () ListLongMap!2685)

(assert (=> b!202718 (= lt!101910 lt!101915)))

(declare-fun lt!101912 () ListLongMap!2685)

(declare-fun lt!101916 () tuple2!3770)

(declare-fun +!412 (ListLongMap!2685 tuple2!3770) ListLongMap!2685)

(assert (=> b!202718 (= lt!101915 (+!412 lt!101912 lt!101916))))

(declare-fun lt!101917 () ListLongMap!2685)

(declare-fun lt!101911 () ListLongMap!2685)

(assert (=> b!202718 (= lt!101917 lt!101911)))

(declare-fun lt!101918 () ListLongMap!2685)

(assert (=> b!202718 (= lt!101911 (+!412 lt!101918 lt!101916))))

(declare-fun lt!101907 () ListLongMap!2685)

(assert (=> b!202718 (= lt!101910 (+!412 lt!101907 lt!101916))))

(declare-fun zeroValue!615 () V!6273)

(assert (=> b!202718 (= lt!101916 (tuple2!3771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202719 () Bool)

(declare-fun res!97199 () Bool)

(declare-fun e!132760 () Bool)

(assert (=> b!202719 (=> (not res!97199) (not e!132760))))

(declare-datatypes ((array!9153 0))(
  ( (array!9154 (arr!4327 (Array (_ BitVec 32) (_ BitVec 64))) (size!4652 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9153)

(declare-datatypes ((List!2676 0))(
  ( (Nil!2673) (Cons!2672 (h!3314 (_ BitVec 64)) (t!7599 List!2676)) )
))
(declare-fun arrayNoDuplicates!0 (array!9153 (_ BitVec 32) List!2676) Bool)

(assert (=> b!202719 (= res!97199 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2673))))

(declare-fun b!202720 () Bool)

(declare-fun res!97206 () Bool)

(assert (=> b!202720 (=> (not res!97206) (not e!132760))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2141 0))(
  ( (ValueCellFull!2141 (v!4500 V!6273)) (EmptyCell!2141) )
))
(declare-datatypes ((array!9155 0))(
  ( (array!9156 (arr!4328 (Array (_ BitVec 32) ValueCell!2141)) (size!4653 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9155)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202720 (= res!97206 (and (= (size!4653 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4652 _keys!825) (size!4653 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!97207 () Bool)

(assert (=> start!20458 (=> (not res!97207) (not e!132760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20458 (= res!97207 (validMask!0 mask!1149))))

(assert (=> start!20458 e!132760))

(declare-fun e!132764 () Bool)

(declare-fun array_inv!2825 (array!9155) Bool)

(assert (=> start!20458 (and (array_inv!2825 _values!649) e!132764)))

(assert (=> start!20458 true))

(declare-fun tp_is_empty!4969 () Bool)

(assert (=> start!20458 tp_is_empty!4969))

(declare-fun array_inv!2826 (array!9153) Bool)

(assert (=> start!20458 (array_inv!2826 _keys!825)))

(assert (=> start!20458 tp!18370))

(declare-fun b!202721 () Bool)

(declare-fun res!97203 () Bool)

(assert (=> b!202721 (=> (not res!97203) (not e!132760))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202721 (= res!97203 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4652 _keys!825))))))

(declare-fun b!202722 () Bool)

(declare-fun e!132762 () Bool)

(assert (=> b!202722 (= e!132764 (and e!132762 mapRes!8522))))

(declare-fun condMapEmpty!8522 () Bool)

(declare-fun mapDefault!8522 () ValueCell!2141)

(assert (=> b!202722 (= condMapEmpty!8522 (= (arr!4328 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2141)) mapDefault!8522)))))

(declare-fun b!202723 () Bool)

(declare-fun e!132761 () Bool)

(assert (=> b!202723 (= e!132761 tp_is_empty!4969)))

(declare-fun b!202724 () Bool)

(declare-fun res!97202 () Bool)

(assert (=> b!202724 (=> (not res!97202) (not e!132760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9153 (_ BitVec 32)) Bool)

(assert (=> b!202724 (= res!97202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8522 () Bool)

(declare-fun tp!18371 () Bool)

(assert (=> mapNonEmpty!8522 (= mapRes!8522 (and tp!18371 e!132761))))

(declare-fun mapValue!8522 () ValueCell!2141)

(declare-fun mapRest!8522 () (Array (_ BitVec 32) ValueCell!2141))

(declare-fun mapKey!8522 () (_ BitVec 32))

(assert (=> mapNonEmpty!8522 (= (arr!4328 _values!649) (store mapRest!8522 mapKey!8522 mapValue!8522))))

(declare-fun b!202725 () Bool)

(assert (=> b!202725 (= e!132760 (not e!132763))))

(declare-fun res!97204 () Bool)

(assert (=> b!202725 (=> res!97204 e!132763)))

(assert (=> b!202725 (= res!97204 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6273)

(declare-fun getCurrentListMap!942 (array!9153 array!9155 (_ BitVec 32) (_ BitVec 32) V!6273 V!6273 (_ BitVec 32) Int) ListLongMap!2685)

(assert (=> b!202725 (= lt!101917 (getCurrentListMap!942 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101908 () array!9155)

(assert (=> b!202725 (= lt!101910 (getCurrentListMap!942 _keys!825 lt!101908 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202725 (and (= lt!101907 lt!101912) (= lt!101912 lt!101907))))

(declare-fun lt!101913 () tuple2!3770)

(assert (=> b!202725 (= lt!101912 (+!412 lt!101918 lt!101913))))

(declare-fun v!520 () V!6273)

(assert (=> b!202725 (= lt!101913 (tuple2!3771 k0!843 v!520))))

(declare-datatypes ((Unit!6108 0))(
  ( (Unit!6109) )
))
(declare-fun lt!101909 () Unit!6108)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!78 (array!9153 array!9155 (_ BitVec 32) (_ BitVec 32) V!6273 V!6273 (_ BitVec 32) (_ BitVec 64) V!6273 (_ BitVec 32) Int) Unit!6108)

(assert (=> b!202725 (= lt!101909 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!78 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!335 (array!9153 array!9155 (_ BitVec 32) (_ BitVec 32) V!6273 V!6273 (_ BitVec 32) Int) ListLongMap!2685)

(assert (=> b!202725 (= lt!101907 (getCurrentListMapNoExtraKeys!335 _keys!825 lt!101908 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202725 (= lt!101908 (array!9156 (store (arr!4328 _values!649) i!601 (ValueCellFull!2141 v!520)) (size!4653 _values!649)))))

(assert (=> b!202725 (= lt!101918 (getCurrentListMapNoExtraKeys!335 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202726 () Bool)

(declare-fun res!97200 () Bool)

(assert (=> b!202726 (=> (not res!97200) (not e!132760))))

(assert (=> b!202726 (= res!97200 (= (select (arr!4327 _keys!825) i!601) k0!843))))

(declare-fun b!202727 () Bool)

(assert (=> b!202727 (= e!132762 tp_is_empty!4969)))

(declare-fun b!202728 () Bool)

(assert (=> b!202728 (= e!132758 true)))

(assert (=> b!202728 (= lt!101915 (+!412 lt!101911 lt!101913))))

(declare-fun lt!101914 () Unit!6108)

(declare-fun addCommutativeForDiffKeys!131 (ListLongMap!2685 (_ BitVec 64) V!6273 (_ BitVec 64) V!6273) Unit!6108)

(assert (=> b!202728 (= lt!101914 (addCommutativeForDiffKeys!131 lt!101918 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202729 () Bool)

(declare-fun res!97205 () Bool)

(assert (=> b!202729 (=> (not res!97205) (not e!132760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202729 (= res!97205 (validKeyInArray!0 k0!843))))

(assert (= (and start!20458 res!97207) b!202720))

(assert (= (and b!202720 res!97206) b!202724))

(assert (= (and b!202724 res!97202) b!202719))

(assert (= (and b!202719 res!97199) b!202721))

(assert (= (and b!202721 res!97203) b!202729))

(assert (= (and b!202729 res!97205) b!202726))

(assert (= (and b!202726 res!97200) b!202725))

(assert (= (and b!202725 (not res!97204)) b!202718))

(assert (= (and b!202718 (not res!97201)) b!202728))

(assert (= (and b!202722 condMapEmpty!8522) mapIsEmpty!8522))

(assert (= (and b!202722 (not condMapEmpty!8522)) mapNonEmpty!8522))

(get-info :version)

(assert (= (and mapNonEmpty!8522 ((_ is ValueCellFull!2141) mapValue!8522)) b!202723))

(assert (= (and b!202722 ((_ is ValueCellFull!2141) mapDefault!8522)) b!202727))

(assert (= start!20458 b!202722))

(declare-fun m!230193 () Bool)

(assert (=> b!202718 m!230193))

(declare-fun m!230195 () Bool)

(assert (=> b!202718 m!230195))

(declare-fun m!230197 () Bool)

(assert (=> b!202718 m!230197))

(declare-fun m!230199 () Bool)

(assert (=> b!202729 m!230199))

(declare-fun m!230201 () Bool)

(assert (=> b!202728 m!230201))

(declare-fun m!230203 () Bool)

(assert (=> b!202728 m!230203))

(declare-fun m!230205 () Bool)

(assert (=> b!202725 m!230205))

(declare-fun m!230207 () Bool)

(assert (=> b!202725 m!230207))

(declare-fun m!230209 () Bool)

(assert (=> b!202725 m!230209))

(declare-fun m!230211 () Bool)

(assert (=> b!202725 m!230211))

(declare-fun m!230213 () Bool)

(assert (=> b!202725 m!230213))

(declare-fun m!230215 () Bool)

(assert (=> b!202725 m!230215))

(declare-fun m!230217 () Bool)

(assert (=> b!202725 m!230217))

(declare-fun m!230219 () Bool)

(assert (=> start!20458 m!230219))

(declare-fun m!230221 () Bool)

(assert (=> start!20458 m!230221))

(declare-fun m!230223 () Bool)

(assert (=> start!20458 m!230223))

(declare-fun m!230225 () Bool)

(assert (=> mapNonEmpty!8522 m!230225))

(declare-fun m!230227 () Bool)

(assert (=> b!202724 m!230227))

(declare-fun m!230229 () Bool)

(assert (=> b!202719 m!230229))

(declare-fun m!230231 () Bool)

(assert (=> b!202726 m!230231))

(check-sat b_and!11873 (not mapNonEmpty!8522) tp_is_empty!4969 (not start!20458) (not b!202718) (not b_next!5113) (not b!202729) (not b!202724) (not b!202725) (not b!202728) (not b!202719))
(check-sat b_and!11873 (not b_next!5113))
