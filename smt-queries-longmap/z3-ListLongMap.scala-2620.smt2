; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39540 () Bool)

(assert start!39540)

(declare-fun b_free!9807 () Bool)

(declare-fun b_next!9807 () Bool)

(assert (=> start!39540 (= b_free!9807 (not b_next!9807))))

(declare-fun tp!34949 () Bool)

(declare-fun b_and!17463 () Bool)

(assert (=> start!39540 (= tp!34949 b_and!17463)))

(declare-fun b!422904 () Bool)

(declare-fun e!251521 () Bool)

(declare-fun e!251525 () Bool)

(assert (=> b!422904 (= e!251521 e!251525)))

(declare-fun res!247057 () Bool)

(assert (=> b!422904 (=> (not res!247057) (not e!251525))))

(declare-datatypes ((array!25765 0))(
  ( (array!25766 (arr!12332 (Array (_ BitVec 32) (_ BitVec 64))) (size!12684 (_ BitVec 32))) )
))
(declare-fun lt!194062 () array!25765)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25765 (_ BitVec 32)) Bool)

(assert (=> b!422904 (= res!247057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194062 mask!1025))))

(declare-fun _keys!709 () array!25765)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422904 (= lt!194062 (array!25766 (store (arr!12332 _keys!709) i!563 k0!794) (size!12684 _keys!709)))))

(declare-fun b!422905 () Bool)

(declare-fun res!247051 () Bool)

