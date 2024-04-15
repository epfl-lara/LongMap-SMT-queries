; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39008 () Bool)

(assert start!39008)

(declare-fun b!408850 () Bool)

(declare-fun res!236716 () Bool)

(declare-fun e!245300 () Bool)

(assert (=> b!408850 (=> (not res!236716) (not e!245300))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24743 0))(
  ( (array!24744 (arr!11821 (Array (_ BitVec 32) (_ BitVec 64))) (size!12174 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24743)

(assert (=> b!408850 (= res!236716 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12174 _keys!709))))))

(declare-fun b!408851 () Bool)

(declare-fun res!236709 () Bool)

(assert (=> b!408851 (=> (not res!236709) (not e!245300))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408851 (= res!236709 (validMask!0 mask!1025))))

(declare-fun res!236710 () Bool)

(assert (=> start!39008 (=> (not res!236710) (not e!245300))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39008 (= res!236710 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12174 _keys!709))))))

(assert (=> start!39008 e!245300))

(assert (=> start!39008 true))

(declare-datatypes ((V!15027 0))(
  ( (V!15028 (val!5265 Int)) )
))
(declare-datatypes ((ValueCell!4877 0))(
  ( (ValueCellFull!4877 (v!7506 V!15027)) (EmptyCell!4877) )
))
(declare-datatypes ((array!24745 0))(
  ( (array!24746 (arr!11822 (Array (_ BitVec 32) ValueCell!4877)) (size!12175 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24745)

(declare-fun e!245304 () Bool)

(declare-fun array_inv!8670 (array!24745) Bool)

(assert (=> start!39008 (and (array_inv!8670 _values!549) e!245304)))

(declare-fun array_inv!8671 (array!24743) Bool)

(assert (=> start!39008 (array_inv!8671 _keys!709)))

(declare-fun b!408852 () Bool)

(declare-fun res!236714 () Bool)

(assert (=> b!408852 (=> (not res!236714) (not e!245300))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408852 (= res!236714 (validKeyInArray!0 k0!794))))

(declare-fun b!408853 () Bool)

(declare-fun e!245302 () Bool)

(declare-fun tp_is_empty!10441 () Bool)

(assert (=> b!408853 (= e!245302 tp_is_empty!10441)))

(declare-fun b!408854 () Bool)

(declare-fun res!236711 () Bool)

(assert (=> b!408854 (=> (not res!236711) (not e!245300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24743 (_ BitVec 32)) Bool)

(assert (=> b!408854 (= res!236711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408855 () Bool)

(declare-fun e!245301 () Bool)

(declare-fun mapRes!17283 () Bool)

(assert (=> b!408855 (= e!245304 (and e!245301 mapRes!17283))))

(declare-fun condMapEmpty!17283 () Bool)

(declare-fun mapDefault!17283 () ValueCell!4877)

(assert (=> b!408855 (= condMapEmpty!17283 (= (arr!11822 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4877)) mapDefault!17283)))))

(declare-fun b!408856 () Bool)

(declare-fun e!245299 () Bool)

(assert (=> b!408856 (= e!245299 false)))

(declare-fun lt!188669 () Bool)

(declare-fun lt!188668 () array!24743)

(declare-datatypes ((List!6820 0))(
  ( (Nil!6817) (Cons!6816 (h!7672 (_ BitVec 64)) (t!11985 List!6820)) )
))
(declare-fun arrayNoDuplicates!0 (array!24743 (_ BitVec 32) List!6820) Bool)

(assert (=> b!408856 (= lt!188669 (arrayNoDuplicates!0 lt!188668 #b00000000000000000000000000000000 Nil!6817))))

(declare-fun mapNonEmpty!17283 () Bool)

(declare-fun tp!33402 () Bool)

(assert (=> mapNonEmpty!17283 (= mapRes!17283 (and tp!33402 e!245302))))

(declare-fun mapRest!17283 () (Array (_ BitVec 32) ValueCell!4877))

(declare-fun mapValue!17283 () ValueCell!4877)

(declare-fun mapKey!17283 () (_ BitVec 32))

(assert (=> mapNonEmpty!17283 (= (arr!11822 _values!549) (store mapRest!17283 mapKey!17283 mapValue!17283))))

(declare-fun b!408857 () Bool)

(declare-fun res!236718 () Bool)

(assert (=> b!408857 (=> (not res!236718) (not e!245300))))

(declare-fun arrayContainsKey!0 (array!24743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408857 (= res!236718 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408858 () Bool)

(declare-fun res!236713 () Bool)

(assert (=> b!408858 (=> (not res!236713) (not e!245300))))

(assert (=> b!408858 (= res!236713 (or (= (select (arr!11821 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11821 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408859 () Bool)

(declare-fun res!236712 () Bool)

(assert (=> b!408859 (=> (not res!236712) (not e!245300))))

(assert (=> b!408859 (= res!236712 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6817))))

(declare-fun b!408860 () Bool)

(assert (=> b!408860 (= e!245300 e!245299)))

(declare-fun res!236715 () Bool)

(assert (=> b!408860 (=> (not res!236715) (not e!245299))))

(assert (=> b!408860 (= res!236715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188668 mask!1025))))

(assert (=> b!408860 (= lt!188668 (array!24744 (store (arr!11821 _keys!709) i!563 k0!794) (size!12174 _keys!709)))))

(declare-fun b!408861 () Bool)

(declare-fun res!236717 () Bool)

(assert (=> b!408861 (=> (not res!236717) (not e!245300))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408861 (= res!236717 (and (= (size!12175 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12174 _keys!709) (size!12175 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17283 () Bool)

(assert (=> mapIsEmpty!17283 mapRes!17283))

(declare-fun b!408862 () Bool)

(assert (=> b!408862 (= e!245301 tp_is_empty!10441)))

(assert (= (and start!39008 res!236710) b!408851))

(assert (= (and b!408851 res!236709) b!408861))

(assert (= (and b!408861 res!236717) b!408854))

(assert (= (and b!408854 res!236711) b!408859))

(assert (= (and b!408859 res!236712) b!408850))

(assert (= (and b!408850 res!236716) b!408852))

(assert (= (and b!408852 res!236714) b!408858))

(assert (= (and b!408858 res!236713) b!408857))

(assert (= (and b!408857 res!236718) b!408860))

(assert (= (and b!408860 res!236715) b!408856))

(assert (= (and b!408855 condMapEmpty!17283) mapIsEmpty!17283))

(assert (= (and b!408855 (not condMapEmpty!17283)) mapNonEmpty!17283))

(get-info :version)

(assert (= (and mapNonEmpty!17283 ((_ is ValueCellFull!4877) mapValue!17283)) b!408853))

(assert (= (and b!408855 ((_ is ValueCellFull!4877) mapDefault!17283)) b!408862))

(assert (= start!39008 b!408855))

(declare-fun m!399435 () Bool)

(assert (=> b!408859 m!399435))

(declare-fun m!399437 () Bool)

(assert (=> mapNonEmpty!17283 m!399437))

(declare-fun m!399439 () Bool)

(assert (=> b!408851 m!399439))

(declare-fun m!399441 () Bool)

(assert (=> b!408860 m!399441))

(declare-fun m!399443 () Bool)

(assert (=> b!408860 m!399443))

(declare-fun m!399445 () Bool)

(assert (=> start!39008 m!399445))

(declare-fun m!399447 () Bool)

(assert (=> start!39008 m!399447))

(declare-fun m!399449 () Bool)

(assert (=> b!408852 m!399449))

(declare-fun m!399451 () Bool)

(assert (=> b!408854 m!399451))

(declare-fun m!399453 () Bool)

(assert (=> b!408856 m!399453))

(declare-fun m!399455 () Bool)

(assert (=> b!408858 m!399455))

(declare-fun m!399457 () Bool)

(assert (=> b!408857 m!399457))

(check-sat tp_is_empty!10441 (not b!408852) (not b!408854) (not b!408859) (not b!408856) (not b!408860) (not start!39008) (not b!408851) (not mapNonEmpty!17283) (not b!408857))
(check-sat)
