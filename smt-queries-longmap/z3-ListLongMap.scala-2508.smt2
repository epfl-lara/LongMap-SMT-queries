; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38868 () Bool)

(assert start!38868)

(declare-fun b!406118 () Bool)

(declare-fun res!234534 () Bool)

(declare-fun e!244092 () Bool)

(assert (=> b!406118 (=> (not res!234534) (not e!244092))))

(declare-datatypes ((array!24465 0))(
  ( (array!24466 (arr!11682 (Array (_ BitVec 32) (_ BitVec 64))) (size!12034 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24465)

(declare-datatypes ((List!6786 0))(
  ( (Nil!6783) (Cons!6782 (h!7638 (_ BitVec 64)) (t!11960 List!6786)) )
))
(declare-fun arrayNoDuplicates!0 (array!24465 (_ BitVec 32) List!6786) Bool)

(assert (=> b!406118 (= res!234534 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6783))))

(declare-fun b!406119 () Bool)

(declare-fun e!244087 () Bool)

(declare-fun e!244091 () Bool)

(declare-fun mapRes!17052 () Bool)

(assert (=> b!406119 (= e!244087 (and e!244091 mapRes!17052))))

(declare-fun condMapEmpty!17052 () Bool)

(declare-datatypes ((V!14821 0))(
  ( (V!14822 (val!5188 Int)) )
))
(declare-datatypes ((ValueCell!4800 0))(
  ( (ValueCellFull!4800 (v!7435 V!14821)) (EmptyCell!4800) )
))
(declare-datatypes ((array!24467 0))(
  ( (array!24468 (arr!11683 (Array (_ BitVec 32) ValueCell!4800)) (size!12035 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24467)

(declare-fun mapDefault!17052 () ValueCell!4800)

(assert (=> b!406119 (= condMapEmpty!17052 (= (arr!11683 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4800)) mapDefault!17052)))))

(declare-fun b!406120 () Bool)

(declare-fun res!234532 () Bool)

(assert (=> b!406120 (=> (not res!234532) (not e!244092))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406120 (= res!234532 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406121 () Bool)

(declare-fun e!244090 () Bool)

(declare-fun tp_is_empty!10287 () Bool)

(assert (=> b!406121 (= e!244090 tp_is_empty!10287)))

(declare-fun mapNonEmpty!17052 () Bool)

(declare-fun tp!33171 () Bool)

(assert (=> mapNonEmpty!17052 (= mapRes!17052 (and tp!33171 e!244090))))

(declare-fun mapValue!17052 () ValueCell!4800)

(declare-fun mapKey!17052 () (_ BitVec 32))

(declare-fun mapRest!17052 () (Array (_ BitVec 32) ValueCell!4800))

(assert (=> mapNonEmpty!17052 (= (arr!11683 _values!549) (store mapRest!17052 mapKey!17052 mapValue!17052))))

(declare-fun mapIsEmpty!17052 () Bool)

(assert (=> mapIsEmpty!17052 mapRes!17052))

(declare-fun b!406122 () Bool)

(declare-fun e!244088 () Bool)

(assert (=> b!406122 (= e!244088 false)))

(declare-fun lt!188440 () Bool)

(declare-fun lt!188441 () array!24465)

(assert (=> b!406122 (= lt!188440 (arrayNoDuplicates!0 lt!188441 #b00000000000000000000000000000000 Nil!6783))))

(declare-fun b!406123 () Bool)

(assert (=> b!406123 (= e!244092 e!244088)))

(declare-fun res!234535 () Bool)

(assert (=> b!406123 (=> (not res!234535) (not e!244088))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24465 (_ BitVec 32)) Bool)

(assert (=> b!406123 (= res!234535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188441 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406123 (= lt!188441 (array!24466 (store (arr!11682 _keys!709) i!563 k0!794) (size!12034 _keys!709)))))

(declare-fun b!406124 () Bool)

(declare-fun res!234529 () Bool)

(assert (=> b!406124 (=> (not res!234529) (not e!244092))))

(assert (=> b!406124 (= res!234529 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12034 _keys!709))))))

(declare-fun b!406125 () Bool)

(declare-fun res!234537 () Bool)

(assert (=> b!406125 (=> (not res!234537) (not e!244092))))

(assert (=> b!406125 (= res!234537 (or (= (select (arr!11682 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11682 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406126 () Bool)

(declare-fun res!234528 () Bool)

(assert (=> b!406126 (=> (not res!234528) (not e!244092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406126 (= res!234528 (validMask!0 mask!1025))))

(declare-fun b!406127 () Bool)

(assert (=> b!406127 (= e!244091 tp_is_empty!10287)))

(declare-fun res!234531 () Bool)

(assert (=> start!38868 (=> (not res!234531) (not e!244092))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38868 (= res!234531 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12034 _keys!709))))))

(assert (=> start!38868 e!244092))

(assert (=> start!38868 true))

(declare-fun array_inv!8532 (array!24467) Bool)

(assert (=> start!38868 (and (array_inv!8532 _values!549) e!244087)))

(declare-fun array_inv!8533 (array!24465) Bool)

(assert (=> start!38868 (array_inv!8533 _keys!709)))

(declare-fun b!406128 () Bool)

(declare-fun res!234533 () Bool)

(assert (=> b!406128 (=> (not res!234533) (not e!244092))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406128 (= res!234533 (and (= (size!12035 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12034 _keys!709) (size!12035 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406129 () Bool)

(declare-fun res!234536 () Bool)

(assert (=> b!406129 (=> (not res!234536) (not e!244092))))

(assert (=> b!406129 (= res!234536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406130 () Bool)

(declare-fun res!234530 () Bool)

(assert (=> b!406130 (=> (not res!234530) (not e!244092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406130 (= res!234530 (validKeyInArray!0 k0!794))))

(assert (= (and start!38868 res!234531) b!406126))

(assert (= (and b!406126 res!234528) b!406128))

(assert (= (and b!406128 res!234533) b!406129))

(assert (= (and b!406129 res!234536) b!406118))

(assert (= (and b!406118 res!234534) b!406124))

(assert (= (and b!406124 res!234529) b!406130))

(assert (= (and b!406130 res!234530) b!406125))

(assert (= (and b!406125 res!234537) b!406120))

(assert (= (and b!406120 res!234532) b!406123))

(assert (= (and b!406123 res!234535) b!406122))

(assert (= (and b!406119 condMapEmpty!17052) mapIsEmpty!17052))

(assert (= (and b!406119 (not condMapEmpty!17052)) mapNonEmpty!17052))

(get-info :version)

(assert (= (and mapNonEmpty!17052 ((_ is ValueCellFull!4800) mapValue!17052)) b!406121))

(assert (= (and b!406119 ((_ is ValueCellFull!4800) mapDefault!17052)) b!406127))

(assert (= start!38868 b!406119))

(declare-fun m!398311 () Bool)

(assert (=> start!38868 m!398311))

(declare-fun m!398313 () Bool)

(assert (=> start!38868 m!398313))

(declare-fun m!398315 () Bool)

(assert (=> b!406118 m!398315))

(declare-fun m!398317 () Bool)

(assert (=> b!406120 m!398317))

(declare-fun m!398319 () Bool)

(assert (=> b!406125 m!398319))

(declare-fun m!398321 () Bool)

(assert (=> mapNonEmpty!17052 m!398321))

(declare-fun m!398323 () Bool)

(assert (=> b!406126 m!398323))

(declare-fun m!398325 () Bool)

(assert (=> b!406123 m!398325))

(declare-fun m!398327 () Bool)

(assert (=> b!406123 m!398327))

(declare-fun m!398329 () Bool)

(assert (=> b!406122 m!398329))

(declare-fun m!398331 () Bool)

(assert (=> b!406129 m!398331))

(declare-fun m!398333 () Bool)

(assert (=> b!406130 m!398333))

(check-sat (not mapNonEmpty!17052) (not b!406122) (not start!38868) (not b!406129) (not b!406120) (not b!406130) (not b!406118) (not b!406126) tp_is_empty!10287 (not b!406123))
(check-sat)
