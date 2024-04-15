; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39134 () Bool)

(assert start!39134)

(declare-fun b_free!9415 () Bool)

(declare-fun b_next!9415 () Bool)

(assert (=> start!39134 (= b_free!9415 (not b_next!9415))))

(declare-fun tp!33773 () Bool)

(declare-fun b_and!16775 () Bool)

(assert (=> start!39134 (= tp!33773 b_and!16775)))

(declare-fun b!411671 () Bool)

(declare-fun res!238971 () Bool)

(declare-fun e!246434 () Bool)

(assert (=> b!411671 (=> (not res!238971) (not e!246434))))

(declare-datatypes ((array!24989 0))(
  ( (array!24990 (arr!11944 (Array (_ BitVec 32) (_ BitVec 64))) (size!12297 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24989)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24989 (_ BitVec 32)) Bool)

(assert (=> b!411671 (= res!238971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411672 () Bool)

(declare-fun res!238972 () Bool)

(assert (=> b!411672 (=> (not res!238972) (not e!246434))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411672 (= res!238972 (or (= (select (arr!11944 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11944 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411673 () Bool)

(declare-fun e!246438 () Bool)

(declare-fun tp_is_empty!10567 () Bool)

(assert (=> b!411673 (= e!246438 tp_is_empty!10567)))

(declare-fun b!411674 () Bool)

(declare-fun res!238967 () Bool)

(declare-fun e!246436 () Bool)

(assert (=> b!411674 (=> (not res!238967) (not e!246436))))

(declare-fun lt!189149 () array!24989)

(declare-datatypes ((List!6913 0))(
  ( (Nil!6910) (Cons!6909 (h!7765 (_ BitVec 64)) (t!12078 List!6913)) )
))
(declare-fun arrayNoDuplicates!0 (array!24989 (_ BitVec 32) List!6913) Bool)

(assert (=> b!411674 (= res!238967 (arrayNoDuplicates!0 lt!189149 #b00000000000000000000000000000000 Nil!6910))))

(declare-fun b!411675 () Bool)

(declare-fun res!238974 () Bool)

(assert (=> b!411675 (=> (not res!238974) (not e!246436))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!411675 (= res!238974 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17472 () Bool)

(declare-fun mapRes!17472 () Bool)

(declare-fun tp!33774 () Bool)

(assert (=> mapNonEmpty!17472 (= mapRes!17472 (and tp!33774 e!246438))))

(declare-datatypes ((V!15195 0))(
  ( (V!15196 (val!5328 Int)) )
))
(declare-datatypes ((ValueCell!4940 0))(
  ( (ValueCellFull!4940 (v!7569 V!15195)) (EmptyCell!4940) )
))
(declare-datatypes ((array!24991 0))(
  ( (array!24992 (arr!11945 (Array (_ BitVec 32) ValueCell!4940)) (size!12298 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24991)

(declare-fun mapRest!17472 () (Array (_ BitVec 32) ValueCell!4940))

(declare-fun mapKey!17472 () (_ BitVec 32))

(declare-fun mapValue!17472 () ValueCell!4940)

(assert (=> mapNonEmpty!17472 (= (arr!11945 _values!549) (store mapRest!17472 mapKey!17472 mapValue!17472))))

(declare-fun b!411676 () Bool)

(declare-fun res!238968 () Bool)

(assert (=> b!411676 (=> (not res!238968) (not e!246434))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411676 (= res!238968 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!238963 () Bool)

(assert (=> start!39134 (=> (not res!238963) (not e!246434))))

(assert (=> start!39134 (= res!238963 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12297 _keys!709))))))

(assert (=> start!39134 e!246434))

(assert (=> start!39134 tp_is_empty!10567))

(assert (=> start!39134 tp!33773))

(assert (=> start!39134 true))

(declare-fun e!246437 () Bool)

(declare-fun array_inv!8766 (array!24991) Bool)

(assert (=> start!39134 (and (array_inv!8766 _values!549) e!246437)))

(declare-fun array_inv!8767 (array!24989) Bool)

(assert (=> start!39134 (array_inv!8767 _keys!709)))

(declare-fun b!411677 () Bool)

(declare-fun res!238969 () Bool)

(assert (=> b!411677 (=> (not res!238969) (not e!246434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411677 (= res!238969 (validMask!0 mask!1025))))

(declare-fun b!411678 () Bool)

(assert (=> b!411678 (= e!246434 e!246436)))

(declare-fun res!238965 () Bool)

(assert (=> b!411678 (=> (not res!238965) (not e!246436))))

(assert (=> b!411678 (= res!238965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189149 mask!1025))))

(assert (=> b!411678 (= lt!189149 (array!24990 (store (arr!11944 _keys!709) i!563 k0!794) (size!12297 _keys!709)))))

(declare-fun b!411679 () Bool)

(assert (=> b!411679 (= e!246436 false)))

(declare-fun minValue!515 () V!15195)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15195)

(declare-datatypes ((tuple2!6900 0))(
  ( (tuple2!6901 (_1!3461 (_ BitVec 64)) (_2!3461 V!15195)) )
))
(declare-datatypes ((List!6914 0))(
  ( (Nil!6911) (Cons!6910 (h!7766 tuple2!6900) (t!12079 List!6914)) )
))
(declare-datatypes ((ListLongMap!5803 0))(
  ( (ListLongMap!5804 (toList!2917 List!6914)) )
))
(declare-fun lt!189147 () ListLongMap!5803)

(declare-fun v!412 () V!15195)

(declare-fun getCurrentListMapNoExtraKeys!1131 (array!24989 array!24991 (_ BitVec 32) (_ BitVec 32) V!15195 V!15195 (_ BitVec 32) Int) ListLongMap!5803)

(assert (=> b!411679 (= lt!189147 (getCurrentListMapNoExtraKeys!1131 lt!189149 (array!24992 (store (arr!11945 _values!549) i!563 (ValueCellFull!4940 v!412)) (size!12298 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189148 () ListLongMap!5803)

(assert (=> b!411679 (= lt!189148 (getCurrentListMapNoExtraKeys!1131 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411680 () Bool)

(declare-fun res!238973 () Bool)

(assert (=> b!411680 (=> (not res!238973) (not e!246434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411680 (= res!238973 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17472 () Bool)

(assert (=> mapIsEmpty!17472 mapRes!17472))

(declare-fun b!411681 () Bool)

(declare-fun res!238970 () Bool)

(assert (=> b!411681 (=> (not res!238970) (not e!246434))))

(assert (=> b!411681 (= res!238970 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12297 _keys!709))))))

(declare-fun b!411682 () Bool)

(declare-fun e!246433 () Bool)

(assert (=> b!411682 (= e!246433 tp_is_empty!10567)))

(declare-fun b!411683 () Bool)

(declare-fun res!238964 () Bool)

(assert (=> b!411683 (=> (not res!238964) (not e!246434))))

(assert (=> b!411683 (= res!238964 (and (= (size!12298 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12297 _keys!709) (size!12298 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411684 () Bool)

(declare-fun res!238966 () Bool)

(assert (=> b!411684 (=> (not res!238966) (not e!246434))))

(assert (=> b!411684 (= res!238966 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6910))))

(declare-fun b!411685 () Bool)

(assert (=> b!411685 (= e!246437 (and e!246433 mapRes!17472))))

(declare-fun condMapEmpty!17472 () Bool)

(declare-fun mapDefault!17472 () ValueCell!4940)

(assert (=> b!411685 (= condMapEmpty!17472 (= (arr!11945 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4940)) mapDefault!17472)))))

(assert (= (and start!39134 res!238963) b!411677))

(assert (= (and b!411677 res!238969) b!411683))

(assert (= (and b!411683 res!238964) b!411671))

(assert (= (and b!411671 res!238971) b!411684))

(assert (= (and b!411684 res!238966) b!411681))

(assert (= (and b!411681 res!238970) b!411680))

(assert (= (and b!411680 res!238973) b!411672))

(assert (= (and b!411672 res!238972) b!411676))

(assert (= (and b!411676 res!238968) b!411678))

(assert (= (and b!411678 res!238965) b!411674))

(assert (= (and b!411674 res!238967) b!411675))

(assert (= (and b!411675 res!238974) b!411679))

(assert (= (and b!411685 condMapEmpty!17472) mapIsEmpty!17472))

(assert (= (and b!411685 (not condMapEmpty!17472)) mapNonEmpty!17472))

(get-info :version)

(assert (= (and mapNonEmpty!17472 ((_ is ValueCellFull!4940) mapValue!17472)) b!411673))

(assert (= (and b!411685 ((_ is ValueCellFull!4940) mapDefault!17472)) b!411682))

(assert (= start!39134 b!411685))

(declare-fun m!401199 () Bool)

(assert (=> b!411680 m!401199))

(declare-fun m!401201 () Bool)

(assert (=> b!411684 m!401201))

(declare-fun m!401203 () Bool)

(assert (=> b!411677 m!401203))

(declare-fun m!401205 () Bool)

(assert (=> b!411671 m!401205))

(declare-fun m!401207 () Bool)

(assert (=> start!39134 m!401207))

(declare-fun m!401209 () Bool)

(assert (=> start!39134 m!401209))

(declare-fun m!401211 () Bool)

(assert (=> b!411678 m!401211))

(declare-fun m!401213 () Bool)

(assert (=> b!411678 m!401213))

(declare-fun m!401215 () Bool)

(assert (=> b!411672 m!401215))

(declare-fun m!401217 () Bool)

(assert (=> b!411679 m!401217))

(declare-fun m!401219 () Bool)

(assert (=> b!411679 m!401219))

(declare-fun m!401221 () Bool)

(assert (=> b!411679 m!401221))

(declare-fun m!401223 () Bool)

(assert (=> b!411676 m!401223))

(declare-fun m!401225 () Bool)

(assert (=> b!411674 m!401225))

(declare-fun m!401227 () Bool)

(assert (=> mapNonEmpty!17472 m!401227))

(check-sat (not b!411677) b_and!16775 (not b!411680) (not b_next!9415) (not b!411678) (not mapNonEmpty!17472) (not b!411679) (not b!411684) (not b!411671) (not b!411676) (not start!39134) tp_is_empty!10567 (not b!411674))
(check-sat b_and!16775 (not b_next!9415))
