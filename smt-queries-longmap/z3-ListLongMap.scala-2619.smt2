; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39518 () Bool)

(assert start!39518)

(declare-fun b_free!9799 () Bool)

(declare-fun b_next!9799 () Bool)

(assert (=> start!39518 (= b_free!9799 (not b_next!9799))))

(declare-fun tp!34926 () Bool)

(declare-fun b_and!17429 () Bool)

(assert (=> start!39518 (= tp!34926 b_and!17429)))

(declare-fun b!422453 () Bool)

(declare-fun e!251275 () Bool)

(assert (=> b!422453 (= e!251275 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15707 0))(
  ( (V!15708 (val!5520 Int)) )
))
(declare-fun minValue!515 () V!15707)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5132 0))(
  ( (ValueCellFull!5132 (v!7761 V!15707)) (EmptyCell!5132) )
))
(declare-datatypes ((array!25731 0))(
  ( (array!25732 (arr!12315 (Array (_ BitVec 32) ValueCell!5132)) (size!12668 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25731)

(declare-fun zeroValue!515 () V!15707)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7236 0))(
  ( (tuple2!7237 (_1!3629 (_ BitVec 64)) (_2!3629 V!15707)) )
))
(declare-datatypes ((List!7227 0))(
  ( (Nil!7224) (Cons!7223 (h!8079 tuple2!7236) (t!12662 List!7227)) )
))
(declare-datatypes ((ListLongMap!6139 0))(
  ( (ListLongMap!6140 (toList!3085 List!7227)) )
))
(declare-fun lt!193793 () ListLongMap!6139)

(declare-datatypes ((array!25733 0))(
  ( (array!25734 (arr!12316 (Array (_ BitVec 32) (_ BitVec 64))) (size!12669 (_ BitVec 32))) )
))
(declare-fun lt!193791 () array!25733)

(declare-fun v!412 () V!15707)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1293 (array!25733 array!25731 (_ BitVec 32) (_ BitVec 32) V!15707 V!15707 (_ BitVec 32) Int) ListLongMap!6139)

