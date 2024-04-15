; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39002 () Bool)

(assert start!39002)

(declare-fun b!408733 () Bool)

(declare-fun res!236619 () Bool)

(declare-fun e!245246 () Bool)

(assert (=> b!408733 (=> (not res!236619) (not e!245246))))

(declare-datatypes ((array!24731 0))(
  ( (array!24732 (arr!11815 (Array (_ BitVec 32) (_ BitVec 64))) (size!12168 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24731)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408733 (= res!236619 (or (= (select (arr!11815 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11815 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408734 () Bool)

(declare-fun res!236624 () Bool)

(assert (=> b!408734 (=> (not res!236624) (not e!245246))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408734 (= res!236624 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17274 () Bool)

(declare-fun mapRes!17274 () Bool)

(assert (=> mapIsEmpty!17274 mapRes!17274))

(declare-fun b!408735 () Bool)

(declare-fun e!245250 () Bool)

(declare-fun e!245249 () Bool)

(assert (=> b!408735 (= e!245250 (and e!245249 mapRes!17274))))

(declare-fun condMapEmpty!17274 () Bool)

(declare-datatypes ((V!15019 0))(
  ( (V!15020 (val!5262 Int)) )
))
(declare-datatypes ((ValueCell!4874 0))(
  ( (ValueCellFull!4874 (v!7503 V!15019)) (EmptyCell!4874) )
))
(declare-datatypes ((array!24733 0))(
  ( (array!24734 (arr!11816 (Array (_ BitVec 32) ValueCell!4874)) (size!12169 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24733)

(declare-fun mapDefault!17274 () ValueCell!4874)

(assert (=> b!408735 (= condMapEmpty!17274 (= (arr!11816 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4874)) mapDefault!17274)))))

(declare-fun b!408736 () Bool)

(declare-fun res!236626 () Bool)

(assert (=> b!408736 (=> (not res!236626) (not e!245246))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24731 (_ BitVec 32)) Bool)

(assert (=> b!408736 (= res!236626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!236622 () Bool)

(assert (=> start!39002 (=> (not res!236622) (not e!245246))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39002 (= res!236622 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12168 _keys!709))))))

(assert (=> start!39002 e!245246))

(assert (=> start!39002 true))

(declare-fun array_inv!8666 (array!24733) Bool)

(assert (=> start!39002 (and (array_inv!8666 _values!549) e!245250)))

(declare-fun array_inv!8667 (array!24731) Bool)

(assert (=> start!39002 (array_inv!8667 _keys!709)))

(declare-fun b!408737 () Bool)

(declare-fun res!236621 () Bool)

(assert (=> b!408737 (=> (not res!236621) (not e!245246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408737 (= res!236621 (validMask!0 mask!1025))))

(declare-fun b!408738 () Bool)

(declare-fun res!236625 () Bool)

(assert (=> b!408738 (=> (not res!236625) (not e!245246))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408738 (= res!236625 (and (= (size!12169 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12168 _keys!709) (size!12169 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408739 () Bool)

(declare-fun e!245248 () Bool)

(declare-fun tp_is_empty!10435 () Bool)

(assert (=> b!408739 (= e!245248 tp_is_empty!10435)))

(declare-fun b!408740 () Bool)

(declare-fun res!236627 () Bool)

(assert (=> b!408740 (=> (not res!236627) (not e!245246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408740 (= res!236627 (validKeyInArray!0 k0!794))))

(declare-fun b!408741 () Bool)

(declare-fun res!236623 () Bool)

(assert (=> b!408741 (=> (not res!236623) (not e!245246))))

(declare-datatypes ((List!6817 0))(
  ( (Nil!6814) (Cons!6813 (h!7669 (_ BitVec 64)) (t!11982 List!6817)) )
))
(declare-fun arrayNoDuplicates!0 (array!24731 (_ BitVec 32) List!6817) Bool)

(assert (=> b!408741 (= res!236623 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6814))))

(declare-fun mapNonEmpty!17274 () Bool)

(declare-fun tp!33393 () Bool)

(assert (=> mapNonEmpty!17274 (= mapRes!17274 (and tp!33393 e!245248))))

(declare-fun mapValue!17274 () ValueCell!4874)

(declare-fun mapKey!17274 () (_ BitVec 32))

(declare-fun mapRest!17274 () (Array (_ BitVec 32) ValueCell!4874))

(assert (=> mapNonEmpty!17274 (= (arr!11816 _values!549) (store mapRest!17274 mapKey!17274 mapValue!17274))))

(declare-fun b!408742 () Bool)

(declare-fun e!245245 () Bool)

(assert (=> b!408742 (= e!245245 false)))

(declare-fun lt!188651 () Bool)

(declare-fun lt!188650 () array!24731)

(assert (=> b!408742 (= lt!188651 (arrayNoDuplicates!0 lt!188650 #b00000000000000000000000000000000 Nil!6814))))

(declare-fun b!408743 () Bool)

(assert (=> b!408743 (= e!245249 tp_is_empty!10435)))

(declare-fun b!408744 () Bool)

(assert (=> b!408744 (= e!245246 e!245245)))

(declare-fun res!236620 () Bool)

(assert (=> b!408744 (=> (not res!236620) (not e!245245))))

(assert (=> b!408744 (= res!236620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188650 mask!1025))))

(assert (=> b!408744 (= lt!188650 (array!24732 (store (arr!11815 _keys!709) i!563 k0!794) (size!12168 _keys!709)))))

(declare-fun b!408745 () Bool)

(declare-fun res!236628 () Bool)

(assert (=> b!408745 (=> (not res!236628) (not e!245246))))

(assert (=> b!408745 (= res!236628 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12168 _keys!709))))))

(assert (= (and start!39002 res!236622) b!408737))

(assert (= (and b!408737 res!236621) b!408738))

(assert (= (and b!408738 res!236625) b!408736))

(assert (= (and b!408736 res!236626) b!408741))

(assert (= (and b!408741 res!236623) b!408745))

(assert (= (and b!408745 res!236628) b!408740))

(assert (= (and b!408740 res!236627) b!408733))

(assert (= (and b!408733 res!236619) b!408734))

(assert (= (and b!408734 res!236624) b!408744))

(assert (= (and b!408744 res!236620) b!408742))

(assert (= (and b!408735 condMapEmpty!17274) mapIsEmpty!17274))

(assert (= (and b!408735 (not condMapEmpty!17274)) mapNonEmpty!17274))

(get-info :version)

(assert (= (and mapNonEmpty!17274 ((_ is ValueCellFull!4874) mapValue!17274)) b!408739))

(assert (= (and b!408735 ((_ is ValueCellFull!4874) mapDefault!17274)) b!408743))

(assert (= start!39002 b!408735))

(declare-fun m!399363 () Bool)

(assert (=> b!408742 m!399363))

(declare-fun m!399365 () Bool)

(assert (=> start!39002 m!399365))

(declare-fun m!399367 () Bool)

(assert (=> start!39002 m!399367))

(declare-fun m!399369 () Bool)

(assert (=> b!408734 m!399369))

(declare-fun m!399371 () Bool)

(assert (=> b!408740 m!399371))

(declare-fun m!399373 () Bool)

(assert (=> b!408741 m!399373))

(declare-fun m!399375 () Bool)

(assert (=> b!408737 m!399375))

(declare-fun m!399377 () Bool)

(assert (=> b!408744 m!399377))

(declare-fun m!399379 () Bool)

(assert (=> b!408744 m!399379))

(declare-fun m!399381 () Bool)

(assert (=> b!408736 m!399381))

(declare-fun m!399383 () Bool)

(assert (=> mapNonEmpty!17274 m!399383))

(declare-fun m!399385 () Bool)

(assert (=> b!408733 m!399385))

(check-sat (not b!408744) (not start!39002) (not b!408736) tp_is_empty!10435 (not b!408740) (not b!408742) (not b!408734) (not b!408741) (not b!408737) (not mapNonEmpty!17274))
(check-sat)
