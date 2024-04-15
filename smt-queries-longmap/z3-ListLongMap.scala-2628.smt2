; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39572 () Bool)

(assert start!39572)

(declare-fun b_free!9853 () Bool)

(declare-fun b_next!9853 () Bool)

(assert (=> start!39572 (= b_free!9853 (not b_next!9853))))

(declare-fun tp!35088 () Bool)

(declare-fun b_and!17483 () Bool)

(assert (=> start!39572 (= tp!35088 b_and!17483)))

(declare-fun b!423668 () Bool)

(declare-fun res!247748 () Bool)

(declare-fun e!251763 () Bool)

(assert (=> b!423668 (=> (not res!247748) (not e!251763))))

(declare-datatypes ((array!25839 0))(
  ( (array!25840 (arr!12369 (Array (_ BitVec 32) (_ BitVec 64))) (size!12722 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25839)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25839 (_ BitVec 32)) Bool)

(assert (=> b!423668 (= res!247748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423669 () Bool)

(declare-fun e!251766 () Bool)

(assert (=> b!423669 (= e!251766 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15779 0))(
  ( (V!15780 (val!5547 Int)) )
))
(declare-fun minValue!515 () V!15779)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5159 0))(
  ( (ValueCellFull!5159 (v!7788 V!15779)) (EmptyCell!5159) )
))
(declare-datatypes ((array!25841 0))(
  ( (array!25842 (arr!12370 (Array (_ BitVec 32) ValueCell!5159)) (size!12723 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25841)

(declare-datatypes ((tuple2!7270 0))(
  ( (tuple2!7271 (_1!3646 (_ BitVec 64)) (_2!3646 V!15779)) )
))
(declare-datatypes ((List!7266 0))(
  ( (Nil!7263) (Cons!7262 (h!8118 tuple2!7270) (t!12701 List!7266)) )
))
(declare-datatypes ((ListLongMap!6173 0))(
  ( (ListLongMap!6174 (toList!3102 List!7266)) )
))
(declare-fun lt!194035 () ListLongMap!6173)

(declare-fun zeroValue!515 () V!15779)

(declare-fun lt!194034 () array!25839)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15779)

(declare-fun getCurrentListMapNoExtraKeys!1310 (array!25839 array!25841 (_ BitVec 32) (_ BitVec 32) V!15779 V!15779 (_ BitVec 32) Int) ListLongMap!6173)

(assert (=> b!423669 (= lt!194035 (getCurrentListMapNoExtraKeys!1310 lt!194034 (array!25842 (store (arr!12370 _values!549) i!563 (ValueCellFull!5159 v!412)) (size!12723 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194036 () ListLongMap!6173)

(assert (=> b!423669 (= lt!194036 (getCurrentListMapNoExtraKeys!1310 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423670 () Bool)

(declare-fun res!247757 () Bool)

(assert (=> b!423670 (=> (not res!247757) (not e!251763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423670 (= res!247757 (validMask!0 mask!1025))))

(declare-fun b!423671 () Bool)

(declare-fun res!247753 () Bool)

(assert (=> b!423671 (=> (not res!247753) (not e!251766))))

(declare-datatypes ((List!7267 0))(
  ( (Nil!7264) (Cons!7263 (h!8119 (_ BitVec 64)) (t!12702 List!7267)) )
))
(declare-fun arrayNoDuplicates!0 (array!25839 (_ BitVec 32) List!7267) Bool)

(assert (=> b!423671 (= res!247753 (arrayNoDuplicates!0 lt!194034 #b00000000000000000000000000000000 Nil!7264))))

(declare-fun b!423672 () Bool)

(declare-fun res!247747 () Bool)

(assert (=> b!423672 (=> (not res!247747) (not e!251766))))

(assert (=> b!423672 (= res!247747 (bvsle from!863 i!563))))

(declare-fun b!423673 () Bool)

(declare-fun res!247755 () Bool)

(assert (=> b!423673 (=> (not res!247755) (not e!251763))))

(assert (=> b!423673 (= res!247755 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7264))))

(declare-fun b!423674 () Bool)

(declare-fun res!247749 () Bool)

(assert (=> b!423674 (=> (not res!247749) (not e!251763))))

(assert (=> b!423674 (= res!247749 (and (= (size!12723 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12722 _keys!709) (size!12723 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423676 () Bool)

(declare-fun e!251762 () Bool)

(declare-fun tp_is_empty!11005 () Bool)

(assert (=> b!423676 (= e!251762 tp_is_empty!11005)))

(declare-fun b!423677 () Bool)

(declare-fun e!251765 () Bool)

(declare-fun e!251761 () Bool)

(declare-fun mapRes!18129 () Bool)

(assert (=> b!423677 (= e!251765 (and e!251761 mapRes!18129))))

(declare-fun condMapEmpty!18129 () Bool)

(declare-fun mapDefault!18129 () ValueCell!5159)

(assert (=> b!423677 (= condMapEmpty!18129 (= (arr!12370 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5159)) mapDefault!18129)))))

(declare-fun b!423678 () Bool)

(declare-fun res!247751 () Bool)

(assert (=> b!423678 (=> (not res!247751) (not e!251763))))

(assert (=> b!423678 (= res!247751 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12722 _keys!709))))))

(declare-fun b!423679 () Bool)

(assert (=> b!423679 (= e!251763 e!251766)))

(declare-fun res!247758 () Bool)

(assert (=> b!423679 (=> (not res!247758) (not e!251766))))

(assert (=> b!423679 (= res!247758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194034 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423679 (= lt!194034 (array!25840 (store (arr!12369 _keys!709) i!563 k0!794) (size!12722 _keys!709)))))

(declare-fun mapIsEmpty!18129 () Bool)

(assert (=> mapIsEmpty!18129 mapRes!18129))

(declare-fun b!423680 () Bool)

(declare-fun res!247754 () Bool)

(assert (=> b!423680 (=> (not res!247754) (not e!251763))))

(declare-fun arrayContainsKey!0 (array!25839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423680 (= res!247754 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423681 () Bool)

(declare-fun res!247750 () Bool)

(assert (=> b!423681 (=> (not res!247750) (not e!251763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423681 (= res!247750 (validKeyInArray!0 k0!794))))

(declare-fun res!247756 () Bool)

(assert (=> start!39572 (=> (not res!247756) (not e!251763))))

(assert (=> start!39572 (= res!247756 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12722 _keys!709))))))

(assert (=> start!39572 e!251763))

(assert (=> start!39572 tp_is_empty!11005))

(assert (=> start!39572 tp!35088))

(assert (=> start!39572 true))

(declare-fun array_inv!9048 (array!25841) Bool)

(assert (=> start!39572 (and (array_inv!9048 _values!549) e!251765)))

(declare-fun array_inv!9049 (array!25839) Bool)

(assert (=> start!39572 (array_inv!9049 _keys!709)))

(declare-fun b!423675 () Bool)

(assert (=> b!423675 (= e!251761 tp_is_empty!11005)))

(declare-fun b!423682 () Bool)

(declare-fun res!247752 () Bool)

(assert (=> b!423682 (=> (not res!247752) (not e!251763))))

(assert (=> b!423682 (= res!247752 (or (= (select (arr!12369 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12369 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18129 () Bool)

(declare-fun tp!35087 () Bool)

(assert (=> mapNonEmpty!18129 (= mapRes!18129 (and tp!35087 e!251762))))

(declare-fun mapRest!18129 () (Array (_ BitVec 32) ValueCell!5159))

(declare-fun mapValue!18129 () ValueCell!5159)

(declare-fun mapKey!18129 () (_ BitVec 32))

(assert (=> mapNonEmpty!18129 (= (arr!12370 _values!549) (store mapRest!18129 mapKey!18129 mapValue!18129))))

(assert (= (and start!39572 res!247756) b!423670))

(assert (= (and b!423670 res!247757) b!423674))

(assert (= (and b!423674 res!247749) b!423668))

(assert (= (and b!423668 res!247748) b!423673))

(assert (= (and b!423673 res!247755) b!423678))

(assert (= (and b!423678 res!247751) b!423681))

(assert (= (and b!423681 res!247750) b!423682))

(assert (= (and b!423682 res!247752) b!423680))

(assert (= (and b!423680 res!247754) b!423679))

(assert (= (and b!423679 res!247758) b!423671))

(assert (= (and b!423671 res!247753) b!423672))

(assert (= (and b!423672 res!247747) b!423669))

(assert (= (and b!423677 condMapEmpty!18129) mapIsEmpty!18129))

(assert (= (and b!423677 (not condMapEmpty!18129)) mapNonEmpty!18129))

(get-info :version)

(assert (= (and mapNonEmpty!18129 ((_ is ValueCellFull!5159) mapValue!18129)) b!423676))

(assert (= (and b!423677 ((_ is ValueCellFull!5159) mapDefault!18129)) b!423675))

(assert (= start!39572 b!423677))

(declare-fun m!412521 () Bool)

(assert (=> b!423670 m!412521))

(declare-fun m!412523 () Bool)

(assert (=> b!423679 m!412523))

(declare-fun m!412525 () Bool)

(assert (=> b!423679 m!412525))

(declare-fun m!412527 () Bool)

(assert (=> b!423671 m!412527))

(declare-fun m!412529 () Bool)

(assert (=> b!423668 m!412529))

(declare-fun m!412531 () Bool)

(assert (=> b!423680 m!412531))

(declare-fun m!412533 () Bool)

(assert (=> b!423673 m!412533))

(declare-fun m!412535 () Bool)

(assert (=> b!423682 m!412535))

(declare-fun m!412537 () Bool)

(assert (=> start!39572 m!412537))

(declare-fun m!412539 () Bool)

(assert (=> start!39572 m!412539))

(declare-fun m!412541 () Bool)

(assert (=> b!423669 m!412541))

(declare-fun m!412543 () Bool)

(assert (=> b!423669 m!412543))

(declare-fun m!412545 () Bool)

(assert (=> b!423669 m!412545))

(declare-fun m!412547 () Bool)

(assert (=> mapNonEmpty!18129 m!412547))

(declare-fun m!412549 () Bool)

(assert (=> b!423681 m!412549))

(check-sat (not b!423671) (not start!39572) (not b!423670) (not b!423679) (not mapNonEmpty!18129) (not b!423681) tp_is_empty!11005 (not b!423673) b_and!17483 (not b_next!9853) (not b!423680) (not b!423669) (not b!423668))
(check-sat b_and!17483 (not b_next!9853))
