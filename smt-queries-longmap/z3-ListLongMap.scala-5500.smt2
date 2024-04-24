; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72952 () Bool)

(assert start!72952)

(declare-fun mapNonEmpty!25352 () Bool)

(declare-fun mapRes!25352 () Bool)

(declare-fun tp!48671 () Bool)

(declare-fun e!472084 () Bool)

(assert (=> mapNonEmpty!25352 (= mapRes!25352 (and tp!48671 e!472084))))

(declare-datatypes ((V!26161 0))(
  ( (V!26162 (val!7965 Int)) )
))
(declare-datatypes ((ValueCell!7478 0))(
  ( (ValueCellFull!7478 (v!10390 V!26161)) (EmptyCell!7478) )
))
(declare-fun mapRest!25352 () (Array (_ BitVec 32) ValueCell!7478))

(declare-datatypes ((array!47939 0))(
  ( (array!47940 (arr!22996 (Array (_ BitVec 32) ValueCell!7478)) (size!23437 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47939)

(declare-fun mapValue!25352 () ValueCell!7478)

(declare-fun mapKey!25352 () (_ BitVec 32))

(assert (=> mapNonEmpty!25352 (= (arr!22996 _values!688) (store mapRest!25352 mapKey!25352 mapValue!25352))))

(declare-fun b!845600 () Bool)

(declare-fun res!574224 () Bool)

(declare-fun e!472081 () Bool)

(assert (=> b!845600 (=> (not res!574224) (not e!472081))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845600 (= res!574224 (validMask!0 mask!1196))))

(declare-fun res!574223 () Bool)

(assert (=> start!72952 (=> (not res!574223) (not e!472081))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47941 0))(
  ( (array!47942 (arr!22997 (Array (_ BitVec 32) (_ BitVec 64))) (size!23438 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47941)

(assert (=> start!72952 (= res!574223 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23438 _keys!868))))))

(assert (=> start!72952 e!472081))

(assert (=> start!72952 true))

(declare-fun array_inv!18328 (array!47941) Bool)

(assert (=> start!72952 (array_inv!18328 _keys!868)))

(declare-fun e!472082 () Bool)

(declare-fun array_inv!18329 (array!47939) Bool)

(assert (=> start!72952 (and (array_inv!18329 _values!688) e!472082)))

(declare-fun b!845601 () Bool)

(declare-fun e!472080 () Bool)

(declare-fun tp_is_empty!15835 () Bool)

(assert (=> b!845601 (= e!472080 tp_is_empty!15835)))

(declare-fun b!845602 () Bool)

(assert (=> b!845602 (= e!472081 false)))

(declare-fun lt!381680 () Bool)

(declare-datatypes ((List!16207 0))(
  ( (Nil!16204) (Cons!16203 (h!17340 (_ BitVec 64)) (t!22570 List!16207)) )
))
(declare-fun arrayNoDuplicates!0 (array!47941 (_ BitVec 32) List!16207) Bool)

(assert (=> b!845602 (= lt!381680 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16204))))

(declare-fun mapIsEmpty!25352 () Bool)

(assert (=> mapIsEmpty!25352 mapRes!25352))

(declare-fun b!845603 () Bool)

(declare-fun res!574225 () Bool)

(assert (=> b!845603 (=> (not res!574225) (not e!472081))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845603 (= res!574225 (and (= (size!23437 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23438 _keys!868) (size!23437 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845604 () Bool)

(declare-fun res!574222 () Bool)

(assert (=> b!845604 (=> (not res!574222) (not e!472081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47941 (_ BitVec 32)) Bool)

(assert (=> b!845604 (= res!574222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845605 () Bool)

(assert (=> b!845605 (= e!472084 tp_is_empty!15835)))

(declare-fun b!845606 () Bool)

(assert (=> b!845606 (= e!472082 (and e!472080 mapRes!25352))))

(declare-fun condMapEmpty!25352 () Bool)

(declare-fun mapDefault!25352 () ValueCell!7478)

(assert (=> b!845606 (= condMapEmpty!25352 (= (arr!22996 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7478)) mapDefault!25352)))))

(assert (= (and start!72952 res!574223) b!845600))

(assert (= (and b!845600 res!574224) b!845603))

(assert (= (and b!845603 res!574225) b!845604))

(assert (= (and b!845604 res!574222) b!845602))

(assert (= (and b!845606 condMapEmpty!25352) mapIsEmpty!25352))

(assert (= (and b!845606 (not condMapEmpty!25352)) mapNonEmpty!25352))

(get-info :version)

(assert (= (and mapNonEmpty!25352 ((_ is ValueCellFull!7478) mapValue!25352)) b!845605))

(assert (= (and b!845606 ((_ is ValueCellFull!7478) mapDefault!25352)) b!845601))

(assert (= start!72952 b!845606))

(declare-fun m!788129 () Bool)

(assert (=> start!72952 m!788129))

(declare-fun m!788131 () Bool)

(assert (=> start!72952 m!788131))

(declare-fun m!788133 () Bool)

(assert (=> b!845604 m!788133))

(declare-fun m!788135 () Bool)

(assert (=> mapNonEmpty!25352 m!788135))

(declare-fun m!788137 () Bool)

(assert (=> b!845602 m!788137))

(declare-fun m!788139 () Bool)

(assert (=> b!845600 m!788139))

(check-sat (not mapNonEmpty!25352) (not start!72952) tp_is_empty!15835 (not b!845602) (not b!845600) (not b!845604))
(check-sat)
