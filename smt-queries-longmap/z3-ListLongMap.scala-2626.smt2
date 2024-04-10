; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39576 () Bool)

(assert start!39576)

(declare-fun b_free!9843 () Bool)

(declare-fun b_next!9843 () Bool)

(assert (=> start!39576 (= b_free!9843 (not b_next!9843))))

(declare-fun tp!35057 () Bool)

(declare-fun b_and!17499 () Bool)

(assert (=> start!39576 (= tp!35057 b_and!17499)))

(declare-fun b!423714 () Bool)

(declare-fun e!251847 () Bool)

(declare-fun e!251845 () Bool)

(assert (=> b!423714 (= e!251847 e!251845)))

(declare-fun res!247706 () Bool)

(assert (=> b!423714 (=> (not res!247706) (not e!251845))))

(declare-datatypes ((array!25833 0))(
  ( (array!25834 (arr!12366 (Array (_ BitVec 32) (_ BitVec 64))) (size!12718 (_ BitVec 32))) )
))
(declare-fun lt!194224 () array!25833)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25833 (_ BitVec 32)) Bool)

(assert (=> b!423714 (= res!247706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194224 mask!1025))))

(declare-fun _keys!709 () array!25833)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423714 (= lt!194224 (array!25834 (store (arr!12366 _keys!709) i!563 k0!794) (size!12718 _keys!709)))))

(declare-fun b!423715 () Bool)

(declare-fun res!247705 () Bool)

(assert (=> b!423715 (=> (not res!247705) (not e!251845))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423715 (= res!247705 (bvsle from!863 i!563))))

(declare-fun b!423716 () Bool)

(declare-fun res!247701 () Bool)

