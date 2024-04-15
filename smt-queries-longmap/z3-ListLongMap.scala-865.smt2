; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20290 () Bool)

(assert start!20290)

(declare-fun b_free!4945 () Bool)

(declare-fun b_next!4945 () Bool)

(assert (=> start!20290 (= b_free!4945 (not b_next!4945))))

(declare-fun tp!17866 () Bool)

(declare-fun b_and!11665 () Bool)

(assert (=> start!20290 (= tp!17866 b_and!11665)))

(declare-fun b!199577 () Bool)

(declare-fun e!130965 () Bool)

(declare-fun tp_is_empty!4801 () Bool)

(assert (=> b!199577 (= e!130965 tp_is_empty!4801)))

(declare-fun b!199578 () Bool)

(declare-fun res!94897 () Bool)

(declare-fun e!130964 () Bool)

(assert (=> b!199578 (=> (not res!94897) (not e!130964))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8823 0))(
  ( (array!8824 (arr!4161 (Array (_ BitVec 32) (_ BitVec 64))) (size!4487 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8823)

(assert (=> b!199578 (= res!94897 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4487 _keys!825))))))

(declare-fun mapNonEmpty!8270 () Bool)

(declare-fun mapRes!8270 () Bool)

(declare-fun tp!17867 () Bool)

(declare-fun e!130966 () Bool)

(assert (=> mapNonEmpty!8270 (= mapRes!8270 (and tp!17867 e!130966))))

(declare-fun mapKey!8270 () (_ BitVec 32))

(declare-datatypes ((V!6049 0))(
  ( (V!6050 (val!2445 Int)) )
))
(declare-datatypes ((ValueCell!2057 0))(
  ( (ValueCellFull!2057 (v!4409 V!6049)) (EmptyCell!2057) )
))
(declare-fun mapRest!8270 () (Array (_ BitVec 32) ValueCell!2057))

(declare-fun mapValue!8270 () ValueCell!2057)

(declare-datatypes ((array!8825 0))(
  ( (array!8826 (arr!4162 (Array (_ BitVec 32) ValueCell!2057)) (size!4488 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8825)

(assert (=> mapNonEmpty!8270 (= (arr!4162 _values!649) (store mapRest!8270 mapKey!8270 mapValue!8270))))

(declare-fun mapIsEmpty!8270 () Bool)

(assert (=> mapIsEmpty!8270 mapRes!8270))

(declare-fun b!199579 () Bool)

(assert (=> b!199579 (= e!130964 (not true))))

(declare-fun lt!98307 () array!8825)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6049)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3668 0))(
  ( (tuple2!3669 (_1!1845 (_ BitVec 64)) (_2!1845 V!6049)) )
))
(declare-datatypes ((List!2596 0))(
  ( (Nil!2593) (Cons!2592 (h!3234 tuple2!3668) (t!7518 List!2596)) )
))
(declare-datatypes ((ListLongMap!2571 0))(
  ( (ListLongMap!2572 (toList!1301 List!2596)) )
))
(declare-fun lt!98310 () ListLongMap!2571)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6049)

(declare-fun getCurrentListMap!871 (array!8823 array!8825 (_ BitVec 32) (_ BitVec 32) V!6049 V!6049 (_ BitVec 32) Int) ListLongMap!2571)

