; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39000 () Bool)

(assert start!39000)

(declare-fun b!408692 () Bool)

(declare-fun res!236517 () Bool)

(declare-fun e!245277 () Bool)

(assert (=> b!408692 (=> (not res!236517) (not e!245277))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24713 0))(
  ( (array!24714 (arr!11806 (Array (_ BitVec 32) (_ BitVec 64))) (size!12158 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24713)

(assert (=> b!408692 (= res!236517 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12158 _keys!709))))))

(declare-fun mapIsEmpty!17250 () Bool)

(declare-fun mapRes!17250 () Bool)

(assert (=> mapIsEmpty!17250 mapRes!17250))

(declare-fun b!408693 () Bool)

(declare-fun res!236512 () Bool)

(assert (=> b!408693 (=> (not res!236512) (not e!245277))))

(declare-datatypes ((List!6838 0))(
  ( (Nil!6835) (Cons!6834 (h!7690 (_ BitVec 64)) (t!12012 List!6838)) )
))
(declare-fun arrayNoDuplicates!0 (array!24713 (_ BitVec 32) List!6838) Bool)

(assert (=> b!408693 (= res!236512 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6835))))

(declare-fun b!408694 () Bool)

(declare-fun res!236509 () Bool)

(assert (=> b!408694 (=> (not res!236509) (not e!245277))))