(assert (=> b!423716 (=> (not res!247701) (not e!251847))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15765 0))(
  ( (V!15766 (val!5542 Int)) )
))
(declare-datatypes ((ValueCell!5154 0))(
  ( (ValueCellFull!5154 (v!7789 V!15765)) (EmptyCell!5154) )
))
(declare-datatypes ((array!25835 0))(
  ( (array!25836 (arr!12367 (Array (_ BitVec 32) ValueCell!5154)) (size!12719 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25835)

(assert (=> b!423716 (= res!247701 (and (= (size!12719 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12718 _keys!709) (size!12719 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423717 () Bool)

(declare-fun res!247707 () Bool)

(assert (=> b!423717 (=> (not res!247707) (not e!251847))))

(declare-datatypes ((List!7288 0))(
  ( (Nil!7285) (Cons!7284 (h!8140 (_ BitVec 64)) (t!12732 List!7288)) )
))
(declare-fun arrayNoDuplicates!0 (array!25833 (_ BitVec 32) List!7288) Bool)

(assert (=> b!423717 (= res!247707 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7285))))

(declare-fun res!247702 () Bool)

(assert (=> start!39576 (=> (not res!247702) (not e!251847))))

(assert (=> start!39576 (= res!247702 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12718 _keys!709))))))

(assert (=> start!39576 e!251847))

(declare-fun tp_is_empty!10995 () Bool)

(assert (=> start!39576 tp_is_empty!10995))

(assert (=> start!39576 tp!35057))

(assert (=> start!39576 true))

(declare-fun e!251850 () Bool)

(declare-fun array_inv!9012 (array!25835) Bool)

(assert (=> start!39576 (and (array_inv!9012 _values!549) e!251850)))

(declare-fun array_inv!9013 (array!25833) Bool)

(assert (=> start!39576 (array_inv!9013 _keys!709)))

(declare-fun b!423718 () Bool)

(declare-fun res!247696 () Bool)

(assert (=> b!423718 (=> (not res!247696) (not e!251847))))

(assert (=> b!423718 (= res!247696 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12718 _keys!709))))))

(declare-fun b!423719 () Bool)

(declare-fun res!247704 () Bool)

(assert (=> b!423719 (=> (not res!247704) (not e!251845))))

(assert (=> b!423719 (= res!247704 (arrayNoDuplicates!0 lt!194224 #b00000000000000000000000000000000 Nil!7285))))

(declare-fun b!423720 () Bool)

(declare-fun res!247698 () Bool)

(assert (=> b!423720 (=> (not res!247698) (not e!251847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423720 (= res!247698 (validMask!0 mask!1025))))

(declare-fun b!423721 () Bool)

(declare-fun e!251849 () Bool)

(assert (=> b!423721 (= e!251849 tp_is_empty!10995)))

(declare-fun b!423722 () Bool)

(declare-fun res!247703 () Bool)

(assert (=> b!423722 (=> (not res!247703) (not e!251847))))

(assert (=> b!423722 (= res!247703 (or (= (select (arr!12366 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12366 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423723 () Bool)

(declare-fun e!251848 () Bool)

(assert (=> b!423723 (= e!251848 tp_is_empty!10995)))

(declare-fun b!423724 () Bool)

(declare-fun res!247697 () Bool)

(assert (=> b!423724 (=> (not res!247697) (not e!251847))))

(assert (=> b!423724 (= res!247697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18114 () Bool)

(declare-fun mapRes!18114 () Bool)

(assert (=> mapIsEmpty!18114 mapRes!18114))

(declare-fun mapNonEmpty!18114 () Bool)

(declare-fun tp!35058 () Bool)

(assert (=> mapNonEmpty!18114 (= mapRes!18114 (and tp!35058 e!251848))))

(declare-fun mapRest!18114 () (Array (_ BitVec 32) ValueCell!5154))

(declare-fun mapKey!18114 () (_ BitVec 32))

(declare-fun mapValue!18114 () ValueCell!5154)

(assert (=> mapNonEmpty!18114 (= (arr!12367 _values!549) (store mapRest!18114 mapKey!18114 mapValue!18114))))

(declare-fun b!423725 () Bool)

(assert (=> b!423725 (= e!251845 false)))

(declare-fun minValue!515 () V!15765)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15765)

(declare-datatypes ((tuple2!7280 0))(
  ( (tuple2!7281 (_1!3651 (_ BitVec 64)) (_2!3651 V!15765)) )
))
(declare-datatypes ((List!7289 0))(
  ( (Nil!7286) (Cons!7285 (h!8141 tuple2!7280) (t!12733 List!7289)) )
))
(declare-datatypes ((ListLongMap!6193 0))(
  ( (ListLongMap!6194 (toList!3112 List!7289)) )
))
(declare-fun lt!194225 () ListLongMap!6193)

(declare-fun v!412 () V!15765)

(declare-fun getCurrentListMapNoExtraKeys!1316 (array!25833 array!25835 (_ BitVec 32) (_ BitVec 32) V!15765 V!15765 (_ BitVec 32) Int) ListLongMap!6193)

(assert (=> b!423725 (= lt!194225 (getCurrentListMapNoExtraKeys!1316 lt!194224 (array!25836 (store (arr!12367 _values!549) i!563 (ValueCellFull!5154 v!412)) (size!12719 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194223 () ListLongMap!6193)

(assert (=> b!423725 (= lt!194223 (getCurrentListMapNoExtraKeys!1316 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423726 () Bool)

(declare-fun res!247699 () Bool)

(assert (=> b!423726 (=> (not res!247699) (not e!251847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423726 (= res!247699 (validKeyInArray!0 k0!794))))

(declare-fun b!423727 () Bool)

(declare-fun res!247700 () Bool)

(assert (=> b!423727 (=> (not res!247700) (not e!251847))))

(declare-fun arrayContainsKey!0 (array!25833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423727 (= res!247700 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423728 () Bool)

(assert (=> b!423728 (= e!251850 (and e!251849 mapRes!18114))))

(declare-fun condMapEmpty!18114 () Bool)

(declare-fun mapDefault!18114 () ValueCell!5154)

(assert (=> b!423728 (= condMapEmpty!18114 (= (arr!12367 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5154)) mapDefault!18114)))))

(assert (= (and start!39576 res!247702) b!423720))

(assert (= (and b!423720 res!247698) b!423716))

(assert (= (and b!423716 res!247701) b!423724))

(assert (= (and b!423724 res!247697) b!423717))

(assert (= (and b!423717 res!247707) b!423718))

(assert (= (and b!423718 res!247696) b!423726))

(assert (= (and b!423726 res!247699) b!423722))

(assert (= (and b!423722 res!247703) b!423727))

(assert (= (and b!423727 res!247700) b!423714))

(assert (= (and b!423714 res!247706) b!423719))

(assert (= (and b!423719 res!247704) b!423715))

(assert (= (and b!423715 res!247705) b!423725))

(assert (= (and b!423728 condMapEmpty!18114) mapIsEmpty!18114))

(assert (= (and b!423728 (not condMapEmpty!18114)) mapNonEmpty!18114))

(get-info :version)

(assert (= (and mapNonEmpty!18114 ((_ is ValueCellFull!5154) mapValue!18114)) b!423723))

(assert (= (and b!423728 ((_ is ValueCellFull!5154) mapDefault!18114)) b!423721))

(assert (= start!39576 b!423728))

(declare-fun m!413103 () Bool)

(assert (=> b!423727 m!413103))

(declare-fun m!413105 () Bool)

(assert (=> b!423714 m!413105))

(declare-fun m!413107 () Bool)

(assert (=> b!423714 m!413107))

(declare-fun m!413109 () Bool)

(assert (=> b!423724 m!413109))

(declare-fun m!413111 () Bool)

(assert (=> mapNonEmpty!18114 m!413111))

(declare-fun m!413113 () Bool)

(assert (=> b!423719 m!413113))

(declare-fun m!413115 () Bool)

(assert (=> b!423725 m!413115))

(declare-fun m!413117 () Bool)

(assert (=> b!423725 m!413117))

(declare-fun m!413119 () Bool)

(assert (=> b!423725 m!413119))

(declare-fun m!413121 () Bool)

(assert (=> b!423722 m!413121))

(declare-fun m!413123 () Bool)

(assert (=> start!39576 m!413123))

(declare-fun m!413125 () Bool)

(assert (=> start!39576 m!413125))

(declare-fun m!413127 () Bool)

(assert (=> b!423720 m!413127))

(declare-fun m!413129 () Bool)

(assert (=> b!423717 m!413129))

(declare-fun m!413131 () Bool)

(assert (=> b!423726 m!413131))

(check-sat (not b!423724) tp_is_empty!10995 b_and!17499 (not b!423726) (not mapNonEmpty!18114) (not b!423717) (not start!39576) (not b!423720) (not b!423719) (not b_next!9843) (not b!423725) (not b!423714) (not b!423727))
(check-sat b_and!17499 (not b_next!9843))