(assert (=> b!422453 (= lt!193793 (getCurrentListMapNoExtraKeys!1293 lt!193791 (array!25732 (store (arr!12315 _values!549) i!563 (ValueCellFull!5132 v!412)) (size!12668 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!25733)

(declare-fun lt!193792 () ListLongMap!6139)

(assert (=> b!422453 (= lt!193792 (getCurrentListMapNoExtraKeys!1293 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422455 () Bool)

(declare-fun res!246784 () Bool)

(declare-fun e!251278 () Bool)

(assert (=> b!422455 (=> (not res!246784) (not e!251278))))

(assert (=> b!422455 (= res!246784 (and (= (size!12668 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12669 _keys!709) (size!12668 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422456 () Bool)

(declare-fun res!246777 () Bool)

(assert (=> b!422456 (=> (not res!246777) (not e!251278))))

(declare-datatypes ((List!7228 0))(
  ( (Nil!7225) (Cons!7224 (h!8080 (_ BitVec 64)) (t!12663 List!7228)) )
))
(declare-fun arrayNoDuplicates!0 (array!25733 (_ BitVec 32) List!7228) Bool)

(assert (=> b!422456 (= res!246777 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7225))))

(declare-fun mapIsEmpty!18048 () Bool)

(declare-fun mapRes!18048 () Bool)

(assert (=> mapIsEmpty!18048 mapRes!18048))

(declare-fun b!422457 () Bool)

(declare-fun e!251280 () Bool)

(declare-fun e!251277 () Bool)

(assert (=> b!422457 (= e!251280 (and e!251277 mapRes!18048))))

(declare-fun condMapEmpty!18048 () Bool)

(declare-fun mapDefault!18048 () ValueCell!5132)

(assert (=> b!422457 (= condMapEmpty!18048 (= (arr!12315 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5132)) mapDefault!18048)))))

(declare-fun b!422458 () Bool)

(declare-fun res!246779 () Bool)

(assert (=> b!422458 (=> (not res!246779) (not e!251278))))

(assert (=> b!422458 (= res!246779 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12669 _keys!709))))))

(declare-fun mapNonEmpty!18048 () Bool)

(declare-fun tp!34925 () Bool)

(declare-fun e!251276 () Bool)

(assert (=> mapNonEmpty!18048 (= mapRes!18048 (and tp!34925 e!251276))))

(declare-fun mapKey!18048 () (_ BitVec 32))

(declare-fun mapRest!18048 () (Array (_ BitVec 32) ValueCell!5132))

(declare-fun mapValue!18048 () ValueCell!5132)

(assert (=> mapNonEmpty!18048 (= (arr!12315 _values!549) (store mapRest!18048 mapKey!18048 mapValue!18048))))

(declare-fun b!422454 () Bool)

(assert (=> b!422454 (= e!251278 e!251275)))

(declare-fun res!246783 () Bool)

(assert (=> b!422454 (=> (not res!246783) (not e!251275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25733 (_ BitVec 32)) Bool)

(assert (=> b!422454 (= res!246783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193791 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!422454 (= lt!193791 (array!25734 (store (arr!12316 _keys!709) i!563 k0!794) (size!12669 _keys!709)))))

(declare-fun res!246782 () Bool)

(assert (=> start!39518 (=> (not res!246782) (not e!251278))))

(assert (=> start!39518 (= res!246782 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12669 _keys!709))))))

(assert (=> start!39518 e!251278))

(declare-fun tp_is_empty!10951 () Bool)

(assert (=> start!39518 tp_is_empty!10951))

(assert (=> start!39518 tp!34926))

(assert (=> start!39518 true))

(declare-fun array_inv!9012 (array!25731) Bool)

(assert (=> start!39518 (and (array_inv!9012 _values!549) e!251280)))

(declare-fun array_inv!9013 (array!25733) Bool)

(assert (=> start!39518 (array_inv!9013 _keys!709)))

(declare-fun b!422459 () Bool)

(declare-fun res!246778 () Bool)

(assert (=> b!422459 (=> (not res!246778) (not e!251278))))

(assert (=> b!422459 (= res!246778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422460 () Bool)

(assert (=> b!422460 (= e!251276 tp_is_empty!10951)))

(declare-fun b!422461 () Bool)

(assert (=> b!422461 (= e!251277 tp_is_empty!10951)))

(declare-fun b!422462 () Bool)

(declare-fun res!246780 () Bool)

(assert (=> b!422462 (=> (not res!246780) (not e!251278))))

(declare-fun arrayContainsKey!0 (array!25733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422462 (= res!246780 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422463 () Bool)

(declare-fun res!246776 () Bool)

(assert (=> b!422463 (=> (not res!246776) (not e!251275))))

(assert (=> b!422463 (= res!246776 (arrayNoDuplicates!0 lt!193791 #b00000000000000000000000000000000 Nil!7225))))

(declare-fun b!422464 () Bool)

(declare-fun res!246781 () Bool)

(assert (=> b!422464 (=> (not res!246781) (not e!251275))))

(assert (=> b!422464 (= res!246781 (bvsle from!863 i!563))))

(declare-fun b!422465 () Bool)

(declare-fun res!246786 () Bool)

(assert (=> b!422465 (=> (not res!246786) (not e!251278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422465 (= res!246786 (validKeyInArray!0 k0!794))))

(declare-fun b!422466 () Bool)

(declare-fun res!246785 () Bool)

(assert (=> b!422466 (=> (not res!246785) (not e!251278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422466 (= res!246785 (validMask!0 mask!1025))))

(declare-fun b!422467 () Bool)

(declare-fun res!246775 () Bool)

(assert (=> b!422467 (=> (not res!246775) (not e!251278))))

(assert (=> b!422467 (= res!246775 (or (= (select (arr!12316 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12316 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39518 res!246782) b!422466))

(assert (= (and b!422466 res!246785) b!422455))

(assert (= (and b!422455 res!246784) b!422459))

(assert (= (and b!422459 res!246778) b!422456))

(assert (= (and b!422456 res!246777) b!422458))

(assert (= (and b!422458 res!246779) b!422465))

(assert (= (and b!422465 res!246786) b!422467))

(assert (= (and b!422467 res!246775) b!422462))

(assert (= (and b!422462 res!246780) b!422454))

(assert (= (and b!422454 res!246783) b!422463))

(assert (= (and b!422463 res!246776) b!422464))

(assert (= (and b!422464 res!246781) b!422453))

(assert (= (and b!422457 condMapEmpty!18048) mapIsEmpty!18048))

(assert (= (and b!422457 (not condMapEmpty!18048)) mapNonEmpty!18048))

(get-info :version)

(assert (= (and mapNonEmpty!18048 ((_ is ValueCellFull!5132) mapValue!18048)) b!422460))

(assert (= (and b!422457 ((_ is ValueCellFull!5132) mapDefault!18048)) b!422461))

(assert (= start!39518 b!422457))

(declare-fun m!411711 () Bool)

(assert (=> b!422463 m!411711))

(declare-fun m!411713 () Bool)

(assert (=> mapNonEmpty!18048 m!411713))

(declare-fun m!411715 () Bool)

(assert (=> b!422454 m!411715))

(declare-fun m!411717 () Bool)

(assert (=> b!422454 m!411717))

(declare-fun m!411719 () Bool)

(assert (=> b!422467 m!411719))

(declare-fun m!411721 () Bool)

(assert (=> b!422462 m!411721))

(declare-fun m!411723 () Bool)

(assert (=> b!422456 m!411723))

(declare-fun m!411725 () Bool)

(assert (=> b!422453 m!411725))

(declare-fun m!411727 () Bool)

(assert (=> b!422453 m!411727))

(declare-fun m!411729 () Bool)

(assert (=> b!422453 m!411729))

(declare-fun m!411731 () Bool)

(assert (=> b!422465 m!411731))

(declare-fun m!411733 () Bool)

(assert (=> start!39518 m!411733))

(declare-fun m!411735 () Bool)

(assert (=> start!39518 m!411735))

(declare-fun m!411737 () Bool)

(assert (=> b!422459 m!411737))

(declare-fun m!411739 () Bool)

(assert (=> b!422466 m!411739))

(check-sat (not b!422465) (not b!422453) (not b_next!9799) (not mapNonEmpty!18048) (not start!39518) (not b!422462) tp_is_empty!10951 (not b!422463) (not b!422466) (not b!422454) b_and!17429 (not b!422456) (not b!422459))
(check-sat b_and!17429 (not b_next!9799))
