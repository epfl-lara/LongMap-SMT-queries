; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72330 () Bool)

(assert start!72330)

(declare-fun mapNonEmpty!24671 () Bool)

(declare-fun mapRes!24671 () Bool)

(declare-fun tp!47665 () Bool)

(declare-fun e!467771 () Bool)

(assert (=> mapNonEmpty!24671 (= mapRes!24671 (and tp!47665 e!467771))))

(declare-datatypes ((V!25555 0))(
  ( (V!25556 (val!7738 Int)) )
))
(declare-datatypes ((ValueCell!7251 0))(
  ( (ValueCellFull!7251 (v!10163 V!25555)) (EmptyCell!7251) )
))
(declare-fun mapRest!24671 () (Array (_ BitVec 32) ValueCell!7251))

(declare-fun mapKey!24671 () (_ BitVec 32))

(declare-fun mapValue!24671 () ValueCell!7251)

(declare-datatypes ((array!47056 0))(
  ( (array!47057 (arr!22559 (Array (_ BitVec 32) ValueCell!7251)) (size!22999 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47056)

(assert (=> mapNonEmpty!24671 (= (arr!22559 _values!688) (store mapRest!24671 mapKey!24671 mapValue!24671))))

(declare-fun b!837986 () Bool)

(declare-fun e!467770 () Bool)

(declare-fun tp_is_empty!15381 () Bool)

(assert (=> b!837986 (= e!467770 tp_is_empty!15381)))

(declare-fun mapIsEmpty!24671 () Bool)

(assert (=> mapIsEmpty!24671 mapRes!24671))

(declare-fun b!837987 () Bool)

(declare-fun e!467773 () Bool)

(assert (=> b!837987 (= e!467773 (and e!467770 mapRes!24671))))

(declare-fun condMapEmpty!24671 () Bool)

(declare-fun mapDefault!24671 () ValueCell!7251)

(assert (=> b!837987 (= condMapEmpty!24671 (= (arr!22559 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7251)) mapDefault!24671)))))

(declare-fun b!837988 () Bool)

(declare-fun res!569861 () Bool)

(declare-fun e!467772 () Bool)

(assert (=> b!837988 (=> (not res!569861) (not e!467772))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837988 (= res!569861 (validMask!0 mask!1196))))

(declare-fun b!837989 () Bool)

(declare-fun res!569860 () Bool)

(assert (=> b!837989 (=> (not res!569860) (not e!467772))))

(declare-datatypes ((array!47058 0))(
  ( (array!47059 (arr!22560 (Array (_ BitVec 32) (_ BitVec 64))) (size!23000 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47058)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47058 (_ BitVec 32)) Bool)

(assert (=> b!837989 (= res!569860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837990 () Bool)

(assert (=> b!837990 (= e!467772 false)))

(declare-fun lt!380638 () Bool)

(declare-datatypes ((List!16044 0))(
  ( (Nil!16041) (Cons!16040 (h!17171 (_ BitVec 64)) (t!22415 List!16044)) )
))
(declare-fun arrayNoDuplicates!0 (array!47058 (_ BitVec 32) List!16044) Bool)

(assert (=> b!837990 (= lt!380638 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16041))))

(declare-fun b!837991 () Bool)

(assert (=> b!837991 (= e!467771 tp_is_empty!15381)))

(declare-fun b!837992 () Bool)

(declare-fun res!569858 () Bool)

(assert (=> b!837992 (=> (not res!569858) (not e!467772))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837992 (= res!569858 (and (= (size!22999 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23000 _keys!868) (size!22999 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!569859 () Bool)

(assert (=> start!72330 (=> (not res!569859) (not e!467772))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72330 (= res!569859 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23000 _keys!868))))))

(assert (=> start!72330 e!467772))

(assert (=> start!72330 true))

(declare-fun array_inv!17976 (array!47058) Bool)

(assert (=> start!72330 (array_inv!17976 _keys!868)))

(declare-fun array_inv!17977 (array!47056) Bool)

(assert (=> start!72330 (and (array_inv!17977 _values!688) e!467773)))

(assert (= (and start!72330 res!569859) b!837988))

(assert (= (and b!837988 res!569861) b!837992))

(assert (= (and b!837992 res!569858) b!837989))

(assert (= (and b!837989 res!569860) b!837990))

(assert (= (and b!837987 condMapEmpty!24671) mapIsEmpty!24671))

(assert (= (and b!837987 (not condMapEmpty!24671)) mapNonEmpty!24671))

(get-info :version)

(assert (= (and mapNonEmpty!24671 ((_ is ValueCellFull!7251) mapValue!24671)) b!837991))

(assert (= (and b!837987 ((_ is ValueCellFull!7251) mapDefault!24671)) b!837986))

(assert (= start!72330 b!837987))

(declare-fun m!782601 () Bool)

(assert (=> b!837989 m!782601))

(declare-fun m!782603 () Bool)

(assert (=> start!72330 m!782603))

(declare-fun m!782605 () Bool)

(assert (=> start!72330 m!782605))

(declare-fun m!782607 () Bool)

(assert (=> b!837988 m!782607))

(declare-fun m!782609 () Bool)

(assert (=> mapNonEmpty!24671 m!782609))

(declare-fun m!782611 () Bool)

(assert (=> b!837990 m!782611))

(check-sat (not b!837988) (not b!837989) (not start!72330) (not b!837990) tp_is_empty!15381 (not mapNonEmpty!24671))
(check-sat)