(assert (=> b!199579 (= lt!98310 (getCurrentListMap!871 _keys!825 lt!98307 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98309 () ListLongMap!2571)

(declare-fun lt!98308 () ListLongMap!2571)

(assert (=> b!199579 (and (= lt!98309 lt!98308) (= lt!98308 lt!98309))))

(declare-fun v!520 () V!6049)

(declare-fun lt!98312 () ListLongMap!2571)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!350 (ListLongMap!2571 tuple2!3668) ListLongMap!2571)

(assert (=> b!199579 (= lt!98308 (+!350 lt!98312 (tuple2!3669 k0!843 v!520)))))

(declare-datatypes ((Unit!5952 0))(
  ( (Unit!5953) )
))
(declare-fun lt!98311 () Unit!5952)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!30 (array!8823 array!8825 (_ BitVec 32) (_ BitVec 32) V!6049 V!6049 (_ BitVec 32) (_ BitVec 64) V!6049 (_ BitVec 32) Int) Unit!5952)

(assert (=> b!199579 (= lt!98311 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!30 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!281 (array!8823 array!8825 (_ BitVec 32) (_ BitVec 32) V!6049 V!6049 (_ BitVec 32) Int) ListLongMap!2571)

(assert (=> b!199579 (= lt!98309 (getCurrentListMapNoExtraKeys!281 _keys!825 lt!98307 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199579 (= lt!98307 (array!8826 (store (arr!4162 _values!649) i!601 (ValueCellFull!2057 v!520)) (size!4488 _values!649)))))

(assert (=> b!199579 (= lt!98312 (getCurrentListMapNoExtraKeys!281 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!94896 () Bool)

(assert (=> start!20290 (=> (not res!94896) (not e!130964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20290 (= res!94896 (validMask!0 mask!1149))))

(assert (=> start!20290 e!130964))

(declare-fun e!130967 () Bool)

(declare-fun array_inv!2717 (array!8825) Bool)

(assert (=> start!20290 (and (array_inv!2717 _values!649) e!130967)))

(assert (=> start!20290 true))

(assert (=> start!20290 tp_is_empty!4801))

(declare-fun array_inv!2718 (array!8823) Bool)

(assert (=> start!20290 (array_inv!2718 _keys!825)))

(assert (=> start!20290 tp!17866))

(declare-fun b!199580 () Bool)

(assert (=> b!199580 (= e!130966 tp_is_empty!4801)))

(declare-fun b!199581 () Bool)

(declare-fun res!94895 () Bool)

(assert (=> b!199581 (=> (not res!94895) (not e!130964))))

(assert (=> b!199581 (= res!94895 (= (select (arr!4161 _keys!825) i!601) k0!843))))

(declare-fun b!199582 () Bool)

(declare-fun res!94894 () Bool)

(assert (=> b!199582 (=> (not res!94894) (not e!130964))))

(assert (=> b!199582 (= res!94894 (and (= (size!4488 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4487 _keys!825) (size!4488 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199583 () Bool)

(declare-fun res!94892 () Bool)

(assert (=> b!199583 (=> (not res!94892) (not e!130964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199583 (= res!94892 (validKeyInArray!0 k0!843))))

(declare-fun b!199584 () Bool)

(declare-fun res!94893 () Bool)

(assert (=> b!199584 (=> (not res!94893) (not e!130964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8823 (_ BitVec 32)) Bool)

(assert (=> b!199584 (= res!94893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199585 () Bool)

(assert (=> b!199585 (= e!130967 (and e!130965 mapRes!8270))))

(declare-fun condMapEmpty!8270 () Bool)

(declare-fun mapDefault!8270 () ValueCell!2057)

(assert (=> b!199585 (= condMapEmpty!8270 (= (arr!4162 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2057)) mapDefault!8270)))))

(declare-fun b!199586 () Bool)

(declare-fun res!94898 () Bool)

(assert (=> b!199586 (=> (not res!94898) (not e!130964))))

(declare-datatypes ((List!2597 0))(
  ( (Nil!2594) (Cons!2593 (h!3235 (_ BitVec 64)) (t!7519 List!2597)) )
))
(declare-fun arrayNoDuplicates!0 (array!8823 (_ BitVec 32) List!2597) Bool)

(assert (=> b!199586 (= res!94898 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2594))))

(assert (= (and start!20290 res!94896) b!199582))

(assert (= (and b!199582 res!94894) b!199584))

(assert (= (and b!199584 res!94893) b!199586))

(assert (= (and b!199586 res!94898) b!199578))

(assert (= (and b!199578 res!94897) b!199583))

(assert (= (and b!199583 res!94892) b!199581))

(assert (= (and b!199581 res!94895) b!199579))

(assert (= (and b!199585 condMapEmpty!8270) mapIsEmpty!8270))

(assert (= (and b!199585 (not condMapEmpty!8270)) mapNonEmpty!8270))

(get-info :version)

(assert (= (and mapNonEmpty!8270 ((_ is ValueCellFull!2057) mapValue!8270)) b!199580))

(assert (= (and b!199585 ((_ is ValueCellFull!2057) mapDefault!8270)) b!199577))

(assert (= start!20290 b!199585))

(declare-fun m!225555 () Bool)

(assert (=> mapNonEmpty!8270 m!225555))

(declare-fun m!225557 () Bool)

(assert (=> b!199586 m!225557))

(declare-fun m!225559 () Bool)

(assert (=> start!20290 m!225559))

(declare-fun m!225561 () Bool)

(assert (=> start!20290 m!225561))

(declare-fun m!225563 () Bool)

(assert (=> start!20290 m!225563))

(declare-fun m!225565 () Bool)

(assert (=> b!199579 m!225565))

(declare-fun m!225567 () Bool)

(assert (=> b!199579 m!225567))

(declare-fun m!225569 () Bool)

(assert (=> b!199579 m!225569))

(declare-fun m!225571 () Bool)

(assert (=> b!199579 m!225571))

(declare-fun m!225573 () Bool)

(assert (=> b!199579 m!225573))

(declare-fun m!225575 () Bool)

(assert (=> b!199579 m!225575))

(declare-fun m!225577 () Bool)

(assert (=> b!199581 m!225577))

(declare-fun m!225579 () Bool)

(assert (=> b!199584 m!225579))

(declare-fun m!225581 () Bool)

(assert (=> b!199583 m!225581))

(check-sat b_and!11665 (not mapNonEmpty!8270) (not b!199586) tp_is_empty!4801 (not start!20290) (not b!199584) (not b!199579) (not b_next!4945) (not b!199583))
(check-sat b_and!11665 (not b_next!4945))
