; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39524 () Bool)

(assert start!39524)

(declare-fun b_free!9805 () Bool)

(declare-fun b_next!9805 () Bool)

(assert (=> start!39524 (= b_free!9805 (not b_next!9805))))

(declare-fun tp!34944 () Bool)

(declare-fun b_and!17435 () Bool)

(assert (=> start!39524 (= tp!34944 b_and!17435)))

(declare-fun b!422588 () Bool)

(declare-fun e!251329 () Bool)

(assert (=> b!422588 (= e!251329 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15715 0))(
  ( (V!15716 (val!5523 Int)) )
))
(declare-fun minValue!515 () V!15715)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25743 0))(
  ( (array!25744 (arr!12321 (Array (_ BitVec 32) (_ BitVec 64))) (size!12674 (_ BitVec 32))) )
))
(declare-fun lt!193820 () array!25743)

(declare-datatypes ((ValueCell!5135 0))(
  ( (ValueCellFull!5135 (v!7764 V!15715)) (EmptyCell!5135) )
))
(declare-datatypes ((array!25745 0))(
  ( (array!25746 (arr!12322 (Array (_ BitVec 32) ValueCell!5135)) (size!12675 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25745)

(declare-fun zeroValue!515 () V!15715)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15715)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7240 0))(
  ( (tuple2!7241 (_1!3631 (_ BitVec 64)) (_2!3631 V!15715)) )
))
(declare-datatypes ((List!7231 0))(
  ( (Nil!7228) (Cons!7227 (h!8083 tuple2!7240) (t!12666 List!7231)) )
))
(declare-datatypes ((ListLongMap!6143 0))(
  ( (ListLongMap!6144 (toList!3087 List!7231)) )
))
(declare-fun lt!193819 () ListLongMap!6143)

(declare-fun getCurrentListMapNoExtraKeys!1295 (array!25743 array!25745 (_ BitVec 32) (_ BitVec 32) V!15715 V!15715 (_ BitVec 32) Int) ListLongMap!6143)