(assert (=> b!408694 (= res!236509 (or (= (select (arr!11806 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11806 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17250 () Bool)

(declare-fun tp!33369 () Bool)

(declare-fun e!245275 () Bool)

(assert (=> mapNonEmpty!17250 (= mapRes!17250 (and tp!33369 e!245275))))

(declare-datatypes ((V!14997 0))(
  ( (V!14998 (val!5254 Int)) )
))
(declare-datatypes ((ValueCell!4866 0))(
  ( (ValueCellFull!4866 (v!7501 V!14997)) (EmptyCell!4866) )
))
(declare-datatypes ((array!24715 0))(
  ( (array!24716 (arr!11807 (Array (_ BitVec 32) ValueCell!4866)) (size!12159 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24715)

(declare-fun mapRest!17250 () (Array (_ BitVec 32) ValueCell!4866))

(declare-fun mapKey!17250 () (_ BitVec 32))

(declare-fun mapValue!17250 () ValueCell!4866)

(assert (=> mapNonEmpty!17250 (= (arr!11807 _values!549) (store mapRest!17250 mapKey!17250 mapValue!17250))))

(declare-fun b!408696 () Bool)

(declare-fun res!236508 () Bool)

(assert (=> b!408696 (=> (not res!236508) (not e!245277))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24713 (_ BitVec 32)) Bool)

(assert (=> b!408696 (= res!236508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408697 () Bool)

(declare-fun res!236511 () Bool)

(assert (=> b!408697 (=> (not res!236511) (not e!245277))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408697 (= res!236511 (and (= (size!12159 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12158 _keys!709) (size!12159 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408698 () Bool)

(declare-fun e!245276 () Bool)

(assert (=> b!408698 (= e!245276 false)))

(declare-fun lt!188836 () Bool)

(declare-fun lt!188837 () array!24713)

(assert (=> b!408698 (= lt!188836 (arrayNoDuplicates!0 lt!188837 #b00000000000000000000000000000000 Nil!6835))))

(declare-fun b!408699 () Bool)

(declare-fun tp_is_empty!10419 () Bool)

(assert (=> b!408699 (= e!245275 tp_is_empty!10419)))

(declare-fun b!408700 () Bool)

(declare-fun res!236514 () Bool)

(assert (=> b!408700 (=> (not res!236514) (not e!245277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408700 (= res!236514 (validMask!0 mask!1025))))

(declare-fun b!408701 () Bool)

(declare-fun res!236516 () Bool)

(assert (=> b!408701 (=> (not res!236516) (not e!245277))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408701 (= res!236516 (validKeyInArray!0 k0!794))))

(declare-fun b!408702 () Bool)

(declare-fun e!245278 () Bool)

(assert (=> b!408702 (= e!245278 tp_is_empty!10419)))

(declare-fun b!408703 () Bool)

(assert (=> b!408703 (= e!245277 e!245276)))

(declare-fun res!236515 () Bool)

(assert (=> b!408703 (=> (not res!236515) (not e!245276))))

(assert (=> b!408703 (= res!236515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188837 mask!1025))))

(assert (=> b!408703 (= lt!188837 (array!24714 (store (arr!11806 _keys!709) i!563 k0!794) (size!12158 _keys!709)))))

(declare-fun b!408704 () Bool)

(declare-fun e!245279 () Bool)

(assert (=> b!408704 (= e!245279 (and e!245278 mapRes!17250))))

(declare-fun condMapEmpty!17250 () Bool)

(declare-fun mapDefault!17250 () ValueCell!4866)

(assert (=> b!408704 (= condMapEmpty!17250 (= (arr!11807 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4866)) mapDefault!17250)))))

(declare-fun res!236510 () Bool)

(assert (=> start!39000 (=> (not res!236510) (not e!245277))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39000 (= res!236510 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12158 _keys!709))))))

(assert (=> start!39000 e!245277))

(assert (=> start!39000 true))

(declare-fun array_inv!8614 (array!24715) Bool)

(assert (=> start!39000 (and (array_inv!8614 _values!549) e!245279)))

(declare-fun array_inv!8615 (array!24713) Bool)

(assert (=> start!39000 (array_inv!8615 _keys!709)))

(declare-fun b!408695 () Bool)

(declare-fun res!236513 () Bool)

(assert (=> b!408695 (=> (not res!236513) (not e!245277))))

(declare-fun arrayContainsKey!0 (array!24713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408695 (= res!236513 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39000 res!236510) b!408700))

(assert (= (and b!408700 res!236514) b!408697))

(assert (= (and b!408697 res!236511) b!408696))

(assert (= (and b!408696 res!236508) b!408693))

(assert (= (and b!408693 res!236512) b!408692))

(assert (= (and b!408692 res!236517) b!408701))

(assert (= (and b!408701 res!236516) b!408694))

(assert (= (and b!408694 res!236509) b!408695))

(assert (= (and b!408695 res!236513) b!408703))

(assert (= (and b!408703 res!236515) b!408698))

(assert (= (and b!408704 condMapEmpty!17250) mapIsEmpty!17250))

(assert (= (and b!408704 (not condMapEmpty!17250)) mapNonEmpty!17250))

(get-info :version)

(assert (= (and mapNonEmpty!17250 ((_ is ValueCellFull!4866) mapValue!17250)) b!408699))

(assert (= (and b!408704 ((_ is ValueCellFull!4866) mapDefault!17250)) b!408702))

(assert (= start!39000 b!408704))

(declare-fun m!399895 () Bool)

(assert (=> b!408696 m!399895))

(declare-fun m!399897 () Bool)

(assert (=> b!408695 m!399897))

(declare-fun m!399899 () Bool)

(assert (=> mapNonEmpty!17250 m!399899))

(declare-fun m!399901 () Bool)

(assert (=> b!408693 m!399901))

(declare-fun m!399903 () Bool)

(assert (=> start!39000 m!399903))

(declare-fun m!399905 () Bool)

(assert (=> start!39000 m!399905))

(declare-fun m!399907 () Bool)

(assert (=> b!408701 m!399907))

(declare-fun m!399909 () Bool)

(assert (=> b!408698 m!399909))

(declare-fun m!399911 () Bool)

(assert (=> b!408694 m!399911))

(declare-fun m!399913 () Bool)

(assert (=> b!408700 m!399913))

(declare-fun m!399915 () Bool)

(assert (=> b!408703 m!399915))

(declare-fun m!399917 () Bool)

(assert (=> b!408703 m!399917))

(check-sat (not b!408700) (not b!408693) (not b!408695) (not mapNonEmpty!17250) (not b!408696) (not b!408701) (not b!408698) (not b!408703) (not start!39000) tp_is_empty!10419)
(check-sat)
