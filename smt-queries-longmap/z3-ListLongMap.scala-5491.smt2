; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72732 () Bool)

(assert start!72732)

(declare-fun b!844151 () Bool)

(declare-fun e!471108 () Bool)

(declare-fun tp_is_empty!15783 () Bool)

(assert (=> b!844151 (= e!471108 tp_is_empty!15783)))

(declare-fun res!573568 () Bool)

(declare-fun e!471110 () Bool)

(assert (=> start!72732 (=> (not res!573568) (not e!471110))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47804 0))(
  ( (array!47805 (arr!22933 (Array (_ BitVec 32) (_ BitVec 64))) (size!23373 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47804)

(assert (=> start!72732 (= res!573568 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23373 _keys!868))))))

(assert (=> start!72732 e!471110))

(assert (=> start!72732 true))

(declare-fun array_inv!18238 (array!47804) Bool)

(assert (=> start!72732 (array_inv!18238 _keys!868)))

(declare-datatypes ((V!26091 0))(
  ( (V!26092 (val!7939 Int)) )
))
(declare-datatypes ((ValueCell!7452 0))(
  ( (ValueCellFull!7452 (v!10364 V!26091)) (EmptyCell!7452) )
))
(declare-datatypes ((array!47806 0))(
  ( (array!47807 (arr!22934 (Array (_ BitVec 32) ValueCell!7452)) (size!23374 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47806)

(declare-fun e!471112 () Bool)

(declare-fun array_inv!18239 (array!47806) Bool)

(assert (=> start!72732 (and (array_inv!18239 _values!688) e!471112)))

(declare-fun b!844152 () Bool)

(declare-fun mapRes!25274 () Bool)

(assert (=> b!844152 (= e!471112 (and e!471108 mapRes!25274))))

(declare-fun condMapEmpty!25274 () Bool)

(declare-fun mapDefault!25274 () ValueCell!7452)

(assert (=> b!844152 (= condMapEmpty!25274 (= (arr!22934 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7452)) mapDefault!25274)))))

(declare-fun b!844153 () Bool)

(declare-fun e!471109 () Bool)

(assert (=> b!844153 (= e!471109 tp_is_empty!15783)))

(declare-fun b!844154 () Bool)

(assert (=> b!844154 (= e!471110 false)))

(declare-fun lt!381241 () Bool)

(declare-datatypes ((List!16262 0))(
  ( (Nil!16259) (Cons!16258 (h!17389 (_ BitVec 64)) (t!22633 List!16262)) )
))
(declare-fun arrayNoDuplicates!0 (array!47804 (_ BitVec 32) List!16262) Bool)

(assert (=> b!844154 (= lt!381241 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16259))))

(declare-fun b!844155 () Bool)

(declare-fun res!573569 () Bool)

(assert (=> b!844155 (=> (not res!573569) (not e!471110))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47804 (_ BitVec 32)) Bool)

(assert (=> b!844155 (= res!573569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844156 () Bool)

(declare-fun res!573567 () Bool)

(assert (=> b!844156 (=> (not res!573567) (not e!471110))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844156 (= res!573567 (and (= (size!23374 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23373 _keys!868) (size!23374 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25274 () Bool)

(declare-fun tp!48592 () Bool)

(assert (=> mapNonEmpty!25274 (= mapRes!25274 (and tp!48592 e!471109))))

(declare-fun mapRest!25274 () (Array (_ BitVec 32) ValueCell!7452))

(declare-fun mapKey!25274 () (_ BitVec 32))

(declare-fun mapValue!25274 () ValueCell!7452)

(assert (=> mapNonEmpty!25274 (= (arr!22934 _values!688) (store mapRest!25274 mapKey!25274 mapValue!25274))))

(declare-fun b!844157 () Bool)

(declare-fun res!573566 () Bool)

(assert (=> b!844157 (=> (not res!573566) (not e!471110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844157 (= res!573566 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25274 () Bool)

(assert (=> mapIsEmpty!25274 mapRes!25274))

(assert (= (and start!72732 res!573568) b!844157))

(assert (= (and b!844157 res!573566) b!844156))

(assert (= (and b!844156 res!573567) b!844155))

(assert (= (and b!844155 res!573569) b!844154))

(assert (= (and b!844152 condMapEmpty!25274) mapIsEmpty!25274))

(assert (= (and b!844152 (not condMapEmpty!25274)) mapNonEmpty!25274))

(get-info :version)

(assert (= (and mapNonEmpty!25274 ((_ is ValueCellFull!7452) mapValue!25274)) b!844153))

(assert (= (and b!844152 ((_ is ValueCellFull!7452) mapDefault!25274)) b!844151))

(assert (= start!72732 b!844152))

(declare-fun m!786525 () Bool)

(assert (=> b!844154 m!786525))

(declare-fun m!786527 () Bool)

(assert (=> start!72732 m!786527))

(declare-fun m!786529 () Bool)

(assert (=> start!72732 m!786529))

(declare-fun m!786531 () Bool)

(assert (=> b!844155 m!786531))

(declare-fun m!786533 () Bool)

(assert (=> mapNonEmpty!25274 m!786533))

(declare-fun m!786535 () Bool)

(assert (=> b!844157 m!786535))

(check-sat (not b!844157) (not start!72732) (not mapNonEmpty!25274) (not b!844155) (not b!844154) tp_is_empty!15783)
(check-sat)
