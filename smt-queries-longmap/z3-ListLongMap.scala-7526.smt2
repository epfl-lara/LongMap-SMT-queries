; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95654 () Bool)

(assert start!95654)

(declare-fun b!1079011 () Bool)

(declare-fun e!617069 () Bool)

(declare-fun tp_is_empty!26131 () Bool)

(assert (=> b!1079011 (= e!617069 tp_is_empty!26131)))

(declare-fun b!1079012 () Bool)

(declare-fun res!718601 () Bool)

(declare-fun e!617070 () Bool)

(assert (=> b!1079012 (=> (not res!718601) (not e!617070))))

(declare-datatypes ((array!69251 0))(
  ( (array!69252 (arr!33297 (Array (_ BitVec 32) (_ BitVec 64))) (size!33834 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69251)

(declare-datatypes ((List!23237 0))(
  ( (Nil!23234) (Cons!23233 (h!24451 (_ BitVec 64)) (t!32588 List!23237)) )
))
(declare-fun arrayNoDuplicates!0 (array!69251 (_ BitVec 32) List!23237) Bool)

(assert (=> b!1079012 (= res!718601 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23234))))

(declare-fun b!1079013 () Bool)

(declare-fun res!718600 () Bool)

(assert (=> b!1079013 (=> (not res!718600) (not e!617070))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69251 (_ BitVec 32)) Bool)

(assert (=> b!1079013 (= res!718600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40939 () Bool)

(declare-fun mapRes!40939 () Bool)

(assert (=> mapIsEmpty!40939 mapRes!40939))

(declare-fun mapNonEmpty!40939 () Bool)

(declare-fun tp!78401 () Bool)

(assert (=> mapNonEmpty!40939 (= mapRes!40939 (and tp!78401 e!617069))))

(declare-datatypes ((V!39969 0))(
  ( (V!39970 (val!13122 Int)) )
))
(declare-datatypes ((ValueCell!12356 0))(
  ( (ValueCellFull!12356 (v!15738 V!39969)) (EmptyCell!12356) )
))
(declare-datatypes ((array!69253 0))(
  ( (array!69254 (arr!33298 (Array (_ BitVec 32) ValueCell!12356)) (size!33835 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69253)

(declare-fun mapValue!40939 () ValueCell!12356)

(declare-fun mapKey!40939 () (_ BitVec 32))

(declare-fun mapRest!40939 () (Array (_ BitVec 32) ValueCell!12356))

(assert (=> mapNonEmpty!40939 (= (arr!33298 _values!874) (store mapRest!40939 mapKey!40939 mapValue!40939))))

(declare-fun res!718598 () Bool)

(assert (=> start!95654 (=> (not res!718598) (not e!617070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95654 (= res!718598 (validMask!0 mask!1414))))

(assert (=> start!95654 e!617070))

(assert (=> start!95654 true))

(declare-fun array_inv!25762 (array!69251) Bool)

(assert (=> start!95654 (array_inv!25762 _keys!1070)))

(declare-fun e!617071 () Bool)

(declare-fun array_inv!25763 (array!69253) Bool)

(assert (=> start!95654 (and (array_inv!25763 _values!874) e!617071)))

(declare-fun b!1079014 () Bool)

(assert (=> b!1079014 (= e!617070 (bvsgt #b00000000000000000000000000000000 (size!33834 _keys!1070)))))

(declare-fun b!1079015 () Bool)

(declare-fun e!617068 () Bool)

(assert (=> b!1079015 (= e!617071 (and e!617068 mapRes!40939))))

(declare-fun condMapEmpty!40939 () Bool)

(declare-fun mapDefault!40939 () ValueCell!12356)

(assert (=> b!1079015 (= condMapEmpty!40939 (= (arr!33298 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12356)) mapDefault!40939)))))

(declare-fun b!1079016 () Bool)

(assert (=> b!1079016 (= e!617068 tp_is_empty!26131)))

(declare-fun b!1079017 () Bool)

(declare-fun res!718599 () Bool)

(assert (=> b!1079017 (=> (not res!718599) (not e!617070))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079017 (= res!718599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69252 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33834 _keys!1070)) mask!1414))))

(declare-fun b!1079018 () Bool)

(declare-fun res!718602 () Bool)

(assert (=> b!1079018 (=> (not res!718602) (not e!617070))))

(assert (=> b!1079018 (= res!718602 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33834 _keys!1070))))))

(declare-fun b!1079019 () Bool)

(declare-fun res!718604 () Bool)

(assert (=> b!1079019 (=> (not res!718604) (not e!617070))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079019 (= res!718604 (and (= (size!33835 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33834 _keys!1070) (size!33835 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079020 () Bool)

(declare-fun res!718597 () Bool)

(assert (=> b!1079020 (=> (not res!718597) (not e!617070))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079020 (= res!718597 (= (select (arr!33297 _keys!1070) i!650) k0!904))))

(declare-fun b!1079021 () Bool)

(declare-fun res!718603 () Bool)

(assert (=> b!1079021 (=> (not res!718603) (not e!617070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079021 (= res!718603 (validKeyInArray!0 k0!904))))

(assert (= (and start!95654 res!718598) b!1079019))

(assert (= (and b!1079019 res!718604) b!1079013))

(assert (= (and b!1079013 res!718600) b!1079012))

(assert (= (and b!1079012 res!718601) b!1079018))

(assert (= (and b!1079018 res!718602) b!1079021))

(assert (= (and b!1079021 res!718603) b!1079020))

(assert (= (and b!1079020 res!718597) b!1079017))

(assert (= (and b!1079017 res!718599) b!1079014))

(assert (= (and b!1079015 condMapEmpty!40939) mapIsEmpty!40939))

(assert (= (and b!1079015 (not condMapEmpty!40939)) mapNonEmpty!40939))

(get-info :version)

(assert (= (and mapNonEmpty!40939 ((_ is ValueCellFull!12356) mapValue!40939)) b!1079011))

(assert (= (and b!1079015 ((_ is ValueCellFull!12356) mapDefault!40939)) b!1079016))

(assert (= start!95654 b!1079015))

(declare-fun m!998115 () Bool)

(assert (=> b!1079020 m!998115))

(declare-fun m!998117 () Bool)

(assert (=> start!95654 m!998117))

(declare-fun m!998119 () Bool)

(assert (=> start!95654 m!998119))

(declare-fun m!998121 () Bool)

(assert (=> start!95654 m!998121))

(declare-fun m!998123 () Bool)

(assert (=> b!1079017 m!998123))

(declare-fun m!998125 () Bool)

(assert (=> b!1079017 m!998125))

(declare-fun m!998127 () Bool)

(assert (=> mapNonEmpty!40939 m!998127))

(declare-fun m!998129 () Bool)

(assert (=> b!1079021 m!998129))

(declare-fun m!998131 () Bool)

(assert (=> b!1079012 m!998131))

(declare-fun m!998133 () Bool)

(assert (=> b!1079013 m!998133))

(check-sat (not mapNonEmpty!40939) (not b!1079012) tp_is_empty!26131 (not b!1079021) (not start!95654) (not b!1079013) (not b!1079017))
(check-sat)
