; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72654 () Bool)

(assert start!72654)

(declare-fun res!573101 () Bool)

(declare-fun e!470525 () Bool)

(assert (=> start!72654 (=> (not res!573101) (not e!470525))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47666 0))(
  ( (array!47667 (arr!22864 (Array (_ BitVec 32) (_ BitVec 64))) (size!23304 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47666)

(assert (=> start!72654 (= res!573101 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23304 _keys!868))))))

(assert (=> start!72654 e!470525))

(assert (=> start!72654 true))

(declare-fun array_inv!18184 (array!47666) Bool)

(assert (=> start!72654 (array_inv!18184 _keys!868)))

(declare-datatypes ((V!25987 0))(
  ( (V!25988 (val!7900 Int)) )
))
(declare-datatypes ((ValueCell!7413 0))(
  ( (ValueCellFull!7413 (v!10325 V!25987)) (EmptyCell!7413) )
))
(declare-datatypes ((array!47668 0))(
  ( (array!47669 (arr!22865 (Array (_ BitVec 32) ValueCell!7413)) (size!23305 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47668)

(declare-fun e!470527 () Bool)

(declare-fun array_inv!18185 (array!47668) Bool)

(assert (=> start!72654 (and (array_inv!18185 _values!688) e!470527)))

(declare-fun b!843332 () Bool)

(assert (=> b!843332 (= e!470525 false)))

(declare-fun lt!381124 () Bool)

(declare-datatypes ((List!16235 0))(
  ( (Nil!16232) (Cons!16231 (h!17362 (_ BitVec 64)) (t!22606 List!16235)) )
))
(declare-fun arrayNoDuplicates!0 (array!47666 (_ BitVec 32) List!16235) Bool)

(assert (=> b!843332 (= lt!381124 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16232))))

(declare-fun b!843333 () Bool)

(declare-fun res!573098 () Bool)

(assert (=> b!843333 (=> (not res!573098) (not e!470525))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843333 (= res!573098 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25157 () Bool)

(declare-fun mapRes!25157 () Bool)

(assert (=> mapIsEmpty!25157 mapRes!25157))

(declare-fun mapNonEmpty!25157 () Bool)

(declare-fun tp!48475 () Bool)

(declare-fun e!470526 () Bool)

(assert (=> mapNonEmpty!25157 (= mapRes!25157 (and tp!48475 e!470526))))

(declare-fun mapValue!25157 () ValueCell!7413)

(declare-fun mapRest!25157 () (Array (_ BitVec 32) ValueCell!7413))

(declare-fun mapKey!25157 () (_ BitVec 32))

(assert (=> mapNonEmpty!25157 (= (arr!22865 _values!688) (store mapRest!25157 mapKey!25157 mapValue!25157))))

(declare-fun b!843334 () Bool)

(declare-fun tp_is_empty!15705 () Bool)

(assert (=> b!843334 (= e!470526 tp_is_empty!15705)))

(declare-fun b!843335 () Bool)

(declare-fun e!470524 () Bool)

(assert (=> b!843335 (= e!470527 (and e!470524 mapRes!25157))))

(declare-fun condMapEmpty!25157 () Bool)

(declare-fun mapDefault!25157 () ValueCell!7413)

(assert (=> b!843335 (= condMapEmpty!25157 (= (arr!22865 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7413)) mapDefault!25157)))))

(declare-fun b!843336 () Bool)

(declare-fun res!573099 () Bool)

(assert (=> b!843336 (=> (not res!573099) (not e!470525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47666 (_ BitVec 32)) Bool)

(assert (=> b!843336 (= res!573099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843337 () Bool)

(declare-fun res!573100 () Bool)

(assert (=> b!843337 (=> (not res!573100) (not e!470525))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843337 (= res!573100 (and (= (size!23305 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23304 _keys!868) (size!23305 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843338 () Bool)

(assert (=> b!843338 (= e!470524 tp_is_empty!15705)))

(assert (= (and start!72654 res!573101) b!843333))

(assert (= (and b!843333 res!573098) b!843337))

(assert (= (and b!843337 res!573100) b!843336))

(assert (= (and b!843336 res!573099) b!843332))

(assert (= (and b!843335 condMapEmpty!25157) mapIsEmpty!25157))

(assert (= (and b!843335 (not condMapEmpty!25157)) mapNonEmpty!25157))

(get-info :version)

(assert (= (and mapNonEmpty!25157 ((_ is ValueCellFull!7413) mapValue!25157)) b!843334))

(assert (= (and b!843335 ((_ is ValueCellFull!7413) mapDefault!25157)) b!843338))

(assert (= start!72654 b!843335))

(declare-fun m!786057 () Bool)

(assert (=> b!843333 m!786057))

(declare-fun m!786059 () Bool)

(assert (=> b!843332 m!786059))

(declare-fun m!786061 () Bool)

(assert (=> b!843336 m!786061))

(declare-fun m!786063 () Bool)

(assert (=> mapNonEmpty!25157 m!786063))

(declare-fun m!786065 () Bool)

(assert (=> start!72654 m!786065))

(declare-fun m!786067 () Bool)

(assert (=> start!72654 m!786067))

(check-sat (not start!72654) (not b!843336) tp_is_empty!15705 (not b!843332) (not b!843333) (not mapNonEmpty!25157))
(check-sat)
