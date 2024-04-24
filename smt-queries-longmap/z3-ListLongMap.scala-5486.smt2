; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72868 () Bool)

(assert start!72868)

(declare-fun b!844718 () Bool)

(declare-fun e!471452 () Bool)

(assert (=> b!844718 (= e!471452 false)))

(declare-fun lt!381554 () Bool)

(declare-datatypes ((array!47781 0))(
  ( (array!47782 (arr!22917 (Array (_ BitVec 32) (_ BitVec 64))) (size!23358 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47781)

(declare-datatypes ((List!16179 0))(
  ( (Nil!16176) (Cons!16175 (h!17312 (_ BitVec 64)) (t!22542 List!16179)) )
))
(declare-fun arrayNoDuplicates!0 (array!47781 (_ BitVec 32) List!16179) Bool)

(assert (=> b!844718 (= lt!381554 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16176))))

(declare-fun mapNonEmpty!25226 () Bool)

(declare-fun mapRes!25226 () Bool)

(declare-fun tp!48545 () Bool)

(declare-fun e!471451 () Bool)

(assert (=> mapNonEmpty!25226 (= mapRes!25226 (and tp!48545 e!471451))))

(declare-fun mapKey!25226 () (_ BitVec 32))

(declare-datatypes ((V!26049 0))(
  ( (V!26050 (val!7923 Int)) )
))
(declare-datatypes ((ValueCell!7436 0))(
  ( (ValueCellFull!7436 (v!10348 V!26049)) (EmptyCell!7436) )
))
(declare-fun mapRest!25226 () (Array (_ BitVec 32) ValueCell!7436))

(declare-fun mapValue!25226 () ValueCell!7436)

(declare-datatypes ((array!47783 0))(
  ( (array!47784 (arr!22918 (Array (_ BitVec 32) ValueCell!7436)) (size!23359 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47783)

(assert (=> mapNonEmpty!25226 (= (arr!22918 _values!688) (store mapRest!25226 mapKey!25226 mapValue!25226))))

(declare-fun mapIsEmpty!25226 () Bool)

(assert (=> mapIsEmpty!25226 mapRes!25226))

(declare-fun b!844719 () Bool)

(declare-fun res!573721 () Bool)

(assert (=> b!844719 (=> (not res!573721) (not e!471452))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47781 (_ BitVec 32)) Bool)

(assert (=> b!844719 (= res!573721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844720 () Bool)

(declare-fun e!471450 () Bool)

(declare-fun e!471453 () Bool)

(assert (=> b!844720 (= e!471450 (and e!471453 mapRes!25226))))

(declare-fun condMapEmpty!25226 () Bool)

(declare-fun mapDefault!25226 () ValueCell!7436)

(assert (=> b!844720 (= condMapEmpty!25226 (= (arr!22918 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7436)) mapDefault!25226)))))

(declare-fun b!844721 () Bool)

(declare-fun res!573720 () Bool)

(assert (=> b!844721 (=> (not res!573720) (not e!471452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844721 (= res!573720 (validMask!0 mask!1196))))

(declare-fun res!573719 () Bool)

(assert (=> start!72868 (=> (not res!573719) (not e!471452))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72868 (= res!573719 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23358 _keys!868))))))

(assert (=> start!72868 e!471452))

(assert (=> start!72868 true))

(declare-fun array_inv!18276 (array!47781) Bool)

(assert (=> start!72868 (array_inv!18276 _keys!868)))

(declare-fun array_inv!18277 (array!47783) Bool)

(assert (=> start!72868 (and (array_inv!18277 _values!688) e!471450)))

(declare-fun b!844722 () Bool)

(declare-fun tp_is_empty!15751 () Bool)

(assert (=> b!844722 (= e!471451 tp_is_empty!15751)))

(declare-fun b!844723 () Bool)

(assert (=> b!844723 (= e!471453 tp_is_empty!15751)))

(declare-fun b!844724 () Bool)

(declare-fun res!573718 () Bool)

(assert (=> b!844724 (=> (not res!573718) (not e!471452))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844724 (= res!573718 (and (= (size!23359 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23358 _keys!868) (size!23359 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72868 res!573719) b!844721))

(assert (= (and b!844721 res!573720) b!844724))

(assert (= (and b!844724 res!573718) b!844719))

(assert (= (and b!844719 res!573721) b!844718))

(assert (= (and b!844720 condMapEmpty!25226) mapIsEmpty!25226))

(assert (= (and b!844720 (not condMapEmpty!25226)) mapNonEmpty!25226))

(get-info :version)

(assert (= (and mapNonEmpty!25226 ((_ is ValueCellFull!7436) mapValue!25226)) b!844722))

(assert (= (and b!844720 ((_ is ValueCellFull!7436) mapDefault!25226)) b!844723))

(assert (= start!72868 b!844720))

(declare-fun m!787625 () Bool)

(assert (=> b!844719 m!787625))

(declare-fun m!787627 () Bool)

(assert (=> mapNonEmpty!25226 m!787627))

(declare-fun m!787629 () Bool)

(assert (=> b!844721 m!787629))

(declare-fun m!787631 () Bool)

(assert (=> b!844718 m!787631))

(declare-fun m!787633 () Bool)

(assert (=> start!72868 m!787633))

(declare-fun m!787635 () Bool)

(assert (=> start!72868 m!787635))

(check-sat (not mapNonEmpty!25226) (not b!844721) (not start!72868) (not b!844719) (not b!844718) tp_is_empty!15751)
(check-sat)
