; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39104 () Bool)

(assert start!39104)

(declare-fun b_free!9385 () Bool)

(declare-fun b_next!9385 () Bool)

(assert (=> start!39104 (= b_free!9385 (not b_next!9385))))

(declare-fun tp!33683 () Bool)

(declare-fun b_and!16785 () Bool)

(assert (=> start!39104 (= tp!33683 b_and!16785)))

(declare-fun b!411219 () Bool)

(declare-fun res!238559 () Bool)

(declare-fun e!246305 () Bool)

(assert (=> b!411219 (=> (not res!238559) (not e!246305))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411219 (= res!238559 (validMask!0 mask!1025))))

(declare-fun b!411220 () Bool)

(declare-fun e!246310 () Bool)

(declare-fun tp_is_empty!10537 () Bool)

(assert (=> b!411220 (= e!246310 tp_is_empty!10537)))

(declare-fun b!411221 () Bool)

(declare-fun e!246308 () Bool)

(declare-fun mapRes!17427 () Bool)

(assert (=> b!411221 (= e!246308 (and e!246310 mapRes!17427))))

(declare-fun condMapEmpty!17427 () Bool)

(declare-datatypes ((V!15155 0))(
  ( (V!15156 (val!5313 Int)) )
))
(declare-datatypes ((ValueCell!4925 0))(
  ( (ValueCellFull!4925 (v!7561 V!15155)) (EmptyCell!4925) )
))
(declare-datatypes ((array!24938 0))(
  ( (array!24939 (arr!11918 (Array (_ BitVec 32) ValueCell!4925)) (size!12270 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24938)

(declare-fun mapDefault!17427 () ValueCell!4925)

(assert (=> b!411221 (= condMapEmpty!17427 (= (arr!11918 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4925)) mapDefault!17427)))))

(declare-fun b!411222 () Bool)

(declare-fun res!238553 () Bool)

(assert (=> b!411222 (=> (not res!238553) (not e!246305))))

(declare-datatypes ((array!24940 0))(
  ( (array!24941 (arr!11919 (Array (_ BitVec 32) (_ BitVec 64))) (size!12271 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24940)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24940 (_ BitVec 32)) Bool)

(assert (=> b!411222 (= res!238553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411223 () Bool)

(declare-fun res!238550 () Bool)

(declare-fun e!246309 () Bool)

(assert (=> b!411223 (=> (not res!238550) (not e!246309))))

(declare-fun lt!189267 () array!24940)

(declare-datatypes ((List!6781 0))(
  ( (Nil!6778) (Cons!6777 (h!7633 (_ BitVec 64)) (t!11947 List!6781)) )
))
(declare-fun arrayNoDuplicates!0 (array!24940 (_ BitVec 32) List!6781) Bool)

(assert (=> b!411223 (= res!238550 (arrayNoDuplicates!0 lt!189267 #b00000000000000000000000000000000 Nil!6778))))

(declare-fun b!411224 () Bool)

(declare-fun res!238554 () Bool)

(assert (=> b!411224 (=> (not res!238554) (not e!246305))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411224 (= res!238554 (and (= (size!12270 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12271 _keys!709) (size!12270 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17427 () Bool)

(assert (=> mapIsEmpty!17427 mapRes!17427))

(declare-fun b!411225 () Bool)

(assert (=> b!411225 (= e!246305 e!246309)))

(declare-fun res!238556 () Bool)

(assert (=> b!411225 (=> (not res!238556) (not e!246309))))

(assert (=> b!411225 (= res!238556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189267 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!411225 (= lt!189267 (array!24941 (store (arr!11919 _keys!709) i!563 k0!794) (size!12271 _keys!709)))))

(declare-fun b!411226 () Bool)

(declare-fun res!238557 () Bool)

(assert (=> b!411226 (=> (not res!238557) (not e!246305))))

(assert (=> b!411226 (= res!238557 (or (= (select (arr!11919 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11919 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411227 () Bool)

(declare-fun res!238549 () Bool)

(assert (=> b!411227 (=> (not res!238549) (not e!246309))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!411227 (= res!238549 (bvsle from!863 i!563))))

(declare-fun b!411228 () Bool)

(assert (=> b!411228 (= e!246309 false)))

(declare-fun minValue!515 () V!15155)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15155)

(declare-datatypes ((tuple2!6764 0))(
  ( (tuple2!6765 (_1!3393 (_ BitVec 64)) (_2!3393 V!15155)) )
))
(declare-datatypes ((List!6782 0))(
  ( (Nil!6779) (Cons!6778 (h!7634 tuple2!6764) (t!11948 List!6782)) )
))
(declare-datatypes ((ListLongMap!5679 0))(
  ( (ListLongMap!5680 (toList!2855 List!6782)) )
))
(declare-fun lt!189265 () ListLongMap!5679)

(declare-fun v!412 () V!15155)

(declare-fun getCurrentListMapNoExtraKeys!1107 (array!24940 array!24938 (_ BitVec 32) (_ BitVec 32) V!15155 V!15155 (_ BitVec 32) Int) ListLongMap!5679)

(assert (=> b!411228 (= lt!189265 (getCurrentListMapNoExtraKeys!1107 lt!189267 (array!24939 (store (arr!11918 _values!549) i!563 (ValueCellFull!4925 v!412)) (size!12270 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189266 () ListLongMap!5679)

(assert (=> b!411228 (= lt!189266 (getCurrentListMapNoExtraKeys!1107 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411229 () Bool)

(declare-fun res!238551 () Bool)

(assert (=> b!411229 (=> (not res!238551) (not e!246305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411229 (= res!238551 (validKeyInArray!0 k0!794))))

(declare-fun res!238558 () Bool)

(assert (=> start!39104 (=> (not res!238558) (not e!246305))))

(assert (=> start!39104 (= res!238558 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12271 _keys!709))))))

(assert (=> start!39104 e!246305))

(assert (=> start!39104 tp_is_empty!10537))

(assert (=> start!39104 tp!33683))

(assert (=> start!39104 true))

(declare-fun array_inv!8774 (array!24938) Bool)

(assert (=> start!39104 (and (array_inv!8774 _values!549) e!246308)))

(declare-fun array_inv!8775 (array!24940) Bool)

(assert (=> start!39104 (array_inv!8775 _keys!709)))

(declare-fun b!411218 () Bool)

(declare-fun res!238560 () Bool)

(assert (=> b!411218 (=> (not res!238560) (not e!246305))))

(assert (=> b!411218 (= res!238560 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12271 _keys!709))))))

(declare-fun mapNonEmpty!17427 () Bool)

(declare-fun tp!33684 () Bool)

(declare-fun e!246307 () Bool)

(assert (=> mapNonEmpty!17427 (= mapRes!17427 (and tp!33684 e!246307))))

(declare-fun mapKey!17427 () (_ BitVec 32))

(declare-fun mapValue!17427 () ValueCell!4925)

(declare-fun mapRest!17427 () (Array (_ BitVec 32) ValueCell!4925))

(assert (=> mapNonEmpty!17427 (= (arr!11918 _values!549) (store mapRest!17427 mapKey!17427 mapValue!17427))))

(declare-fun b!411230 () Bool)

(declare-fun res!238555 () Bool)

(assert (=> b!411230 (=> (not res!238555) (not e!246305))))

(declare-fun arrayContainsKey!0 (array!24940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411230 (= res!238555 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411231 () Bool)

(declare-fun res!238552 () Bool)

(assert (=> b!411231 (=> (not res!238552) (not e!246305))))

(assert (=> b!411231 (= res!238552 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6778))))

(declare-fun b!411232 () Bool)

(assert (=> b!411232 (= e!246307 tp_is_empty!10537)))

(assert (= (and start!39104 res!238558) b!411219))

(assert (= (and b!411219 res!238559) b!411224))

(assert (= (and b!411224 res!238554) b!411222))

(assert (= (and b!411222 res!238553) b!411231))

(assert (= (and b!411231 res!238552) b!411218))

(assert (= (and b!411218 res!238560) b!411229))

(assert (= (and b!411229 res!238551) b!411226))

(assert (= (and b!411226 res!238557) b!411230))

(assert (= (and b!411230 res!238555) b!411225))

(assert (= (and b!411225 res!238556) b!411223))

(assert (= (and b!411223 res!238550) b!411227))

(assert (= (and b!411227 res!238549) b!411228))

(assert (= (and b!411221 condMapEmpty!17427) mapIsEmpty!17427))

(assert (= (and b!411221 (not condMapEmpty!17427)) mapNonEmpty!17427))

(get-info :version)

(assert (= (and mapNonEmpty!17427 ((_ is ValueCellFull!4925) mapValue!17427)) b!411232))

(assert (= (and b!411221 ((_ is ValueCellFull!4925) mapDefault!17427)) b!411220))

(assert (= start!39104 b!411221))

(declare-fun m!401703 () Bool)

(assert (=> b!411219 m!401703))

(declare-fun m!401705 () Bool)

(assert (=> b!411225 m!401705))

(declare-fun m!401707 () Bool)

(assert (=> b!411225 m!401707))

(declare-fun m!401709 () Bool)

(assert (=> b!411229 m!401709))

(declare-fun m!401711 () Bool)

(assert (=> b!411226 m!401711))

(declare-fun m!401713 () Bool)

(assert (=> b!411231 m!401713))

(declare-fun m!401715 () Bool)

(assert (=> b!411228 m!401715))

(declare-fun m!401717 () Bool)

(assert (=> b!411228 m!401717))

(declare-fun m!401719 () Bool)

(assert (=> b!411228 m!401719))

(declare-fun m!401721 () Bool)

(assert (=> b!411230 m!401721))

(declare-fun m!401723 () Bool)

(assert (=> mapNonEmpty!17427 m!401723))

(declare-fun m!401725 () Bool)

(assert (=> b!411222 m!401725))

(declare-fun m!401727 () Bool)

(assert (=> start!39104 m!401727))

(declare-fun m!401729 () Bool)

(assert (=> start!39104 m!401729))

(declare-fun m!401731 () Bool)

(assert (=> b!411223 m!401731))

(check-sat (not b!411230) (not start!39104) (not mapNonEmpty!17427) (not b!411223) (not b!411219) (not b!411229) (not b!411222) (not b!411225) (not b!411231) (not b_next!9385) (not b!411228) tp_is_empty!10537 b_and!16785)
(check-sat b_and!16785 (not b_next!9385))
