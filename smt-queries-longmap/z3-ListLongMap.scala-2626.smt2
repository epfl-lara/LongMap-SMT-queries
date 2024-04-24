; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39560 () Bool)

(assert start!39560)

(declare-fun b_free!9841 () Bool)

(declare-fun b_next!9841 () Bool)

(assert (=> start!39560 (= b_free!9841 (not b_next!9841))))

(declare-fun tp!35052 () Bool)

(declare-fun b_and!17511 () Bool)

(assert (=> start!39560 (= tp!35052 b_and!17511)))

(declare-fun b!423620 () Bool)

(declare-fun res!247658 () Bool)

(declare-fun e!251800 () Bool)

(assert (=> b!423620 (=> (not res!247658) (not e!251800))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423620 (= res!247658 (bvsle from!863 i!563))))

(declare-fun b!423621 () Bool)

(declare-fun res!247666 () Bool)

(declare-fun e!251797 () Bool)

(assert (=> b!423621 (=> (not res!247666) (not e!251797))))

(declare-datatypes ((array!25838 0))(
  ( (array!25839 (arr!12368 (Array (_ BitVec 32) (_ BitVec 64))) (size!12720 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25838)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25838 (_ BitVec 32)) Bool)

(assert (=> b!423621 (= res!247666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423622 () Bool)

(declare-fun res!247664 () Bool)

(assert (=> b!423622 (=> (not res!247664) (not e!251797))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15763 0))(
  ( (V!15764 (val!5541 Int)) )
))
(declare-datatypes ((ValueCell!5153 0))(
  ( (ValueCellFull!5153 (v!7789 V!15763)) (EmptyCell!5153) )
))
(declare-datatypes ((array!25840 0))(
  ( (array!25841 (arr!12369 (Array (_ BitVec 32) ValueCell!5153)) (size!12721 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25840)

(assert (=> b!423622 (= res!247664 (and (= (size!12721 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12720 _keys!709) (size!12721 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423623 () Bool)

(declare-fun res!247661 () Bool)

(assert (=> b!423623 (=> (not res!247661) (not e!251797))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423623 (= res!247661 (validKeyInArray!0 k0!794))))

(declare-fun b!423624 () Bool)

(declare-fun res!247660 () Bool)

(assert (=> b!423624 (=> (not res!247660) (not e!251797))))

(assert (=> b!423624 (= res!247660 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12720 _keys!709))))))

(declare-fun b!423625 () Bool)

(declare-fun res!247665 () Bool)

(assert (=> b!423625 (=> (not res!247665) (not e!251797))))

(assert (=> b!423625 (= res!247665 (or (= (select (arr!12368 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12368 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423626 () Bool)

(assert (=> b!423626 (= e!251797 e!251800)))

(declare-fun res!247667 () Bool)

(assert (=> b!423626 (=> (not res!247667) (not e!251800))))

(declare-fun lt!194235 () array!25838)

(assert (=> b!423626 (= res!247667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194235 mask!1025))))

(assert (=> b!423626 (= lt!194235 (array!25839 (store (arr!12368 _keys!709) i!563 k0!794) (size!12720 _keys!709)))))

(declare-fun b!423627 () Bool)

(declare-fun res!247668 () Bool)

(assert (=> b!423627 (=> (not res!247668) (not e!251797))))

(declare-datatypes ((List!7166 0))(
  ( (Nil!7163) (Cons!7162 (h!8018 (_ BitVec 64)) (t!12602 List!7166)) )
))
(declare-fun arrayNoDuplicates!0 (array!25838 (_ BitVec 32) List!7166) Bool)

(assert (=> b!423627 (= res!247668 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7163))))

(declare-fun mapNonEmpty!18111 () Bool)

(declare-fun mapRes!18111 () Bool)

(declare-fun tp!35051 () Bool)

(declare-fun e!251795 () Bool)

(assert (=> mapNonEmpty!18111 (= mapRes!18111 (and tp!35051 e!251795))))

(declare-fun mapRest!18111 () (Array (_ BitVec 32) ValueCell!5153))

(declare-fun mapValue!18111 () ValueCell!5153)

(declare-fun mapKey!18111 () (_ BitVec 32))

(assert (=> mapNonEmpty!18111 (= (arr!12369 _values!549) (store mapRest!18111 mapKey!18111 mapValue!18111))))

(declare-fun b!423628 () Bool)

(declare-fun tp_is_empty!10993 () Bool)

(assert (=> b!423628 (= e!251795 tp_is_empty!10993)))

(declare-fun b!423629 () Bool)

(assert (=> b!423629 (= e!251800 false)))

(declare-fun minValue!515 () V!15763)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15763)

(declare-fun v!412 () V!15763)

(declare-datatypes ((tuple2!7160 0))(
  ( (tuple2!7161 (_1!3591 (_ BitVec 64)) (_2!3591 V!15763)) )
))
(declare-datatypes ((List!7167 0))(
  ( (Nil!7164) (Cons!7163 (h!8019 tuple2!7160) (t!12603 List!7167)) )
))
(declare-datatypes ((ListLongMap!6075 0))(
  ( (ListLongMap!6076 (toList!3053 List!7167)) )
))
(declare-fun lt!194233 () ListLongMap!6075)

(declare-fun getCurrentListMapNoExtraKeys!1299 (array!25838 array!25840 (_ BitVec 32) (_ BitVec 32) V!15763 V!15763 (_ BitVec 32) Int) ListLongMap!6075)

(assert (=> b!423629 (= lt!194233 (getCurrentListMapNoExtraKeys!1299 lt!194235 (array!25841 (store (arr!12369 _values!549) i!563 (ValueCellFull!5153 v!412)) (size!12721 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194234 () ListLongMap!6075)

(assert (=> b!423629 (= lt!194234 (getCurrentListMapNoExtraKeys!1299 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423630 () Bool)

(declare-fun res!247659 () Bool)

(assert (=> b!423630 (=> (not res!247659) (not e!251797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423630 (= res!247659 (validMask!0 mask!1025))))

(declare-fun b!423631 () Bool)

(declare-fun res!247663 () Bool)

(assert (=> b!423631 (=> (not res!247663) (not e!251800))))

(assert (=> b!423631 (= res!247663 (arrayNoDuplicates!0 lt!194235 #b00000000000000000000000000000000 Nil!7163))))

(declare-fun b!423632 () Bool)

(declare-fun e!251799 () Bool)

(declare-fun e!251796 () Bool)

(assert (=> b!423632 (= e!251799 (and e!251796 mapRes!18111))))

(declare-fun condMapEmpty!18111 () Bool)

(declare-fun mapDefault!18111 () ValueCell!5153)

(assert (=> b!423632 (= condMapEmpty!18111 (= (arr!12369 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5153)) mapDefault!18111)))))

(declare-fun b!423633 () Bool)

(declare-fun res!247657 () Bool)

(assert (=> b!423633 (=> (not res!247657) (not e!251797))))

(declare-fun arrayContainsKey!0 (array!25838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423633 (= res!247657 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18111 () Bool)

(assert (=> mapIsEmpty!18111 mapRes!18111))

(declare-fun b!423634 () Bool)

(assert (=> b!423634 (= e!251796 tp_is_empty!10993)))

(declare-fun res!247662 () Bool)

(assert (=> start!39560 (=> (not res!247662) (not e!251797))))

(assert (=> start!39560 (= res!247662 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12720 _keys!709))))))

(assert (=> start!39560 e!251797))

(assert (=> start!39560 tp_is_empty!10993))

(assert (=> start!39560 tp!35052))

(assert (=> start!39560 true))

(declare-fun array_inv!9086 (array!25840) Bool)

(assert (=> start!39560 (and (array_inv!9086 _values!549) e!251799)))

(declare-fun array_inv!9087 (array!25838) Bool)

(assert (=> start!39560 (array_inv!9087 _keys!709)))

(assert (= (and start!39560 res!247662) b!423630))

(assert (= (and b!423630 res!247659) b!423622))

(assert (= (and b!423622 res!247664) b!423621))

(assert (= (and b!423621 res!247666) b!423627))

(assert (= (and b!423627 res!247668) b!423624))

(assert (= (and b!423624 res!247660) b!423623))

(assert (= (and b!423623 res!247661) b!423625))

(assert (= (and b!423625 res!247665) b!423633))

(assert (= (and b!423633 res!247657) b!423626))

(assert (= (and b!423626 res!247667) b!423631))

(assert (= (and b!423631 res!247663) b!423620))

(assert (= (and b!423620 res!247658) b!423629))

(assert (= (and b!423632 condMapEmpty!18111) mapIsEmpty!18111))

(assert (= (and b!423632 (not condMapEmpty!18111)) mapNonEmpty!18111))

(get-info :version)

(assert (= (and mapNonEmpty!18111 ((_ is ValueCellFull!5153) mapValue!18111)) b!423628))

(assert (= (and b!423632 ((_ is ValueCellFull!5153) mapDefault!18111)) b!423634))

(assert (= start!39560 b!423632))

(declare-fun m!413291 () Bool)

(assert (=> start!39560 m!413291))

(declare-fun m!413293 () Bool)

(assert (=> start!39560 m!413293))

(declare-fun m!413295 () Bool)

(assert (=> b!423629 m!413295))

(declare-fun m!413297 () Bool)

(assert (=> b!423629 m!413297))

(declare-fun m!413299 () Bool)

(assert (=> b!423629 m!413299))

(declare-fun m!413301 () Bool)

(assert (=> b!423631 m!413301))

(declare-fun m!413303 () Bool)

(assert (=> b!423633 m!413303))

(declare-fun m!413305 () Bool)

(assert (=> mapNonEmpty!18111 m!413305))

(declare-fun m!413307 () Bool)

(assert (=> b!423627 m!413307))

(declare-fun m!413309 () Bool)

(assert (=> b!423623 m!413309))

(declare-fun m!413311 () Bool)

(assert (=> b!423621 m!413311))

(declare-fun m!413313 () Bool)

(assert (=> b!423630 m!413313))

(declare-fun m!413315 () Bool)

(assert (=> b!423625 m!413315))

(declare-fun m!413317 () Bool)

(assert (=> b!423626 m!413317))

(declare-fun m!413319 () Bool)

(assert (=> b!423626 m!413319))

(check-sat (not b!423627) (not b!423630) (not start!39560) tp_is_empty!10993 (not b!423629) (not b!423626) (not b_next!9841) (not b!423621) b_and!17511 (not b!423623) (not b!423631) (not mapNonEmpty!18111) (not b!423633))
(check-sat b_and!17511 (not b_next!9841))