(assert (=> b!422588 (= lt!193819 (getCurrentListMapNoExtraKeys!1295 lt!193820 (array!25746 (store (arr!12322 _values!549) i!563 (ValueCellFull!5135 v!412)) (size!12675 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193818 () ListLongMap!6143)

(declare-fun _keys!709 () array!25743)

(assert (=> b!422588 (= lt!193818 (getCurrentListMapNoExtraKeys!1295 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422589 () Bool)

(declare-fun e!251332 () Bool)

(declare-fun tp_is_empty!10957 () Bool)

(assert (=> b!422589 (= e!251332 tp_is_empty!10957)))

(declare-fun b!422590 () Bool)

(declare-fun e!251331 () Bool)

(assert (=> b!422590 (= e!251331 e!251329)))

(declare-fun res!246894 () Bool)

(assert (=> b!422590 (=> (not res!246894) (not e!251329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25743 (_ BitVec 32)) Bool)

(assert (=> b!422590 (= res!246894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193820 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!422590 (= lt!193820 (array!25744 (store (arr!12321 _keys!709) i!563 k0!794) (size!12674 _keys!709)))))

(declare-fun b!422591 () Bool)

(declare-fun e!251330 () Bool)

(declare-fun e!251333 () Bool)

(declare-fun mapRes!18057 () Bool)

(assert (=> b!422591 (= e!251330 (and e!251333 mapRes!18057))))

(declare-fun condMapEmpty!18057 () Bool)

(declare-fun mapDefault!18057 () ValueCell!5135)

(assert (=> b!422591 (= condMapEmpty!18057 (= (arr!12322 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5135)) mapDefault!18057)))))

(declare-fun b!422592 () Bool)

(declare-fun res!246892 () Bool)

(assert (=> b!422592 (=> (not res!246892) (not e!251331))))

(assert (=> b!422592 (= res!246892 (or (= (select (arr!12321 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12321 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422593 () Bool)

(declare-fun res!246884 () Bool)

(assert (=> b!422593 (=> (not res!246884) (not e!251331))))

(declare-fun arrayContainsKey!0 (array!25743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422593 (= res!246884 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!246891 () Bool)

(assert (=> start!39524 (=> (not res!246891) (not e!251331))))

(assert (=> start!39524 (= res!246891 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12674 _keys!709))))))

(assert (=> start!39524 e!251331))

(assert (=> start!39524 tp_is_empty!10957))

(assert (=> start!39524 tp!34944))

(assert (=> start!39524 true))

(declare-fun array_inv!9014 (array!25745) Bool)

(assert (=> start!39524 (and (array_inv!9014 _values!549) e!251330)))

(declare-fun array_inv!9015 (array!25743) Bool)

(assert (=> start!39524 (array_inv!9015 _keys!709)))

(declare-fun b!422594 () Bool)

(declare-fun res!246886 () Bool)

(assert (=> b!422594 (=> (not res!246886) (not e!251329))))

(assert (=> b!422594 (= res!246886 (bvsle from!863 i!563))))

(declare-fun b!422595 () Bool)

(declare-fun res!246890 () Bool)

(assert (=> b!422595 (=> (not res!246890) (not e!251329))))

(declare-datatypes ((List!7232 0))(
  ( (Nil!7229) (Cons!7228 (h!8084 (_ BitVec 64)) (t!12667 List!7232)) )
))
(declare-fun arrayNoDuplicates!0 (array!25743 (_ BitVec 32) List!7232) Bool)

(assert (=> b!422595 (= res!246890 (arrayNoDuplicates!0 lt!193820 #b00000000000000000000000000000000 Nil!7229))))

(declare-fun b!422596 () Bool)

(assert (=> b!422596 (= e!251333 tp_is_empty!10957)))

(declare-fun b!422597 () Bool)

(declare-fun res!246883 () Bool)

(assert (=> b!422597 (=> (not res!246883) (not e!251331))))

(assert (=> b!422597 (= res!246883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7229))))

(declare-fun mapNonEmpty!18057 () Bool)

(declare-fun tp!34943 () Bool)

(assert (=> mapNonEmpty!18057 (= mapRes!18057 (and tp!34943 e!251332))))

(declare-fun mapRest!18057 () (Array (_ BitVec 32) ValueCell!5135))

(declare-fun mapKey!18057 () (_ BitVec 32))

(declare-fun mapValue!18057 () ValueCell!5135)

(assert (=> mapNonEmpty!18057 (= (arr!12322 _values!549) (store mapRest!18057 mapKey!18057 mapValue!18057))))

(declare-fun mapIsEmpty!18057 () Bool)

(assert (=> mapIsEmpty!18057 mapRes!18057))

(declare-fun b!422598 () Bool)

(declare-fun res!246893 () Bool)

(assert (=> b!422598 (=> (not res!246893) (not e!251331))))

(assert (=> b!422598 (= res!246893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422599 () Bool)

(declare-fun res!246885 () Bool)

(assert (=> b!422599 (=> (not res!246885) (not e!251331))))

(assert (=> b!422599 (= res!246885 (and (= (size!12675 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12674 _keys!709) (size!12675 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422600 () Bool)

(declare-fun res!246889 () Bool)

(assert (=> b!422600 (=> (not res!246889) (not e!251331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422600 (= res!246889 (validMask!0 mask!1025))))

(declare-fun b!422601 () Bool)

(declare-fun res!246888 () Bool)

(assert (=> b!422601 (=> (not res!246888) (not e!251331))))

(assert (=> b!422601 (= res!246888 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12674 _keys!709))))))

(declare-fun b!422602 () Bool)

(declare-fun res!246887 () Bool)

(assert (=> b!422602 (=> (not res!246887) (not e!251331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422602 (= res!246887 (validKeyInArray!0 k0!794))))

(assert (= (and start!39524 res!246891) b!422600))

(assert (= (and b!422600 res!246889) b!422599))

(assert (= (and b!422599 res!246885) b!422598))

(assert (= (and b!422598 res!246893) b!422597))

(assert (= (and b!422597 res!246883) b!422601))

(assert (= (and b!422601 res!246888) b!422602))

(assert (= (and b!422602 res!246887) b!422592))

(assert (= (and b!422592 res!246892) b!422593))

(assert (= (and b!422593 res!246884) b!422590))

(assert (= (and b!422590 res!246894) b!422595))

(assert (= (and b!422595 res!246890) b!422594))

(assert (= (and b!422594 res!246886) b!422588))

(assert (= (and b!422591 condMapEmpty!18057) mapIsEmpty!18057))

(assert (= (and b!422591 (not condMapEmpty!18057)) mapNonEmpty!18057))

(get-info :version)

(assert (= (and mapNonEmpty!18057 ((_ is ValueCellFull!5135) mapValue!18057)) b!422589))

(assert (= (and b!422591 ((_ is ValueCellFull!5135) mapDefault!18057)) b!422596))

(assert (= start!39524 b!422591))

(declare-fun m!411801 () Bool)

(assert (=> b!422588 m!411801))

(declare-fun m!411803 () Bool)

(assert (=> b!422588 m!411803))

(declare-fun m!411805 () Bool)

(assert (=> b!422588 m!411805))

(declare-fun m!411807 () Bool)

(assert (=> b!422590 m!411807))

(declare-fun m!411809 () Bool)

(assert (=> b!422590 m!411809))

(declare-fun m!411811 () Bool)

(assert (=> b!422602 m!411811))

(declare-fun m!411813 () Bool)

(assert (=> b!422597 m!411813))

(declare-fun m!411815 () Bool)

(assert (=> b!422593 m!411815))

(declare-fun m!411817 () Bool)

(assert (=> mapNonEmpty!18057 m!411817))

(declare-fun m!411819 () Bool)

(assert (=> b!422595 m!411819))

(declare-fun m!411821 () Bool)

(assert (=> b!422598 m!411821))

(declare-fun m!411823 () Bool)

(assert (=> b!422592 m!411823))

(declare-fun m!411825 () Bool)

(assert (=> b!422600 m!411825))

(declare-fun m!411827 () Bool)

(assert (=> start!39524 m!411827))

(declare-fun m!411829 () Bool)

(assert (=> start!39524 m!411829))

(check-sat (not b!422597) (not b!422590) (not b_next!9805) (not b!422588) tp_is_empty!10957 (not b!422593) (not b!422600) (not b!422598) b_and!17435 (not b!422595) (not mapNonEmpty!18057) (not b!422602) (not start!39524))
(check-sat b_and!17435 (not b_next!9805))
