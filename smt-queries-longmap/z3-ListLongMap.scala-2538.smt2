; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39048 () Bool)

(assert start!39048)

(declare-fun b_free!9315 () Bool)

(declare-fun b_next!9315 () Bool)

(assert (=> start!39048 (= b_free!9315 (not b_next!9315))))

(declare-fun tp!33474 () Bool)

(declare-fun b_and!16701 () Bool)

(assert (=> start!39048 (= tp!33474 b_and!16701)))

(declare-fun mapIsEmpty!17322 () Bool)

(declare-fun mapRes!17322 () Bool)

(assert (=> mapIsEmpty!17322 mapRes!17322))

(declare-fun b!409692 () Bool)

(declare-fun res!237302 () Bool)

(declare-fun e!245710 () Bool)

(assert (=> b!409692 (=> (not res!237302) (not e!245710))))

(declare-datatypes ((array!24807 0))(
  ( (array!24808 (arr!11853 (Array (_ BitVec 32) (_ BitVec 64))) (size!12205 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24807)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24807 (_ BitVec 32)) Bool)

(assert (=> b!409692 (= res!237302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409693 () Bool)

(declare-fun e!245712 () Bool)

(assert (=> b!409693 (= e!245710 e!245712)))

(declare-fun res!237292 () Bool)

(assert (=> b!409693 (=> (not res!237292) (not e!245712))))

(declare-fun lt!188981 () array!24807)

(assert (=> b!409693 (= res!237292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188981 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409693 (= lt!188981 (array!24808 (store (arr!11853 _keys!709) i!563 k0!794) (size!12205 _keys!709)))))

(declare-fun b!409694 () Bool)

(declare-fun res!237294 () Bool)

(assert (=> b!409694 (=> (not res!237294) (not e!245712))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!409694 (= res!237294 (bvsle from!863 i!563))))

(declare-fun b!409695 () Bool)

(declare-fun res!237293 () Bool)

(assert (=> b!409695 (=> (not res!237293) (not e!245710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409695 (= res!237293 (validKeyInArray!0 k0!794))))

(declare-fun res!237299 () Bool)

(assert (=> start!39048 (=> (not res!237299) (not e!245710))))

(assert (=> start!39048 (= res!237299 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12205 _keys!709))))))

(assert (=> start!39048 e!245710))

(declare-fun tp_is_empty!10467 () Bool)

(assert (=> start!39048 tp_is_empty!10467))

(assert (=> start!39048 tp!33474))

(assert (=> start!39048 true))

(declare-datatypes ((V!15061 0))(
  ( (V!15062 (val!5278 Int)) )
))
(declare-datatypes ((ValueCell!4890 0))(
  ( (ValueCellFull!4890 (v!7525 V!15061)) (EmptyCell!4890) )
))
(declare-datatypes ((array!24809 0))(
  ( (array!24810 (arr!11854 (Array (_ BitVec 32) ValueCell!4890)) (size!12206 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24809)

(declare-fun e!245709 () Bool)

(declare-fun array_inv!8652 (array!24809) Bool)

(assert (=> start!39048 (and (array_inv!8652 _values!549) e!245709)))

(declare-fun array_inv!8653 (array!24807) Bool)

(assert (=> start!39048 (array_inv!8653 _keys!709)))

(declare-fun b!409696 () Bool)

(declare-fun e!245711 () Bool)

(assert (=> b!409696 (= e!245711 tp_is_empty!10467)))

(declare-fun b!409697 () Bool)

(declare-fun res!237298 () Bool)

(assert (=> b!409697 (=> (not res!237298) (not e!245710))))

(declare-datatypes ((List!6865 0))(
  ( (Nil!6862) (Cons!6861 (h!7717 (_ BitVec 64)) (t!12039 List!6865)) )
))
(declare-fun arrayNoDuplicates!0 (array!24807 (_ BitVec 32) List!6865) Bool)

(assert (=> b!409697 (= res!237298 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6862))))

(declare-fun b!409698 () Bool)

(assert (=> b!409698 (= e!245709 (and e!245711 mapRes!17322))))

(declare-fun condMapEmpty!17322 () Bool)

(declare-fun mapDefault!17322 () ValueCell!4890)

(assert (=> b!409698 (= condMapEmpty!17322 (= (arr!11854 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4890)) mapDefault!17322)))))

(declare-fun b!409699 () Bool)

(declare-fun res!237296 () Bool)

(assert (=> b!409699 (=> (not res!237296) (not e!245710))))

(assert (=> b!409699 (= res!237296 (or (= (select (arr!11853 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11853 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409700 () Bool)

(declare-fun res!237297 () Bool)

(assert (=> b!409700 (=> (not res!237297) (not e!245710))))

(declare-fun arrayContainsKey!0 (array!24807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409700 (= res!237297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409701 () Bool)

(declare-fun res!237303 () Bool)

(assert (=> b!409701 (=> (not res!237303) (not e!245710))))

(assert (=> b!409701 (= res!237303 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12205 _keys!709))))))

(declare-fun mapNonEmpty!17322 () Bool)

(declare-fun tp!33473 () Bool)

(declare-fun e!245708 () Bool)

(assert (=> mapNonEmpty!17322 (= mapRes!17322 (and tp!33473 e!245708))))

(declare-fun mapKey!17322 () (_ BitVec 32))

(declare-fun mapValue!17322 () ValueCell!4890)

(declare-fun mapRest!17322 () (Array (_ BitVec 32) ValueCell!4890))

(assert (=> mapNonEmpty!17322 (= (arr!11854 _values!549) (store mapRest!17322 mapKey!17322 mapValue!17322))))

(declare-fun b!409702 () Bool)

(declare-fun res!237295 () Bool)

(assert (=> b!409702 (=> (not res!237295) (not e!245710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409702 (= res!237295 (validMask!0 mask!1025))))

(declare-fun b!409703 () Bool)

(declare-fun res!237300 () Bool)

(assert (=> b!409703 (=> (not res!237300) (not e!245710))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409703 (= res!237300 (and (= (size!12206 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12205 _keys!709) (size!12206 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409704 () Bool)

(declare-fun res!237301 () Bool)

(assert (=> b!409704 (=> (not res!237301) (not e!245712))))

(assert (=> b!409704 (= res!237301 (arrayNoDuplicates!0 lt!188981 #b00000000000000000000000000000000 Nil!6862))))

(declare-fun b!409705 () Bool)

(assert (=> b!409705 (= e!245708 tp_is_empty!10467)))

(declare-fun b!409706 () Bool)

(assert (=> b!409706 (= e!245712 false)))

(declare-fun minValue!515 () V!15061)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15061)

(declare-datatypes ((tuple2!6842 0))(
  ( (tuple2!6843 (_1!3432 (_ BitVec 64)) (_2!3432 V!15061)) )
))
(declare-datatypes ((List!6866 0))(
  ( (Nil!6863) (Cons!6862 (h!7718 tuple2!6842) (t!12040 List!6866)) )
))
(declare-datatypes ((ListLongMap!5755 0))(
  ( (ListLongMap!5756 (toList!2893 List!6866)) )
))
(declare-fun lt!188980 () ListLongMap!5755)

(declare-fun getCurrentListMapNoExtraKeys!1101 (array!24807 array!24809 (_ BitVec 32) (_ BitVec 32) V!15061 V!15061 (_ BitVec 32) Int) ListLongMap!5755)

(assert (=> b!409706 (= lt!188980 (getCurrentListMapNoExtraKeys!1101 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39048 res!237299) b!409702))

(assert (= (and b!409702 res!237295) b!409703))

(assert (= (and b!409703 res!237300) b!409692))

(assert (= (and b!409692 res!237302) b!409697))

(assert (= (and b!409697 res!237298) b!409701))

(assert (= (and b!409701 res!237303) b!409695))

(assert (= (and b!409695 res!237293) b!409699))

(assert (= (and b!409699 res!237296) b!409700))

(assert (= (and b!409700 res!237297) b!409693))

(assert (= (and b!409693 res!237292) b!409704))

(assert (= (and b!409704 res!237301) b!409694))

(assert (= (and b!409694 res!237294) b!409706))

(assert (= (and b!409698 condMapEmpty!17322) mapIsEmpty!17322))

(assert (= (and b!409698 (not condMapEmpty!17322)) mapNonEmpty!17322))

(get-info :version)

(assert (= (and mapNonEmpty!17322 ((_ is ValueCellFull!4890) mapValue!17322)) b!409705))

(assert (= (and b!409698 ((_ is ValueCellFull!4890) mapDefault!17322)) b!409696))

(assert (= start!39048 b!409698))

(declare-fun m!400491 () Bool)

(assert (=> b!409695 m!400491))

(declare-fun m!400493 () Bool)

(assert (=> b!409697 m!400493))

(declare-fun m!400495 () Bool)

(assert (=> b!409700 m!400495))

(declare-fun m!400497 () Bool)

(assert (=> b!409706 m!400497))

(declare-fun m!400499 () Bool)

(assert (=> b!409702 m!400499))

(declare-fun m!400501 () Bool)

(assert (=> b!409693 m!400501))

(declare-fun m!400503 () Bool)

(assert (=> b!409693 m!400503))

(declare-fun m!400505 () Bool)

(assert (=> b!409692 m!400505))

(declare-fun m!400507 () Bool)

(assert (=> mapNonEmpty!17322 m!400507))

(declare-fun m!400509 () Bool)

(assert (=> start!39048 m!400509))

(declare-fun m!400511 () Bool)

(assert (=> start!39048 m!400511))

(declare-fun m!400513 () Bool)

(assert (=> b!409699 m!400513))

(declare-fun m!400515 () Bool)

(assert (=> b!409704 m!400515))

(check-sat (not mapNonEmpty!17322) tp_is_empty!10467 (not b!409704) (not b!409695) (not b!409702) b_and!16701 (not b!409697) (not start!39048) (not b!409693) (not b!409700) (not b!409706) (not b!409692) (not b_next!9315))
(check-sat b_and!16701 (not b_next!9315))
