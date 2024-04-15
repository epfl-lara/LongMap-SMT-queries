; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39032 () Bool)

(assert start!39032)

(declare-fun b_free!9313 () Bool)

(declare-fun b_next!9313 () Bool)

(assert (=> start!39032 (= b_free!9313 (not b_next!9313))))

(declare-fun tp!33467 () Bool)

(declare-fun b_and!16673 () Bool)

(assert (=> start!39032 (= tp!33467 b_and!16673)))

(declare-fun b!409376 () Bool)

(declare-fun e!245518 () Bool)

(declare-fun tp_is_empty!10465 () Bool)

(assert (=> b!409376 (= e!245518 tp_is_empty!10465)))

(declare-fun b!409377 () Bool)

(declare-fun res!237133 () Bool)

(declare-fun e!245516 () Bool)

(assert (=> b!409377 (=> (not res!237133) (not e!245516))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24791 0))(
  ( (array!24792 (arr!11845 (Array (_ BitVec 32) (_ BitVec 64))) (size!12198 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24791)

(assert (=> b!409377 (= res!237133 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12198 _keys!709))))))

(declare-fun b!409379 () Bool)

(declare-fun e!245519 () Bool)

(assert (=> b!409379 (= e!245519 tp_is_empty!10465)))

(declare-fun b!409380 () Bool)

(declare-fun res!237131 () Bool)

