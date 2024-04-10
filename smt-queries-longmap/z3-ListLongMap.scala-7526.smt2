; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95420 () Bool)

(assert start!95420)

(declare-fun b!1077717 () Bool)

(declare-fun res!718105 () Bool)

(declare-fun e!616228 () Bool)

(assert (=> b!1077717 (=> (not res!718105) (not e!616228))))

(declare-datatypes ((array!69215 0))(
  ( (array!69216 (arr!33285 (Array (_ BitVec 32) (_ BitVec 64))) (size!33821 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69215)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69215 (_ BitVec 32)) Bool)

(assert (=> b!1077717 (= res!718105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077718 () Bool)

(declare-fun res!718104 () Bool)

(assert (=> b!1077718 (=> (not res!718104) (not e!616228))))

(declare-datatypes ((List!23225 0))(
  ( (Nil!23222) (Cons!23221 (h!24430 (_ BitVec 64)) (t!32584 List!23225)) )
))
(declare-fun arrayNoDuplicates!0 (array!69215 (_ BitVec 32) List!23225) Bool)

(assert (=> b!1077718 (= res!718104 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23222))))

(declare-fun mapIsEmpty!40942 () Bool)

(declare-fun mapRes!40942 () Bool)

(assert (=> mapIsEmpty!40942 mapRes!40942))

(declare-fun b!1077720 () Bool)

(assert (=> b!1077720 (= e!616228 (bvsgt #b00000000000000000000000000000000 (size!33821 _keys!1070)))))

(declare-fun b!1077721 () Bool)

(declare-fun res!718103 () Bool)

(assert (=> b!1077721 (=> (not res!718103) (not e!616228))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077721 (= res!718103 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33821 _keys!1070))))))

(declare-fun mapNonEmpty!40942 () Bool)

(declare-fun tp!78404 () Bool)

(declare-fun e!616231 () Bool)

(assert (=> mapNonEmpty!40942 (= mapRes!40942 (and tp!78404 e!616231))))

(declare-datatypes ((V!39971 0))(
  ( (V!39972 (val!13123 Int)) )
))
(declare-datatypes ((ValueCell!12357 0))(
  ( (ValueCellFull!12357 (v!15743 V!39971)) (EmptyCell!12357) )
))
(declare-datatypes ((array!69217 0))(
  ( (array!69218 (arr!33286 (Array (_ BitVec 32) ValueCell!12357)) (size!33822 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69217)

(declare-fun mapKey!40942 () (_ BitVec 32))

(declare-fun mapValue!40942 () ValueCell!12357)

(declare-fun mapRest!40942 () (Array (_ BitVec 32) ValueCell!12357))

(assert (=> mapNonEmpty!40942 (= (arr!33286 _values!874) (store mapRest!40942 mapKey!40942 mapValue!40942))))

(declare-fun b!1077722 () Bool)

(declare-fun res!718099 () Bool)

(assert (=> b!1077722 (=> (not res!718099) (not e!616228))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1077722 (= res!718099 (= (select (arr!33285 _keys!1070) i!650) k0!904))))

(declare-fun b!1077723 () Bool)

(declare-fun res!718102 () Bool)

(assert (=> b!1077723 (=> (not res!718102) (not e!616228))))

(assert (=> b!1077723 (= res!718102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69216 (store (arr!33285 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33821 _keys!1070)) mask!1414))))

(declare-fun b!1077724 () Bool)

(declare-fun tp_is_empty!26133 () Bool)

(assert (=> b!1077724 (= e!616231 tp_is_empty!26133)))

(declare-fun b!1077725 () Bool)

(declare-fun res!718100 () Bool)

(assert (=> b!1077725 (=> (not res!718100) (not e!616228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077725 (= res!718100 (validKeyInArray!0 k0!904))))

(declare-fun b!1077726 () Bool)

(declare-fun res!718106 () Bool)

(assert (=> b!1077726 (=> (not res!718106) (not e!616228))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077726 (= res!718106 (and (= (size!33822 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33821 _keys!1070) (size!33822 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077727 () Bool)

(declare-fun e!616230 () Bool)

(assert (=> b!1077727 (= e!616230 tp_is_empty!26133)))

(declare-fun b!1077719 () Bool)

(declare-fun e!616232 () Bool)

(assert (=> b!1077719 (= e!616232 (and e!616230 mapRes!40942))))

(declare-fun condMapEmpty!40942 () Bool)

(declare-fun mapDefault!40942 () ValueCell!12357)

(assert (=> b!1077719 (= condMapEmpty!40942 (= (arr!33286 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12357)) mapDefault!40942)))))

(declare-fun res!718101 () Bool)

(assert (=> start!95420 (=> (not res!718101) (not e!616228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95420 (= res!718101 (validMask!0 mask!1414))))

(assert (=> start!95420 e!616228))

(assert (=> start!95420 true))

(declare-fun array_inv!25716 (array!69215) Bool)

(assert (=> start!95420 (array_inv!25716 _keys!1070)))

(declare-fun array_inv!25717 (array!69217) Bool)

(assert (=> start!95420 (and (array_inv!25717 _values!874) e!616232)))

(assert (= (and start!95420 res!718101) b!1077726))

(assert (= (and b!1077726 res!718106) b!1077717))

(assert (= (and b!1077717 res!718105) b!1077718))

(assert (= (and b!1077718 res!718104) b!1077721))

(assert (= (and b!1077721 res!718103) b!1077725))

(assert (= (and b!1077725 res!718100) b!1077722))

(assert (= (and b!1077722 res!718099) b!1077723))

(assert (= (and b!1077723 res!718102) b!1077720))

(assert (= (and b!1077719 condMapEmpty!40942) mapIsEmpty!40942))

(assert (= (and b!1077719 (not condMapEmpty!40942)) mapNonEmpty!40942))

(get-info :version)

(assert (= (and mapNonEmpty!40942 ((_ is ValueCellFull!12357) mapValue!40942)) b!1077724))

(assert (= (and b!1077719 ((_ is ValueCellFull!12357) mapDefault!40942)) b!1077727))

(assert (= start!95420 b!1077719))

(declare-fun m!996463 () Bool)

(assert (=> b!1077722 m!996463))

(declare-fun m!996465 () Bool)

(assert (=> b!1077717 m!996465))

(declare-fun m!996467 () Bool)

(assert (=> b!1077723 m!996467))

(declare-fun m!996469 () Bool)

(assert (=> b!1077723 m!996469))

(declare-fun m!996471 () Bool)

(assert (=> mapNonEmpty!40942 m!996471))

(declare-fun m!996473 () Bool)

(assert (=> b!1077725 m!996473))

(declare-fun m!996475 () Bool)

(assert (=> start!95420 m!996475))

(declare-fun m!996477 () Bool)

(assert (=> start!95420 m!996477))

(declare-fun m!996479 () Bool)

(assert (=> start!95420 m!996479))

(declare-fun m!996481 () Bool)

(assert (=> b!1077718 m!996481))

(check-sat (not b!1077717) (not b!1077723) tp_is_empty!26133 (not b!1077725) (not mapNonEmpty!40942) (not start!95420) (not b!1077718))
(check-sat)
