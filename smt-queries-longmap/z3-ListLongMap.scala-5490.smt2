; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72892 () Bool)

(assert start!72892)

(declare-fun b!844970 () Bool)

(declare-fun e!471631 () Bool)

(declare-fun e!471632 () Bool)

(declare-fun mapRes!25262 () Bool)

(assert (=> b!844970 (= e!471631 (and e!471632 mapRes!25262))))

(declare-fun condMapEmpty!25262 () Bool)

(declare-datatypes ((V!26081 0))(
  ( (V!26082 (val!7935 Int)) )
))
(declare-datatypes ((ValueCell!7448 0))(
  ( (ValueCellFull!7448 (v!10360 V!26081)) (EmptyCell!7448) )
))
(declare-datatypes ((array!47825 0))(
  ( (array!47826 (arr!22939 (Array (_ BitVec 32) ValueCell!7448)) (size!23380 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47825)

(declare-fun mapDefault!25262 () ValueCell!7448)

(assert (=> b!844970 (= condMapEmpty!25262 (= (arr!22939 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7448)) mapDefault!25262)))))

(declare-fun b!844971 () Bool)

(declare-fun res!573864 () Bool)

(declare-fun e!471630 () Bool)

(assert (=> b!844971 (=> (not res!573864) (not e!471630))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47827 0))(
  ( (array!47828 (arr!22940 (Array (_ BitVec 32) (_ BitVec 64))) (size!23381 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47827)

(assert (=> b!844971 (= res!573864 (and (= (size!23380 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23381 _keys!868) (size!23380 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25262 () Bool)

(declare-fun tp!48581 () Bool)

(declare-fun e!471634 () Bool)

(assert (=> mapNonEmpty!25262 (= mapRes!25262 (and tp!48581 e!471634))))

(declare-fun mapValue!25262 () ValueCell!7448)

(declare-fun mapRest!25262 () (Array (_ BitVec 32) ValueCell!7448))

(declare-fun mapKey!25262 () (_ BitVec 32))

(assert (=> mapNonEmpty!25262 (= (arr!22939 _values!688) (store mapRest!25262 mapKey!25262 mapValue!25262))))

(declare-fun b!844972 () Bool)

(declare-fun res!573863 () Bool)

(assert (=> b!844972 (=> (not res!573863) (not e!471630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844972 (= res!573863 (validMask!0 mask!1196))))

(declare-fun b!844973 () Bool)

(declare-fun tp_is_empty!15775 () Bool)

(assert (=> b!844973 (= e!471634 tp_is_empty!15775)))

(declare-fun b!844974 () Bool)

(assert (=> b!844974 (= e!471630 false)))

(declare-fun lt!381590 () Bool)

(declare-datatypes ((List!16187 0))(
  ( (Nil!16184) (Cons!16183 (h!17320 (_ BitVec 64)) (t!22550 List!16187)) )
))
(declare-fun arrayNoDuplicates!0 (array!47827 (_ BitVec 32) List!16187) Bool)

(assert (=> b!844974 (= lt!381590 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16184))))

(declare-fun mapIsEmpty!25262 () Bool)

(assert (=> mapIsEmpty!25262 mapRes!25262))

(declare-fun res!573865 () Bool)

(assert (=> start!72892 (=> (not res!573865) (not e!471630))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72892 (= res!573865 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23381 _keys!868))))))

(assert (=> start!72892 e!471630))

(assert (=> start!72892 true))

(declare-fun array_inv!18292 (array!47827) Bool)

(assert (=> start!72892 (array_inv!18292 _keys!868)))

(declare-fun array_inv!18293 (array!47825) Bool)

(assert (=> start!72892 (and (array_inv!18293 _values!688) e!471631)))

(declare-fun b!844975 () Bool)

(assert (=> b!844975 (= e!471632 tp_is_empty!15775)))

(declare-fun b!844976 () Bool)

(declare-fun res!573862 () Bool)

(assert (=> b!844976 (=> (not res!573862) (not e!471630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47827 (_ BitVec 32)) Bool)

(assert (=> b!844976 (= res!573862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72892 res!573865) b!844972))

(assert (= (and b!844972 res!573863) b!844971))

(assert (= (and b!844971 res!573864) b!844976))

(assert (= (and b!844976 res!573862) b!844974))

(assert (= (and b!844970 condMapEmpty!25262) mapIsEmpty!25262))

(assert (= (and b!844970 (not condMapEmpty!25262)) mapNonEmpty!25262))

(get-info :version)

(assert (= (and mapNonEmpty!25262 ((_ is ValueCellFull!7448) mapValue!25262)) b!844973))

(assert (= (and b!844970 ((_ is ValueCellFull!7448) mapDefault!25262)) b!844975))

(assert (= start!72892 b!844970))

(declare-fun m!787769 () Bool)

(assert (=> b!844976 m!787769))

(declare-fun m!787771 () Bool)

(assert (=> b!844974 m!787771))

(declare-fun m!787773 () Bool)

(assert (=> start!72892 m!787773))

(declare-fun m!787775 () Bool)

(assert (=> start!72892 m!787775))

(declare-fun m!787777 () Bool)

(assert (=> b!844972 m!787777))

(declare-fun m!787779 () Bool)

(assert (=> mapNonEmpty!25262 m!787779))

(check-sat tp_is_empty!15775 (not b!844974) (not mapNonEmpty!25262) (not b!844972) (not start!72892) (not b!844976))
(check-sat)
