; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96564 () Bool)

(assert start!96564)

(declare-fun b!1096074 () Bool)

(declare-fun res!731091 () Bool)

(declare-fun e!625874 () Bool)

(assert (=> b!1096074 (=> (not res!731091) (not e!625874))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!70911 0))(
  ( (array!70912 (arr!34123 (Array (_ BitVec 32) (_ BitVec 64))) (size!34660 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70911)

(declare-datatypes ((V!41105 0))(
  ( (V!41106 (val!13548 Int)) )
))
(declare-datatypes ((ValueCell!12782 0))(
  ( (ValueCellFull!12782 (v!16165 V!41105)) (EmptyCell!12782) )
))
(declare-datatypes ((array!70913 0))(
  ( (array!70914 (arr!34124 (Array (_ BitVec 32) ValueCell!12782)) (size!34661 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70913)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096074 (= res!731091 (and (= (size!34661 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34660 _keys!1070) (size!34661 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096075 () Bool)

(declare-fun res!731093 () Bool)

(assert (=> b!1096075 (=> (not res!731093) (not e!625874))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096075 (= res!731093 (= (select (arr!34123 _keys!1070) i!650) k0!904))))

(declare-fun b!1096076 () Bool)

(declare-fun res!731090 () Bool)

(assert (=> b!1096076 (=> (not res!731090) (not e!625874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70911 (_ BitVec 32)) Bool)

(assert (=> b!1096076 (= res!731090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096077 () Bool)

(declare-fun e!625870 () Bool)

(declare-fun tp_is_empty!26983 () Bool)

(assert (=> b!1096077 (= e!625870 tp_is_empty!26983)))

(declare-fun b!1096078 () Bool)

(declare-fun res!731092 () Bool)

(assert (=> b!1096078 (=> (not res!731092) (not e!625874))))

(assert (=> b!1096078 (= res!731092 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34660 _keys!1070))))))

(declare-fun b!1096079 () Bool)

(declare-fun res!731087 () Bool)

(assert (=> b!1096079 (=> (not res!731087) (not e!625874))))

(declare-datatypes ((List!23838 0))(
  ( (Nil!23835) (Cons!23834 (h!25052 (_ BitVec 64)) (t!33837 List!23838)) )
))
(declare-fun arrayNoDuplicates!0 (array!70911 (_ BitVec 32) List!23838) Bool)

(assert (=> b!1096079 (= res!731087 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23835))))

(declare-fun b!1096080 () Bool)

(declare-fun e!625873 () Bool)

(declare-fun e!625871 () Bool)

(declare-fun mapRes!42229 () Bool)

(assert (=> b!1096080 (= e!625873 (and e!625871 mapRes!42229))))

(declare-fun condMapEmpty!42229 () Bool)

(declare-fun mapDefault!42229 () ValueCell!12782)

(assert (=> b!1096080 (= condMapEmpty!42229 (= (arr!34124 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12782)) mapDefault!42229)))))

(declare-fun b!1096081 () Bool)

(declare-fun res!731094 () Bool)

(assert (=> b!1096081 (=> (not res!731094) (not e!625874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096081 (= res!731094 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42229 () Bool)

(declare-fun tp!80744 () Bool)

(assert (=> mapNonEmpty!42229 (= mapRes!42229 (and tp!80744 e!625870))))

(declare-fun mapKey!42229 () (_ BitVec 32))

(declare-fun mapRest!42229 () (Array (_ BitVec 32) ValueCell!12782))

(declare-fun mapValue!42229 () ValueCell!12782)

(assert (=> mapNonEmpty!42229 (= (arr!34124 _values!874) (store mapRest!42229 mapKey!42229 mapValue!42229))))

(declare-fun b!1096082 () Bool)

(declare-fun e!625872 () Bool)

(assert (=> b!1096082 (= e!625874 e!625872)))

(declare-fun res!731089 () Bool)

(assert (=> b!1096082 (=> (not res!731089) (not e!625872))))

(declare-fun lt!490211 () array!70911)

(assert (=> b!1096082 (= res!731089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490211 mask!1414))))

(assert (=> b!1096082 (= lt!490211 (array!70912 (store (arr!34123 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34660 _keys!1070)))))

(declare-fun b!1096073 () Bool)

(assert (=> b!1096073 (= e!625871 tp_is_empty!26983)))

(declare-fun res!731088 () Bool)

(assert (=> start!96564 (=> (not res!731088) (not e!625874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96564 (= res!731088 (validMask!0 mask!1414))))

(assert (=> start!96564 e!625874))

(assert (=> start!96564 true))

(declare-fun array_inv!26334 (array!70911) Bool)

(assert (=> start!96564 (array_inv!26334 _keys!1070)))

(declare-fun array_inv!26335 (array!70913) Bool)

(assert (=> start!96564 (and (array_inv!26335 _values!874) e!625873)))

(declare-fun b!1096083 () Bool)

(assert (=> b!1096083 (= e!625872 false)))

(declare-fun lt!490212 () Bool)

(assert (=> b!1096083 (= lt!490212 (arrayNoDuplicates!0 lt!490211 #b00000000000000000000000000000000 Nil!23835))))

(declare-fun mapIsEmpty!42229 () Bool)

(assert (=> mapIsEmpty!42229 mapRes!42229))

(assert (= (and start!96564 res!731088) b!1096074))

(assert (= (and b!1096074 res!731091) b!1096076))

(assert (= (and b!1096076 res!731090) b!1096079))

(assert (= (and b!1096079 res!731087) b!1096078))

(assert (= (and b!1096078 res!731092) b!1096081))

(assert (= (and b!1096081 res!731094) b!1096075))

(assert (= (and b!1096075 res!731093) b!1096082))

(assert (= (and b!1096082 res!731089) b!1096083))

(assert (= (and b!1096080 condMapEmpty!42229) mapIsEmpty!42229))

(assert (= (and b!1096080 (not condMapEmpty!42229)) mapNonEmpty!42229))

(get-info :version)

(assert (= (and mapNonEmpty!42229 ((_ is ValueCellFull!12782) mapValue!42229)) b!1096077))

(assert (= (and b!1096080 ((_ is ValueCellFull!12782) mapDefault!42229)) b!1096073))

(assert (= start!96564 b!1096080))

(declare-fun m!1016255 () Bool)

(assert (=> b!1096083 m!1016255))

(declare-fun m!1016257 () Bool)

(assert (=> b!1096082 m!1016257))

(declare-fun m!1016259 () Bool)

(assert (=> b!1096082 m!1016259))

(declare-fun m!1016261 () Bool)

(assert (=> b!1096075 m!1016261))

(declare-fun m!1016263 () Bool)

(assert (=> b!1096079 m!1016263))

(declare-fun m!1016265 () Bool)

(assert (=> start!96564 m!1016265))

(declare-fun m!1016267 () Bool)

(assert (=> start!96564 m!1016267))

(declare-fun m!1016269 () Bool)

(assert (=> start!96564 m!1016269))

(declare-fun m!1016271 () Bool)

(assert (=> b!1096081 m!1016271))

(declare-fun m!1016273 () Bool)

(assert (=> b!1096076 m!1016273))

(declare-fun m!1016275 () Bool)

(assert (=> mapNonEmpty!42229 m!1016275))

(check-sat (not mapNonEmpty!42229) (not b!1096076) (not b!1096082) (not b!1096083) (not b!1096081) tp_is_empty!26983 (not start!96564) (not b!1096079))
(check-sat)
