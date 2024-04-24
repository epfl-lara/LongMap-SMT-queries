; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39026 () Bool)

(assert start!39026)

(declare-fun b_free!9307 () Bool)

(declare-fun b_next!9307 () Bool)

(assert (=> start!39026 (= b_free!9307 (not b_next!9307))))

(declare-fun tp!33450 () Bool)

(declare-fun b_and!16707 () Bool)

(assert (=> start!39026 (= tp!33450 b_and!16707)))

(declare-fun b!409463 () Bool)

(declare-fun res!237151 () Bool)

(declare-fun e!245605 () Bool)

(assert (=> b!409463 (=> (not res!237151) (not e!245605))))

(declare-datatypes ((array!24788 0))(
  ( (array!24789 (arr!11843 (Array (_ BitVec 32) (_ BitVec 64))) (size!12195 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24788)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409463 (= res!237151 (or (= (select (arr!11843 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11843 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409464 () Bool)

(declare-fun e!245607 () Bool)

(declare-fun tp_is_empty!10459 () Bool)

(assert (=> b!409464 (= e!245607 tp_is_empty!10459)))

(declare-fun b!409465 () Bool)

(declare-fun res!237155 () Bool)

(assert (=> b!409465 (=> (not res!237155) (not e!245605))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409465 (= res!237155 (validKeyInArray!0 k0!794))))

(declare-fun b!409466 () Bool)

(declare-fun res!237146 () Bool)

(assert (=> b!409466 (=> (not res!237146) (not e!245605))))

(declare-fun arrayContainsKey!0 (array!24788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409466 (= res!237146 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17310 () Bool)

(declare-fun mapRes!17310 () Bool)

(declare-fun tp!33449 () Bool)

(declare-fun e!245606 () Bool)

(assert (=> mapNonEmpty!17310 (= mapRes!17310 (and tp!33449 e!245606))))

(declare-datatypes ((V!15051 0))(
  ( (V!15052 (val!5274 Int)) )
))
(declare-datatypes ((ValueCell!4886 0))(
  ( (ValueCellFull!4886 (v!7522 V!15051)) (EmptyCell!4886) )
))
(declare-datatypes ((array!24790 0))(
  ( (array!24791 (arr!11844 (Array (_ BitVec 32) ValueCell!4886)) (size!12196 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24790)

(declare-fun mapValue!17310 () ValueCell!4886)

(declare-fun mapKey!17310 () (_ BitVec 32))

(declare-fun mapRest!17310 () (Array (_ BitVec 32) ValueCell!4886))

(assert (=> mapNonEmpty!17310 (= (arr!11844 _values!549) (store mapRest!17310 mapKey!17310 mapValue!17310))))

(declare-fun b!409467 () Bool)

(declare-fun res!237156 () Bool)

(assert (=> b!409467 (=> (not res!237156) (not e!245605))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409467 (= res!237156 (validMask!0 mask!1025))))

(declare-fun b!409468 () Bool)

(declare-fun e!245603 () Bool)

(assert (=> b!409468 (= e!245605 e!245603)))

(declare-fun res!237147 () Bool)

(assert (=> b!409468 (=> (not res!237147) (not e!245603))))

(declare-fun lt!188975 () array!24788)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24788 (_ BitVec 32)) Bool)

(assert (=> b!409468 (= res!237147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188975 mask!1025))))

(assert (=> b!409468 (= lt!188975 (array!24789 (store (arr!11843 _keys!709) i!563 k0!794) (size!12195 _keys!709)))))

(declare-fun b!409469 () Bool)

(declare-fun res!237150 () Bool)

(assert (=> b!409469 (=> (not res!237150) (not e!245605))))

(assert (=> b!409469 (= res!237150 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12195 _keys!709))))))

(declare-fun b!409470 () Bool)

(declare-fun res!237152 () Bool)

(assert (=> b!409470 (=> (not res!237152) (not e!245605))))

(assert (=> b!409470 (= res!237152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409471 () Bool)

(declare-fun res!237154 () Bool)

(assert (=> b!409471 (=> (not res!237154) (not e!245605))))

(declare-datatypes ((List!6730 0))(
  ( (Nil!6727) (Cons!6726 (h!7582 (_ BitVec 64)) (t!11896 List!6730)) )
))
(declare-fun arrayNoDuplicates!0 (array!24788 (_ BitVec 32) List!6730) Bool)

(assert (=> b!409471 (= res!237154 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6727))))

(declare-fun b!409472 () Bool)

(declare-fun res!237148 () Bool)

(assert (=> b!409472 (=> (not res!237148) (not e!245603))))

(assert (=> b!409472 (= res!237148 (arrayNoDuplicates!0 lt!188975 #b00000000000000000000000000000000 Nil!6727))))

(declare-fun b!409473 () Bool)

(declare-fun res!237153 () Bool)

(assert (=> b!409473 (=> (not res!237153) (not e!245605))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409473 (= res!237153 (and (= (size!12196 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12195 _keys!709) (size!12196 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409474 () Bool)

(assert (=> b!409474 (= e!245606 tp_is_empty!10459)))

(declare-fun b!409475 () Bool)

(assert (=> b!409475 (= e!245603 false)))

(declare-fun minValue!515 () V!15051)

(declare-fun zeroValue!515 () V!15051)

(declare-datatypes ((tuple2!6712 0))(
  ( (tuple2!6713 (_1!3367 (_ BitVec 64)) (_2!3367 V!15051)) )
))
(declare-datatypes ((List!6731 0))(
  ( (Nil!6728) (Cons!6727 (h!7583 tuple2!6712) (t!11897 List!6731)) )
))
(declare-datatypes ((ListLongMap!5627 0))(
  ( (ListLongMap!5628 (toList!2829 List!6731)) )
))
(declare-fun lt!188976 () ListLongMap!5627)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1081 (array!24788 array!24790 (_ BitVec 32) (_ BitVec 32) V!15051 V!15051 (_ BitVec 32) Int) ListLongMap!5627)

(assert (=> b!409475 (= lt!188976 (getCurrentListMapNoExtraKeys!1081 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409476 () Bool)

(declare-fun e!245604 () Bool)

(assert (=> b!409476 (= e!245604 (and e!245607 mapRes!17310))))

(declare-fun condMapEmpty!17310 () Bool)

(declare-fun mapDefault!17310 () ValueCell!4886)

(assert (=> b!409476 (= condMapEmpty!17310 (= (arr!11844 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4886)) mapDefault!17310)))))

(declare-fun b!409477 () Bool)

(declare-fun res!237149 () Bool)

(assert (=> b!409477 (=> (not res!237149) (not e!245603))))

(assert (=> b!409477 (= res!237149 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17310 () Bool)

(assert (=> mapIsEmpty!17310 mapRes!17310))

(declare-fun res!237145 () Bool)

(assert (=> start!39026 (=> (not res!237145) (not e!245605))))

(assert (=> start!39026 (= res!237145 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12195 _keys!709))))))

(assert (=> start!39026 e!245605))

(assert (=> start!39026 tp_is_empty!10459))

(assert (=> start!39026 tp!33450))

(assert (=> start!39026 true))

(declare-fun array_inv!8728 (array!24790) Bool)

(assert (=> start!39026 (and (array_inv!8728 _values!549) e!245604)))

(declare-fun array_inv!8729 (array!24788) Bool)

(assert (=> start!39026 (array_inv!8729 _keys!709)))

(assert (= (and start!39026 res!237145) b!409467))

(assert (= (and b!409467 res!237156) b!409473))

(assert (= (and b!409473 res!237153) b!409470))

(assert (= (and b!409470 res!237152) b!409471))

(assert (= (and b!409471 res!237154) b!409469))

(assert (= (and b!409469 res!237150) b!409465))

(assert (= (and b!409465 res!237155) b!409463))

(assert (= (and b!409463 res!237151) b!409466))

(assert (= (and b!409466 res!237146) b!409468))

(assert (= (and b!409468 res!237147) b!409472))

(assert (= (and b!409472 res!237148) b!409477))

(assert (= (and b!409477 res!237149) b!409475))

(assert (= (and b!409476 condMapEmpty!17310) mapIsEmpty!17310))

(assert (= (and b!409476 (not condMapEmpty!17310)) mapNonEmpty!17310))

(get-info :version)

(assert (= (and mapNonEmpty!17310 ((_ is ValueCellFull!4886) mapValue!17310)) b!409474))

(assert (= (and b!409476 ((_ is ValueCellFull!4886) mapDefault!17310)) b!409464))

(assert (= start!39026 b!409476))

(declare-fun m!400617 () Bool)

(assert (=> b!409468 m!400617))

(declare-fun m!400619 () Bool)

(assert (=> b!409468 m!400619))

(declare-fun m!400621 () Bool)

(assert (=> b!409465 m!400621))

(declare-fun m!400623 () Bool)

(assert (=> b!409470 m!400623))

(declare-fun m!400625 () Bool)

(assert (=> b!409466 m!400625))

(declare-fun m!400627 () Bool)

(assert (=> b!409475 m!400627))

(declare-fun m!400629 () Bool)

(assert (=> start!39026 m!400629))

(declare-fun m!400631 () Bool)

(assert (=> start!39026 m!400631))

(declare-fun m!400633 () Bool)

(assert (=> b!409463 m!400633))

(declare-fun m!400635 () Bool)

(assert (=> b!409467 m!400635))

(declare-fun m!400637 () Bool)

(assert (=> b!409471 m!400637))

(declare-fun m!400639 () Bool)

(assert (=> b!409472 m!400639))

(declare-fun m!400641 () Bool)

(assert (=> mapNonEmpty!17310 m!400641))

(check-sat (not b!409466) (not b!409472) (not mapNonEmpty!17310) (not b!409468) (not b!409467) (not start!39026) (not b!409475) (not b!409471) (not b_next!9307) (not b!409470) (not b!409465) b_and!16707 tp_is_empty!10459)
(check-sat b_and!16707 (not b_next!9307))