(assert (=> b!422905 (=> (not res!247051) (not e!251521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422905 (= res!247051 (validMask!0 mask!1025))))

(declare-fun b!422906 () Bool)

(declare-fun e!251526 () Bool)

(declare-fun tp_is_empty!10959 () Bool)

(assert (=> b!422906 (= e!251526 tp_is_empty!10959)))

(declare-fun mapIsEmpty!18060 () Bool)

(declare-fun mapRes!18060 () Bool)

(assert (=> mapIsEmpty!18060 mapRes!18060))

(declare-fun b!422907 () Bool)

(declare-fun res!247054 () Bool)

(assert (=> b!422907 (=> (not res!247054) (not e!251521))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15717 0))(
  ( (V!15718 (val!5524 Int)) )
))
(declare-datatypes ((ValueCell!5136 0))(
  ( (ValueCellFull!5136 (v!7771 V!15717)) (EmptyCell!5136) )
))
(declare-datatypes ((array!25767 0))(
  ( (array!25768 (arr!12333 (Array (_ BitVec 32) ValueCell!5136)) (size!12685 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25767)

(assert (=> b!422907 (= res!247054 (and (= (size!12685 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12684 _keys!709) (size!12685 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422908 () Bool)

(declare-fun e!251522 () Bool)

(assert (=> b!422908 (= e!251522 tp_is_empty!10959)))

(declare-fun b!422909 () Bool)

(declare-fun res!247049 () Bool)

(assert (=> b!422909 (=> (not res!247049) (not e!251521))))

(assert (=> b!422909 (= res!247049 (or (= (select (arr!12332 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12332 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422910 () Bool)

(declare-fun res!247055 () Bool)

(assert (=> b!422910 (=> (not res!247055) (not e!251521))))

(declare-fun arrayContainsKey!0 (array!25765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422910 (= res!247055 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422911 () Bool)

(declare-fun res!247053 () Bool)

(assert (=> b!422911 (=> (not res!247053) (not e!251521))))

(assert (=> b!422911 (= res!247053 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12684 _keys!709))))))

(declare-fun res!247048 () Bool)

(assert (=> start!39540 (=> (not res!247048) (not e!251521))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39540 (= res!247048 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12684 _keys!709))))))

(assert (=> start!39540 e!251521))

(assert (=> start!39540 tp_is_empty!10959))

(assert (=> start!39540 tp!34949))

(assert (=> start!39540 true))

(declare-fun e!251523 () Bool)

(declare-fun array_inv!8986 (array!25767) Bool)

(assert (=> start!39540 (and (array_inv!8986 _values!549) e!251523)))

(declare-fun array_inv!8987 (array!25765) Bool)

(assert (=> start!39540 (array_inv!8987 _keys!709)))

(declare-fun mapNonEmpty!18060 () Bool)

(declare-fun tp!34950 () Bool)

(assert (=> mapNonEmpty!18060 (= mapRes!18060 (and tp!34950 e!251522))))

(declare-fun mapValue!18060 () ValueCell!5136)

(declare-fun mapRest!18060 () (Array (_ BitVec 32) ValueCell!5136))

(declare-fun mapKey!18060 () (_ BitVec 32))

(assert (=> mapNonEmpty!18060 (= (arr!12333 _values!549) (store mapRest!18060 mapKey!18060 mapValue!18060))))

(declare-fun b!422912 () Bool)

(assert (=> b!422912 (= e!251523 (and e!251526 mapRes!18060))))

(declare-fun condMapEmpty!18060 () Bool)

(declare-fun mapDefault!18060 () ValueCell!5136)

(assert (=> b!422912 (= condMapEmpty!18060 (= (arr!12333 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5136)) mapDefault!18060)))))

(declare-fun b!422913 () Bool)

(declare-fun res!247058 () Bool)

(assert (=> b!422913 (=> (not res!247058) (not e!251525))))

(declare-datatypes ((List!7262 0))(
  ( (Nil!7259) (Cons!7258 (h!8114 (_ BitVec 64)) (t!12706 List!7262)) )
))
(declare-fun arrayNoDuplicates!0 (array!25765 (_ BitVec 32) List!7262) Bool)

(assert (=> b!422913 (= res!247058 (arrayNoDuplicates!0 lt!194062 #b00000000000000000000000000000000 Nil!7259))))

(declare-fun b!422914 () Bool)

(assert (=> b!422914 (= e!251525 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15717)

(declare-fun v!412 () V!15717)

(declare-fun minValue!515 () V!15717)

(declare-datatypes ((tuple2!7256 0))(
  ( (tuple2!7257 (_1!3639 (_ BitVec 64)) (_2!3639 V!15717)) )
))
(declare-datatypes ((List!7263 0))(
  ( (Nil!7260) (Cons!7259 (h!8115 tuple2!7256) (t!12707 List!7263)) )
))
(declare-datatypes ((ListLongMap!6169 0))(
  ( (ListLongMap!6170 (toList!3100 List!7263)) )
))
(declare-fun lt!194061 () ListLongMap!6169)

(declare-fun getCurrentListMapNoExtraKeys!1304 (array!25765 array!25767 (_ BitVec 32) (_ BitVec 32) V!15717 V!15717 (_ BitVec 32) Int) ListLongMap!6169)

(assert (=> b!422914 (= lt!194061 (getCurrentListMapNoExtraKeys!1304 lt!194062 (array!25768 (store (arr!12333 _values!549) i!563 (ValueCellFull!5136 v!412)) (size!12685 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194063 () ListLongMap!6169)

(assert (=> b!422914 (= lt!194063 (getCurrentListMapNoExtraKeys!1304 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422915 () Bool)

(declare-fun res!247059 () Bool)

(assert (=> b!422915 (=> (not res!247059) (not e!251521))))

(assert (=> b!422915 (= res!247059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422916 () Bool)

(declare-fun res!247052 () Bool)

(assert (=> b!422916 (=> (not res!247052) (not e!251525))))

(assert (=> b!422916 (= res!247052 (bvsle from!863 i!563))))

(declare-fun b!422917 () Bool)

(declare-fun res!247050 () Bool)

(assert (=> b!422917 (=> (not res!247050) (not e!251521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422917 (= res!247050 (validKeyInArray!0 k0!794))))

(declare-fun b!422918 () Bool)

(declare-fun res!247056 () Bool)

(assert (=> b!422918 (=> (not res!247056) (not e!251521))))

(assert (=> b!422918 (= res!247056 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7259))))

(assert (= (and start!39540 res!247048) b!422905))

(assert (= (and b!422905 res!247051) b!422907))

(assert (= (and b!422907 res!247054) b!422915))

(assert (= (and b!422915 res!247059) b!422918))

(assert (= (and b!422918 res!247056) b!422911))

(assert (= (and b!422911 res!247053) b!422917))

(assert (= (and b!422917 res!247050) b!422909))

(assert (= (and b!422909 res!247049) b!422910))

(assert (= (and b!422910 res!247055) b!422904))

(assert (= (and b!422904 res!247057) b!422913))

(assert (= (and b!422913 res!247058) b!422916))

(assert (= (and b!422916 res!247052) b!422914))

(assert (= (and b!422912 condMapEmpty!18060) mapIsEmpty!18060))

(assert (= (and b!422912 (not condMapEmpty!18060)) mapNonEmpty!18060))

(get-info :version)

(assert (= (and mapNonEmpty!18060 ((_ is ValueCellFull!5136) mapValue!18060)) b!422908))

(assert (= (and b!422912 ((_ is ValueCellFull!5136) mapDefault!18060)) b!422906))

(assert (= start!39540 b!422912))

(declare-fun m!412563 () Bool)

(assert (=> b!422917 m!412563))

(declare-fun m!412565 () Bool)

(assert (=> b!422910 m!412565))

(declare-fun m!412567 () Bool)

(assert (=> b!422913 m!412567))

(declare-fun m!412569 () Bool)

(assert (=> b!422918 m!412569))

(declare-fun m!412571 () Bool)

(assert (=> b!422905 m!412571))

(declare-fun m!412573 () Bool)

(assert (=> start!39540 m!412573))

(declare-fun m!412575 () Bool)

(assert (=> start!39540 m!412575))

(declare-fun m!412577 () Bool)

(assert (=> b!422915 m!412577))

(declare-fun m!412579 () Bool)

(assert (=> b!422909 m!412579))

(declare-fun m!412581 () Bool)

(assert (=> mapNonEmpty!18060 m!412581))

(declare-fun m!412583 () Bool)

(assert (=> b!422904 m!412583))

(declare-fun m!412585 () Bool)

(assert (=> b!422904 m!412585))

(declare-fun m!412587 () Bool)

(assert (=> b!422914 m!412587))

(declare-fun m!412589 () Bool)

(assert (=> b!422914 m!412589))

(declare-fun m!412591 () Bool)

(assert (=> b!422914 m!412591))

(check-sat (not b!422910) (not b!422914) (not b!422904) (not mapNonEmpty!18060) (not b!422917) b_and!17463 (not b!422918) (not start!39540) (not b!422915) (not b!422905) (not b_next!9807) tp_is_empty!10959 (not b!422913))
(check-sat b_and!17463 (not b_next!9807))
