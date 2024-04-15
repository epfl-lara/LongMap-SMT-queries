; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20470 () Bool)

(assert start!20470)

(declare-fun b_free!5125 () Bool)

(declare-fun b_next!5125 () Bool)

(assert (=> start!20470 (= b_free!5125 (not b_next!5125))))

(declare-fun tp!18406 () Bool)

(declare-fun b_and!11845 () Bool)

(assert (=> start!20470 (= tp!18406 b_and!11845)))

(declare-fun b!202740 () Bool)

(declare-fun e!132759 () Bool)

(declare-fun e!132760 () Bool)

(assert (=> b!202740 (= e!132759 (not e!132760))))

(declare-fun res!97245 () Bool)

(assert (=> b!202740 (=> res!97245 e!132760)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202740 (= res!97245 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6289 0))(
  ( (V!6290 (val!2535 Int)) )
))
(declare-datatypes ((ValueCell!2147 0))(
  ( (ValueCellFull!2147 (v!4499 V!6289)) (EmptyCell!2147) )
))
(declare-datatypes ((array!9173 0))(
  ( (array!9174 (arr!4336 (Array (_ BitVec 32) ValueCell!2147)) (size!4662 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9173)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6289)

(declare-datatypes ((array!9175 0))(
  ( (array!9176 (arr!4337 (Array (_ BitVec 32) (_ BitVec 64))) (size!4663 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9175)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3822 0))(
  ( (tuple2!3823 (_1!1922 (_ BitVec 64)) (_2!1922 V!6289)) )
))
(declare-datatypes ((List!2734 0))(
  ( (Nil!2731) (Cons!2730 (h!3372 tuple2!3822) (t!7656 List!2734)) )
))
(declare-datatypes ((ListLongMap!2725 0))(
  ( (ListLongMap!2726 (toList!1378 List!2734)) )
))
(declare-fun lt!101886 () ListLongMap!2725)

(declare-fun minValue!615 () V!6289)

(declare-fun getCurrentListMap!932 (array!9175 array!9173 (_ BitVec 32) (_ BitVec 32) V!6289 V!6289 (_ BitVec 32) Int) ListLongMap!2725)

(assert (=> b!202740 (= lt!101886 (getCurrentListMap!932 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101890 () ListLongMap!2725)

(declare-fun lt!101883 () array!9173)

(assert (=> b!202740 (= lt!101890 (getCurrentListMap!932 _keys!825 lt!101883 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101885 () ListLongMap!2725)

(declare-fun lt!101887 () ListLongMap!2725)

(assert (=> b!202740 (and (= lt!101885 lt!101887) (= lt!101887 lt!101885))))

(declare-fun lt!101893 () ListLongMap!2725)

(declare-fun lt!101889 () tuple2!3822)

(declare-fun +!427 (ListLongMap!2725 tuple2!3822) ListLongMap!2725)

(assert (=> b!202740 (= lt!101887 (+!427 lt!101893 lt!101889))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6289)

(assert (=> b!202740 (= lt!101889 (tuple2!3823 k0!843 v!520))))

(declare-datatypes ((Unit!6104 0))(
  ( (Unit!6105) )
))
(declare-fun lt!101891 () Unit!6104)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!91 (array!9175 array!9173 (_ BitVec 32) (_ BitVec 32) V!6289 V!6289 (_ BitVec 32) (_ BitVec 64) V!6289 (_ BitVec 32) Int) Unit!6104)

(assert (=> b!202740 (= lt!101891 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!91 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!342 (array!9175 array!9173 (_ BitVec 32) (_ BitVec 32) V!6289 V!6289 (_ BitVec 32) Int) ListLongMap!2725)

(assert (=> b!202740 (= lt!101885 (getCurrentListMapNoExtraKeys!342 _keys!825 lt!101883 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202740 (= lt!101883 (array!9174 (store (arr!4336 _values!649) i!601 (ValueCellFull!2147 v!520)) (size!4662 _values!649)))))

(assert (=> b!202740 (= lt!101893 (getCurrentListMapNoExtraKeys!342 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202741 () Bool)

(declare-fun e!132761 () Bool)

(declare-fun tp_is_empty!4981 () Bool)

(assert (=> b!202741 (= e!132761 tp_is_empty!4981)))

(declare-fun b!202742 () Bool)

(declare-fun res!97253 () Bool)

(assert (=> b!202742 (=> (not res!97253) (not e!132759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202742 (= res!97253 (validKeyInArray!0 k0!843))))

(declare-fun b!202743 () Bool)

(declare-fun res!97247 () Bool)

(assert (=> b!202743 (=> (not res!97247) (not e!132759))))

(assert (=> b!202743 (= res!97247 (and (= (size!4662 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4663 _keys!825) (size!4662 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202744 () Bool)

(declare-fun res!97251 () Bool)

(assert (=> b!202744 (=> (not res!97251) (not e!132759))))

(declare-datatypes ((List!2735 0))(
  ( (Nil!2732) (Cons!2731 (h!3373 (_ BitVec 64)) (t!7657 List!2735)) )
))
(declare-fun arrayNoDuplicates!0 (array!9175 (_ BitVec 32) List!2735) Bool)

(assert (=> b!202744 (= res!97251 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2732))))

(declare-fun b!202745 () Bool)

(declare-fun e!132765 () Bool)

(assert (=> b!202745 (= e!132765 tp_is_empty!4981)))

(declare-fun b!202747 () Bool)

(declare-fun res!97246 () Bool)

(assert (=> b!202747 (=> (not res!97246) (not e!132759))))

(assert (=> b!202747 (= res!97246 (= (select (arr!4337 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8540 () Bool)

(declare-fun mapRes!8540 () Bool)

(declare-fun tp!18407 () Bool)

(assert (=> mapNonEmpty!8540 (= mapRes!8540 (and tp!18407 e!132765))))

(declare-fun mapKey!8540 () (_ BitVec 32))

(declare-fun mapValue!8540 () ValueCell!2147)

(declare-fun mapRest!8540 () (Array (_ BitVec 32) ValueCell!2147))

(assert (=> mapNonEmpty!8540 (= (arr!4336 _values!649) (store mapRest!8540 mapKey!8540 mapValue!8540))))

(declare-fun b!202748 () Bool)

(declare-fun e!132762 () Bool)

(assert (=> b!202748 (= e!132760 e!132762)))

(declare-fun res!97249 () Bool)

(assert (=> b!202748 (=> res!97249 e!132762)))

(assert (=> b!202748 (= res!97249 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101892 () ListLongMap!2725)

(assert (=> b!202748 (= lt!101890 lt!101892)))

(declare-fun lt!101894 () tuple2!3822)

(assert (=> b!202748 (= lt!101892 (+!427 lt!101887 lt!101894))))

(declare-fun lt!101888 () ListLongMap!2725)

(assert (=> b!202748 (= lt!101886 lt!101888)))

(assert (=> b!202748 (= lt!101888 (+!427 lt!101893 lt!101894))))

(assert (=> b!202748 (= lt!101890 (+!427 lt!101885 lt!101894))))

(assert (=> b!202748 (= lt!101894 (tuple2!3823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202749 () Bool)

(declare-fun res!97252 () Bool)

(assert (=> b!202749 (=> (not res!97252) (not e!132759))))

(assert (=> b!202749 (= res!97252 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4663 _keys!825))))))

(declare-fun mapIsEmpty!8540 () Bool)

(assert (=> mapIsEmpty!8540 mapRes!8540))

(declare-fun b!202750 () Bool)

(declare-fun e!132764 () Bool)

(assert (=> b!202750 (= e!132764 (and e!132761 mapRes!8540))))

(declare-fun condMapEmpty!8540 () Bool)

(declare-fun mapDefault!8540 () ValueCell!2147)

(assert (=> b!202750 (= condMapEmpty!8540 (= (arr!4336 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2147)) mapDefault!8540)))))

(declare-fun b!202751 () Bool)

(assert (=> b!202751 (= e!132762 true)))

(assert (=> b!202751 (= lt!101892 (+!427 lt!101888 lt!101889))))

(declare-fun lt!101884 () Unit!6104)

(declare-fun addCommutativeForDiffKeys!129 (ListLongMap!2725 (_ BitVec 64) V!6289 (_ BitVec 64) V!6289) Unit!6104)

(assert (=> b!202751 (= lt!101884 (addCommutativeForDiffKeys!129 lt!101893 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97250 () Bool)

(assert (=> start!20470 (=> (not res!97250) (not e!132759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20470 (= res!97250 (validMask!0 mask!1149))))

(assert (=> start!20470 e!132759))

(declare-fun array_inv!2847 (array!9173) Bool)

(assert (=> start!20470 (and (array_inv!2847 _values!649) e!132764)))

(assert (=> start!20470 true))

(assert (=> start!20470 tp_is_empty!4981))

(declare-fun array_inv!2848 (array!9175) Bool)

(assert (=> start!20470 (array_inv!2848 _keys!825)))

(assert (=> start!20470 tp!18406))

(declare-fun b!202746 () Bool)

(declare-fun res!97248 () Bool)

(assert (=> b!202746 (=> (not res!97248) (not e!132759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9175 (_ BitVec 32)) Bool)

(assert (=> b!202746 (= res!97248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20470 res!97250) b!202743))

(assert (= (and b!202743 res!97247) b!202746))

(assert (= (and b!202746 res!97248) b!202744))

(assert (= (and b!202744 res!97251) b!202749))

(assert (= (and b!202749 res!97252) b!202742))

(assert (= (and b!202742 res!97253) b!202747))

(assert (= (and b!202747 res!97246) b!202740))

(assert (= (and b!202740 (not res!97245)) b!202748))

(assert (= (and b!202748 (not res!97249)) b!202751))

(assert (= (and b!202750 condMapEmpty!8540) mapIsEmpty!8540))

(assert (= (and b!202750 (not condMapEmpty!8540)) mapNonEmpty!8540))

(get-info :version)

(assert (= (and mapNonEmpty!8540 ((_ is ValueCellFull!2147) mapValue!8540)) b!202745))

(assert (= (and b!202750 ((_ is ValueCellFull!2147) mapDefault!8540)) b!202741))

(assert (= start!20470 b!202750))

(declare-fun m!229635 () Bool)

(assert (=> b!202744 m!229635))

(declare-fun m!229637 () Bool)

(assert (=> b!202746 m!229637))

(declare-fun m!229639 () Bool)

(assert (=> b!202748 m!229639))

(declare-fun m!229641 () Bool)

(assert (=> b!202748 m!229641))

(declare-fun m!229643 () Bool)

(assert (=> b!202748 m!229643))

(declare-fun m!229645 () Bool)

(assert (=> start!20470 m!229645))

(declare-fun m!229647 () Bool)

(assert (=> start!20470 m!229647))

(declare-fun m!229649 () Bool)

(assert (=> start!20470 m!229649))

(declare-fun m!229651 () Bool)

(assert (=> b!202751 m!229651))

(declare-fun m!229653 () Bool)

(assert (=> b!202751 m!229653))

(declare-fun m!229655 () Bool)

(assert (=> b!202747 m!229655))

(declare-fun m!229657 () Bool)

(assert (=> b!202740 m!229657))

(declare-fun m!229659 () Bool)

(assert (=> b!202740 m!229659))

(declare-fun m!229661 () Bool)

(assert (=> b!202740 m!229661))

(declare-fun m!229663 () Bool)

(assert (=> b!202740 m!229663))

(declare-fun m!229665 () Bool)

(assert (=> b!202740 m!229665))

(declare-fun m!229667 () Bool)

(assert (=> b!202740 m!229667))

(declare-fun m!229669 () Bool)

(assert (=> b!202740 m!229669))

(declare-fun m!229671 () Bool)

(assert (=> b!202742 m!229671))

(declare-fun m!229673 () Bool)

(assert (=> mapNonEmpty!8540 m!229673))

(check-sat (not mapNonEmpty!8540) (not b!202748) tp_is_empty!4981 (not b!202744) (not start!20470) (not b!202746) b_and!11845 (not b!202742) (not b!202740) (not b!202751) (not b_next!5125))
(check-sat b_and!11845 (not b_next!5125))
