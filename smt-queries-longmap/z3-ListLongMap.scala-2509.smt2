; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38858 () Bool)

(assert start!38858)

(declare-fun mapNonEmpty!17058 () Bool)

(declare-fun mapRes!17058 () Bool)

(declare-fun tp!33177 () Bool)

(declare-fun e!244095 () Bool)

(assert (=> mapNonEmpty!17058 (= mapRes!17058 (and tp!33177 e!244095))))

(declare-datatypes ((V!14827 0))(
  ( (V!14828 (val!5190 Int)) )
))
(declare-datatypes ((ValueCell!4802 0))(
  ( (ValueCellFull!4802 (v!7438 V!14827)) (EmptyCell!4802) )
))
(declare-datatypes ((array!24460 0))(
  ( (array!24461 (arr!11679 (Array (_ BitVec 32) ValueCell!4802)) (size!12031 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24460)

(declare-fun mapKey!17058 () (_ BitVec 32))

(declare-fun mapRest!17058 () (Array (_ BitVec 32) ValueCell!4802))

(declare-fun mapValue!17058 () ValueCell!4802)

(assert (=> mapNonEmpty!17058 (= (arr!11679 _values!549) (store mapRest!17058 mapKey!17058 mapValue!17058))))

(declare-fun b!406147 () Bool)

(declare-fun e!244092 () Bool)

(declare-fun e!244091 () Bool)

(assert (=> b!406147 (= e!244092 (and e!244091 mapRes!17058))))

(declare-fun condMapEmpty!17058 () Bool)

(declare-fun mapDefault!17058 () ValueCell!4802)

(assert (=> b!406147 (= condMapEmpty!17058 (= (arr!11679 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4802)) mapDefault!17058)))))

(declare-fun b!406148 () Bool)

(declare-fun e!244096 () Bool)

(declare-fun e!244093 () Bool)

(assert (=> b!406148 (= e!244096 e!244093)))

(declare-fun res!234587 () Bool)

(assert (=> b!406148 (=> (not res!234587) (not e!244093))))

(declare-datatypes ((array!24462 0))(
  ( (array!24463 (arr!11680 (Array (_ BitVec 32) (_ BitVec 64))) (size!12032 (_ BitVec 32))) )
))
(declare-fun lt!188472 () array!24462)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24462 (_ BitVec 32)) Bool)

(assert (=> b!406148 (= res!234587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188472 mask!1025))))

(declare-fun _keys!709 () array!24462)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406148 (= lt!188472 (array!24463 (store (arr!11680 _keys!709) i!563 k0!794) (size!12032 _keys!709)))))

(declare-fun b!406149 () Bool)

(declare-fun res!234590 () Bool)

(assert (=> b!406149 (=> (not res!234590) (not e!244096))))

(declare-datatypes ((List!6664 0))(
  ( (Nil!6661) (Cons!6660 (h!7516 (_ BitVec 64)) (t!11830 List!6664)) )
))
(declare-fun arrayNoDuplicates!0 (array!24462 (_ BitVec 32) List!6664) Bool)

(assert (=> b!406149 (= res!234590 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6661))))

(declare-fun b!406150 () Bool)

(declare-fun res!234592 () Bool)

