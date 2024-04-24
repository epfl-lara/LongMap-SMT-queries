; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38834 () Bool)

(assert start!38834)

(declare-fun b!405679 () Bool)

(declare-fun res!234232 () Bool)

(declare-fun e!243876 () Bool)

(assert (=> b!405679 (=> (not res!234232) (not e!243876))))

(declare-datatypes ((array!24414 0))(
  ( (array!24415 (arr!11656 (Array (_ BitVec 32) (_ BitVec 64))) (size!12008 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24414)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405679 (= res!234232 (or (= (select (arr!11656 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11656 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405680 () Bool)

(declare-fun e!243878 () Bool)

(declare-fun e!243875 () Bool)

(declare-fun mapRes!17022 () Bool)

(assert (=> b!405680 (= e!243878 (and e!243875 mapRes!17022))))

(declare-fun condMapEmpty!17022 () Bool)

(declare-datatypes ((V!14795 0))(
  ( (V!14796 (val!5178 Int)) )
))
(declare-datatypes ((ValueCell!4790 0))(
  ( (ValueCellFull!4790 (v!7426 V!14795)) (EmptyCell!4790) )
))
(declare-datatypes ((array!24416 0))(
  ( (array!24417 (arr!11657 (Array (_ BitVec 32) ValueCell!4790)) (size!12009 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24416)

(declare-fun mapDefault!17022 () ValueCell!4790)

(assert (=> b!405680 (= condMapEmpty!17022 (= (arr!11657 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4790)) mapDefault!17022)))))

(declare-fun b!405681 () Bool)

(declare-fun e!243880 () Bool)

(assert (=> b!405681 (= e!243880 false)))

(declare-fun lt!188399 () Bool)

(declare-fun lt!188400 () array!24414)

(declare-datatypes ((List!6653 0))(
  ( (Nil!6650) (Cons!6649 (h!7505 (_ BitVec 64)) (t!11819 List!6653)) )
))
(declare-fun arrayNoDuplicates!0 (array!24414 (_ BitVec 32) List!6653) Bool)

(assert (=> b!405681 (= lt!188399 (arrayNoDuplicates!0 lt!188400 #b00000000000000000000000000000000 Nil!6650))))

(declare-fun b!405682 () Bool)

(declare-fun res!234226 () Bool)

(assert (=> b!405682 (=> (not res!234226) (not e!243876))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24414 (_ BitVec 32)) Bool)

(assert (=> b!405682 (= res!234226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405683 () Bool)

(declare-fun res!234229 () Bool)

(assert (=> b!405683 (=> (not res!234229) (not e!243876))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405683 (= res!234229 (and (= (size!12009 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12008 _keys!709) (size!12009 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!234231 () Bool)

(assert (=> start!38834 (=> (not res!234231) (not e!243876))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38834 (= res!234231 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12008 _keys!709))))))

(assert (=> start!38834 e!243876))

(assert (=> start!38834 true))

(declare-fun array_inv!8610 (array!24416) Bool)

(assert (=> start!38834 (and (array_inv!8610 _values!549) e!243878)))

(declare-fun array_inv!8611 (array!24414) Bool)

(assert (=> start!38834 (array_inv!8611 _keys!709)))

(declare-fun b!405684 () Bool)

(assert (=> b!405684 (= e!243876 e!243880)))

(declare-fun res!234227 () Bool)

(assert (=> b!405684 (=> (not res!234227) (not e!243880))))

(assert (=> b!405684 (= res!234227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188400 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!405684 (= lt!188400 (array!24415 (store (arr!11656 _keys!709) i!563 k0!794) (size!12008 _keys!709)))))

(declare-fun b!405685 () Bool)

(declare-fun tp_is_empty!10267 () Bool)

(assert (=> b!405685 (= e!243875 tp_is_empty!10267)))

(declare-fun mapIsEmpty!17022 () Bool)

(assert (=> mapIsEmpty!17022 mapRes!17022))

(declare-fun b!405686 () Bool)

(declare-fun res!234225 () Bool)

(assert (=> b!405686 (=> (not res!234225) (not e!243876))))

(assert (=> b!405686 (= res!234225 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12008 _keys!709))))))

(declare-fun b!405687 () Bool)

(declare-fun res!234230 () Bool)

(assert (=> b!405687 (=> (not res!234230) (not e!243876))))

(assert (=> b!405687 (= res!234230 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6650))))

(declare-fun b!405688 () Bool)

(declare-fun e!243879 () Bool)

(assert (=> b!405688 (= e!243879 tp_is_empty!10267)))

(declare-fun b!405689 () Bool)

(declare-fun res!234234 () Bool)

(assert (=> b!405689 (=> (not res!234234) (not e!243876))))

(declare-fun arrayContainsKey!0 (array!24414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405689 (= res!234234 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17022 () Bool)

(declare-fun tp!33141 () Bool)

(assert (=> mapNonEmpty!17022 (= mapRes!17022 (and tp!33141 e!243879))))

(declare-fun mapRest!17022 () (Array (_ BitVec 32) ValueCell!4790))

(declare-fun mapValue!17022 () ValueCell!4790)

(declare-fun mapKey!17022 () (_ BitVec 32))

(assert (=> mapNonEmpty!17022 (= (arr!11657 _values!549) (store mapRest!17022 mapKey!17022 mapValue!17022))))

(declare-fun b!405690 () Bool)

(declare-fun res!234233 () Bool)

(assert (=> b!405690 (=> (not res!234233) (not e!243876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405690 (= res!234233 (validMask!0 mask!1025))))

(declare-fun b!405691 () Bool)

(declare-fun res!234228 () Bool)

(assert (=> b!405691 (=> (not res!234228) (not e!243876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405691 (= res!234228 (validKeyInArray!0 k0!794))))

(assert (= (and start!38834 res!234231) b!405690))

(assert (= (and b!405690 res!234233) b!405683))

(assert (= (and b!405683 res!234229) b!405682))

(assert (= (and b!405682 res!234226) b!405687))

(assert (= (and b!405687 res!234230) b!405686))

(assert (= (and b!405686 res!234225) b!405691))

(assert (= (and b!405691 res!234228) b!405679))

(assert (= (and b!405679 res!234232) b!405689))

(assert (= (and b!405689 res!234234) b!405684))

(assert (= (and b!405684 res!234227) b!405681))

(assert (= (and b!405680 condMapEmpty!17022) mapIsEmpty!17022))

(assert (= (and b!405680 (not condMapEmpty!17022)) mapNonEmpty!17022))

(get-info :version)

(assert (= (and mapNonEmpty!17022 ((_ is ValueCellFull!4790) mapValue!17022)) b!405688))

(assert (= (and b!405680 ((_ is ValueCellFull!4790) mapDefault!17022)) b!405685))

(assert (= start!38834 b!405680))

(declare-fun m!398301 () Bool)

(assert (=> mapNonEmpty!17022 m!398301))

(declare-fun m!398303 () Bool)

(assert (=> b!405679 m!398303))

(declare-fun m!398305 () Bool)

(assert (=> b!405690 m!398305))

(declare-fun m!398307 () Bool)

(assert (=> b!405691 m!398307))

(declare-fun m!398309 () Bool)

(assert (=> b!405687 m!398309))

(declare-fun m!398311 () Bool)

(assert (=> b!405682 m!398311))

(declare-fun m!398313 () Bool)

(assert (=> b!405681 m!398313))

(declare-fun m!398315 () Bool)

(assert (=> b!405684 m!398315))

(declare-fun m!398317 () Bool)

(assert (=> b!405684 m!398317))

(declare-fun m!398319 () Bool)

(assert (=> start!38834 m!398319))

(declare-fun m!398321 () Bool)

(assert (=> start!38834 m!398321))

(declare-fun m!398323 () Bool)

(assert (=> b!405689 m!398323))

(check-sat (not b!405689) (not mapNonEmpty!17022) (not b!405682) (not b!405691) (not b!405684) (not b!405690) (not start!38834) (not b!405681) (not b!405687) tp_is_empty!10267)
(check-sat)
