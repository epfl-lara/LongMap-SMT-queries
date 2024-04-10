; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39018 () Bool)

(assert start!39018)

(declare-fun b!409043 () Bool)

(declare-fun e!245440 () Bool)

(declare-fun e!245442 () Bool)

(declare-fun mapRes!17277 () Bool)

(assert (=> b!409043 (= e!245440 (and e!245442 mapRes!17277))))

(declare-fun condMapEmpty!17277 () Bool)

(declare-datatypes ((V!15021 0))(
  ( (V!15022 (val!5263 Int)) )
))
(declare-datatypes ((ValueCell!4875 0))(
  ( (ValueCellFull!4875 (v!7510 V!15021)) (EmptyCell!4875) )
))
(declare-datatypes ((array!24747 0))(
  ( (array!24748 (arr!11823 (Array (_ BitVec 32) ValueCell!4875)) (size!12175 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24747)

(declare-fun mapDefault!17277 () ValueCell!4875)

(assert (=> b!409043 (= condMapEmpty!17277 (= (arr!11823 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4875)) mapDefault!17277)))))

(declare-fun mapIsEmpty!17277 () Bool)

(assert (=> mapIsEmpty!17277 mapRes!17277))

(declare-fun res!236787 () Bool)

(declare-fun e!245437 () Bool)

(assert (=> start!39018 (=> (not res!236787) (not e!245437))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24749 0))(
  ( (array!24750 (arr!11824 (Array (_ BitVec 32) (_ BitVec 64))) (size!12176 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24749)

(assert (=> start!39018 (= res!236787 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12176 _keys!709))))))

(assert (=> start!39018 e!245437))

(assert (=> start!39018 true))

(declare-fun array_inv!8628 (array!24747) Bool)

(assert (=> start!39018 (and (array_inv!8628 _values!549) e!245440)))

(declare-fun array_inv!8629 (array!24749) Bool)

(assert (=> start!39018 (array_inv!8629 _keys!709)))

(declare-fun b!409044 () Bool)

(declare-fun res!236780 () Bool)

(assert (=> b!409044 (=> (not res!236780) (not e!245437))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409044 (= res!236780 (and (= (size!12175 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12176 _keys!709) (size!12175 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409045 () Bool)

(declare-fun res!236784 () Bool)

(assert (=> b!409045 (=> (not res!236784) (not e!245437))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409045 (= res!236784 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17277 () Bool)

(declare-fun tp!33396 () Bool)

(declare-fun e!245439 () Bool)

(assert (=> mapNonEmpty!17277 (= mapRes!17277 (and tp!33396 e!245439))))

(declare-fun mapKey!17277 () (_ BitVec 32))

(declare-fun mapValue!17277 () ValueCell!4875)

(declare-fun mapRest!17277 () (Array (_ BitVec 32) ValueCell!4875))

(assert (=> mapNonEmpty!17277 (= (arr!11823 _values!549) (store mapRest!17277 mapKey!17277 mapValue!17277))))

(declare-fun b!409046 () Bool)

(declare-fun res!236782 () Bool)

(assert (=> b!409046 (=> (not res!236782) (not e!245437))))

(declare-fun arrayContainsKey!0 (array!24749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409046 (= res!236782 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409047 () Bool)

(declare-fun tp_is_empty!10437 () Bool)

(assert (=> b!409047 (= e!245442 tp_is_empty!10437)))

(declare-fun b!409048 () Bool)

(declare-fun e!245441 () Bool)

(assert (=> b!409048 (= e!245441 false)))

(declare-fun lt!188890 () Bool)

(declare-fun lt!188891 () array!24749)

(declare-datatypes ((List!6845 0))(
  ( (Nil!6842) (Cons!6841 (h!7697 (_ BitVec 64)) (t!12019 List!6845)) )
))
(declare-fun arrayNoDuplicates!0 (array!24749 (_ BitVec 32) List!6845) Bool)

(assert (=> b!409048 (= lt!188890 (arrayNoDuplicates!0 lt!188891 #b00000000000000000000000000000000 Nil!6842))))

(declare-fun b!409049 () Bool)

(assert (=> b!409049 (= e!245439 tp_is_empty!10437)))

(declare-fun b!409050 () Bool)

(declare-fun res!236779 () Bool)

(assert (=> b!409050 (=> (not res!236779) (not e!245437))))

(assert (=> b!409050 (= res!236779 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6842))))

(declare-fun b!409051 () Bool)

(declare-fun res!236781 () Bool)

(assert (=> b!409051 (=> (not res!236781) (not e!245437))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409051 (= res!236781 (or (= (select (arr!11824 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11824 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409052 () Bool)

(declare-fun res!236785 () Bool)

(assert (=> b!409052 (=> (not res!236785) (not e!245437))))

(assert (=> b!409052 (= res!236785 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12176 _keys!709))))))

(declare-fun b!409053 () Bool)

(declare-fun res!236778 () Bool)

(assert (=> b!409053 (=> (not res!236778) (not e!245437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24749 (_ BitVec 32)) Bool)

(assert (=> b!409053 (= res!236778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409054 () Bool)

(declare-fun res!236786 () Bool)

(assert (=> b!409054 (=> (not res!236786) (not e!245437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409054 (= res!236786 (validMask!0 mask!1025))))

(declare-fun b!409055 () Bool)

(assert (=> b!409055 (= e!245437 e!245441)))

(declare-fun res!236783 () Bool)

(assert (=> b!409055 (=> (not res!236783) (not e!245441))))

(assert (=> b!409055 (= res!236783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188891 mask!1025))))

(assert (=> b!409055 (= lt!188891 (array!24750 (store (arr!11824 _keys!709) i!563 k0!794) (size!12176 _keys!709)))))

(assert (= (and start!39018 res!236787) b!409054))

(assert (= (and b!409054 res!236786) b!409044))

(assert (= (and b!409044 res!236780) b!409053))

(assert (= (and b!409053 res!236778) b!409050))

(assert (= (and b!409050 res!236779) b!409052))

(assert (= (and b!409052 res!236785) b!409045))

(assert (= (and b!409045 res!236784) b!409051))

(assert (= (and b!409051 res!236781) b!409046))

(assert (= (and b!409046 res!236782) b!409055))

(assert (= (and b!409055 res!236783) b!409048))

(assert (= (and b!409043 condMapEmpty!17277) mapIsEmpty!17277))

(assert (= (and b!409043 (not condMapEmpty!17277)) mapNonEmpty!17277))

(get-info :version)

(assert (= (and mapNonEmpty!17277 ((_ is ValueCellFull!4875) mapValue!17277)) b!409049))

(assert (= (and b!409043 ((_ is ValueCellFull!4875) mapDefault!17277)) b!409047))

(assert (= start!39018 b!409043))

(declare-fun m!400111 () Bool)

(assert (=> b!409055 m!400111))

(declare-fun m!400113 () Bool)

(assert (=> b!409055 m!400113))

(declare-fun m!400115 () Bool)

(assert (=> mapNonEmpty!17277 m!400115))

(declare-fun m!400117 () Bool)

(assert (=> b!409051 m!400117))

(declare-fun m!400119 () Bool)

(assert (=> start!39018 m!400119))

(declare-fun m!400121 () Bool)

(assert (=> start!39018 m!400121))

(declare-fun m!400123 () Bool)

(assert (=> b!409054 m!400123))

(declare-fun m!400125 () Bool)

(assert (=> b!409050 m!400125))

(declare-fun m!400127 () Bool)

(assert (=> b!409046 m!400127))

(declare-fun m!400129 () Bool)

(assert (=> b!409045 m!400129))

(declare-fun m!400131 () Bool)

(assert (=> b!409048 m!400131))

(declare-fun m!400133 () Bool)

(assert (=> b!409053 m!400133))

(check-sat (not b!409055) tp_is_empty!10437 (not b!409050) (not b!409054) (not b!409053) (not b!409046) (not mapNonEmpty!17277) (not b!409045) (not start!39018) (not b!409048))
(check-sat)
