; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95402 () Bool)

(assert start!95402)

(declare-fun b!1077491 () Bool)

(declare-fun e!616093 () Bool)

(declare-fun tp_is_empty!26115 () Bool)

(assert (=> b!1077491 (= e!616093 tp_is_empty!26115)))

(declare-fun b!1077492 () Bool)

(declare-fun e!616096 () Bool)

(assert (=> b!1077492 (= e!616096 tp_is_empty!26115)))

(declare-fun b!1077493 () Bool)

(declare-fun e!616097 () Bool)

(declare-fun mapRes!40915 () Bool)

(assert (=> b!1077493 (= e!616097 (and e!616096 mapRes!40915))))

(declare-fun condMapEmpty!40915 () Bool)

(declare-datatypes ((V!39947 0))(
  ( (V!39948 (val!13114 Int)) )
))
(declare-datatypes ((ValueCell!12348 0))(
  ( (ValueCellFull!12348 (v!15734 V!39947)) (EmptyCell!12348) )
))
(declare-datatypes ((array!69183 0))(
  ( (array!69184 (arr!33269 (Array (_ BitVec 32) ValueCell!12348)) (size!33805 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69183)

(declare-fun mapDefault!40915 () ValueCell!12348)

(assert (=> b!1077493 (= condMapEmpty!40915 (= (arr!33269 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12348)) mapDefault!40915)))))

(declare-fun b!1077494 () Bool)

(declare-fun res!717954 () Bool)

(declare-fun e!616094 () Bool)

(assert (=> b!1077494 (=> (not res!717954) (not e!616094))))

(declare-datatypes ((array!69185 0))(
  ( (array!69186 (arr!33270 (Array (_ BitVec 32) (_ BitVec 64))) (size!33806 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69185)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69185 (_ BitVec 32)) Bool)

(assert (=> b!1077494 (= res!717954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!40915 () Bool)

(declare-fun tp!78377 () Bool)

(assert (=> mapNonEmpty!40915 (= mapRes!40915 (and tp!78377 e!616093))))

(declare-fun mapKey!40915 () (_ BitVec 32))

(declare-fun mapRest!40915 () (Array (_ BitVec 32) ValueCell!12348))

(declare-fun mapValue!40915 () ValueCell!12348)

(assert (=> mapNonEmpty!40915 (= (arr!33269 _values!874) (store mapRest!40915 mapKey!40915 mapValue!40915))))

(declare-fun b!1077495 () Bool)

(declare-fun res!717959 () Bool)

(assert (=> b!1077495 (=> (not res!717959) (not e!616094))))

(declare-datatypes ((List!23220 0))(
  ( (Nil!23217) (Cons!23216 (h!24425 (_ BitVec 64)) (t!32579 List!23220)) )
))
(declare-fun arrayNoDuplicates!0 (array!69185 (_ BitVec 32) List!23220) Bool)

(assert (=> b!1077495 (= res!717959 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23217))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun b!1077496 () Bool)

(assert (=> b!1077496 (= e!616094 (and (= (select (arr!33270 _keys!1070) i!650) k0!904) (not (= (size!33806 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun res!717956 () Bool)

(assert (=> start!95402 (=> (not res!717956) (not e!616094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95402 (= res!717956 (validMask!0 mask!1414))))

(assert (=> start!95402 e!616094))

(assert (=> start!95402 true))

(declare-fun array_inv!25702 (array!69185) Bool)

(assert (=> start!95402 (array_inv!25702 _keys!1070)))

(declare-fun array_inv!25703 (array!69183) Bool)

(assert (=> start!95402 (and (array_inv!25703 _values!874) e!616097)))

(declare-fun mapIsEmpty!40915 () Bool)

(assert (=> mapIsEmpty!40915 mapRes!40915))

(declare-fun b!1077497 () Bool)

(declare-fun res!717955 () Bool)

(assert (=> b!1077497 (=> (not res!717955) (not e!616094))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077497 (= res!717955 (and (= (size!33805 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33806 _keys!1070) (size!33805 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077498 () Bool)

(declare-fun res!717958 () Bool)

(assert (=> b!1077498 (=> (not res!717958) (not e!616094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077498 (= res!717958 (validKeyInArray!0 k0!904))))

(declare-fun b!1077499 () Bool)

(declare-fun res!717957 () Bool)

(assert (=> b!1077499 (=> (not res!717957) (not e!616094))))

(assert (=> b!1077499 (= res!717957 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33806 _keys!1070))))))

(assert (= (and start!95402 res!717956) b!1077497))

(assert (= (and b!1077497 res!717955) b!1077494))

(assert (= (and b!1077494 res!717954) b!1077495))

(assert (= (and b!1077495 res!717959) b!1077499))

(assert (= (and b!1077499 res!717957) b!1077498))

(assert (= (and b!1077498 res!717958) b!1077496))

(assert (= (and b!1077493 condMapEmpty!40915) mapIsEmpty!40915))

(assert (= (and b!1077493 (not condMapEmpty!40915)) mapNonEmpty!40915))

(get-info :version)

(assert (= (and mapNonEmpty!40915 ((_ is ValueCellFull!12348) mapValue!40915)) b!1077491))

(assert (= (and b!1077493 ((_ is ValueCellFull!12348) mapDefault!40915)) b!1077492))

(assert (= start!95402 b!1077493))

(declare-fun m!996327 () Bool)

(assert (=> b!1077496 m!996327))

(declare-fun m!996329 () Bool)

(assert (=> b!1077498 m!996329))

(declare-fun m!996331 () Bool)

(assert (=> mapNonEmpty!40915 m!996331))

(declare-fun m!996333 () Bool)

(assert (=> b!1077494 m!996333))

(declare-fun m!996335 () Bool)

(assert (=> b!1077495 m!996335))

(declare-fun m!996337 () Bool)

(assert (=> start!95402 m!996337))

(declare-fun m!996339 () Bool)

(assert (=> start!95402 m!996339))

(declare-fun m!996341 () Bool)

(assert (=> start!95402 m!996341))

(check-sat (not start!95402) (not b!1077494) tp_is_empty!26115 (not b!1077495) (not b!1077498) (not mapNonEmpty!40915))
(check-sat)
