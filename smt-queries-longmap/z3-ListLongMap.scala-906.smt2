; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20536 () Bool)

(assert start!20536)

(declare-fun b_free!5191 () Bool)

(declare-fun b_next!5191 () Bool)

(assert (=> start!20536 (= b_free!5191 (not b_next!5191))))

(declare-fun tp!18605 () Bool)

(declare-fun b_and!11951 () Bool)

(assert (=> start!20536 (= tp!18605 b_and!11951)))

(declare-fun b!204122 () Bool)

(declare-fun e!133578 () Bool)

(declare-fun e!133580 () Bool)

(assert (=> b!204122 (= e!133578 (not e!133580))))

(declare-fun res!98254 () Bool)

(assert (=> b!204122 (=> res!98254 e!133580)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204122 (= res!98254 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6377 0))(
  ( (V!6378 (val!2568 Int)) )
))
(declare-datatypes ((ValueCell!2180 0))(
  ( (ValueCellFull!2180 (v!4539 V!6377)) (EmptyCell!2180) )
))
(declare-datatypes ((array!9305 0))(
  ( (array!9306 (arr!4403 (Array (_ BitVec 32) ValueCell!2180)) (size!4728 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9305)

(declare-fun zeroValue!615 () V!6377)

(declare-datatypes ((array!9307 0))(
  ( (array!9308 (arr!4404 (Array (_ BitVec 32) (_ BitVec 64))) (size!4729 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9307)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6377)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3838 0))(
  ( (tuple2!3839 (_1!1930 (_ BitVec 64)) (_2!1930 V!6377)) )
))
(declare-datatypes ((List!2736 0))(
  ( (Nil!2733) (Cons!2732 (h!3374 tuple2!3838) (t!7659 List!2736)) )
))
(declare-datatypes ((ListLongMap!2753 0))(
  ( (ListLongMap!2754 (toList!1392 List!2736)) )
))
(declare-fun lt!103319 () ListLongMap!2753)

(declare-fun getCurrentListMap!970 (array!9307 array!9305 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) Int) ListLongMap!2753)

(assert (=> b!204122 (= lt!103319 (getCurrentListMap!970 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103316 () array!9305)

(declare-fun lt!103313 () ListLongMap!2753)

(assert (=> b!204122 (= lt!103313 (getCurrentListMap!970 _keys!825 lt!103316 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103317 () ListLongMap!2753)

(declare-fun lt!103322 () ListLongMap!2753)

(assert (=> b!204122 (and (= lt!103317 lt!103322) (= lt!103322 lt!103317))))

(declare-fun lt!103311 () ListLongMap!2753)

(declare-fun lt!103315 () tuple2!3838)

(declare-fun +!446 (ListLongMap!2753 tuple2!3838) ListLongMap!2753)

(assert (=> b!204122 (= lt!103322 (+!446 lt!103311 lt!103315))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6377)

(assert (=> b!204122 (= lt!103315 (tuple2!3839 k0!843 v!520))))

(declare-datatypes ((Unit!6172 0))(
  ( (Unit!6173) )
))
(declare-fun lt!103314 () Unit!6172)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!106 (array!9307 array!9305 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) (_ BitVec 64) V!6377 (_ BitVec 32) Int) Unit!6172)

(assert (=> b!204122 (= lt!103314 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!106 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!363 (array!9307 array!9305 (_ BitVec 32) (_ BitVec 32) V!6377 V!6377 (_ BitVec 32) Int) ListLongMap!2753)

(assert (=> b!204122 (= lt!103317 (getCurrentListMapNoExtraKeys!363 _keys!825 lt!103316 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204122 (= lt!103316 (array!9306 (store (arr!4403 _values!649) i!601 (ValueCellFull!2180 v!520)) (size!4728 _values!649)))))

(assert (=> b!204122 (= lt!103311 (getCurrentListMapNoExtraKeys!363 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204123 () Bool)

(declare-fun e!133581 () Bool)

(declare-fun tp_is_empty!5047 () Bool)

(assert (=> b!204123 (= e!133581 tp_is_empty!5047)))

(declare-fun b!204124 () Bool)

(declare-fun res!98259 () Bool)

(assert (=> b!204124 (=> (not res!98259) (not e!133578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204124 (= res!98259 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8639 () Bool)

(declare-fun mapRes!8639 () Bool)

(assert (=> mapIsEmpty!8639 mapRes!8639))

(declare-fun b!204125 () Bool)

(declare-fun res!98253 () Bool)

(assert (=> b!204125 (=> (not res!98253) (not e!133578))))

(assert (=> b!204125 (= res!98253 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4729 _keys!825))))))

(declare-fun b!204126 () Bool)

(declare-fun e!133582 () Bool)

(assert (=> b!204126 (= e!133580 e!133582)))

(declare-fun res!98255 () Bool)

(assert (=> b!204126 (=> res!98255 e!133582)))

(assert (=> b!204126 (= res!98255 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103318 () ListLongMap!2753)

(assert (=> b!204126 (= lt!103313 lt!103318)))

(declare-fun lt!103320 () tuple2!3838)

(assert (=> b!204126 (= lt!103318 (+!446 lt!103322 lt!103320))))

(declare-fun lt!103321 () ListLongMap!2753)

(assert (=> b!204126 (= lt!103319 lt!103321)))

(assert (=> b!204126 (= lt!103321 (+!446 lt!103311 lt!103320))))

(assert (=> b!204126 (= lt!103313 (+!446 lt!103317 lt!103320))))

(assert (=> b!204126 (= lt!103320 (tuple2!3839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!98256 () Bool)

(assert (=> start!20536 (=> (not res!98256) (not e!133578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20536 (= res!98256 (validMask!0 mask!1149))))

(assert (=> start!20536 e!133578))

(declare-fun e!133583 () Bool)

(declare-fun array_inv!2877 (array!9305) Bool)

(assert (=> start!20536 (and (array_inv!2877 _values!649) e!133583)))

(assert (=> start!20536 true))

(assert (=> start!20536 tp_is_empty!5047))

(declare-fun array_inv!2878 (array!9307) Bool)

(assert (=> start!20536 (array_inv!2878 _keys!825)))

(assert (=> start!20536 tp!18605))

(declare-fun b!204127 () Bool)

(declare-fun res!98257 () Bool)

(assert (=> b!204127 (=> (not res!98257) (not e!133578))))

(declare-datatypes ((List!2737 0))(
  ( (Nil!2734) (Cons!2733 (h!3375 (_ BitVec 64)) (t!7660 List!2737)) )
))
(declare-fun arrayNoDuplicates!0 (array!9307 (_ BitVec 32) List!2737) Bool)

(assert (=> b!204127 (= res!98257 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2734))))

(declare-fun b!204128 () Bool)

(assert (=> b!204128 (= e!133582 true)))

(assert (=> b!204128 (= lt!103318 (+!446 lt!103321 lt!103315))))

(declare-fun lt!103312 () Unit!6172)

(declare-fun addCommutativeForDiffKeys!157 (ListLongMap!2753 (_ BitVec 64) V!6377 (_ BitVec 64) V!6377) Unit!6172)

(assert (=> b!204128 (= lt!103312 (addCommutativeForDiffKeys!157 lt!103311 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204129 () Bool)

(declare-fun e!133577 () Bool)

(assert (=> b!204129 (= e!133577 tp_is_empty!5047)))

(declare-fun mapNonEmpty!8639 () Bool)

(declare-fun tp!18604 () Bool)

(assert (=> mapNonEmpty!8639 (= mapRes!8639 (and tp!18604 e!133577))))

(declare-fun mapValue!8639 () ValueCell!2180)

(declare-fun mapKey!8639 () (_ BitVec 32))

(declare-fun mapRest!8639 () (Array (_ BitVec 32) ValueCell!2180))

(assert (=> mapNonEmpty!8639 (= (arr!4403 _values!649) (store mapRest!8639 mapKey!8639 mapValue!8639))))

(declare-fun b!204130 () Bool)

(declare-fun res!98260 () Bool)

(assert (=> b!204130 (=> (not res!98260) (not e!133578))))

(assert (=> b!204130 (= res!98260 (= (select (arr!4404 _keys!825) i!601) k0!843))))

(declare-fun b!204131 () Bool)

(declare-fun res!98258 () Bool)

(assert (=> b!204131 (=> (not res!98258) (not e!133578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9307 (_ BitVec 32)) Bool)

(assert (=> b!204131 (= res!98258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204132 () Bool)

(assert (=> b!204132 (= e!133583 (and e!133581 mapRes!8639))))

(declare-fun condMapEmpty!8639 () Bool)

(declare-fun mapDefault!8639 () ValueCell!2180)

(assert (=> b!204132 (= condMapEmpty!8639 (= (arr!4403 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2180)) mapDefault!8639)))))

(declare-fun b!204133 () Bool)

(declare-fun res!98252 () Bool)

(assert (=> b!204133 (=> (not res!98252) (not e!133578))))

(assert (=> b!204133 (= res!98252 (and (= (size!4728 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4729 _keys!825) (size!4728 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20536 res!98256) b!204133))

(assert (= (and b!204133 res!98252) b!204131))

(assert (= (and b!204131 res!98258) b!204127))

(assert (= (and b!204127 res!98257) b!204125))

(assert (= (and b!204125 res!98253) b!204124))

(assert (= (and b!204124 res!98259) b!204130))

(assert (= (and b!204130 res!98260) b!204122))

(assert (= (and b!204122 (not res!98254)) b!204126))

(assert (= (and b!204126 (not res!98255)) b!204128))

(assert (= (and b!204132 condMapEmpty!8639) mapIsEmpty!8639))

(assert (= (and b!204132 (not condMapEmpty!8639)) mapNonEmpty!8639))

(get-info :version)

(assert (= (and mapNonEmpty!8639 ((_ is ValueCellFull!2180) mapValue!8639)) b!204129))

(assert (= (and b!204132 ((_ is ValueCellFull!2180) mapDefault!8639)) b!204123))

(assert (= start!20536 b!204132))

(declare-fun m!231753 () Bool)

(assert (=> b!204124 m!231753))

(declare-fun m!231755 () Bool)

(assert (=> b!204130 m!231755))

(declare-fun m!231757 () Bool)

(assert (=> start!20536 m!231757))

(declare-fun m!231759 () Bool)

(assert (=> start!20536 m!231759))

(declare-fun m!231761 () Bool)

(assert (=> start!20536 m!231761))

(declare-fun m!231763 () Bool)

(assert (=> mapNonEmpty!8639 m!231763))

(declare-fun m!231765 () Bool)

(assert (=> b!204122 m!231765))

(declare-fun m!231767 () Bool)

(assert (=> b!204122 m!231767))

(declare-fun m!231769 () Bool)

(assert (=> b!204122 m!231769))

(declare-fun m!231771 () Bool)

(assert (=> b!204122 m!231771))

(declare-fun m!231773 () Bool)

(assert (=> b!204122 m!231773))

(declare-fun m!231775 () Bool)

(assert (=> b!204122 m!231775))

(declare-fun m!231777 () Bool)

(assert (=> b!204122 m!231777))

(declare-fun m!231779 () Bool)

(assert (=> b!204127 m!231779))

(declare-fun m!231781 () Bool)

(assert (=> b!204131 m!231781))

(declare-fun m!231783 () Bool)

(assert (=> b!204128 m!231783))

(declare-fun m!231785 () Bool)

(assert (=> b!204128 m!231785))

(declare-fun m!231787 () Bool)

(assert (=> b!204126 m!231787))

(declare-fun m!231789 () Bool)

(assert (=> b!204126 m!231789))

(declare-fun m!231791 () Bool)

(assert (=> b!204126 m!231791))

(check-sat tp_is_empty!5047 b_and!11951 (not b!204126) (not start!20536) (not b!204127) (not b!204128) (not mapNonEmpty!8639) (not b!204124) (not b!204131) (not b_next!5191) (not b!204122))
(check-sat b_and!11951 (not b_next!5191))
