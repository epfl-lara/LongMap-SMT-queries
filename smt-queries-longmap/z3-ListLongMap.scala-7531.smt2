; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95484 () Bool)

(assert start!95484)

(declare-fun b!1078199 () Bool)

(declare-fun e!616477 () Bool)

(assert (=> b!1078199 (= e!616477 false)))

(declare-fun lt!478420 () Bool)

(declare-datatypes ((array!69206 0))(
  ( (array!69207 (arr!33278 (Array (_ BitVec 32) (_ BitVec 64))) (size!33816 (_ BitVec 32))) )
))
(declare-fun lt!478421 () array!69206)

(declare-datatypes ((List!23287 0))(
  ( (Nil!23284) (Cons!23283 (h!24492 (_ BitVec 64)) (t!32637 List!23287)) )
))
(declare-fun arrayNoDuplicates!0 (array!69206 (_ BitVec 32) List!23287) Bool)

(assert (=> b!1078199 (= lt!478420 (arrayNoDuplicates!0 lt!478421 #b00000000000000000000000000000000 Nil!23284))))

(declare-fun b!1078200 () Bool)

(declare-fun e!616476 () Bool)

(declare-fun tp_is_empty!26161 () Bool)

(assert (=> b!1078200 (= e!616476 tp_is_empty!26161)))

(declare-fun b!1078201 () Bool)

(declare-fun res!718478 () Bool)

(declare-fun e!616478 () Bool)

(assert (=> b!1078201 (=> (not res!718478) (not e!616478))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078201 (= res!718478 (validKeyInArray!0 k0!904))))

(declare-fun b!1078202 () Bool)

(declare-fun res!718480 () Bool)

(assert (=> b!1078202 (=> (not res!718480) (not e!616478))))

(declare-fun _keys!1070 () array!69206)

(assert (=> b!1078202 (= res!718480 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23284))))

(declare-fun b!1078203 () Bool)

(assert (=> b!1078203 (= e!616478 e!616477)))

(declare-fun res!718475 () Bool)

(assert (=> b!1078203 (=> (not res!718475) (not e!616477))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69206 (_ BitVec 32)) Bool)

(assert (=> b!1078203 (= res!718475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478421 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078203 (= lt!478421 (array!69207 (store (arr!33278 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33816 _keys!1070)))))

(declare-fun b!1078204 () Bool)

(declare-fun res!718473 () Bool)

(assert (=> b!1078204 (=> (not res!718473) (not e!616478))))

(assert (=> b!1078204 (= res!718473 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33816 _keys!1070))))))

(declare-fun b!1078205 () Bool)

(declare-fun res!718479 () Bool)

(assert (=> b!1078205 (=> (not res!718479) (not e!616478))))

(assert (=> b!1078205 (= res!718479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078206 () Bool)

(declare-fun e!616475 () Bool)

(declare-fun mapRes!40993 () Bool)

(assert (=> b!1078206 (= e!616475 (and e!616476 mapRes!40993))))

(declare-fun condMapEmpty!40993 () Bool)

(declare-datatypes ((V!40009 0))(
  ( (V!40010 (val!13137 Int)) )
))
(declare-datatypes ((ValueCell!12371 0))(
  ( (ValueCellFull!12371 (v!15757 V!40009)) (EmptyCell!12371) )
))
(declare-datatypes ((array!69208 0))(
  ( (array!69209 (arr!33279 (Array (_ BitVec 32) ValueCell!12371)) (size!33817 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69208)

(declare-fun mapDefault!40993 () ValueCell!12371)

(assert (=> b!1078206 (= condMapEmpty!40993 (= (arr!33279 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12371)) mapDefault!40993)))))

(declare-fun res!718476 () Bool)

(assert (=> start!95484 (=> (not res!718476) (not e!616478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95484 (= res!718476 (validMask!0 mask!1414))))

(assert (=> start!95484 e!616478))

(assert (=> start!95484 true))

(declare-fun array_inv!25730 (array!69206) Bool)

(assert (=> start!95484 (array_inv!25730 _keys!1070)))

(declare-fun array_inv!25731 (array!69208) Bool)

(assert (=> start!95484 (and (array_inv!25731 _values!874) e!616475)))

(declare-fun b!1078207 () Bool)

(declare-fun res!718474 () Bool)

(assert (=> b!1078207 (=> (not res!718474) (not e!616478))))

(assert (=> b!1078207 (= res!718474 (= (select (arr!33278 _keys!1070) i!650) k0!904))))

(declare-fun b!1078208 () Bool)

(declare-fun e!616479 () Bool)

(assert (=> b!1078208 (= e!616479 tp_is_empty!26161)))

(declare-fun b!1078209 () Bool)

(declare-fun res!718477 () Bool)

(assert (=> b!1078209 (=> (not res!718477) (not e!616478))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078209 (= res!718477 (and (= (size!33817 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33816 _keys!1070) (size!33817 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!40993 () Bool)

(assert (=> mapIsEmpty!40993 mapRes!40993))

(declare-fun mapNonEmpty!40993 () Bool)

(declare-fun tp!78455 () Bool)

(assert (=> mapNonEmpty!40993 (= mapRes!40993 (and tp!78455 e!616479))))

(declare-fun mapRest!40993 () (Array (_ BitVec 32) ValueCell!12371))

(declare-fun mapValue!40993 () ValueCell!12371)

(declare-fun mapKey!40993 () (_ BitVec 32))

(assert (=> mapNonEmpty!40993 (= (arr!33279 _values!874) (store mapRest!40993 mapKey!40993 mapValue!40993))))

(assert (= (and start!95484 res!718476) b!1078209))

(assert (= (and b!1078209 res!718477) b!1078205))

(assert (= (and b!1078205 res!718479) b!1078202))

(assert (= (and b!1078202 res!718480) b!1078204))

(assert (= (and b!1078204 res!718473) b!1078201))

(assert (= (and b!1078201 res!718478) b!1078207))

(assert (= (and b!1078207 res!718474) b!1078203))

(assert (= (and b!1078203 res!718475) b!1078199))

(assert (= (and b!1078206 condMapEmpty!40993) mapIsEmpty!40993))

(assert (= (and b!1078206 (not condMapEmpty!40993)) mapNonEmpty!40993))

(get-info :version)

(assert (= (and mapNonEmpty!40993 ((_ is ValueCellFull!12371) mapValue!40993)) b!1078208))

(assert (= (and b!1078206 ((_ is ValueCellFull!12371) mapDefault!40993)) b!1078200))

(assert (= start!95484 b!1078206))

(declare-fun m!996255 () Bool)

(assert (=> b!1078199 m!996255))

(declare-fun m!996257 () Bool)

(assert (=> b!1078205 m!996257))

(declare-fun m!996259 () Bool)

(assert (=> b!1078203 m!996259))

(declare-fun m!996261 () Bool)

(assert (=> b!1078203 m!996261))

(declare-fun m!996263 () Bool)

(assert (=> mapNonEmpty!40993 m!996263))

(declare-fun m!996265 () Bool)

(assert (=> b!1078202 m!996265))

(declare-fun m!996267 () Bool)

(assert (=> start!95484 m!996267))

(declare-fun m!996269 () Bool)

(assert (=> start!95484 m!996269))

(declare-fun m!996271 () Bool)

(assert (=> start!95484 m!996271))

(declare-fun m!996273 () Bool)

(assert (=> b!1078207 m!996273))

(declare-fun m!996275 () Bool)

(assert (=> b!1078201 m!996275))

(check-sat (not mapNonEmpty!40993) (not b!1078203) (not b!1078201) (not b!1078205) tp_is_empty!26161 (not b!1078202) (not b!1078199) (not start!95484))
(check-sat)