(assert (=> b!409380 (=> (not res!237131) (not e!245516))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15059 0))(
  ( (V!15060 (val!5277 Int)) )
))
(declare-datatypes ((ValueCell!4889 0))(
  ( (ValueCellFull!4889 (v!7518 V!15059)) (EmptyCell!4889) )
))
(declare-datatypes ((array!24793 0))(
  ( (array!24794 (arr!11846 (Array (_ BitVec 32) ValueCell!4889)) (size!12199 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24793)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409380 (= res!237131 (and (= (size!12199 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12198 _keys!709) (size!12199 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17319 () Bool)

(declare-fun mapRes!17319 () Bool)

(assert (=> mapIsEmpty!17319 mapRes!17319))

(declare-fun mapNonEmpty!17319 () Bool)

(declare-fun tp!33468 () Bool)

(assert (=> mapNonEmpty!17319 (= mapRes!17319 (and tp!33468 e!245519))))

(declare-fun mapKey!17319 () (_ BitVec 32))

(declare-fun mapValue!17319 () ValueCell!4889)

(declare-fun mapRest!17319 () (Array (_ BitVec 32) ValueCell!4889))

(assert (=> mapNonEmpty!17319 (= (arr!11846 _values!549) (store mapRest!17319 mapKey!17319 mapValue!17319))))

(declare-fun b!409381 () Bool)

(declare-fun res!237136 () Bool)

(assert (=> b!409381 (=> (not res!237136) (not e!245516))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409381 (= res!237136 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409382 () Bool)

(declare-fun res!237132 () Bool)

(assert (=> b!409382 (=> (not res!237132) (not e!245516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409382 (= res!237132 (validMask!0 mask!1025))))

(declare-fun b!409383 () Bool)

(declare-fun res!237138 () Bool)

(declare-fun e!245520 () Bool)

(assert (=> b!409383 (=> (not res!237138) (not e!245520))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!409383 (= res!237138 (bvsle from!863 i!563))))

(declare-fun b!409384 () Bool)

(declare-fun e!245515 () Bool)

(assert (=> b!409384 (= e!245515 (and e!245518 mapRes!17319))))

(declare-fun condMapEmpty!17319 () Bool)

(declare-fun mapDefault!17319 () ValueCell!4889)

(assert (=> b!409384 (= condMapEmpty!17319 (= (arr!11846 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4889)) mapDefault!17319)))))

(declare-fun b!409385 () Bool)

(assert (=> b!409385 (= e!245516 e!245520)))

(declare-fun res!237128 () Bool)

(assert (=> b!409385 (=> (not res!237128) (not e!245520))))

(declare-fun lt!188740 () array!24791)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24791 (_ BitVec 32)) Bool)

(assert (=> b!409385 (= res!237128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188740 mask!1025))))

(assert (=> b!409385 (= lt!188740 (array!24792 (store (arr!11845 _keys!709) i!563 k0!794) (size!12198 _keys!709)))))

(declare-fun b!409386 () Bool)

(assert (=> b!409386 (= e!245520 false)))

(declare-fun minValue!515 () V!15059)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15059)

(declare-datatypes ((tuple2!6828 0))(
  ( (tuple2!6829 (_1!3425 (_ BitVec 64)) (_2!3425 V!15059)) )
))
(declare-datatypes ((List!6838 0))(
  ( (Nil!6835) (Cons!6834 (h!7690 tuple2!6828) (t!12003 List!6838)) )
))
(declare-datatypes ((ListLongMap!5731 0))(
  ( (ListLongMap!5732 (toList!2881 List!6838)) )
))
(declare-fun lt!188741 () ListLongMap!5731)

(declare-fun getCurrentListMapNoExtraKeys!1095 (array!24791 array!24793 (_ BitVec 32) (_ BitVec 32) V!15059 V!15059 (_ BitVec 32) Int) ListLongMap!5731)

(assert (=> b!409386 (= lt!188741 (getCurrentListMapNoExtraKeys!1095 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409387 () Bool)

(declare-fun res!237130 () Bool)

(assert (=> b!409387 (=> (not res!237130) (not e!245516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409387 (= res!237130 (validKeyInArray!0 k0!794))))

(declare-fun b!409378 () Bool)

(declare-fun res!237127 () Bool)

(assert (=> b!409378 (=> (not res!237127) (not e!245516))))

(assert (=> b!409378 (= res!237127 (or (= (select (arr!11845 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11845 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!237135 () Bool)

(assert (=> start!39032 (=> (not res!237135) (not e!245516))))

(assert (=> start!39032 (= res!237135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12198 _keys!709))))))

(assert (=> start!39032 e!245516))

(assert (=> start!39032 tp_is_empty!10465))

(assert (=> start!39032 tp!33467))

(assert (=> start!39032 true))

(declare-fun array_inv!8686 (array!24793) Bool)

(assert (=> start!39032 (and (array_inv!8686 _values!549) e!245515)))

(declare-fun array_inv!8687 (array!24791) Bool)

(assert (=> start!39032 (array_inv!8687 _keys!709)))

(declare-fun b!409388 () Bool)

(declare-fun res!237137 () Bool)

(assert (=> b!409388 (=> (not res!237137) (not e!245516))))

(declare-datatypes ((List!6839 0))(
  ( (Nil!6836) (Cons!6835 (h!7691 (_ BitVec 64)) (t!12004 List!6839)) )
))
(declare-fun arrayNoDuplicates!0 (array!24791 (_ BitVec 32) List!6839) Bool)

(assert (=> b!409388 (= res!237137 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6836))))

(declare-fun b!409389 () Bool)

(declare-fun res!237129 () Bool)

(assert (=> b!409389 (=> (not res!237129) (not e!245516))))

(assert (=> b!409389 (= res!237129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409390 () Bool)

(declare-fun res!237134 () Bool)

(assert (=> b!409390 (=> (not res!237134) (not e!245520))))

(assert (=> b!409390 (= res!237134 (arrayNoDuplicates!0 lt!188740 #b00000000000000000000000000000000 Nil!6836))))

(assert (= (and start!39032 res!237135) b!409382))

(assert (= (and b!409382 res!237132) b!409380))

(assert (= (and b!409380 res!237131) b!409389))

(assert (= (and b!409389 res!237129) b!409388))

(assert (= (and b!409388 res!237137) b!409377))

(assert (= (and b!409377 res!237133) b!409387))

(assert (= (and b!409387 res!237130) b!409378))

(assert (= (and b!409378 res!237127) b!409381))

(assert (= (and b!409381 res!237136) b!409385))

(assert (= (and b!409385 res!237128) b!409390))

(assert (= (and b!409390 res!237134) b!409383))

(assert (= (and b!409383 res!237138) b!409386))

(assert (= (and b!409384 condMapEmpty!17319) mapIsEmpty!17319))

(assert (= (and b!409384 (not condMapEmpty!17319)) mapNonEmpty!17319))

(get-info :version)

(assert (= (and mapNonEmpty!17319 ((_ is ValueCellFull!4889) mapValue!17319)) b!409379))

(assert (= (and b!409384 ((_ is ValueCellFull!4889) mapDefault!17319)) b!409376))

(assert (= start!39032 b!409384))

(declare-fun m!399741 () Bool)

(assert (=> mapNonEmpty!17319 m!399741))

(declare-fun m!399743 () Bool)

(assert (=> b!409390 m!399743))

(declare-fun m!399745 () Bool)

(assert (=> b!409385 m!399745))

(declare-fun m!399747 () Bool)

(assert (=> b!409385 m!399747))

(declare-fun m!399749 () Bool)

(assert (=> b!409378 m!399749))

(declare-fun m!399751 () Bool)

(assert (=> b!409386 m!399751))

(declare-fun m!399753 () Bool)

(assert (=> b!409389 m!399753))

(declare-fun m!399755 () Bool)

(assert (=> b!409387 m!399755))

(declare-fun m!399757 () Bool)

(assert (=> b!409388 m!399757))

(declare-fun m!399759 () Bool)

(assert (=> b!409382 m!399759))

(declare-fun m!399761 () Bool)

(assert (=> start!39032 m!399761))

(declare-fun m!399763 () Bool)

(assert (=> start!39032 m!399763))

(declare-fun m!399765 () Bool)

(assert (=> b!409381 m!399765))

(check-sat (not b!409382) (not b_next!9313) (not b!409390) (not b!409381) (not b!409389) (not b!409388) b_and!16673 (not b!409387) tp_is_empty!10465 (not start!39032) (not mapNonEmpty!17319) (not b!409385) (not b!409386))
(check-sat b_and!16673 (not b_next!9313))
