; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72916 () Bool)

(assert start!72916)

(declare-fun b!845222 () Bool)

(declare-fun res!574006 () Bool)

(declare-fun e!471812 () Bool)

(assert (=> b!845222 (=> (not res!574006) (not e!471812))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845222 (= res!574006 (validMask!0 mask!1196))))

(declare-fun res!574009 () Bool)

(assert (=> start!72916 (=> (not res!574009) (not e!471812))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47873 0))(
  ( (array!47874 (arr!22963 (Array (_ BitVec 32) (_ BitVec 64))) (size!23404 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47873)

(assert (=> start!72916 (= res!574009 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23404 _keys!868))))))

(assert (=> start!72916 e!471812))

(assert (=> start!72916 true))

(declare-fun array_inv!18306 (array!47873) Bool)

(assert (=> start!72916 (array_inv!18306 _keys!868)))

(declare-datatypes ((V!26113 0))(
  ( (V!26114 (val!7947 Int)) )
))
(declare-datatypes ((ValueCell!7460 0))(
  ( (ValueCellFull!7460 (v!10372 V!26113)) (EmptyCell!7460) )
))
(declare-datatypes ((array!47875 0))(
  ( (array!47876 (arr!22964 (Array (_ BitVec 32) ValueCell!7460)) (size!23405 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47875)

(declare-fun e!471811 () Bool)

(declare-fun array_inv!18307 (array!47875) Bool)

(assert (=> start!72916 (and (array_inv!18307 _values!688) e!471811)))

(declare-fun mapIsEmpty!25298 () Bool)

(declare-fun mapRes!25298 () Bool)

(assert (=> mapIsEmpty!25298 mapRes!25298))

(declare-fun b!845223 () Bool)

(declare-fun e!471814 () Bool)

(declare-fun tp_is_empty!15799 () Bool)

(assert (=> b!845223 (= e!471814 tp_is_empty!15799)))

(declare-fun mapNonEmpty!25298 () Bool)

(declare-fun tp!48617 () Bool)

(assert (=> mapNonEmpty!25298 (= mapRes!25298 (and tp!48617 e!471814))))

(declare-fun mapValue!25298 () ValueCell!7460)

(declare-fun mapKey!25298 () (_ BitVec 32))

(declare-fun mapRest!25298 () (Array (_ BitVec 32) ValueCell!7460))

(assert (=> mapNonEmpty!25298 (= (arr!22964 _values!688) (store mapRest!25298 mapKey!25298 mapValue!25298))))

(declare-fun b!845224 () Bool)

(declare-fun e!471810 () Bool)

(assert (=> b!845224 (= e!471811 (and e!471810 mapRes!25298))))

(declare-fun condMapEmpty!25298 () Bool)

(declare-fun mapDefault!25298 () ValueCell!7460)

(assert (=> b!845224 (= condMapEmpty!25298 (= (arr!22964 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7460)) mapDefault!25298)))))

(declare-fun b!845225 () Bool)

(declare-fun res!574007 () Bool)

(assert (=> b!845225 (=> (not res!574007) (not e!471812))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845225 (= res!574007 (and (= (size!23405 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23404 _keys!868) (size!23405 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845226 () Bool)

(assert (=> b!845226 (= e!471810 tp_is_empty!15799)))

(declare-fun b!845227 () Bool)

(assert (=> b!845227 (= e!471812 false)))

(declare-fun lt!381626 () Bool)

(declare-datatypes ((List!16195 0))(
  ( (Nil!16192) (Cons!16191 (h!17328 (_ BitVec 64)) (t!22558 List!16195)) )
))
(declare-fun arrayNoDuplicates!0 (array!47873 (_ BitVec 32) List!16195) Bool)

(assert (=> b!845227 (= lt!381626 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16192))))

(declare-fun b!845228 () Bool)

(declare-fun res!574008 () Bool)

(assert (=> b!845228 (=> (not res!574008) (not e!471812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47873 (_ BitVec 32)) Bool)

(assert (=> b!845228 (= res!574008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72916 res!574009) b!845222))

(assert (= (and b!845222 res!574006) b!845225))

(assert (= (and b!845225 res!574007) b!845228))

(assert (= (and b!845228 res!574008) b!845227))

(assert (= (and b!845224 condMapEmpty!25298) mapIsEmpty!25298))

(assert (= (and b!845224 (not condMapEmpty!25298)) mapNonEmpty!25298))

(get-info :version)

(assert (= (and mapNonEmpty!25298 ((_ is ValueCellFull!7460) mapValue!25298)) b!845223))

(assert (= (and b!845224 ((_ is ValueCellFull!7460) mapDefault!25298)) b!845226))

(assert (= start!72916 b!845224))

(declare-fun m!787913 () Bool)

(assert (=> b!845222 m!787913))

(declare-fun m!787915 () Bool)

(assert (=> start!72916 m!787915))

(declare-fun m!787917 () Bool)

(assert (=> start!72916 m!787917))

(declare-fun m!787919 () Bool)

(assert (=> b!845227 m!787919))

(declare-fun m!787921 () Bool)

(assert (=> b!845228 m!787921))

(declare-fun m!787923 () Bool)

(assert (=> mapNonEmpty!25298 m!787923))

(check-sat (not b!845228) (not start!72916) (not b!845227) (not b!845222) (not mapNonEmpty!25298) tp_is_empty!15799)
(check-sat)
