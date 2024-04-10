; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38850 () Bool)

(assert start!38850)

(declare-fun b!405767 () Bool)

(declare-fun e!243925 () Bool)

(declare-fun tp_is_empty!10269 () Bool)

(assert (=> b!405767 (= e!243925 tp_is_empty!10269)))

(declare-fun mapNonEmpty!17025 () Bool)

(declare-fun mapRes!17025 () Bool)

(declare-fun tp!33144 () Bool)

(declare-fun e!243930 () Bool)

(assert (=> mapNonEmpty!17025 (= mapRes!17025 (and tp!33144 e!243930))))

(declare-datatypes ((V!14797 0))(
  ( (V!14798 (val!5179 Int)) )
))
(declare-datatypes ((ValueCell!4791 0))(
  ( (ValueCellFull!4791 (v!7426 V!14797)) (EmptyCell!4791) )
))
(declare-datatypes ((array!24429 0))(
  ( (array!24430 (arr!11664 (Array (_ BitVec 32) ValueCell!4791)) (size!12016 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24429)

(declare-fun mapValue!17025 () ValueCell!4791)

(declare-fun mapRest!17025 () (Array (_ BitVec 32) ValueCell!4791))

(declare-fun mapKey!17025 () (_ BitVec 32))

(assert (=> mapNonEmpty!17025 (= (arr!11664 _values!549) (store mapRest!17025 mapKey!17025 mapValue!17025))))

(declare-fun b!405769 () Bool)

(declare-fun e!243929 () Bool)

(assert (=> b!405769 (= e!243929 (and e!243925 mapRes!17025))))

(declare-fun condMapEmpty!17025 () Bool)

(declare-fun mapDefault!17025 () ValueCell!4791)

(assert (=> b!405769 (= condMapEmpty!17025 (= (arr!11664 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4791)) mapDefault!17025)))))

(declare-fun b!405770 () Bool)

(declare-fun res!234261 () Bool)

(declare-fun e!243926 () Bool)

(assert (=> b!405770 (=> (not res!234261) (not e!243926))))

(declare-datatypes ((array!24431 0))(
  ( (array!24432 (arr!11665 (Array (_ BitVec 32) (_ BitVec 64))) (size!12017 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24431)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24431 (_ BitVec 32)) Bool)

(assert (=> b!405770 (= res!234261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405771 () Bool)

(declare-fun e!243928 () Bool)

(assert (=> b!405771 (= e!243928 false)))

(declare-fun lt!188387 () Bool)

(declare-fun lt!188386 () array!24431)

(declare-datatypes ((List!6780 0))(
  ( (Nil!6777) (Cons!6776 (h!7632 (_ BitVec 64)) (t!11954 List!6780)) )
))
(declare-fun arrayNoDuplicates!0 (array!24431 (_ BitVec 32) List!6780) Bool)

(assert (=> b!405771 (= lt!188387 (arrayNoDuplicates!0 lt!188386 #b00000000000000000000000000000000 Nil!6777))))

(declare-fun b!405772 () Bool)

(declare-fun res!234258 () Bool)

(assert (=> b!405772 (=> (not res!234258) (not e!243926))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405772 (= res!234258 (or (= (select (arr!11665 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11665 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405773 () Bool)

(declare-fun res!234263 () Bool)

(assert (=> b!405773 (=> (not res!234263) (not e!243926))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405773 (= res!234263 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405774 () Bool)

(assert (=> b!405774 (= e!243930 tp_is_empty!10269)))

(declare-fun b!405775 () Bool)

(assert (=> b!405775 (= e!243926 e!243928)))

(declare-fun res!234266 () Bool)

(assert (=> b!405775 (=> (not res!234266) (not e!243928))))

(assert (=> b!405775 (= res!234266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188386 mask!1025))))

(assert (=> b!405775 (= lt!188386 (array!24432 (store (arr!11665 _keys!709) i!563 k0!794) (size!12017 _keys!709)))))

(declare-fun b!405776 () Bool)

(declare-fun res!234262 () Bool)

(assert (=> b!405776 (=> (not res!234262) (not e!243926))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405776 (= res!234262 (and (= (size!12016 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12017 _keys!709) (size!12016 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405777 () Bool)

(declare-fun res!234264 () Bool)

(assert (=> b!405777 (=> (not res!234264) (not e!243926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405777 (= res!234264 (validKeyInArray!0 k0!794))))

(declare-fun b!405778 () Bool)

(declare-fun res!234259 () Bool)

(assert (=> b!405778 (=> (not res!234259) (not e!243926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405778 (= res!234259 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17025 () Bool)

(assert (=> mapIsEmpty!17025 mapRes!17025))

(declare-fun b!405779 () Bool)

(declare-fun res!234260 () Bool)

(assert (=> b!405779 (=> (not res!234260) (not e!243926))))

(assert (=> b!405779 (= res!234260 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12017 _keys!709))))))

(declare-fun res!234267 () Bool)

(assert (=> start!38850 (=> (not res!234267) (not e!243926))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38850 (= res!234267 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12017 _keys!709))))))

(assert (=> start!38850 e!243926))

(assert (=> start!38850 true))

(declare-fun array_inv!8522 (array!24429) Bool)

(assert (=> start!38850 (and (array_inv!8522 _values!549) e!243929)))

(declare-fun array_inv!8523 (array!24431) Bool)

(assert (=> start!38850 (array_inv!8523 _keys!709)))

(declare-fun b!405768 () Bool)

(declare-fun res!234265 () Bool)

(assert (=> b!405768 (=> (not res!234265) (not e!243926))))

(assert (=> b!405768 (= res!234265 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6777))))

(assert (= (and start!38850 res!234267) b!405778))

(assert (= (and b!405778 res!234259) b!405776))

(assert (= (and b!405776 res!234262) b!405770))

(assert (= (and b!405770 res!234261) b!405768))

(assert (= (and b!405768 res!234265) b!405779))

(assert (= (and b!405779 res!234260) b!405777))

(assert (= (and b!405777 res!234264) b!405772))

(assert (= (and b!405772 res!234258) b!405773))

(assert (= (and b!405773 res!234263) b!405775))

(assert (= (and b!405775 res!234266) b!405771))

(assert (= (and b!405769 condMapEmpty!17025) mapIsEmpty!17025))

(assert (= (and b!405769 (not condMapEmpty!17025)) mapNonEmpty!17025))

(get-info :version)

(assert (= (and mapNonEmpty!17025 ((_ is ValueCellFull!4791) mapValue!17025)) b!405774))

(assert (= (and b!405769 ((_ is ValueCellFull!4791) mapDefault!17025)) b!405767))

(assert (= start!38850 b!405769))

(declare-fun m!398095 () Bool)

(assert (=> b!405777 m!398095))

(declare-fun m!398097 () Bool)

(assert (=> b!405778 m!398097))

(declare-fun m!398099 () Bool)

(assert (=> b!405772 m!398099))

(declare-fun m!398101 () Bool)

(assert (=> mapNonEmpty!17025 m!398101))

(declare-fun m!398103 () Bool)

(assert (=> b!405771 m!398103))

(declare-fun m!398105 () Bool)

(assert (=> start!38850 m!398105))

(declare-fun m!398107 () Bool)

(assert (=> start!38850 m!398107))

(declare-fun m!398109 () Bool)

(assert (=> b!405775 m!398109))

(declare-fun m!398111 () Bool)

(assert (=> b!405775 m!398111))

(declare-fun m!398113 () Bool)

(assert (=> b!405770 m!398113))

(declare-fun m!398115 () Bool)

(assert (=> b!405773 m!398115))

(declare-fun m!398117 () Bool)

(assert (=> b!405768 m!398117))

(check-sat (not b!405773) (not b!405768) (not b!405770) (not b!405771) (not mapNonEmpty!17025) (not b!405775) tp_is_empty!10269 (not start!38850) (not b!405778) (not b!405777))
(check-sat)
