; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95630 () Bool)

(assert start!95630)

(declare-fun b!1078731 () Bool)

(declare-fun e!616892 () Bool)

(declare-fun tp_is_empty!26107 () Bool)

(assert (=> b!1078731 (= e!616892 tp_is_empty!26107)))

(declare-fun mapNonEmpty!40903 () Bool)

(declare-fun mapRes!40903 () Bool)

(declare-fun tp!78365 () Bool)

(declare-fun e!616890 () Bool)

(assert (=> mapNonEmpty!40903 (= mapRes!40903 (and tp!78365 e!616890))))

(declare-datatypes ((V!39937 0))(
  ( (V!39938 (val!13110 Int)) )
))
(declare-datatypes ((ValueCell!12344 0))(
  ( (ValueCellFull!12344 (v!15726 V!39937)) (EmptyCell!12344) )
))
(declare-fun mapValue!40903 () ValueCell!12344)

(declare-datatypes ((array!69203 0))(
  ( (array!69204 (arr!33273 (Array (_ BitVec 32) ValueCell!12344)) (size!33810 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69203)

(declare-fun mapRest!40903 () (Array (_ BitVec 32) ValueCell!12344))

(declare-fun mapKey!40903 () (_ BitVec 32))

(assert (=> mapNonEmpty!40903 (= (arr!33273 _values!874) (store mapRest!40903 mapKey!40903 mapValue!40903))))

(declare-fun b!1078732 () Bool)

(declare-fun res!718427 () Bool)

(declare-fun e!616889 () Bool)

(assert (=> b!1078732 (=> (not res!718427) (not e!616889))))

(declare-datatypes ((array!69205 0))(
  ( (array!69206 (arr!33274 (Array (_ BitVec 32) (_ BitVec 64))) (size!33811 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69205)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69205 (_ BitVec 32)) Bool)

(assert (=> b!1078732 (= res!718427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40903 () Bool)

(assert (=> mapIsEmpty!40903 mapRes!40903))

(declare-fun b!1078733 () Bool)

(declare-fun e!616891 () Bool)

(assert (=> b!1078733 (= e!616891 (and e!616892 mapRes!40903))))

(declare-fun condMapEmpty!40903 () Bool)

(declare-fun mapDefault!40903 () ValueCell!12344)

(assert (=> b!1078733 (= condMapEmpty!40903 (= (arr!33273 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12344)) mapDefault!40903)))))

(declare-fun res!718425 () Bool)

(assert (=> start!95630 (=> (not res!718425) (not e!616889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95630 (= res!718425 (validMask!0 mask!1414))))

(assert (=> start!95630 e!616889))

(assert (=> start!95630 true))

(declare-fun array_inv!25748 (array!69203) Bool)

(assert (=> start!95630 (and (array_inv!25748 _values!874) e!616891)))

(declare-fun array_inv!25749 (array!69205) Bool)

(assert (=> start!95630 (array_inv!25749 _keys!1070)))

(declare-fun b!1078734 () Bool)

(assert (=> b!1078734 (= e!616890 tp_is_empty!26107)))

(declare-fun b!1078735 () Bool)

(assert (=> b!1078735 (= e!616889 false)))

(declare-fun lt!479057 () Bool)

(declare-datatypes ((List!23227 0))(
  ( (Nil!23224) (Cons!23223 (h!24441 (_ BitVec 64)) (t!32578 List!23227)) )
))
(declare-fun arrayNoDuplicates!0 (array!69205 (_ BitVec 32) List!23227) Bool)

(assert (=> b!1078735 (= lt!479057 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23224))))

(declare-fun b!1078736 () Bool)

(declare-fun res!718426 () Bool)

(assert (=> b!1078736 (=> (not res!718426) (not e!616889))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078736 (= res!718426 (and (= (size!33810 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33811 _keys!1070) (size!33810 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95630 res!718425) b!1078736))

(assert (= (and b!1078736 res!718426) b!1078732))

(assert (= (and b!1078732 res!718427) b!1078735))

(assert (= (and b!1078733 condMapEmpty!40903) mapIsEmpty!40903))

(assert (= (and b!1078733 (not condMapEmpty!40903)) mapNonEmpty!40903))

(get-info :version)

(assert (= (and mapNonEmpty!40903 ((_ is ValueCellFull!12344) mapValue!40903)) b!1078734))

(assert (= (and b!1078733 ((_ is ValueCellFull!12344) mapDefault!40903)) b!1078731))

(assert (= start!95630 b!1078733))

(declare-fun m!997947 () Bool)

(assert (=> mapNonEmpty!40903 m!997947))

(declare-fun m!997949 () Bool)

(assert (=> b!1078732 m!997949))

(declare-fun m!997951 () Bool)

(assert (=> start!95630 m!997951))

(declare-fun m!997953 () Bool)

(assert (=> start!95630 m!997953))

(declare-fun m!997955 () Bool)

(assert (=> start!95630 m!997955))

(declare-fun m!997957 () Bool)

(assert (=> b!1078735 m!997957))

(check-sat (not b!1078732) (not mapNonEmpty!40903) tp_is_empty!26107 (not start!95630) (not b!1078735))
(check-sat)
