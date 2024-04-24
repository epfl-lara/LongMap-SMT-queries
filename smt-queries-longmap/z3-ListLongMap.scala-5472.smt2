; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72784 () Bool)

(assert start!72784)

(declare-fun b!843836 () Bool)

(declare-fun res!573215 () Bool)

(declare-fun e!470823 () Bool)

(assert (=> b!843836 (=> (not res!573215) (not e!470823))))

(declare-datatypes ((array!47621 0))(
  ( (array!47622 (arr!22837 (Array (_ BitVec 32) (_ BitVec 64))) (size!23278 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47621)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47621 (_ BitVec 32)) Bool)

(assert (=> b!843836 (= res!573215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573216 () Bool)

(assert (=> start!72784 (=> (not res!573216) (not e!470823))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72784 (= res!573216 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23278 _keys!868))))))

(assert (=> start!72784 e!470823))

(assert (=> start!72784 true))

(declare-fun array_inv!18216 (array!47621) Bool)

(assert (=> start!72784 (array_inv!18216 _keys!868)))

(declare-datatypes ((V!25937 0))(
  ( (V!25938 (val!7881 Int)) )
))
(declare-datatypes ((ValueCell!7394 0))(
  ( (ValueCellFull!7394 (v!10306 V!25937)) (EmptyCell!7394) )
))
(declare-datatypes ((array!47623 0))(
  ( (array!47624 (arr!22838 (Array (_ BitVec 32) ValueCell!7394)) (size!23279 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47623)

(declare-fun e!470822 () Bool)

(declare-fun array_inv!18217 (array!47623) Bool)

(assert (=> start!72784 (and (array_inv!18217 _values!688) e!470822)))

(declare-fun b!843837 () Bool)

(declare-fun res!573217 () Bool)

(assert (=> b!843837 (=> (not res!573217) (not e!470823))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843837 (= res!573217 (and (= (size!23279 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23278 _keys!868) (size!23279 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843838 () Bool)

(declare-fun e!470821 () Bool)

(declare-fun tp_is_empty!15667 () Bool)

(assert (=> b!843838 (= e!470821 tp_is_empty!15667)))

(declare-fun mapNonEmpty!25100 () Bool)

(declare-fun mapRes!25100 () Bool)

(declare-fun tp!48419 () Bool)

(declare-fun e!470820 () Bool)

(assert (=> mapNonEmpty!25100 (= mapRes!25100 (and tp!48419 e!470820))))

(declare-fun mapValue!25100 () ValueCell!7394)

(declare-fun mapRest!25100 () (Array (_ BitVec 32) ValueCell!7394))

(declare-fun mapKey!25100 () (_ BitVec 32))

(assert (=> mapNonEmpty!25100 (= (arr!22838 _values!688) (store mapRest!25100 mapKey!25100 mapValue!25100))))

(declare-fun b!843839 () Bool)

(assert (=> b!843839 (= e!470823 false)))

(declare-fun lt!381428 () Bool)

(declare-datatypes ((List!16151 0))(
  ( (Nil!16148) (Cons!16147 (h!17284 (_ BitVec 64)) (t!22514 List!16151)) )
))
(declare-fun arrayNoDuplicates!0 (array!47621 (_ BitVec 32) List!16151) Bool)

(assert (=> b!843839 (= lt!381428 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16148))))

(declare-fun mapIsEmpty!25100 () Bool)

(assert (=> mapIsEmpty!25100 mapRes!25100))

(declare-fun b!843840 () Bool)

(assert (=> b!843840 (= e!470822 (and e!470821 mapRes!25100))))

(declare-fun condMapEmpty!25100 () Bool)

(declare-fun mapDefault!25100 () ValueCell!7394)

(assert (=> b!843840 (= condMapEmpty!25100 (= (arr!22838 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7394)) mapDefault!25100)))))

(declare-fun b!843841 () Bool)

(assert (=> b!843841 (= e!470820 tp_is_empty!15667)))

(declare-fun b!843842 () Bool)

(declare-fun res!573214 () Bool)

(assert (=> b!843842 (=> (not res!573214) (not e!470823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843842 (= res!573214 (validMask!0 mask!1196))))

(assert (= (and start!72784 res!573216) b!843842))

(assert (= (and b!843842 res!573214) b!843837))

(assert (= (and b!843837 res!573217) b!843836))

(assert (= (and b!843836 res!573215) b!843839))

(assert (= (and b!843840 condMapEmpty!25100) mapIsEmpty!25100))

(assert (= (and b!843840 (not condMapEmpty!25100)) mapNonEmpty!25100))

(get-info :version)

(assert (= (and mapNonEmpty!25100 ((_ is ValueCellFull!7394) mapValue!25100)) b!843841))

(assert (= (and b!843840 ((_ is ValueCellFull!7394) mapDefault!25100)) b!843838))

(assert (= start!72784 b!843840))

(declare-fun m!787121 () Bool)

(assert (=> start!72784 m!787121))

(declare-fun m!787123 () Bool)

(assert (=> start!72784 m!787123))

(declare-fun m!787125 () Bool)

(assert (=> mapNonEmpty!25100 m!787125))

(declare-fun m!787127 () Bool)

(assert (=> b!843839 m!787127))

(declare-fun m!787129 () Bool)

(assert (=> b!843842 m!787129))

(declare-fun m!787131 () Bool)

(assert (=> b!843836 m!787131))

(check-sat (not b!843836) (not start!72784) (not b!843839) (not b!843842) tp_is_empty!15667 (not mapNonEmpty!25100))
(check-sat)