(assert (=> b!406150 (=> (not res!234592) (not e!244096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406150 (= res!234592 (validKeyInArray!0 k0!794))))

(declare-fun b!406151 () Bool)

(declare-fun res!234585 () Bool)

(assert (=> b!406151 (=> (not res!234585) (not e!244096))))

(assert (=> b!406151 (= res!234585 (or (= (select (arr!11680 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11680 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406152 () Bool)

(declare-fun tp_is_empty!10291 () Bool)

(assert (=> b!406152 (= e!244095 tp_is_empty!10291)))

(declare-fun b!406153 () Bool)

(assert (=> b!406153 (= e!244091 tp_is_empty!10291)))

(declare-fun res!234593 () Bool)

(assert (=> start!38858 (=> (not res!234593) (not e!244096))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38858 (= res!234593 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12032 _keys!709))))))

(assert (=> start!38858 e!244096))

(assert (=> start!38858 true))

(declare-fun array_inv!8624 (array!24460) Bool)

(assert (=> start!38858 (and (array_inv!8624 _values!549) e!244092)))

(declare-fun array_inv!8625 (array!24462) Bool)

(assert (=> start!38858 (array_inv!8625 _keys!709)))

(declare-fun b!406154 () Bool)

(declare-fun res!234589 () Bool)

(assert (=> b!406154 (=> (not res!234589) (not e!244096))))

(assert (=> b!406154 (= res!234589 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12032 _keys!709))))))

(declare-fun mapIsEmpty!17058 () Bool)

(assert (=> mapIsEmpty!17058 mapRes!17058))

(declare-fun b!406155 () Bool)

(assert (=> b!406155 (= e!244093 false)))

(declare-fun lt!188471 () Bool)

(assert (=> b!406155 (= lt!188471 (arrayNoDuplicates!0 lt!188472 #b00000000000000000000000000000000 Nil!6661))))

(declare-fun b!406156 () Bool)

(declare-fun res!234588 () Bool)

(assert (=> b!406156 (=> (not res!234588) (not e!244096))))

(declare-fun arrayContainsKey!0 (array!24462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406156 (= res!234588 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406157 () Bool)

(declare-fun res!234586 () Bool)

(assert (=> b!406157 (=> (not res!234586) (not e!244096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406157 (= res!234586 (validMask!0 mask!1025))))

(declare-fun b!406158 () Bool)

(declare-fun res!234594 () Bool)

(assert (=> b!406158 (=> (not res!234594) (not e!244096))))

(assert (=> b!406158 (= res!234594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406159 () Bool)

(declare-fun res!234591 () Bool)

(assert (=> b!406159 (=> (not res!234591) (not e!244096))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406159 (= res!234591 (and (= (size!12031 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12032 _keys!709) (size!12031 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38858 res!234593) b!406157))

(assert (= (and b!406157 res!234586) b!406159))

(assert (= (and b!406159 res!234591) b!406158))

(assert (= (and b!406158 res!234594) b!406149))

(assert (= (and b!406149 res!234590) b!406154))

(assert (= (and b!406154 res!234589) b!406150))

(assert (= (and b!406150 res!234592) b!406151))

(assert (= (and b!406151 res!234585) b!406156))

(assert (= (and b!406156 res!234588) b!406148))

(assert (= (and b!406148 res!234587) b!406155))

(assert (= (and b!406147 condMapEmpty!17058) mapIsEmpty!17058))

(assert (= (and b!406147 (not condMapEmpty!17058)) mapNonEmpty!17058))

(get-info :version)

(assert (= (and mapNonEmpty!17058 ((_ is ValueCellFull!4802) mapValue!17058)) b!406152))

(assert (= (and b!406147 ((_ is ValueCellFull!4802) mapDefault!17058)) b!406153))

(assert (= start!38858 b!406147))

(declare-fun m!398589 () Bool)

(assert (=> mapNonEmpty!17058 m!398589))

(declare-fun m!398591 () Bool)

(assert (=> b!406157 m!398591))

(declare-fun m!398593 () Bool)

(assert (=> b!406155 m!398593))

(declare-fun m!398595 () Bool)

(assert (=> b!406148 m!398595))

(declare-fun m!398597 () Bool)

(assert (=> b!406148 m!398597))

(declare-fun m!398599 () Bool)

(assert (=> b!406158 m!398599))

(declare-fun m!398601 () Bool)

(assert (=> start!38858 m!398601))

(declare-fun m!398603 () Bool)

(assert (=> start!38858 m!398603))

(declare-fun m!398605 () Bool)

(assert (=> b!406150 m!398605))

(declare-fun m!398607 () Bool)

(assert (=> b!406149 m!398607))

(declare-fun m!398609 () Bool)

(assert (=> b!406156 m!398609))

(declare-fun m!398611 () Bool)

(assert (=> b!406151 m!398611))

(check-sat (not b!406157) (not start!38858) (not b!406155) (not mapNonEmpty!17058) (not b!406158) (not b!406150) (not b!406149) (not b!406148) tp_is_empty!10291 (not b!406156))
(check-sat)
