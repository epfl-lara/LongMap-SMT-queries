; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39506 () Bool)

(assert start!39506)

(declare-fun b_free!9787 () Bool)

(declare-fun b_next!9787 () Bool)

(assert (=> start!39506 (= b_free!9787 (not b_next!9787))))

(declare-fun tp!34889 () Bool)

(declare-fun b_and!17457 () Bool)

(assert (=> start!39506 (= tp!34889 b_and!17457)))

(declare-fun res!246687 () Bool)

(declare-fun e!251314 () Bool)

(assert (=> start!39506 (=> (not res!246687) (not e!251314))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25732 0))(
  ( (array!25733 (arr!12315 (Array (_ BitVec 32) (_ BitVec 64))) (size!12667 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25732)

(assert (=> start!39506 (= res!246687 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12667 _keys!709))))))

(assert (=> start!39506 e!251314))

(declare-fun tp_is_empty!10939 () Bool)

(assert (=> start!39506 tp_is_empty!10939))

(assert (=> start!39506 tp!34889))

(assert (=> start!39506 true))

(declare-datatypes ((V!15691 0))(
  ( (V!15692 (val!5514 Int)) )
))
(declare-datatypes ((ValueCell!5126 0))(
  ( (ValueCellFull!5126 (v!7762 V!15691)) (EmptyCell!5126) )
))
(declare-datatypes ((array!25734 0))(
  ( (array!25735 (arr!12316 (Array (_ BitVec 32) ValueCell!5126)) (size!12668 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25734)

(declare-fun e!251310 () Bool)

(declare-fun array_inv!9050 (array!25734) Bool)

(assert (=> start!39506 (and (array_inv!9050 _values!549) e!251310)))

(declare-fun array_inv!9051 (array!25732) Bool)

(assert (=> start!39506 (array_inv!9051 _keys!709)))

(declare-fun b!422405 () Bool)

(declare-fun res!246695 () Bool)

(assert (=> b!422405 (=> (not res!246695) (not e!251314))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422405 (= res!246695 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18030 () Bool)

(declare-fun mapRes!18030 () Bool)

(assert (=> mapIsEmpty!18030 mapRes!18030))

(declare-fun b!422406 () Bool)

(declare-fun e!251311 () Bool)

(assert (=> b!422406 (= e!251311 tp_is_empty!10939)))

(declare-fun b!422407 () Bool)

(declare-fun e!251313 () Bool)

(assert (=> b!422407 (= e!251313 false)))

(declare-fun minValue!515 () V!15691)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7124 0))(
  ( (tuple2!7125 (_1!3573 (_ BitVec 64)) (_2!3573 V!15691)) )
))
(declare-datatypes ((List!7126 0))(
  ( (Nil!7123) (Cons!7122 (h!7978 tuple2!7124) (t!12562 List!7126)) )
))
(declare-datatypes ((ListLongMap!6039 0))(
  ( (ListLongMap!6040 (toList!3035 List!7126)) )
))
(declare-fun lt!193992 () ListLongMap!6039)

(declare-fun zeroValue!515 () V!15691)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15691)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!193990 () array!25732)

(declare-fun getCurrentListMapNoExtraKeys!1281 (array!25732 array!25734 (_ BitVec 32) (_ BitVec 32) V!15691 V!15691 (_ BitVec 32) Int) ListLongMap!6039)

(assert (=> b!422407 (= lt!193992 (getCurrentListMapNoExtraKeys!1281 lt!193990 (array!25735 (store (arr!12316 _values!549) i!563 (ValueCellFull!5126 v!412)) (size!12668 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193991 () ListLongMap!6039)

(assert (=> b!422407 (= lt!193991 (getCurrentListMapNoExtraKeys!1281 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422408 () Bool)

(declare-fun res!246691 () Bool)

(assert (=> b!422408 (=> (not res!246691) (not e!251314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422408 (= res!246691 (validKeyInArray!0 k0!794))))

(declare-fun b!422409 () Bool)

(declare-fun res!246689 () Bool)

(assert (=> b!422409 (=> (not res!246689) (not e!251313))))

(declare-datatypes ((List!7127 0))(
  ( (Nil!7124) (Cons!7123 (h!7979 (_ BitVec 64)) (t!12563 List!7127)) )
))
(declare-fun arrayNoDuplicates!0 (array!25732 (_ BitVec 32) List!7127) Bool)

(assert (=> b!422409 (= res!246689 (arrayNoDuplicates!0 lt!193990 #b00000000000000000000000000000000 Nil!7124))))

(declare-fun b!422410 () Bool)

(assert (=> b!422410 (= e!251314 e!251313)))

(declare-fun res!246694 () Bool)

(assert (=> b!422410 (=> (not res!246694) (not e!251313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25732 (_ BitVec 32)) Bool)

(assert (=> b!422410 (= res!246694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193990 mask!1025))))

(assert (=> b!422410 (= lt!193990 (array!25733 (store (arr!12315 _keys!709) i!563 k0!794) (size!12667 _keys!709)))))

(declare-fun b!422411 () Bool)

(declare-fun res!246690 () Bool)

(assert (=> b!422411 (=> (not res!246690) (not e!251314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422411 (= res!246690 (validMask!0 mask!1025))))

(declare-fun b!422412 () Bool)

(declare-fun res!246685 () Bool)

(assert (=> b!422412 (=> (not res!246685) (not e!251314))))

(assert (=> b!422412 (= res!246685 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7124))))

(declare-fun b!422413 () Bool)

(declare-fun e!251312 () Bool)

(assert (=> b!422413 (= e!251310 (and e!251312 mapRes!18030))))

(declare-fun condMapEmpty!18030 () Bool)

(declare-fun mapDefault!18030 () ValueCell!5126)

(assert (=> b!422413 (= condMapEmpty!18030 (= (arr!12316 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5126)) mapDefault!18030)))))

(declare-fun b!422414 () Bool)

(declare-fun res!246696 () Bool)

(assert (=> b!422414 (=> (not res!246696) (not e!251313))))

(assert (=> b!422414 (= res!246696 (bvsle from!863 i!563))))

(declare-fun b!422415 () Bool)

(declare-fun res!246693 () Bool)

(assert (=> b!422415 (=> (not res!246693) (not e!251314))))

(assert (=> b!422415 (= res!246693 (and (= (size!12668 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12667 _keys!709) (size!12668 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18030 () Bool)

(declare-fun tp!34890 () Bool)

(assert (=> mapNonEmpty!18030 (= mapRes!18030 (and tp!34890 e!251311))))

(declare-fun mapKey!18030 () (_ BitVec 32))

(declare-fun mapValue!18030 () ValueCell!5126)

(declare-fun mapRest!18030 () (Array (_ BitVec 32) ValueCell!5126))

(assert (=> mapNonEmpty!18030 (= (arr!12316 _values!549) (store mapRest!18030 mapKey!18030 mapValue!18030))))

(declare-fun b!422416 () Bool)

(declare-fun res!246692 () Bool)

(assert (=> b!422416 (=> (not res!246692) (not e!251314))))

(assert (=> b!422416 (= res!246692 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12667 _keys!709))))))

(declare-fun b!422417 () Bool)

(declare-fun res!246688 () Bool)

(assert (=> b!422417 (=> (not res!246688) (not e!251314))))

(assert (=> b!422417 (= res!246688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422418 () Bool)

(declare-fun res!246686 () Bool)

(assert (=> b!422418 (=> (not res!246686) (not e!251314))))

(assert (=> b!422418 (= res!246686 (or (= (select (arr!12315 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12315 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422419 () Bool)

(assert (=> b!422419 (= e!251312 tp_is_empty!10939)))

(assert (= (and start!39506 res!246687) b!422411))

(assert (= (and b!422411 res!246690) b!422415))

(assert (= (and b!422415 res!246693) b!422417))

(assert (= (and b!422417 res!246688) b!422412))

(assert (= (and b!422412 res!246685) b!422416))

(assert (= (and b!422416 res!246692) b!422408))

(assert (= (and b!422408 res!246691) b!422418))

(assert (= (and b!422418 res!246686) b!422405))

(assert (= (and b!422405 res!246695) b!422410))

(assert (= (and b!422410 res!246694) b!422409))

(assert (= (and b!422409 res!246689) b!422414))

(assert (= (and b!422414 res!246696) b!422407))

(assert (= (and b!422413 condMapEmpty!18030) mapIsEmpty!18030))

(assert (= (and b!422413 (not condMapEmpty!18030)) mapNonEmpty!18030))

(get-info :version)

(assert (= (and mapNonEmpty!18030 ((_ is ValueCellFull!5126) mapValue!18030)) b!422406))

(assert (= (and b!422413 ((_ is ValueCellFull!5126) mapDefault!18030)) b!422419))

(assert (= start!39506 b!422413))

(declare-fun m!412481 () Bool)

(assert (=> b!422417 m!412481))

(declare-fun m!412483 () Bool)

(assert (=> b!422407 m!412483))

(declare-fun m!412485 () Bool)

(assert (=> b!422407 m!412485))

(declare-fun m!412487 () Bool)

(assert (=> b!422407 m!412487))

(declare-fun m!412489 () Bool)

(assert (=> b!422411 m!412489))

(declare-fun m!412491 () Bool)

(assert (=> b!422418 m!412491))

(declare-fun m!412493 () Bool)

(assert (=> b!422412 m!412493))

(declare-fun m!412495 () Bool)

(assert (=> b!422409 m!412495))

(declare-fun m!412497 () Bool)

(assert (=> b!422410 m!412497))

(declare-fun m!412499 () Bool)

(assert (=> b!422410 m!412499))

(declare-fun m!412501 () Bool)

(assert (=> mapNonEmpty!18030 m!412501))

(declare-fun m!412503 () Bool)

(assert (=> b!422408 m!412503))

(declare-fun m!412505 () Bool)

(assert (=> b!422405 m!412505))

(declare-fun m!412507 () Bool)

(assert (=> start!39506 m!412507))

(declare-fun m!412509 () Bool)

(assert (=> start!39506 m!412509))

(check-sat (not b!422407) (not b_next!9787) (not b!422409) (not b!422412) (not b!422410) (not b!422417) tp_is_empty!10939 (not b!422405) (not start!39506) (not mapNonEmpty!18030) b_and!17457 (not b!422408) (not b!422411))
(check-sat b_and!17457 (not b_next!9787))
