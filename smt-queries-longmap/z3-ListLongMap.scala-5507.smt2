; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72808 () Bool)

(assert start!72808)

(declare-fun b!844899 () Bool)

(declare-fun res!574020 () Bool)

(declare-fun e!471667 () Bool)

(assert (=> b!844899 (=> (not res!574020) (not e!471667))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844899 (= res!574020 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25415 () Bool)

(declare-fun mapRes!25415 () Bool)

(assert (=> mapIsEmpty!25415 mapRes!25415))

(declare-fun b!844900 () Bool)

(assert (=> b!844900 (= e!471667 false)))

(declare-fun lt!381146 () Bool)

(declare-datatypes ((array!47977 0))(
  ( (array!47978 (arr!23020 (Array (_ BitVec 32) (_ BitVec 64))) (size!23462 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47977)

(declare-datatypes ((List!16313 0))(
  ( (Nil!16310) (Cons!16309 (h!17440 (_ BitVec 64)) (t!22675 List!16313)) )
))
(declare-fun arrayNoDuplicates!0 (array!47977 (_ BitVec 32) List!16313) Bool)

(assert (=> b!844900 (= lt!381146 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16310))))

(declare-fun b!844901 () Bool)

(declare-fun e!471668 () Bool)

(declare-fun tp_is_empty!15877 () Bool)

(assert (=> b!844901 (= e!471668 tp_is_empty!15877)))

(declare-fun res!574023 () Bool)

(assert (=> start!72808 (=> (not res!574023) (not e!471667))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72808 (= res!574023 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23462 _keys!868))))))

(assert (=> start!72808 e!471667))

(assert (=> start!72808 true))

(declare-fun array_inv!18364 (array!47977) Bool)

(assert (=> start!72808 (array_inv!18364 _keys!868)))

(declare-datatypes ((V!26217 0))(
  ( (V!26218 (val!7986 Int)) )
))
(declare-datatypes ((ValueCell!7499 0))(
  ( (ValueCellFull!7499 (v!10405 V!26217)) (EmptyCell!7499) )
))
(declare-datatypes ((array!47979 0))(
  ( (array!47980 (arr!23021 (Array (_ BitVec 32) ValueCell!7499)) (size!23463 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47979)

(declare-fun e!471669 () Bool)

(declare-fun array_inv!18365 (array!47979) Bool)

(assert (=> start!72808 (and (array_inv!18365 _values!688) e!471669)))

(declare-fun b!844902 () Bool)

(declare-fun res!574021 () Bool)

(assert (=> b!844902 (=> (not res!574021) (not e!471667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47977 (_ BitVec 32)) Bool)

(assert (=> b!844902 (= res!574021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844903 () Bool)

(declare-fun e!471666 () Bool)

(assert (=> b!844903 (= e!471669 (and e!471666 mapRes!25415))))

(declare-fun condMapEmpty!25415 () Bool)

(declare-fun mapDefault!25415 () ValueCell!7499)

(assert (=> b!844903 (= condMapEmpty!25415 (= (arr!23021 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7499)) mapDefault!25415)))))

(declare-fun b!844904 () Bool)

(assert (=> b!844904 (= e!471666 tp_is_empty!15877)))

(declare-fun mapNonEmpty!25415 () Bool)

(declare-fun tp!48734 () Bool)

(assert (=> mapNonEmpty!25415 (= mapRes!25415 (and tp!48734 e!471668))))

(declare-fun mapValue!25415 () ValueCell!7499)

(declare-fun mapKey!25415 () (_ BitVec 32))

(declare-fun mapRest!25415 () (Array (_ BitVec 32) ValueCell!7499))

(assert (=> mapNonEmpty!25415 (= (arr!23021 _values!688) (store mapRest!25415 mapKey!25415 mapValue!25415))))

(declare-fun b!844905 () Bool)

(declare-fun res!574022 () Bool)

(assert (=> b!844905 (=> (not res!574022) (not e!471667))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844905 (= res!574022 (and (= (size!23463 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23462 _keys!868) (size!23463 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72808 res!574023) b!844899))

(assert (= (and b!844899 res!574020) b!844905))

(assert (= (and b!844905 res!574022) b!844902))

(assert (= (and b!844902 res!574021) b!844900))

(assert (= (and b!844903 condMapEmpty!25415) mapIsEmpty!25415))

(assert (= (and b!844903 (not condMapEmpty!25415)) mapNonEmpty!25415))

(get-info :version)

(assert (= (and mapNonEmpty!25415 ((_ is ValueCellFull!7499) mapValue!25415)) b!844901))

(assert (= (and b!844903 ((_ is ValueCellFull!7499) mapDefault!25415)) b!844904))

(assert (= start!72808 b!844903))

(declare-fun m!786335 () Bool)

(assert (=> b!844902 m!786335))

(declare-fun m!786337 () Bool)

(assert (=> b!844900 m!786337))

(declare-fun m!786339 () Bool)

(assert (=> start!72808 m!786339))

(declare-fun m!786341 () Bool)

(assert (=> start!72808 m!786341))

(declare-fun m!786343 () Bool)

(assert (=> b!844899 m!786343))

(declare-fun m!786345 () Bool)

(assert (=> mapNonEmpty!25415 m!786345))

(check-sat (not start!72808) (not mapNonEmpty!25415) (not b!844902) tp_is_empty!15877 (not b!844899) (not b!844900))
(check-sat)
