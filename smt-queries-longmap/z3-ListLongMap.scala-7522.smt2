; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95388 () Bool)

(assert start!95388)

(declare-fun b!1077251 () Bool)

(declare-fun e!615944 () Bool)

(declare-fun e!615942 () Bool)

(declare-fun mapRes!40903 () Bool)

(assert (=> b!1077251 (= e!615944 (and e!615942 mapRes!40903))))

(declare-fun condMapEmpty!40903 () Bool)

(declare-datatypes ((V!39937 0))(
  ( (V!39938 (val!13110 Int)) )
))
(declare-datatypes ((ValueCell!12344 0))(
  ( (ValueCellFull!12344 (v!15729 V!39937)) (EmptyCell!12344) )
))
(declare-datatypes ((array!69100 0))(
  ( (array!69101 (arr!33228 (Array (_ BitVec 32) ValueCell!12344)) (size!33766 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69100)

(declare-fun mapDefault!40903 () ValueCell!12344)

(assert (=> b!1077251 (= condMapEmpty!40903 (= (arr!33228 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12344)) mapDefault!40903)))))

(declare-fun res!717835 () Bool)

(declare-fun e!615940 () Bool)

(assert (=> start!95388 (=> (not res!717835) (not e!615940))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95388 (= res!717835 (validMask!0 mask!1414))))

(assert (=> start!95388 e!615940))

(assert (=> start!95388 true))

(declare-fun array_inv!25702 (array!69100) Bool)

(assert (=> start!95388 (and (array_inv!25702 _values!874) e!615944)))

(declare-datatypes ((array!69102 0))(
  ( (array!69103 (arr!33229 (Array (_ BitVec 32) (_ BitVec 64))) (size!33767 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69102)

(declare-fun array_inv!25703 (array!69102) Bool)

(assert (=> start!95388 (array_inv!25703 _keys!1070)))

(declare-fun mapIsEmpty!40903 () Bool)

(assert (=> mapIsEmpty!40903 mapRes!40903))

(declare-fun b!1077252 () Bool)

(declare-fun res!717836 () Bool)

(assert (=> b!1077252 (=> (not res!717836) (not e!615940))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077252 (= res!717836 (and (= (size!33766 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33767 _keys!1070) (size!33766 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077253 () Bool)

(declare-fun e!615941 () Bool)

(declare-fun tp_is_empty!26107 () Bool)

(assert (=> b!1077253 (= e!615941 tp_is_empty!26107)))

(declare-fun b!1077254 () Bool)

(declare-fun res!717834 () Bool)

(assert (=> b!1077254 (=> (not res!717834) (not e!615940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69102 (_ BitVec 32)) Bool)

(assert (=> b!1077254 (= res!717834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077255 () Bool)

(assert (=> b!1077255 (= e!615942 tp_is_empty!26107)))

(declare-fun mapNonEmpty!40903 () Bool)

(declare-fun tp!78365 () Bool)

(assert (=> mapNonEmpty!40903 (= mapRes!40903 (and tp!78365 e!615941))))

(declare-fun mapRest!40903 () (Array (_ BitVec 32) ValueCell!12344))

(declare-fun mapValue!40903 () ValueCell!12344)

(declare-fun mapKey!40903 () (_ BitVec 32))

(assert (=> mapNonEmpty!40903 (= (arr!33228 _values!874) (store mapRest!40903 mapKey!40903 mapValue!40903))))

(declare-fun b!1077256 () Bool)

(assert (=> b!1077256 (= e!615940 false)))

(declare-fun lt!478342 () Bool)

(declare-datatypes ((List!23269 0))(
  ( (Nil!23266) (Cons!23265 (h!24474 (_ BitVec 64)) (t!32619 List!23269)) )
))
(declare-fun arrayNoDuplicates!0 (array!69102 (_ BitVec 32) List!23269) Bool)

(assert (=> b!1077256 (= lt!478342 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23266))))

(assert (= (and start!95388 res!717835) b!1077252))

(assert (= (and b!1077252 res!717836) b!1077254))

(assert (= (and b!1077254 res!717834) b!1077256))

(assert (= (and b!1077251 condMapEmpty!40903) mapIsEmpty!40903))

(assert (= (and b!1077251 (not condMapEmpty!40903)) mapNonEmpty!40903))

(get-info :version)

(assert (= (and mapNonEmpty!40903 ((_ is ValueCellFull!12344) mapValue!40903)) b!1077253))

(assert (= (and b!1077251 ((_ is ValueCellFull!12344) mapDefault!40903)) b!1077255))

(assert (= start!95388 b!1077251))

(declare-fun m!995649 () Bool)

(assert (=> start!95388 m!995649))

(declare-fun m!995651 () Bool)

(assert (=> start!95388 m!995651))

(declare-fun m!995653 () Bool)

(assert (=> start!95388 m!995653))

(declare-fun m!995655 () Bool)

(assert (=> b!1077254 m!995655))

(declare-fun m!995657 () Bool)

(assert (=> mapNonEmpty!40903 m!995657))

(declare-fun m!995659 () Bool)

(assert (=> b!1077256 m!995659))

(check-sat tp_is_empty!26107 (not mapNonEmpty!40903) (not b!1077256) (not start!95388) (not b!1077254))
(check-sat)
