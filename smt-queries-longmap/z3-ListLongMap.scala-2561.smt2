; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39170 () Bool)

(assert start!39170)

(declare-fun b_free!9451 () Bool)

(declare-fun b_next!9451 () Bool)

(assert (=> start!39170 (= b_free!9451 (not b_next!9451))))

(declare-fun tp!33881 () Bool)

(declare-fun b_and!16811 () Bool)

(assert (=> start!39170 (= tp!33881 b_and!16811)))

(declare-fun b!412481 () Bool)

(declare-fun e!246760 () Bool)

(assert (=> b!412481 (= e!246760 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25057 0))(
  ( (array!25058 (arr!11978 (Array (_ BitVec 32) (_ BitVec 64))) (size!12331 (_ BitVec 32))) )
))
(declare-fun lt!189311 () array!25057)

(declare-datatypes ((V!15243 0))(
  ( (V!15244 (val!5346 Int)) )
))
(declare-fun minValue!515 () V!15243)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4958 0))(
  ( (ValueCellFull!4958 (v!7587 V!15243)) (EmptyCell!4958) )
))
(declare-datatypes ((array!25059 0))(
  ( (array!25060 (arr!11979 (Array (_ BitVec 32) ValueCell!4958)) (size!12332 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25059)

(declare-fun zeroValue!515 () V!15243)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15243)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6918 0))(
  ( (tuple2!6919 (_1!3470 (_ BitVec 64)) (_2!3470 V!15243)) )
))
(declare-datatypes ((List!6937 0))(
  ( (Nil!6934) (Cons!6933 (h!7789 tuple2!6918) (t!12102 List!6937)) )
))
(declare-datatypes ((ListLongMap!5821 0))(
  ( (ListLongMap!5822 (toList!2926 List!6937)) )
))
(declare-fun lt!189310 () ListLongMap!5821)

(declare-fun getCurrentListMapNoExtraKeys!1140 (array!25057 array!25059 (_ BitVec 32) (_ BitVec 32) V!15243 V!15243 (_ BitVec 32) Int) ListLongMap!5821)

