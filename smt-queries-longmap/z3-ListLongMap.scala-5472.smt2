; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72598 () Bool)

(assert start!72598)

(declare-fun b!842694 () Bool)

(declare-fun res!572763 () Bool)

(declare-fun e!470091 () Bool)

(assert (=> b!842694 (=> (not res!572763) (not e!470091))))

(declare-datatypes ((array!47581 0))(
  ( (array!47582 (arr!22822 (Array (_ BitVec 32) (_ BitVec 64))) (size!23264 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47581)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47581 (_ BitVec 32)) Bool)

(assert (=> b!842694 (= res!572763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842695 () Bool)

(declare-fun e!470094 () Bool)

(declare-fun e!470093 () Bool)

(declare-fun mapRes!25100 () Bool)

(assert (=> b!842695 (= e!470094 (and e!470093 mapRes!25100))))

(declare-fun condMapEmpty!25100 () Bool)

(declare-datatypes ((V!25937 0))(
  ( (V!25938 (val!7881 Int)) )
))
(declare-datatypes ((ValueCell!7394 0))(
  ( (ValueCellFull!7394 (v!10300 V!25937)) (EmptyCell!7394) )
))
(declare-datatypes ((array!47583 0))(
  ( (array!47584 (arr!22823 (Array (_ BitVec 32) ValueCell!7394)) (size!23265 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47583)

(declare-fun mapDefault!25100 () ValueCell!7394)

(assert (=> b!842695 (= condMapEmpty!25100 (= (arr!22823 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7394)) mapDefault!25100)))))

(declare-fun b!842696 () Bool)

(declare-fun tp_is_empty!15667 () Bool)

(assert (=> b!842696 (= e!470093 tp_is_empty!15667)))

(declare-fun b!842697 () Bool)

(declare-fun res!572762 () Bool)

(assert (=> b!842697 (=> (not res!572762) (not e!470091))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842697 (= res!572762 (and (= (size!23265 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23264 _keys!868) (size!23265 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842698 () Bool)

(declare-fun e!470090 () Bool)

(assert (=> b!842698 (= e!470090 tp_is_empty!15667)))

(declare-fun mapNonEmpty!25100 () Bool)

(declare-fun tp!48419 () Bool)

(assert (=> mapNonEmpty!25100 (= mapRes!25100 (and tp!48419 e!470090))))

(declare-fun mapRest!25100 () (Array (_ BitVec 32) ValueCell!7394))

(declare-fun mapValue!25100 () ValueCell!7394)

(declare-fun mapKey!25100 () (_ BitVec 32))

(assert (=> mapNonEmpty!25100 (= (arr!22823 _values!688) (store mapRest!25100 mapKey!25100 mapValue!25100))))

(declare-fun mapIsEmpty!25100 () Bool)

(assert (=> mapIsEmpty!25100 mapRes!25100))

(declare-fun res!572761 () Bool)

(assert (=> start!72598 (=> (not res!572761) (not e!470091))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72598 (= res!572761 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23264 _keys!868))))))

(assert (=> start!72598 e!470091))

(assert (=> start!72598 true))

(declare-fun array_inv!18228 (array!47581) Bool)

(assert (=> start!72598 (array_inv!18228 _keys!868)))

(declare-fun array_inv!18229 (array!47583) Bool)

(assert (=> start!72598 (and (array_inv!18229 _values!688) e!470094)))

(declare-fun b!842699 () Bool)

(assert (=> b!842699 (= e!470091 false)))

(declare-fun lt!380831 () Bool)

(declare-datatypes ((List!16239 0))(
  ( (Nil!16236) (Cons!16235 (h!17366 (_ BitVec 64)) (t!22601 List!16239)) )
))
(declare-fun arrayNoDuplicates!0 (array!47581 (_ BitVec 32) List!16239) Bool)

(assert (=> b!842699 (= lt!380831 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16236))))

(declare-fun b!842700 () Bool)

(declare-fun res!572760 () Bool)

(assert (=> b!842700 (=> (not res!572760) (not e!470091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842700 (= res!572760 (validMask!0 mask!1196))))

(assert (= (and start!72598 res!572761) b!842700))

(assert (= (and b!842700 res!572760) b!842697))

(assert (= (and b!842697 res!572762) b!842694))

(assert (= (and b!842694 res!572763) b!842699))

(assert (= (and b!842695 condMapEmpty!25100) mapIsEmpty!25100))

(assert (= (and b!842695 (not condMapEmpty!25100)) mapNonEmpty!25100))

(get-info :version)

(assert (= (and mapNonEmpty!25100 ((_ is ValueCellFull!7394) mapValue!25100)) b!842698))

(assert (= (and b!842695 ((_ is ValueCellFull!7394) mapDefault!25100)) b!842696))

(assert (= start!72598 b!842695))

(declare-fun m!785075 () Bool)

(assert (=> mapNonEmpty!25100 m!785075))

(declare-fun m!785077 () Bool)

(assert (=> b!842699 m!785077))

(declare-fun m!785079 () Bool)

(assert (=> b!842694 m!785079))

(declare-fun m!785081 () Bool)

(assert (=> start!72598 m!785081))

(declare-fun m!785083 () Bool)

(assert (=> start!72598 m!785083))

(declare-fun m!785085 () Bool)

(assert (=> b!842700 m!785085))

(check-sat (not b!842700) (not b!842699) tp_is_empty!15667 (not start!72598) (not mapNonEmpty!25100) (not b!842694))
(check-sat)
