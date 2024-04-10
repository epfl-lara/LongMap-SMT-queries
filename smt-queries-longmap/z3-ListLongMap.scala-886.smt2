; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20414 () Bool)

(assert start!20414)

(declare-fun b_free!5073 () Bool)

(declare-fun b_next!5073 () Bool)

(assert (=> start!20414 (= b_free!5073 (not b_next!5073))))

(declare-fun tp!18251 () Bool)

(declare-fun b_and!11819 () Bool)

(assert (=> start!20414 (= tp!18251 b_and!11819)))

(declare-fun mapIsEmpty!8462 () Bool)

(declare-fun mapRes!8462 () Bool)

(assert (=> mapIsEmpty!8462 mapRes!8462))

(declare-fun b!201942 () Bool)

(declare-fun e!132314 () Bool)

(declare-fun tp_is_empty!4929 () Bool)

(assert (=> b!201942 (= e!132314 tp_is_empty!4929)))

(declare-fun b!201943 () Bool)

(declare-fun res!96630 () Bool)

(declare-fun e!132319 () Bool)

(assert (=> b!201943 (=> (not res!96630) (not e!132319))))

(declare-datatypes ((array!9087 0))(
  ( (array!9088 (arr!4294 (Array (_ BitVec 32) (_ BitVec 64))) (size!4619 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9087)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201943 (= res!96630 (= (select (arr!4294 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8462 () Bool)

(declare-fun tp!18250 () Bool)

(declare-fun e!132320 () Bool)

(assert (=> mapNonEmpty!8462 (= mapRes!8462 (and tp!18250 e!132320))))

(declare-datatypes ((V!6219 0))(
  ( (V!6220 (val!2509 Int)) )
))
(declare-datatypes ((ValueCell!2121 0))(
  ( (ValueCellFull!2121 (v!4479 V!6219)) (EmptyCell!2121) )
))
(declare-fun mapRest!8462 () (Array (_ BitVec 32) ValueCell!2121))

(declare-fun mapKey!8462 () (_ BitVec 32))

(declare-fun mapValue!8462 () ValueCell!2121)

(declare-datatypes ((array!9089 0))(
  ( (array!9090 (arr!4295 (Array (_ BitVec 32) ValueCell!2121)) (size!4620 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9089)

(assert (=> mapNonEmpty!8462 (= (arr!4295 _values!649) (store mapRest!8462 mapKey!8462 mapValue!8462))))

(declare-fun res!96632 () Bool)

(assert (=> start!20414 (=> (not res!96632) (not e!132319))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20414 (= res!96632 (validMask!0 mask!1149))))

(assert (=> start!20414 e!132319))

(declare-fun e!132315 () Bool)

(declare-fun array_inv!2833 (array!9089) Bool)

(assert (=> start!20414 (and (array_inv!2833 _values!649) e!132315)))

(assert (=> start!20414 true))

(assert (=> start!20414 tp_is_empty!4929))

(declare-fun array_inv!2834 (array!9087) Bool)

(assert (=> start!20414 (array_inv!2834 _keys!825)))

(assert (=> start!20414 tp!18251))

(declare-fun b!201944 () Bool)

(declare-fun e!132318 () Bool)

(declare-fun e!132317 () Bool)

(assert (=> b!201944 (= e!132318 e!132317)))

(declare-fun res!96637 () Bool)

(assert (=> b!201944 (=> res!96637 e!132317)))

(assert (=> b!201944 (= res!96637 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3802 0))(
  ( (tuple2!3803 (_1!1912 (_ BitVec 64)) (_2!1912 V!6219)) )
))
(declare-datatypes ((List!2712 0))(
  ( (Nil!2709) (Cons!2708 (h!3350 tuple2!3802) (t!7643 List!2712)) )
))
(declare-datatypes ((ListLongMap!2715 0))(
  ( (ListLongMap!2716 (toList!1373 List!2712)) )
))
(declare-fun lt!101053 () ListLongMap!2715)

(declare-fun lt!101054 () ListLongMap!2715)

(assert (=> b!201944 (= lt!101053 lt!101054)))

(declare-fun lt!101042 () ListLongMap!2715)

(declare-fun lt!101044 () tuple2!3802)

(declare-fun +!400 (ListLongMap!2715 tuple2!3802) ListLongMap!2715)

(assert (=> b!201944 (= lt!101054 (+!400 lt!101042 lt!101044))))

(declare-fun lt!101045 () ListLongMap!2715)

(declare-fun v!520 () V!6219)

(declare-datatypes ((Unit!6100 0))(
  ( (Unit!6101) )
))
(declare-fun lt!101049 () Unit!6100)

(declare-fun zeroValue!615 () V!6219)

(declare-fun addCommutativeForDiffKeys!121 (ListLongMap!2715 (_ BitVec 64) V!6219 (_ BitVec 64) V!6219) Unit!6100)

(assert (=> b!201944 (= lt!101049 (addCommutativeForDiffKeys!121 lt!101045 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101052 () ListLongMap!2715)

(declare-fun lt!101050 () tuple2!3802)

(assert (=> b!201944 (= lt!101052 (+!400 lt!101053 lt!101050))))

(declare-fun lt!101046 () ListLongMap!2715)

(declare-fun lt!101040 () tuple2!3802)

(assert (=> b!201944 (= lt!101053 (+!400 lt!101046 lt!101040))))

(declare-fun lt!101047 () ListLongMap!2715)

(declare-fun lt!101055 () ListLongMap!2715)

(assert (=> b!201944 (= lt!101047 lt!101055)))

(assert (=> b!201944 (= lt!101055 (+!400 lt!101042 lt!101050))))

(assert (=> b!201944 (= lt!101042 (+!400 lt!101045 lt!101040))))

(declare-fun lt!101041 () ListLongMap!2715)

(assert (=> b!201944 (= lt!101052 (+!400 (+!400 lt!101041 lt!101040) lt!101050))))

(declare-fun minValue!615 () V!6219)

(assert (=> b!201944 (= lt!101050 (tuple2!3803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201944 (= lt!101040 (tuple2!3803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201945 () Bool)

(assert (=> b!201945 (= e!132317 true)))

(assert (=> b!201945 (= (+!400 lt!101054 lt!101050) (+!400 lt!101055 lt!101044))))

(declare-fun lt!101048 () Unit!6100)

(assert (=> b!201945 (= lt!101048 (addCommutativeForDiffKeys!121 lt!101042 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201946 () Bool)

(declare-fun res!96631 () Bool)

(assert (=> b!201946 (=> (not res!96631) (not e!132319))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201946 (= res!96631 (and (= (size!4620 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4619 _keys!825) (size!4620 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201947 () Bool)

(declare-fun res!96636 () Bool)

(assert (=> b!201947 (=> (not res!96636) (not e!132319))))

(assert (=> b!201947 (= res!96636 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4619 _keys!825))))))

(declare-fun b!201948 () Bool)

(assert (=> b!201948 (= e!132320 tp_is_empty!4929)))

(declare-fun b!201949 () Bool)

(declare-fun res!96634 () Bool)

(assert (=> b!201949 (=> (not res!96634) (not e!132319))))

(declare-datatypes ((List!2713 0))(
  ( (Nil!2710) (Cons!2709 (h!3351 (_ BitVec 64)) (t!7644 List!2713)) )
))
(declare-fun arrayNoDuplicates!0 (array!9087 (_ BitVec 32) List!2713) Bool)

(assert (=> b!201949 (= res!96634 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2710))))

(declare-fun b!201950 () Bool)

(assert (=> b!201950 (= e!132315 (and e!132314 mapRes!8462))))

(declare-fun condMapEmpty!8462 () Bool)

(declare-fun mapDefault!8462 () ValueCell!2121)

(assert (=> b!201950 (= condMapEmpty!8462 (= (arr!4295 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2121)) mapDefault!8462)))))

(declare-fun b!201951 () Bool)

(assert (=> b!201951 (= e!132319 (not e!132318))))

(declare-fun res!96629 () Bool)

(assert (=> b!201951 (=> res!96629 e!132318)))

(assert (=> b!201951 (= res!96629 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!957 (array!9087 array!9089 (_ BitVec 32) (_ BitVec 32) V!6219 V!6219 (_ BitVec 32) Int) ListLongMap!2715)

(assert (=> b!201951 (= lt!101047 (getCurrentListMap!957 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101051 () array!9089)

(assert (=> b!201951 (= lt!101052 (getCurrentListMap!957 _keys!825 lt!101051 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201951 (and (= lt!101041 lt!101046) (= lt!101046 lt!101041))))

(assert (=> b!201951 (= lt!101046 (+!400 lt!101045 lt!101044))))

(assert (=> b!201951 (= lt!101044 (tuple2!3803 k0!843 v!520))))

(declare-fun lt!101043 () Unit!6100)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!70 (array!9087 array!9089 (_ BitVec 32) (_ BitVec 32) V!6219 V!6219 (_ BitVec 32) (_ BitVec 64) V!6219 (_ BitVec 32) Int) Unit!6100)

(assert (=> b!201951 (= lt!101043 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!70 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!331 (array!9087 array!9089 (_ BitVec 32) (_ BitVec 32) V!6219 V!6219 (_ BitVec 32) Int) ListLongMap!2715)

(assert (=> b!201951 (= lt!101041 (getCurrentListMapNoExtraKeys!331 _keys!825 lt!101051 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201951 (= lt!101051 (array!9090 (store (arr!4295 _values!649) i!601 (ValueCellFull!2121 v!520)) (size!4620 _values!649)))))

(assert (=> b!201951 (= lt!101045 (getCurrentListMapNoExtraKeys!331 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201952 () Bool)

(declare-fun res!96635 () Bool)

(assert (=> b!201952 (=> (not res!96635) (not e!132319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201952 (= res!96635 (validKeyInArray!0 k0!843))))

(declare-fun b!201953 () Bool)

(declare-fun res!96633 () Bool)

(assert (=> b!201953 (=> (not res!96633) (not e!132319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9087 (_ BitVec 32)) Bool)

(assert (=> b!201953 (= res!96633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20414 res!96632) b!201946))

(assert (= (and b!201946 res!96631) b!201953))

(assert (= (and b!201953 res!96633) b!201949))

(assert (= (and b!201949 res!96634) b!201947))

(assert (= (and b!201947 res!96636) b!201952))

(assert (= (and b!201952 res!96635) b!201943))

(assert (= (and b!201943 res!96630) b!201951))

(assert (= (and b!201951 (not res!96629)) b!201944))

(assert (= (and b!201944 (not res!96637)) b!201945))

(assert (= (and b!201950 condMapEmpty!8462) mapIsEmpty!8462))

(assert (= (and b!201950 (not condMapEmpty!8462)) mapNonEmpty!8462))

(get-info :version)

(assert (= (and mapNonEmpty!8462 ((_ is ValueCellFull!2121) mapValue!8462)) b!201948))

(assert (= (and b!201950 ((_ is ValueCellFull!2121) mapDefault!8462)) b!201942))

(assert (= start!20414 b!201950))

(declare-fun m!229091 () Bool)

(assert (=> b!201949 m!229091))

(declare-fun m!229093 () Bool)

(assert (=> b!201945 m!229093))

(declare-fun m!229095 () Bool)

(assert (=> b!201945 m!229095))

(declare-fun m!229097 () Bool)

(assert (=> b!201945 m!229097))

(declare-fun m!229099 () Bool)

(assert (=> start!20414 m!229099))

(declare-fun m!229101 () Bool)

(assert (=> start!20414 m!229101))

(declare-fun m!229103 () Bool)

(assert (=> start!20414 m!229103))

(declare-fun m!229105 () Bool)

(assert (=> b!201953 m!229105))

(declare-fun m!229107 () Bool)

(assert (=> b!201944 m!229107))

(declare-fun m!229109 () Bool)

(assert (=> b!201944 m!229109))

(declare-fun m!229111 () Bool)

(assert (=> b!201944 m!229111))

(declare-fun m!229113 () Bool)

(assert (=> b!201944 m!229113))

(declare-fun m!229115 () Bool)

(assert (=> b!201944 m!229115))

(declare-fun m!229117 () Bool)

(assert (=> b!201944 m!229117))

(assert (=> b!201944 m!229107))

(declare-fun m!229119 () Bool)

(assert (=> b!201944 m!229119))

(declare-fun m!229121 () Bool)

(assert (=> b!201944 m!229121))

(declare-fun m!229123 () Bool)

(assert (=> mapNonEmpty!8462 m!229123))

(declare-fun m!229125 () Bool)

(assert (=> b!201952 m!229125))

(declare-fun m!229127 () Bool)

(assert (=> b!201943 m!229127))

(declare-fun m!229129 () Bool)

(assert (=> b!201951 m!229129))

(declare-fun m!229131 () Bool)

(assert (=> b!201951 m!229131))

(declare-fun m!229133 () Bool)

(assert (=> b!201951 m!229133))

(declare-fun m!229135 () Bool)

(assert (=> b!201951 m!229135))

(declare-fun m!229137 () Bool)

(assert (=> b!201951 m!229137))

(declare-fun m!229139 () Bool)

(assert (=> b!201951 m!229139))

(declare-fun m!229141 () Bool)

(assert (=> b!201951 m!229141))

(check-sat (not b!201951) tp_is_empty!4929 (not b!201953) (not start!20414) (not b!201952) (not b!201944) (not b!201945) (not b!201949) (not mapNonEmpty!8462) b_and!11819 (not b_next!5073))
(check-sat b_and!11819 (not b_next!5073))