(assert (=> b!412481 (= lt!189310 (getCurrentListMapNoExtraKeys!1140 lt!189311 (array!25060 (store (arr!11979 _values!549) i!563 (ValueCellFull!4958 v!412)) (size!12332 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189309 () ListLongMap!5821)

(declare-fun _keys!709 () array!25057)

(assert (=> b!412481 (= lt!189309 (getCurrentListMapNoExtraKeys!1140 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412482 () Bool)

(declare-fun e!246762 () Bool)

(declare-fun tp_is_empty!10603 () Bool)

(assert (=> b!412482 (= e!246762 tp_is_empty!10603)))

(declare-fun b!412483 () Bool)

(declare-fun res!239614 () Bool)

(assert (=> b!412483 (=> (not res!239614) (not e!246760))))

(declare-datatypes ((List!6938 0))(
  ( (Nil!6935) (Cons!6934 (h!7790 (_ BitVec 64)) (t!12103 List!6938)) )
))
(declare-fun arrayNoDuplicates!0 (array!25057 (_ BitVec 32) List!6938) Bool)

(assert (=> b!412483 (= res!239614 (arrayNoDuplicates!0 lt!189311 #b00000000000000000000000000000000 Nil!6935))))

(declare-fun b!412484 () Bool)

(declare-fun res!239616 () Bool)

(declare-fun e!246758 () Bool)

(assert (=> b!412484 (=> (not res!239616) (not e!246758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412484 (= res!239616 (validMask!0 mask!1025))))

(declare-fun b!412485 () Bool)

(declare-fun res!239612 () Bool)

(assert (=> b!412485 (=> (not res!239612) (not e!246758))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412485 (= res!239612 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412486 () Bool)

(declare-fun res!239620 () Bool)

(assert (=> b!412486 (=> (not res!239620) (not e!246758))))

(assert (=> b!412486 (= res!239620 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6935))))

(declare-fun b!412487 () Bool)

(assert (=> b!412487 (= e!246758 e!246760)))

(declare-fun res!239617 () Bool)

(assert (=> b!412487 (=> (not res!239617) (not e!246760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25057 (_ BitVec 32)) Bool)

(assert (=> b!412487 (= res!239617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189311 mask!1025))))

(assert (=> b!412487 (= lt!189311 (array!25058 (store (arr!11978 _keys!709) i!563 k0!794) (size!12331 _keys!709)))))

(declare-fun b!412488 () Bool)

(declare-fun res!239613 () Bool)

(assert (=> b!412488 (=> (not res!239613) (not e!246758))))

(assert (=> b!412488 (= res!239613 (or (= (select (arr!11978 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11978 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412489 () Bool)

(declare-fun res!239619 () Bool)

(assert (=> b!412489 (=> (not res!239619) (not e!246758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412489 (= res!239619 (validKeyInArray!0 k0!794))))

(declare-fun b!412490 () Bool)

(declare-fun e!246759 () Bool)

(declare-fun mapRes!17526 () Bool)

(assert (=> b!412490 (= e!246759 (and e!246762 mapRes!17526))))

(declare-fun condMapEmpty!17526 () Bool)

(declare-fun mapDefault!17526 () ValueCell!4958)

(assert (=> b!412490 (= condMapEmpty!17526 (= (arr!11979 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4958)) mapDefault!17526)))))

(declare-fun b!412491 () Bool)

(declare-fun e!246761 () Bool)

(assert (=> b!412491 (= e!246761 tp_is_empty!10603)))

(declare-fun b!412492 () Bool)

(declare-fun res!239622 () Bool)

(assert (=> b!412492 (=> (not res!239622) (not e!246758))))

(assert (=> b!412492 (= res!239622 (and (= (size!12332 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12331 _keys!709) (size!12332 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412494 () Bool)

(declare-fun res!239621 () Bool)

(assert (=> b!412494 (=> (not res!239621) (not e!246758))))

(assert (=> b!412494 (= res!239621 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12331 _keys!709))))))

(declare-fun b!412495 () Bool)

(declare-fun res!239615 () Bool)

(assert (=> b!412495 (=> (not res!239615) (not e!246760))))

(assert (=> b!412495 (= res!239615 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17526 () Bool)

(declare-fun tp!33882 () Bool)

(assert (=> mapNonEmpty!17526 (= mapRes!17526 (and tp!33882 e!246761))))

(declare-fun mapRest!17526 () (Array (_ BitVec 32) ValueCell!4958))

(declare-fun mapKey!17526 () (_ BitVec 32))

(declare-fun mapValue!17526 () ValueCell!4958)

(assert (=> mapNonEmpty!17526 (= (arr!11979 _values!549) (store mapRest!17526 mapKey!17526 mapValue!17526))))

(declare-fun mapIsEmpty!17526 () Bool)

(assert (=> mapIsEmpty!17526 mapRes!17526))

(declare-fun b!412493 () Bool)

(declare-fun res!239618 () Bool)

(assert (=> b!412493 (=> (not res!239618) (not e!246758))))

(assert (=> b!412493 (= res!239618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!239611 () Bool)

(assert (=> start!39170 (=> (not res!239611) (not e!246758))))

(assert (=> start!39170 (= res!239611 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12331 _keys!709))))))

(assert (=> start!39170 e!246758))

(assert (=> start!39170 tp_is_empty!10603))

(assert (=> start!39170 tp!33881))

(assert (=> start!39170 true))

(declare-fun array_inv!8786 (array!25059) Bool)

(assert (=> start!39170 (and (array_inv!8786 _values!549) e!246759)))

(declare-fun array_inv!8787 (array!25057) Bool)

(assert (=> start!39170 (array_inv!8787 _keys!709)))

(assert (= (and start!39170 res!239611) b!412484))

(assert (= (and b!412484 res!239616) b!412492))

(assert (= (and b!412492 res!239622) b!412493))

(assert (= (and b!412493 res!239618) b!412486))

(assert (= (and b!412486 res!239620) b!412494))

(assert (= (and b!412494 res!239621) b!412489))

(assert (= (and b!412489 res!239619) b!412488))

(assert (= (and b!412488 res!239613) b!412485))

(assert (= (and b!412485 res!239612) b!412487))

(assert (= (and b!412487 res!239617) b!412483))

(assert (= (and b!412483 res!239614) b!412495))

(assert (= (and b!412495 res!239615) b!412481))

(assert (= (and b!412490 condMapEmpty!17526) mapIsEmpty!17526))

(assert (= (and b!412490 (not condMapEmpty!17526)) mapNonEmpty!17526))

(get-info :version)

(assert (= (and mapNonEmpty!17526 ((_ is ValueCellFull!4958) mapValue!17526)) b!412491))

(assert (= (and b!412490 ((_ is ValueCellFull!4958) mapDefault!17526)) b!412482))

(assert (= start!39170 b!412490))

(declare-fun m!401739 () Bool)

(assert (=> b!412489 m!401739))

(declare-fun m!401741 () Bool)

(assert (=> b!412487 m!401741))

(declare-fun m!401743 () Bool)

(assert (=> b!412487 m!401743))

(declare-fun m!401745 () Bool)

(assert (=> b!412486 m!401745))

(declare-fun m!401747 () Bool)

(assert (=> b!412481 m!401747))

(declare-fun m!401749 () Bool)

(assert (=> b!412481 m!401749))

(declare-fun m!401751 () Bool)

(assert (=> b!412481 m!401751))

(declare-fun m!401753 () Bool)

(assert (=> b!412493 m!401753))

(declare-fun m!401755 () Bool)

(assert (=> b!412485 m!401755))

(declare-fun m!401757 () Bool)

(assert (=> b!412483 m!401757))

(declare-fun m!401759 () Bool)

(assert (=> b!412484 m!401759))

(declare-fun m!401761 () Bool)

(assert (=> start!39170 m!401761))

(declare-fun m!401763 () Bool)

(assert (=> start!39170 m!401763))

(declare-fun m!401765 () Bool)

(assert (=> b!412488 m!401765))

(declare-fun m!401767 () Bool)

(assert (=> mapNonEmpty!17526 m!401767))

(check-sat (not b!412481) (not b!412483) (not b!412489) (not start!39170) (not b!412493) (not b!412485) (not b!412486) tp_is_empty!10603 (not b!412487) (not mapNonEmpty!17526) b_and!16811 (not b_next!9451) (not b!412484))
(check-sat b_and!16811 (not b_next!9451))
