; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38864 () Bool)

(assert start!38864)

(declare-fun b!406264 () Bool)

(declare-fun res!234684 () Bool)

(declare-fun e!244145 () Bool)

(assert (=> b!406264 (=> (not res!234684) (not e!244145))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24472 0))(
  ( (array!24473 (arr!11685 (Array (_ BitVec 32) (_ BitVec 64))) (size!12037 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24472)

(assert (=> b!406264 (= res!234684 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12037 _keys!709))))))

(declare-fun res!234683 () Bool)

(assert (=> start!38864 (=> (not res!234683) (not e!244145))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38864 (= res!234683 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12037 _keys!709))))))

(assert (=> start!38864 e!244145))

(assert (=> start!38864 true))

(declare-datatypes ((V!14835 0))(
  ( (V!14836 (val!5193 Int)) )
))
(declare-datatypes ((ValueCell!4805 0))(
  ( (ValueCellFull!4805 (v!7441 V!14835)) (EmptyCell!4805) )
))
(declare-datatypes ((array!24474 0))(
  ( (array!24475 (arr!11686 (Array (_ BitVec 32) ValueCell!4805)) (size!12038 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24474)

(declare-fun e!244148 () Bool)

(declare-fun array_inv!8628 (array!24474) Bool)

(assert (=> start!38864 (and (array_inv!8628 _values!549) e!244148)))

(declare-fun array_inv!8629 (array!24472) Bool)

(assert (=> start!38864 (array_inv!8629 _keys!709)))

(declare-fun b!406265 () Bool)

(declare-fun res!234675 () Bool)

(assert (=> b!406265 (=> (not res!234675) (not e!244145))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406265 (= res!234675 (validKeyInArray!0 k0!794))))

(declare-fun b!406266 () Bool)

(declare-fun e!244150 () Bool)

(assert (=> b!406266 (= e!244145 e!244150)))

(declare-fun res!234680 () Bool)

(assert (=> b!406266 (=> (not res!234680) (not e!244150))))

(declare-fun lt!188490 () array!24472)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24472 (_ BitVec 32)) Bool)

(assert (=> b!406266 (= res!234680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188490 mask!1025))))

(assert (=> b!406266 (= lt!188490 (array!24473 (store (arr!11685 _keys!709) i!563 k0!794) (size!12037 _keys!709)))))

(declare-fun b!406267 () Bool)

(declare-fun e!244147 () Bool)

(declare-fun tp_is_empty!10297 () Bool)

(assert (=> b!406267 (= e!244147 tp_is_empty!10297)))

(declare-fun mapNonEmpty!17067 () Bool)

(declare-fun mapRes!17067 () Bool)

(declare-fun tp!33186 () Bool)

(declare-fun e!244149 () Bool)

(assert (=> mapNonEmpty!17067 (= mapRes!17067 (and tp!33186 e!244149))))

(declare-fun mapRest!17067 () (Array (_ BitVec 32) ValueCell!4805))

(declare-fun mapKey!17067 () (_ BitVec 32))

(declare-fun mapValue!17067 () ValueCell!4805)

(assert (=> mapNonEmpty!17067 (= (arr!11686 _values!549) (store mapRest!17067 mapKey!17067 mapValue!17067))))

(declare-fun b!406268 () Bool)

(assert (=> b!406268 (= e!244149 tp_is_empty!10297)))

(declare-fun b!406269 () Bool)

(declare-fun res!234681 () Bool)

(assert (=> b!406269 (=> (not res!234681) (not e!244145))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406269 (= res!234681 (and (= (size!12038 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12037 _keys!709) (size!12038 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406270 () Bool)

(declare-fun res!234682 () Bool)

(assert (=> b!406270 (=> (not res!234682) (not e!244145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406270 (= res!234682 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17067 () Bool)

(assert (=> mapIsEmpty!17067 mapRes!17067))

(declare-fun b!406271 () Bool)

(declare-fun res!234677 () Bool)

(assert (=> b!406271 (=> (not res!234677) (not e!244145))))

(assert (=> b!406271 (= res!234677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406272 () Bool)

(declare-fun res!234678 () Bool)

(assert (=> b!406272 (=> (not res!234678) (not e!244145))))

(declare-fun arrayContainsKey!0 (array!24472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406272 (= res!234678 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406273 () Bool)

(assert (=> b!406273 (= e!244150 false)))

(declare-fun lt!188489 () Bool)

(declare-datatypes ((List!6666 0))(
  ( (Nil!6663) (Cons!6662 (h!7518 (_ BitVec 64)) (t!11832 List!6666)) )
))
(declare-fun arrayNoDuplicates!0 (array!24472 (_ BitVec 32) List!6666) Bool)

(assert (=> b!406273 (= lt!188489 (arrayNoDuplicates!0 lt!188490 #b00000000000000000000000000000000 Nil!6663))))

(declare-fun b!406274 () Bool)

(assert (=> b!406274 (= e!244148 (and e!244147 mapRes!17067))))

(declare-fun condMapEmpty!17067 () Bool)

(declare-fun mapDefault!17067 () ValueCell!4805)

(assert (=> b!406274 (= condMapEmpty!17067 (= (arr!11686 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4805)) mapDefault!17067)))))

(declare-fun b!406275 () Bool)

(declare-fun res!234679 () Bool)

(assert (=> b!406275 (=> (not res!234679) (not e!244145))))

(assert (=> b!406275 (= res!234679 (or (= (select (arr!11685 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11685 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406276 () Bool)

(declare-fun res!234676 () Bool)

(assert (=> b!406276 (=> (not res!234676) (not e!244145))))

(assert (=> b!406276 (= res!234676 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6663))))

(assert (= (and start!38864 res!234683) b!406270))

(assert (= (and b!406270 res!234682) b!406269))

(assert (= (and b!406269 res!234681) b!406271))

(assert (= (and b!406271 res!234677) b!406276))

(assert (= (and b!406276 res!234676) b!406264))

(assert (= (and b!406264 res!234684) b!406265))

(assert (= (and b!406265 res!234675) b!406275))

(assert (= (and b!406275 res!234679) b!406272))

(assert (= (and b!406272 res!234678) b!406266))

(assert (= (and b!406266 res!234680) b!406273))

(assert (= (and b!406274 condMapEmpty!17067) mapIsEmpty!17067))

(assert (= (and b!406274 (not condMapEmpty!17067)) mapNonEmpty!17067))

(get-info :version)

(assert (= (and mapNonEmpty!17067 ((_ is ValueCellFull!4805) mapValue!17067)) b!406268))

(assert (= (and b!406274 ((_ is ValueCellFull!4805) mapDefault!17067)) b!406267))

(assert (= start!38864 b!406274))

(declare-fun m!398661 () Bool)

(assert (=> b!406270 m!398661))

(declare-fun m!398663 () Bool)

(assert (=> b!406265 m!398663))

(declare-fun m!398665 () Bool)

(assert (=> b!406266 m!398665))

(declare-fun m!398667 () Bool)

(assert (=> b!406266 m!398667))

(declare-fun m!398669 () Bool)

(assert (=> b!406272 m!398669))

(declare-fun m!398671 () Bool)

(assert (=> mapNonEmpty!17067 m!398671))

(declare-fun m!398673 () Bool)

(assert (=> start!38864 m!398673))

(declare-fun m!398675 () Bool)

(assert (=> start!38864 m!398675))

(declare-fun m!398677 () Bool)

(assert (=> b!406276 m!398677))

(declare-fun m!398679 () Bool)

(assert (=> b!406275 m!398679))

(declare-fun m!398681 () Bool)

(assert (=> b!406273 m!398681))

(declare-fun m!398683 () Bool)

(assert (=> b!406271 m!398683))

(check-sat (not b!406276) (not b!406266) tp_is_empty!10297 (not b!406265) (not b!406270) (not mapNonEmpty!17067) (not b!406272) (not start!38864) (not b!406273) (not b!406271))
(check-sat)
