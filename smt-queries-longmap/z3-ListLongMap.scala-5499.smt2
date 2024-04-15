; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72760 () Bool)

(assert start!72760)

(declare-fun mapIsEmpty!25343 () Bool)

(declare-fun mapRes!25343 () Bool)

(assert (=> mapIsEmpty!25343 mapRes!25343))

(declare-fun res!573734 () Bool)

(declare-fun e!471309 () Bool)

(assert (=> start!72760 (=> (not res!573734) (not e!471309))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47881 0))(
  ( (array!47882 (arr!22972 (Array (_ BitVec 32) (_ BitVec 64))) (size!23414 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47881)

(assert (=> start!72760 (= res!573734 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23414 _keys!868))))))

(assert (=> start!72760 e!471309))

(assert (=> start!72760 true))

(declare-fun array_inv!18332 (array!47881) Bool)

(assert (=> start!72760 (array_inv!18332 _keys!868)))

(declare-datatypes ((V!26153 0))(
  ( (V!26154 (val!7962 Int)) )
))
(declare-datatypes ((ValueCell!7475 0))(
  ( (ValueCellFull!7475 (v!10381 V!26153)) (EmptyCell!7475) )
))
(declare-datatypes ((array!47883 0))(
  ( (array!47884 (arr!22973 (Array (_ BitVec 32) ValueCell!7475)) (size!23415 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47883)

(declare-fun e!471305 () Bool)

(declare-fun array_inv!18333 (array!47883) Bool)

(assert (=> start!72760 (and (array_inv!18333 _values!688) e!471305)))

(declare-fun b!844395 () Bool)

(declare-fun res!573735 () Bool)

(assert (=> b!844395 (=> (not res!573735) (not e!471309))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!844395 (= res!573735 (and (= (size!23415 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23414 _keys!868) (size!23415 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844396 () Bool)

(assert (=> b!844396 (= e!471309 false)))

(declare-fun lt!381074 () Bool)

(declare-datatypes ((List!16292 0))(
  ( (Nil!16289) (Cons!16288 (h!17419 (_ BitVec 64)) (t!22654 List!16292)) )
))
(declare-fun arrayNoDuplicates!0 (array!47881 (_ BitVec 32) List!16292) Bool)

(assert (=> b!844396 (= lt!381074 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16289))))

(declare-fun b!844397 () Bool)

(declare-fun e!471307 () Bool)

(assert (=> b!844397 (= e!471305 (and e!471307 mapRes!25343))))

(declare-fun condMapEmpty!25343 () Bool)

(declare-fun mapDefault!25343 () ValueCell!7475)

(assert (=> b!844397 (= condMapEmpty!25343 (= (arr!22973 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7475)) mapDefault!25343)))))

(declare-fun b!844398 () Bool)

(declare-fun res!573732 () Bool)

(assert (=> b!844398 (=> (not res!573732) (not e!471309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844398 (= res!573732 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25343 () Bool)

(declare-fun tp!48662 () Bool)

(declare-fun e!471308 () Bool)

(assert (=> mapNonEmpty!25343 (= mapRes!25343 (and tp!48662 e!471308))))

(declare-fun mapKey!25343 () (_ BitVec 32))

(declare-fun mapValue!25343 () ValueCell!7475)

(declare-fun mapRest!25343 () (Array (_ BitVec 32) ValueCell!7475))

(assert (=> mapNonEmpty!25343 (= (arr!22973 _values!688) (store mapRest!25343 mapKey!25343 mapValue!25343))))

(declare-fun b!844399 () Bool)

(declare-fun tp_is_empty!15829 () Bool)

(assert (=> b!844399 (= e!471308 tp_is_empty!15829)))

(declare-fun b!844400 () Bool)

(assert (=> b!844400 (= e!471307 tp_is_empty!15829)))

(declare-fun b!844401 () Bool)

(declare-fun res!573733 () Bool)

(assert (=> b!844401 (=> (not res!573733) (not e!471309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47881 (_ BitVec 32)) Bool)

(assert (=> b!844401 (= res!573733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72760 res!573734) b!844398))

(assert (= (and b!844398 res!573732) b!844395))

(assert (= (and b!844395 res!573735) b!844401))

(assert (= (and b!844401 res!573733) b!844396))

(assert (= (and b!844397 condMapEmpty!25343) mapIsEmpty!25343))

(assert (= (and b!844397 (not condMapEmpty!25343)) mapNonEmpty!25343))

(get-info :version)

(assert (= (and mapNonEmpty!25343 ((_ is ValueCellFull!7475) mapValue!25343)) b!844399))

(assert (= (and b!844397 ((_ is ValueCellFull!7475) mapDefault!25343)) b!844400))

(assert (= start!72760 b!844397))

(declare-fun m!786047 () Bool)

(assert (=> start!72760 m!786047))

(declare-fun m!786049 () Bool)

(assert (=> start!72760 m!786049))

(declare-fun m!786051 () Bool)

(assert (=> mapNonEmpty!25343 m!786051))

(declare-fun m!786053 () Bool)

(assert (=> b!844396 m!786053))

(declare-fun m!786055 () Bool)

(assert (=> b!844398 m!786055))

(declare-fun m!786057 () Bool)

(assert (=> b!844401 m!786057))

(check-sat (not b!844401) (not b!844396) (not start!72760) (not mapNonEmpty!25343) (not b!844398) tp_is_empty!15829)
(check-sat)
