; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39032 () Bool)

(assert start!39032)

(declare-fun b_free!9313 () Bool)

(declare-fun b_next!9313 () Bool)

(assert (=> start!39032 (= b_free!9313 (not b_next!9313))))

(declare-fun tp!33467 () Bool)

(declare-fun b_and!16713 () Bool)

(assert (=> start!39032 (= tp!33467 b_and!16713)))

(declare-fun b!409598 () Bool)

(declare-fun res!237257 () Bool)

(declare-fun e!245657 () Bool)

(assert (=> b!409598 (=> (not res!237257) (not e!245657))))

(declare-datatypes ((array!24798 0))(
  ( (array!24799 (arr!11848 (Array (_ BitVec 32) (_ BitVec 64))) (size!12200 (_ BitVec 32))) )
))
(declare-fun lt!188994 () array!24798)

(declare-datatypes ((List!6734 0))(
  ( (Nil!6731) (Cons!6730 (h!7586 (_ BitVec 64)) (t!11900 List!6734)) )
))
(declare-fun arrayNoDuplicates!0 (array!24798 (_ BitVec 32) List!6734) Bool)

(assert (=> b!409598 (= res!237257 (arrayNoDuplicates!0 lt!188994 #b00000000000000000000000000000000 Nil!6731))))

(declare-fun b!409599 () Bool)

(assert (=> b!409599 (= e!245657 false)))

(declare-datatypes ((V!15059 0))(
  ( (V!15060 (val!5277 Int)) )
))
(declare-fun minValue!515 () V!15059)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6716 0))(
  ( (tuple2!6717 (_1!3369 (_ BitVec 64)) (_2!3369 V!15059)) )
))
(declare-datatypes ((List!6735 0))(
  ( (Nil!6732) (Cons!6731 (h!7587 tuple2!6716) (t!11901 List!6735)) )
))
(declare-datatypes ((ListLongMap!5631 0))(
  ( (ListLongMap!5632 (toList!2831 List!6735)) )
))
(declare-fun lt!188993 () ListLongMap!5631)

(declare-datatypes ((ValueCell!4889 0))(
  ( (ValueCellFull!4889 (v!7525 V!15059)) (EmptyCell!4889) )
))
(declare-datatypes ((array!24800 0))(
  ( (array!24801 (arr!11849 (Array (_ BitVec 32) ValueCell!4889)) (size!12201 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24800)

(declare-fun zeroValue!515 () V!15059)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24798)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1083 (array!24798 array!24800 (_ BitVec 32) (_ BitVec 32) V!15059 V!15059 (_ BitVec 32) Int) ListLongMap!5631)

(assert (=> b!409599 (= lt!188993 (getCurrentListMapNoExtraKeys!1083 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17319 () Bool)

(declare-fun mapRes!17319 () Bool)

(declare-fun tp!33468 () Bool)

(declare-fun e!245661 () Bool)

(assert (=> mapNonEmpty!17319 (= mapRes!17319 (and tp!33468 e!245661))))

(declare-fun mapValue!17319 () ValueCell!4889)

(declare-fun mapKey!17319 () (_ BitVec 32))

(declare-fun mapRest!17319 () (Array (_ BitVec 32) ValueCell!4889))

(assert (=> mapNonEmpty!17319 (= (arr!11849 _values!549) (store mapRest!17319 mapKey!17319 mapValue!17319))))

(declare-fun b!409600 () Bool)

(declare-fun res!237259 () Bool)

(declare-fun e!245658 () Bool)

(assert (=> b!409600 (=> (not res!237259) (not e!245658))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409600 (= res!237259 (or (= (select (arr!11848 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11848 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409601 () Bool)

(declare-fun res!237263 () Bool)

(assert (=> b!409601 (=> (not res!237263) (not e!245658))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409601 (= res!237263 (validKeyInArray!0 k0!794))))

(declare-fun b!409602 () Bool)

(declare-fun res!237258 () Bool)

(assert (=> b!409602 (=> (not res!237258) (not e!245657))))

(assert (=> b!409602 (= res!237258 (bvsle from!863 i!563))))

(declare-fun b!409603 () Bool)

(declare-fun res!237254 () Bool)

(assert (=> b!409603 (=> (not res!237254) (not e!245658))))

(declare-fun arrayContainsKey!0 (array!24798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409603 (= res!237254 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409604 () Bool)

(declare-fun e!245659 () Bool)

(declare-fun tp_is_empty!10465 () Bool)

(assert (=> b!409604 (= e!245659 tp_is_empty!10465)))

(declare-fun b!409605 () Bool)

(declare-fun res!237264 () Bool)

(assert (=> b!409605 (=> (not res!237264) (not e!245658))))

(assert (=> b!409605 (= res!237264 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12200 _keys!709))))))

(declare-fun b!409606 () Bool)

(declare-fun res!237260 () Bool)

(assert (=> b!409606 (=> (not res!237260) (not e!245658))))

(assert (=> b!409606 (= res!237260 (and (= (size!12201 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12200 _keys!709) (size!12201 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409607 () Bool)

(declare-fun res!237256 () Bool)

(assert (=> b!409607 (=> (not res!237256) (not e!245658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24798 (_ BitVec 32)) Bool)

(assert (=> b!409607 (= res!237256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409608 () Bool)

(assert (=> b!409608 (= e!245661 tp_is_empty!10465)))

(declare-fun res!237253 () Bool)

(assert (=> start!39032 (=> (not res!237253) (not e!245658))))

(assert (=> start!39032 (= res!237253 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12200 _keys!709))))))

(assert (=> start!39032 e!245658))

(assert (=> start!39032 tp_is_empty!10465))

(assert (=> start!39032 tp!33467))

(assert (=> start!39032 true))

(declare-fun e!245662 () Bool)

(declare-fun array_inv!8730 (array!24800) Bool)

(assert (=> start!39032 (and (array_inv!8730 _values!549) e!245662)))

(declare-fun array_inv!8731 (array!24798) Bool)

(assert (=> start!39032 (array_inv!8731 _keys!709)))

(declare-fun mapIsEmpty!17319 () Bool)

(assert (=> mapIsEmpty!17319 mapRes!17319))

(declare-fun b!409609 () Bool)

(declare-fun res!237262 () Bool)

(assert (=> b!409609 (=> (not res!237262) (not e!245658))))

(assert (=> b!409609 (= res!237262 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6731))))

(declare-fun b!409610 () Bool)

(assert (=> b!409610 (= e!245658 e!245657)))

(declare-fun res!237255 () Bool)

(assert (=> b!409610 (=> (not res!237255) (not e!245657))))

(assert (=> b!409610 (= res!237255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188994 mask!1025))))

(assert (=> b!409610 (= lt!188994 (array!24799 (store (arr!11848 _keys!709) i!563 k0!794) (size!12200 _keys!709)))))

(declare-fun b!409611 () Bool)

(assert (=> b!409611 (= e!245662 (and e!245659 mapRes!17319))))

(declare-fun condMapEmpty!17319 () Bool)

(declare-fun mapDefault!17319 () ValueCell!4889)

(assert (=> b!409611 (= condMapEmpty!17319 (= (arr!11849 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4889)) mapDefault!17319)))))

(declare-fun b!409612 () Bool)

(declare-fun res!237261 () Bool)

(assert (=> b!409612 (=> (not res!237261) (not e!245658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409612 (= res!237261 (validMask!0 mask!1025))))

(assert (= (and start!39032 res!237253) b!409612))

(assert (= (and b!409612 res!237261) b!409606))

(assert (= (and b!409606 res!237260) b!409607))

(assert (= (and b!409607 res!237256) b!409609))

(assert (= (and b!409609 res!237262) b!409605))

(assert (= (and b!409605 res!237264) b!409601))

(assert (= (and b!409601 res!237263) b!409600))

(assert (= (and b!409600 res!237259) b!409603))

(assert (= (and b!409603 res!237254) b!409610))

(assert (= (and b!409610 res!237255) b!409598))

(assert (= (and b!409598 res!237257) b!409602))

(assert (= (and b!409602 res!237258) b!409599))

(assert (= (and b!409611 condMapEmpty!17319) mapIsEmpty!17319))

(assert (= (and b!409611 (not condMapEmpty!17319)) mapNonEmpty!17319))

(get-info :version)

(assert (= (and mapNonEmpty!17319 ((_ is ValueCellFull!4889) mapValue!17319)) b!409608))

(assert (= (and b!409611 ((_ is ValueCellFull!4889) mapDefault!17319)) b!409604))

(assert (= start!39032 b!409611))

(declare-fun m!400695 () Bool)

(assert (=> b!409600 m!400695))

(declare-fun m!400697 () Bool)

(assert (=> b!409599 m!400697))

(declare-fun m!400699 () Bool)

(assert (=> mapNonEmpty!17319 m!400699))

(declare-fun m!400701 () Bool)

(assert (=> start!39032 m!400701))

(declare-fun m!400703 () Bool)

(assert (=> start!39032 m!400703))

(declare-fun m!400705 () Bool)

(assert (=> b!409610 m!400705))

(declare-fun m!400707 () Bool)

(assert (=> b!409610 m!400707))

(declare-fun m!400709 () Bool)

(assert (=> b!409598 m!400709))

(declare-fun m!400711 () Bool)

(assert (=> b!409612 m!400711))

(declare-fun m!400713 () Bool)

(assert (=> b!409609 m!400713))

(declare-fun m!400715 () Bool)

(assert (=> b!409603 m!400715))

(declare-fun m!400717 () Bool)

(assert (=> b!409601 m!400717))

(declare-fun m!400719 () Bool)

(assert (=> b!409607 m!400719))

(check-sat tp_is_empty!10465 (not b_next!9313) (not b!409599) (not start!39032) (not mapNonEmpty!17319) b_and!16713 (not b!409609) (not b!409603) (not b!409601) (not b!409598) (not b!409610) (not b!409607) (not b!409612))
(check-sat b_and!16713 (not b_next!9313))
