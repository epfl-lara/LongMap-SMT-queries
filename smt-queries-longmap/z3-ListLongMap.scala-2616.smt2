; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39500 () Bool)

(assert start!39500)

(declare-fun b_free!9781 () Bool)

(declare-fun b_next!9781 () Bool)

(assert (=> start!39500 (= b_free!9781 (not b_next!9781))))

(declare-fun tp!34872 () Bool)

(declare-fun b_and!17411 () Bool)

(assert (=> start!39500 (= tp!34872 b_and!17411)))

(declare-fun b!422048 () Bool)

(declare-fun res!246459 () Bool)

(declare-fun e!251115 () Bool)

(assert (=> b!422048 (=> (not res!246459) (not e!251115))))

(declare-datatypes ((array!25695 0))(
  ( (array!25696 (arr!12297 (Array (_ BitVec 32) (_ BitVec 64))) (size!12650 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25695)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422048 (= res!246459 (or (= (select (arr!12297 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12297 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422049 () Bool)

(declare-fun res!246451 () Bool)

(declare-fun e!251118 () Bool)

(assert (=> b!422049 (=> (not res!246451) (not e!251118))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422049 (= res!246451 (bvsle from!863 i!563))))

(declare-fun b!422050 () Bool)

(declare-fun res!246457 () Bool)

(assert (=> b!422050 (=> (not res!246457) (not e!251115))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422050 (= res!246457 (validMask!0 mask!1025))))

(declare-fun res!246454 () Bool)

(assert (=> start!39500 (=> (not res!246454) (not e!251115))))

(assert (=> start!39500 (= res!246454 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12650 _keys!709))))))

(assert (=> start!39500 e!251115))

(declare-fun tp_is_empty!10933 () Bool)

(assert (=> start!39500 tp_is_empty!10933))

(assert (=> start!39500 tp!34872))

(assert (=> start!39500 true))

(declare-datatypes ((V!15683 0))(
  ( (V!15684 (val!5511 Int)) )
))
(declare-datatypes ((ValueCell!5123 0))(
  ( (ValueCellFull!5123 (v!7752 V!15683)) (EmptyCell!5123) )
))
(declare-datatypes ((array!25697 0))(
  ( (array!25698 (arr!12298 (Array (_ BitVec 32) ValueCell!5123)) (size!12651 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25697)

(declare-fun e!251117 () Bool)

(declare-fun array_inv!9000 (array!25697) Bool)

(assert (=> start!39500 (and (array_inv!9000 _values!549) e!251117)))

(declare-fun array_inv!9001 (array!25695) Bool)

(assert (=> start!39500 (array_inv!9001 _keys!709)))

(declare-fun b!422051 () Bool)

(declare-fun res!246462 () Bool)

(assert (=> b!422051 (=> (not res!246462) (not e!251115))))

(declare-datatypes ((List!7211 0))(
  ( (Nil!7208) (Cons!7207 (h!8063 (_ BitVec 64)) (t!12646 List!7211)) )
))
(declare-fun arrayNoDuplicates!0 (array!25695 (_ BitVec 32) List!7211) Bool)

(assert (=> b!422051 (= res!246462 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7208))))

(declare-fun b!422052 () Bool)

(declare-fun res!246460 () Bool)

(assert (=> b!422052 (=> (not res!246460) (not e!251115))))

(assert (=> b!422052 (= res!246460 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12650 _keys!709))))))

(declare-fun b!422053 () Bool)

(declare-fun e!251114 () Bool)

(declare-fun mapRes!18021 () Bool)

(assert (=> b!422053 (= e!251117 (and e!251114 mapRes!18021))))

(declare-fun condMapEmpty!18021 () Bool)

(declare-fun mapDefault!18021 () ValueCell!5123)

(assert (=> b!422053 (= condMapEmpty!18021 (= (arr!12298 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5123)) mapDefault!18021)))))

(declare-fun b!422054 () Bool)

(declare-fun e!251113 () Bool)

(assert (=> b!422054 (= e!251113 tp_is_empty!10933)))

(declare-fun b!422055 () Bool)

(assert (=> b!422055 (= e!251115 e!251118)))

(declare-fun res!246456 () Bool)

(assert (=> b!422055 (=> (not res!246456) (not e!251118))))

(declare-fun lt!193710 () array!25695)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25695 (_ BitVec 32)) Bool)

(assert (=> b!422055 (= res!246456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193710 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!422055 (= lt!193710 (array!25696 (store (arr!12297 _keys!709) i!563 k0!794) (size!12650 _keys!709)))))

(declare-fun b!422056 () Bool)

(declare-fun res!246455 () Bool)

(assert (=> b!422056 (=> (not res!246455) (not e!251115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422056 (= res!246455 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18021 () Bool)

(assert (=> mapIsEmpty!18021 mapRes!18021))

(declare-fun b!422057 () Bool)

(declare-fun res!246458 () Bool)

(assert (=> b!422057 (=> (not res!246458) (not e!251115))))

(declare-fun arrayContainsKey!0 (array!25695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422057 (= res!246458 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422058 () Bool)

(declare-fun res!246452 () Bool)

(assert (=> b!422058 (=> (not res!246452) (not e!251115))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!422058 (= res!246452 (and (= (size!12651 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12650 _keys!709) (size!12651 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422059 () Bool)

(assert (=> b!422059 (= e!251118 false)))

(declare-fun minValue!515 () V!15683)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15683)

(declare-datatypes ((tuple2!7222 0))(
  ( (tuple2!7223 (_1!3622 (_ BitVec 64)) (_2!3622 V!15683)) )
))
(declare-datatypes ((List!7212 0))(
  ( (Nil!7209) (Cons!7208 (h!8064 tuple2!7222) (t!12647 List!7212)) )
))
(declare-datatypes ((ListLongMap!6125 0))(
  ( (ListLongMap!6126 (toList!3078 List!7212)) )
))
(declare-fun lt!193712 () ListLongMap!6125)

(declare-fun v!412 () V!15683)

(declare-fun getCurrentListMapNoExtraKeys!1286 (array!25695 array!25697 (_ BitVec 32) (_ BitVec 32) V!15683 V!15683 (_ BitVec 32) Int) ListLongMap!6125)

(assert (=> b!422059 (= lt!193712 (getCurrentListMapNoExtraKeys!1286 lt!193710 (array!25698 (store (arr!12298 _values!549) i!563 (ValueCellFull!5123 v!412)) (size!12651 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193711 () ListLongMap!6125)

(assert (=> b!422059 (= lt!193711 (getCurrentListMapNoExtraKeys!1286 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422060 () Bool)

(declare-fun res!246461 () Bool)

(assert (=> b!422060 (=> (not res!246461) (not e!251118))))

(assert (=> b!422060 (= res!246461 (arrayNoDuplicates!0 lt!193710 #b00000000000000000000000000000000 Nil!7208))))

(declare-fun mapNonEmpty!18021 () Bool)

(declare-fun tp!34871 () Bool)

(assert (=> mapNonEmpty!18021 (= mapRes!18021 (and tp!34871 e!251113))))

(declare-fun mapKey!18021 () (_ BitVec 32))

(declare-fun mapRest!18021 () (Array (_ BitVec 32) ValueCell!5123))

(declare-fun mapValue!18021 () ValueCell!5123)

(assert (=> mapNonEmpty!18021 (= (arr!12298 _values!549) (store mapRest!18021 mapKey!18021 mapValue!18021))))

(declare-fun b!422061 () Bool)

(assert (=> b!422061 (= e!251114 tp_is_empty!10933)))

(declare-fun b!422062 () Bool)

(declare-fun res!246453 () Bool)

(assert (=> b!422062 (=> (not res!246453) (not e!251115))))

(assert (=> b!422062 (= res!246453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39500 res!246454) b!422050))

(assert (= (and b!422050 res!246457) b!422058))

(assert (= (and b!422058 res!246452) b!422062))

(assert (= (and b!422062 res!246453) b!422051))

(assert (= (and b!422051 res!246462) b!422052))

(assert (= (and b!422052 res!246460) b!422056))

(assert (= (and b!422056 res!246455) b!422048))

(assert (= (and b!422048 res!246459) b!422057))

(assert (= (and b!422057 res!246458) b!422055))

(assert (= (and b!422055 res!246456) b!422060))

(assert (= (and b!422060 res!246461) b!422049))

(assert (= (and b!422049 res!246451) b!422059))

(assert (= (and b!422053 condMapEmpty!18021) mapIsEmpty!18021))

(assert (= (and b!422053 (not condMapEmpty!18021)) mapNonEmpty!18021))

(get-info :version)

(assert (= (and mapNonEmpty!18021 ((_ is ValueCellFull!5123) mapValue!18021)) b!422054))

(assert (= (and b!422053 ((_ is ValueCellFull!5123) mapDefault!18021)) b!422061))

(assert (= start!39500 b!422053))

(declare-fun m!411441 () Bool)

(assert (=> b!422055 m!411441))

(declare-fun m!411443 () Bool)

(assert (=> b!422055 m!411443))

(declare-fun m!411445 () Bool)

(assert (=> b!422060 m!411445))

(declare-fun m!411447 () Bool)

(assert (=> b!422048 m!411447))

(declare-fun m!411449 () Bool)

(assert (=> b!422059 m!411449))

(declare-fun m!411451 () Bool)

(assert (=> b!422059 m!411451))

(declare-fun m!411453 () Bool)

(assert (=> b!422059 m!411453))

(declare-fun m!411455 () Bool)

(assert (=> b!422057 m!411455))

(declare-fun m!411457 () Bool)

(assert (=> b!422051 m!411457))

(declare-fun m!411459 () Bool)

(assert (=> start!39500 m!411459))

(declare-fun m!411461 () Bool)

(assert (=> start!39500 m!411461))

(declare-fun m!411463 () Bool)

(assert (=> b!422056 m!411463))

(declare-fun m!411465 () Bool)

(assert (=> mapNonEmpty!18021 m!411465))

(declare-fun m!411467 () Bool)

(assert (=> b!422050 m!411467))

(declare-fun m!411469 () Bool)

(assert (=> b!422062 m!411469))

(check-sat (not b!422057) (not b!422051) tp_is_empty!10933 (not mapNonEmpty!18021) (not b!422055) (not b_next!9781) (not b!422056) (not b!422062) (not start!39500) b_and!17411 (not b!422050) (not b!422060) (not b!422059))
(check-sat b_and!17411 (not b_next!9781))
