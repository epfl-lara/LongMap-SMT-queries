; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38522 () Bool)

(assert start!38522)

(declare-fun b!398077 () Bool)

(declare-fun res!228773 () Bool)

(declare-fun e!240604 () Bool)

(assert (=> b!398077 (=> (not res!228773) (not e!240604))))

(declare-datatypes ((array!23801 0))(
  ( (array!23802 (arr!11350 (Array (_ BitVec 32) (_ BitVec 64))) (size!11703 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23801)

(declare-datatypes ((List!6525 0))(
  ( (Nil!6522) (Cons!6521 (h!7377 (_ BitVec 64)) (t!11690 List!6525)) )
))
(declare-fun arrayNoDuplicates!0 (array!23801 (_ BitVec 32) List!6525) Bool)

(assert (=> b!398077 (= res!228773 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6522))))

(declare-fun res!228774 () Bool)

(assert (=> start!38522 (=> (not res!228774) (not e!240604))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38522 (= res!228774 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11703 _keys!709))))))

(assert (=> start!38522 e!240604))

(assert (=> start!38522 true))

(declare-datatypes ((V!14379 0))(
  ( (V!14380 (val!5022 Int)) )
))
(declare-datatypes ((ValueCell!4634 0))(
  ( (ValueCellFull!4634 (v!7263 V!14379)) (EmptyCell!4634) )
))
(declare-datatypes ((array!23803 0))(
  ( (array!23804 (arr!11351 (Array (_ BitVec 32) ValueCell!4634)) (size!11704 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23803)

(declare-fun e!240606 () Bool)

(declare-fun array_inv!8334 (array!23803) Bool)

(assert (=> start!38522 (and (array_inv!8334 _values!549) e!240606)))

(declare-fun array_inv!8335 (array!23801) Bool)

(assert (=> start!38522 (array_inv!8335 _keys!709)))

(declare-fun b!398078 () Bool)

(declare-fun res!228778 () Bool)

(assert (=> b!398078 (=> (not res!228778) (not e!240604))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398078 (= res!228778 (or (= (select (arr!11350 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11350 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398079 () Bool)

(declare-fun res!228777 () Bool)

(assert (=> b!398079 (=> (not res!228777) (not e!240604))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398079 (= res!228777 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398080 () Bool)

(declare-fun res!228775 () Bool)

(assert (=> b!398080 (=> (not res!228775) (not e!240604))))

(assert (=> b!398080 (= res!228775 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11703 _keys!709))))))

(declare-fun mapIsEmpty!16554 () Bool)

(declare-fun mapRes!16554 () Bool)

(assert (=> mapIsEmpty!16554 mapRes!16554))

(declare-fun mapNonEmpty!16554 () Bool)

(declare-fun tp!32349 () Bool)

(declare-fun e!240601 () Bool)

(assert (=> mapNonEmpty!16554 (= mapRes!16554 (and tp!32349 e!240601))))

(declare-fun mapRest!16554 () (Array (_ BitVec 32) ValueCell!4634))

(declare-fun mapKey!16554 () (_ BitVec 32))

(declare-fun mapValue!16554 () ValueCell!4634)

(assert (=> mapNonEmpty!16554 (= (arr!11351 _values!549) (store mapRest!16554 mapKey!16554 mapValue!16554))))

(declare-fun b!398081 () Bool)

(declare-fun res!228779 () Bool)

(assert (=> b!398081 (=> (not res!228779) (not e!240604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398081 (= res!228779 (validKeyInArray!0 k0!794))))

(declare-fun b!398082 () Bool)

(declare-fun e!240605 () Bool)

(assert (=> b!398082 (= e!240604 e!240605)))

(declare-fun res!228772 () Bool)

(assert (=> b!398082 (=> (not res!228772) (not e!240605))))

(declare-fun lt!187210 () array!23801)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23801 (_ BitVec 32)) Bool)

(assert (=> b!398082 (= res!228772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187210 mask!1025))))

(assert (=> b!398082 (= lt!187210 (array!23802 (store (arr!11350 _keys!709) i!563 k0!794) (size!11703 _keys!709)))))

(declare-fun b!398083 () Bool)

(declare-fun e!240602 () Bool)

(declare-fun tp_is_empty!9955 () Bool)

(assert (=> b!398083 (= e!240602 tp_is_empty!9955)))

(declare-fun b!398084 () Bool)

(assert (=> b!398084 (= e!240606 (and e!240602 mapRes!16554))))

(declare-fun condMapEmpty!16554 () Bool)

(declare-fun mapDefault!16554 () ValueCell!4634)

(assert (=> b!398084 (= condMapEmpty!16554 (= (arr!11351 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4634)) mapDefault!16554)))))

(declare-fun b!398085 () Bool)

(assert (=> b!398085 (= e!240601 tp_is_empty!9955)))

(declare-fun b!398086 () Bool)

(declare-fun res!228771 () Bool)

(assert (=> b!398086 (=> (not res!228771) (not e!240604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398086 (= res!228771 (validMask!0 mask!1025))))

(declare-fun b!398087 () Bool)

(assert (=> b!398087 (= e!240605 false)))

(declare-fun lt!187211 () Bool)

(assert (=> b!398087 (= lt!187211 (arrayNoDuplicates!0 lt!187210 #b00000000000000000000000000000000 Nil!6522))))

(declare-fun b!398088 () Bool)

(declare-fun res!228776 () Bool)

(assert (=> b!398088 (=> (not res!228776) (not e!240604))))

(assert (=> b!398088 (= res!228776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398089 () Bool)

(declare-fun res!228780 () Bool)

(assert (=> b!398089 (=> (not res!228780) (not e!240604))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398089 (= res!228780 (and (= (size!11704 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11703 _keys!709) (size!11704 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38522 res!228774) b!398086))

(assert (= (and b!398086 res!228771) b!398089))

(assert (= (and b!398089 res!228780) b!398088))

(assert (= (and b!398088 res!228776) b!398077))

(assert (= (and b!398077 res!228773) b!398080))

(assert (= (and b!398080 res!228775) b!398081))

(assert (= (and b!398081 res!228779) b!398078))

(assert (= (and b!398078 res!228778) b!398079))

(assert (= (and b!398079 res!228777) b!398082))

(assert (= (and b!398082 res!228772) b!398087))

(assert (= (and b!398084 condMapEmpty!16554) mapIsEmpty!16554))

(assert (= (and b!398084 (not condMapEmpty!16554)) mapNonEmpty!16554))

(get-info :version)

(assert (= (and mapNonEmpty!16554 ((_ is ValueCellFull!4634) mapValue!16554)) b!398085))

(assert (= (and b!398084 ((_ is ValueCellFull!4634) mapDefault!16554)) b!398083))

(assert (= start!38522 b!398084))

(declare-fun m!392523 () Bool)

(assert (=> b!398086 m!392523))

(declare-fun m!392525 () Bool)

(assert (=> mapNonEmpty!16554 m!392525))

(declare-fun m!392527 () Bool)

(assert (=> b!398079 m!392527))

(declare-fun m!392529 () Bool)

(assert (=> b!398088 m!392529))

(declare-fun m!392531 () Bool)

(assert (=> b!398078 m!392531))

(declare-fun m!392533 () Bool)

(assert (=> b!398087 m!392533))

(declare-fun m!392535 () Bool)

(assert (=> b!398081 m!392535))

(declare-fun m!392537 () Bool)

(assert (=> b!398082 m!392537))

(declare-fun m!392539 () Bool)

(assert (=> b!398082 m!392539))

(declare-fun m!392541 () Bool)

(assert (=> b!398077 m!392541))

(declare-fun m!392543 () Bool)

(assert (=> start!38522 m!392543))

(declare-fun m!392545 () Bool)

(assert (=> start!38522 m!392545))

(check-sat (not b!398079) (not b!398081) (not mapNonEmpty!16554) tp_is_empty!9955 (not b!398086) (not b!398082) (not start!38522) (not b!398077) (not b!398087) (not b!398088))
(check-sat)
