; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72696 () Bool)

(assert start!72696)

(declare-fun b!843773 () Bool)

(declare-fun e!470839 () Bool)

(declare-fun tp_is_empty!15747 () Bool)

(assert (=> b!843773 (= e!470839 tp_is_empty!15747)))

(declare-fun b!843774 () Bool)

(declare-fun res!573353 () Bool)

(declare-fun e!470838 () Bool)

(assert (=> b!843774 (=> (not res!573353) (not e!470838))))

(declare-datatypes ((array!47738 0))(
  ( (array!47739 (arr!22900 (Array (_ BitVec 32) (_ BitVec 64))) (size!23340 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47738)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47738 (_ BitVec 32)) Bool)

(assert (=> b!843774 (= res!573353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843775 () Bool)

(declare-fun e!470840 () Bool)

(declare-fun mapRes!25220 () Bool)

(assert (=> b!843775 (= e!470840 (and e!470839 mapRes!25220))))

(declare-fun condMapEmpty!25220 () Bool)

(declare-datatypes ((V!26043 0))(
  ( (V!26044 (val!7921 Int)) )
))
(declare-datatypes ((ValueCell!7434 0))(
  ( (ValueCellFull!7434 (v!10346 V!26043)) (EmptyCell!7434) )
))
(declare-datatypes ((array!47740 0))(
  ( (array!47741 (arr!22901 (Array (_ BitVec 32) ValueCell!7434)) (size!23341 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47740)

(declare-fun mapDefault!25220 () ValueCell!7434)

(assert (=> b!843775 (= condMapEmpty!25220 (= (arr!22901 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7434)) mapDefault!25220)))))

(declare-fun b!843776 () Bool)

(declare-fun res!573350 () Bool)

(assert (=> b!843776 (=> (not res!573350) (not e!470838))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843776 (= res!573350 (and (= (size!23341 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23340 _keys!868) (size!23341 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843777 () Bool)

(declare-fun e!470841 () Bool)

(assert (=> b!843777 (= e!470841 tp_is_empty!15747)))

(declare-fun b!843778 () Bool)

(declare-fun res!573352 () Bool)

(assert (=> b!843778 (=> (not res!573352) (not e!470838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843778 (= res!573352 (validMask!0 mask!1196))))

(declare-fun b!843779 () Bool)

(assert (=> b!843779 (= e!470838 false)))

(declare-fun lt!381187 () Bool)

(declare-datatypes ((List!16248 0))(
  ( (Nil!16245) (Cons!16244 (h!17375 (_ BitVec 64)) (t!22619 List!16248)) )
))
(declare-fun arrayNoDuplicates!0 (array!47738 (_ BitVec 32) List!16248) Bool)

(assert (=> b!843779 (= lt!381187 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16245))))

(declare-fun mapNonEmpty!25220 () Bool)

(declare-fun tp!48538 () Bool)

(assert (=> mapNonEmpty!25220 (= mapRes!25220 (and tp!48538 e!470841))))

(declare-fun mapRest!25220 () (Array (_ BitVec 32) ValueCell!7434))

(declare-fun mapValue!25220 () ValueCell!7434)

(declare-fun mapKey!25220 () (_ BitVec 32))

(assert (=> mapNonEmpty!25220 (= (arr!22901 _values!688) (store mapRest!25220 mapKey!25220 mapValue!25220))))

(declare-fun res!573351 () Bool)

(assert (=> start!72696 (=> (not res!573351) (not e!470838))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72696 (= res!573351 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23340 _keys!868))))))

(assert (=> start!72696 e!470838))

(assert (=> start!72696 true))

(declare-fun array_inv!18212 (array!47738) Bool)

(assert (=> start!72696 (array_inv!18212 _keys!868)))

(declare-fun array_inv!18213 (array!47740) Bool)

(assert (=> start!72696 (and (array_inv!18213 _values!688) e!470840)))

(declare-fun mapIsEmpty!25220 () Bool)

(assert (=> mapIsEmpty!25220 mapRes!25220))

(assert (= (and start!72696 res!573351) b!843778))

(assert (= (and b!843778 res!573352) b!843776))

(assert (= (and b!843776 res!573350) b!843774))

(assert (= (and b!843774 res!573353) b!843779))

(assert (= (and b!843775 condMapEmpty!25220) mapIsEmpty!25220))

(assert (= (and b!843775 (not condMapEmpty!25220)) mapNonEmpty!25220))

(get-info :version)

(assert (= (and mapNonEmpty!25220 ((_ is ValueCellFull!7434) mapValue!25220)) b!843777))

(assert (= (and b!843775 ((_ is ValueCellFull!7434) mapDefault!25220)) b!843773))

(assert (= start!72696 b!843775))

(declare-fun m!786309 () Bool)

(assert (=> b!843774 m!786309))

(declare-fun m!786311 () Bool)

(assert (=> start!72696 m!786311))

(declare-fun m!786313 () Bool)

(assert (=> start!72696 m!786313))

(declare-fun m!786315 () Bool)

(assert (=> mapNonEmpty!25220 m!786315))

(declare-fun m!786317 () Bool)

(assert (=> b!843778 m!786317))

(declare-fun m!786319 () Bool)

(assert (=> b!843779 m!786319))

(check-sat (not b!843774) (not start!72696) (not b!843779) tp_is_empty!15747 (not mapNonEmpty!25220) (not b!843778))
(check-sat)
