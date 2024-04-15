; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72610 () Bool)

(assert start!72610)

(declare-fun b!842820 () Bool)

(declare-fun e!470180 () Bool)

(declare-fun tp_is_empty!15679 () Bool)

(assert (=> b!842820 (= e!470180 tp_is_empty!15679)))

(declare-fun mapIsEmpty!25118 () Bool)

(declare-fun mapRes!25118 () Bool)

(assert (=> mapIsEmpty!25118 mapRes!25118))

(declare-fun b!842821 () Bool)

(declare-fun e!470182 () Bool)

(assert (=> b!842821 (= e!470182 tp_is_empty!15679)))

(declare-fun b!842822 () Bool)

(declare-fun res!572833 () Bool)

(declare-fun e!470184 () Bool)

(assert (=> b!842822 (=> (not res!572833) (not e!470184))))

(declare-datatypes ((array!47603 0))(
  ( (array!47604 (arr!22833 (Array (_ BitVec 32) (_ BitVec 64))) (size!23275 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47603)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47603 (_ BitVec 32)) Bool)

(assert (=> b!842822 (= res!572833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25118 () Bool)

(declare-fun tp!48437 () Bool)

(assert (=> mapNonEmpty!25118 (= mapRes!25118 (and tp!48437 e!470182))))

(declare-datatypes ((V!25953 0))(
  ( (V!25954 (val!7887 Int)) )
))
(declare-datatypes ((ValueCell!7400 0))(
  ( (ValueCellFull!7400 (v!10306 V!25953)) (EmptyCell!7400) )
))
(declare-fun mapValue!25118 () ValueCell!7400)

(declare-fun mapRest!25118 () (Array (_ BitVec 32) ValueCell!7400))

(declare-fun mapKey!25118 () (_ BitVec 32))

(declare-datatypes ((array!47605 0))(
  ( (array!47606 (arr!22834 (Array (_ BitVec 32) ValueCell!7400)) (size!23276 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47605)

(assert (=> mapNonEmpty!25118 (= (arr!22834 _values!688) (store mapRest!25118 mapKey!25118 mapValue!25118))))

(declare-fun b!842824 () Bool)

(assert (=> b!842824 (= e!470184 false)))

(declare-fun lt!380849 () Bool)

(declare-datatypes ((List!16242 0))(
  ( (Nil!16239) (Cons!16238 (h!17369 (_ BitVec 64)) (t!22604 List!16242)) )
))
(declare-fun arrayNoDuplicates!0 (array!47603 (_ BitVec 32) List!16242) Bool)

(assert (=> b!842824 (= lt!380849 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16239))))

(declare-fun b!842825 () Bool)

(declare-fun res!572834 () Bool)

(assert (=> b!842825 (=> (not res!572834) (not e!470184))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842825 (= res!572834 (and (= (size!23276 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23275 _keys!868) (size!23276 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842826 () Bool)

(declare-fun e!470183 () Bool)

(assert (=> b!842826 (= e!470183 (and e!470180 mapRes!25118))))

(declare-fun condMapEmpty!25118 () Bool)

(declare-fun mapDefault!25118 () ValueCell!7400)

(assert (=> b!842826 (= condMapEmpty!25118 (= (arr!22834 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7400)) mapDefault!25118)))))

(declare-fun res!572832 () Bool)

(assert (=> start!72610 (=> (not res!572832) (not e!470184))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72610 (= res!572832 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23275 _keys!868))))))

(assert (=> start!72610 e!470184))

(assert (=> start!72610 true))

(declare-fun array_inv!18236 (array!47603) Bool)

(assert (=> start!72610 (array_inv!18236 _keys!868)))

(declare-fun array_inv!18237 (array!47605) Bool)

(assert (=> start!72610 (and (array_inv!18237 _values!688) e!470183)))

(declare-fun b!842823 () Bool)

(declare-fun res!572835 () Bool)

(assert (=> b!842823 (=> (not res!572835) (not e!470184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842823 (= res!572835 (validMask!0 mask!1196))))

(assert (= (and start!72610 res!572832) b!842823))

(assert (= (and b!842823 res!572835) b!842825))

(assert (= (and b!842825 res!572834) b!842822))

(assert (= (and b!842822 res!572833) b!842824))

(assert (= (and b!842826 condMapEmpty!25118) mapIsEmpty!25118))

(assert (= (and b!842826 (not condMapEmpty!25118)) mapNonEmpty!25118))

(get-info :version)

(assert (= (and mapNonEmpty!25118 ((_ is ValueCellFull!7400) mapValue!25118)) b!842821))

(assert (= (and b!842826 ((_ is ValueCellFull!7400) mapDefault!25118)) b!842820))

(assert (= start!72610 b!842826))

(declare-fun m!785147 () Bool)

(assert (=> b!842822 m!785147))

(declare-fun m!785149 () Bool)

(assert (=> start!72610 m!785149))

(declare-fun m!785151 () Bool)

(assert (=> start!72610 m!785151))

(declare-fun m!785153 () Bool)

(assert (=> b!842824 m!785153))

(declare-fun m!785155 () Bool)

(assert (=> b!842823 m!785155))

(declare-fun m!785157 () Bool)

(assert (=> mapNonEmpty!25118 m!785157))

(check-sat (not b!842823) (not mapNonEmpty!25118) (not b!842822) (not start!72610) (not b!842824) tp_is_empty!15679)
(check-sat)
