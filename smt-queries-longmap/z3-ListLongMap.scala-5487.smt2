; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72874 () Bool)

(assert start!72874)

(declare-fun b!844781 () Bool)

(declare-fun e!471497 () Bool)

(declare-fun e!471495 () Bool)

(declare-fun mapRes!25235 () Bool)

(assert (=> b!844781 (= e!471497 (and e!471495 mapRes!25235))))

(declare-fun condMapEmpty!25235 () Bool)

(declare-datatypes ((V!26057 0))(
  ( (V!26058 (val!7926 Int)) )
))
(declare-datatypes ((ValueCell!7439 0))(
  ( (ValueCellFull!7439 (v!10351 V!26057)) (EmptyCell!7439) )
))
(declare-datatypes ((array!47793 0))(
  ( (array!47794 (arr!22923 (Array (_ BitVec 32) ValueCell!7439)) (size!23364 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47793)

(declare-fun mapDefault!25235 () ValueCell!7439)

(assert (=> b!844781 (= condMapEmpty!25235 (= (arr!22923 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7439)) mapDefault!25235)))))

(declare-fun b!844782 () Bool)

(declare-fun e!471496 () Bool)

(declare-fun tp_is_empty!15757 () Bool)

(assert (=> b!844782 (= e!471496 tp_is_empty!15757)))

(declare-fun mapIsEmpty!25235 () Bool)

(assert (=> mapIsEmpty!25235 mapRes!25235))

(declare-fun res!573757 () Bool)

(declare-fun e!471499 () Bool)

(assert (=> start!72874 (=> (not res!573757) (not e!471499))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47795 0))(
  ( (array!47796 (arr!22924 (Array (_ BitVec 32) (_ BitVec 64))) (size!23365 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47795)

(assert (=> start!72874 (= res!573757 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23365 _keys!868))))))

(assert (=> start!72874 e!471499))

(assert (=> start!72874 true))

(declare-fun array_inv!18280 (array!47795) Bool)

(assert (=> start!72874 (array_inv!18280 _keys!868)))

(declare-fun array_inv!18281 (array!47793) Bool)

(assert (=> start!72874 (and (array_inv!18281 _values!688) e!471497)))

(declare-fun mapNonEmpty!25235 () Bool)

(declare-fun tp!48554 () Bool)

(assert (=> mapNonEmpty!25235 (= mapRes!25235 (and tp!48554 e!471496))))

(declare-fun mapRest!25235 () (Array (_ BitVec 32) ValueCell!7439))

(declare-fun mapKey!25235 () (_ BitVec 32))

(declare-fun mapValue!25235 () ValueCell!7439)

(assert (=> mapNonEmpty!25235 (= (arr!22923 _values!688) (store mapRest!25235 mapKey!25235 mapValue!25235))))

(declare-fun b!844783 () Bool)

(declare-fun res!573755 () Bool)

(assert (=> b!844783 (=> (not res!573755) (not e!471499))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47795 (_ BitVec 32)) Bool)

(assert (=> b!844783 (= res!573755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844784 () Bool)

(declare-fun res!573756 () Bool)

(assert (=> b!844784 (=> (not res!573756) (not e!471499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844784 (= res!573756 (validMask!0 mask!1196))))

(declare-fun b!844785 () Bool)

(declare-fun res!573754 () Bool)

(assert (=> b!844785 (=> (not res!573754) (not e!471499))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844785 (= res!573754 (and (= (size!23364 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23365 _keys!868) (size!23364 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844786 () Bool)

(assert (=> b!844786 (= e!471499 false)))

(declare-fun lt!381563 () Bool)

(declare-datatypes ((List!16182 0))(
  ( (Nil!16179) (Cons!16178 (h!17315 (_ BitVec 64)) (t!22545 List!16182)) )
))
(declare-fun arrayNoDuplicates!0 (array!47795 (_ BitVec 32) List!16182) Bool)

(assert (=> b!844786 (= lt!381563 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16179))))

(declare-fun b!844787 () Bool)

(assert (=> b!844787 (= e!471495 tp_is_empty!15757)))

(assert (= (and start!72874 res!573757) b!844784))

(assert (= (and b!844784 res!573756) b!844785))

(assert (= (and b!844785 res!573754) b!844783))

(assert (= (and b!844783 res!573755) b!844786))

(assert (= (and b!844781 condMapEmpty!25235) mapIsEmpty!25235))

(assert (= (and b!844781 (not condMapEmpty!25235)) mapNonEmpty!25235))

(get-info :version)

(assert (= (and mapNonEmpty!25235 ((_ is ValueCellFull!7439) mapValue!25235)) b!844782))

(assert (= (and b!844781 ((_ is ValueCellFull!7439) mapDefault!25235)) b!844787))

(assert (= start!72874 b!844781))

(declare-fun m!787661 () Bool)

(assert (=> b!844783 m!787661))

(declare-fun m!787663 () Bool)

(assert (=> b!844786 m!787663))

(declare-fun m!787665 () Bool)

(assert (=> mapNonEmpty!25235 m!787665))

(declare-fun m!787667 () Bool)

(assert (=> start!72874 m!787667))

(declare-fun m!787669 () Bool)

(assert (=> start!72874 m!787669))

(declare-fun m!787671 () Bool)

(assert (=> b!844784 m!787671))

(check-sat (not b!844784) (not mapNonEmpty!25235) (not b!844786) (not b!844783) (not start!72874) tp_is_empty!15757)
(check-sat)
