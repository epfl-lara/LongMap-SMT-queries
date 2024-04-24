; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95826 () Bool)

(assert start!95826)

(declare-fun b!1081216 () Bool)

(declare-fun res!720204 () Bool)

(declare-fun e!618224 () Bool)

(assert (=> b!1081216 (=> (not res!720204) (not e!618224))))

(declare-datatypes ((array!69479 0))(
  ( (array!69480 (arr!33407 (Array (_ BitVec 32) (_ BitVec 64))) (size!33944 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69479)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081216 (= res!720204 (= (select (arr!33407 _keys!1070) i!650) k0!904))))

(declare-fun b!1081217 () Bool)

(declare-fun e!618222 () Bool)

(assert (=> b!1081217 (= e!618224 e!618222)))

(declare-fun res!720201 () Bool)

(assert (=> b!1081217 (=> (not res!720201) (not e!618222))))

(declare-fun lt!479403 () array!69479)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69479 (_ BitVec 32)) Bool)

(assert (=> b!1081217 (= res!720201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479403 mask!1414))))

(assert (=> b!1081217 (= lt!479403 (array!69480 (store (arr!33407 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33944 _keys!1070)))))

(declare-fun mapIsEmpty!41122 () Bool)

(declare-fun mapRes!41122 () Bool)

(assert (=> mapIsEmpty!41122 mapRes!41122))

(declare-fun b!1081218 () Bool)

(declare-fun res!720205 () Bool)

(assert (=> b!1081218 (=> (not res!720205) (not e!618224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081218 (= res!720205 (validKeyInArray!0 k0!904))))

(declare-fun b!1081219 () Bool)

(declare-fun res!720199 () Bool)

(assert (=> b!1081219 (=> (not res!720199) (not e!618224))))

(assert (=> b!1081219 (= res!720199 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33944 _keys!1070))))))

(declare-fun res!720200 () Bool)

(assert (=> start!95826 (=> (not res!720200) (not e!618224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95826 (= res!720200 (validMask!0 mask!1414))))

(assert (=> start!95826 e!618224))

(assert (=> start!95826 true))

(declare-fun array_inv!25832 (array!69479) Bool)

(assert (=> start!95826 (array_inv!25832 _keys!1070)))

(declare-datatypes ((V!40121 0))(
  ( (V!40122 (val!13179 Int)) )
))
(declare-datatypes ((ValueCell!12413 0))(
  ( (ValueCellFull!12413 (v!15796 V!40121)) (EmptyCell!12413) )
))
(declare-datatypes ((array!69481 0))(
  ( (array!69482 (arr!33408 (Array (_ BitVec 32) ValueCell!12413)) (size!33945 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69481)

(declare-fun e!618223 () Bool)

(declare-fun array_inv!25833 (array!69481) Bool)

(assert (=> start!95826 (and (array_inv!25833 _values!874) e!618223)))

(declare-fun b!1081220 () Bool)

(declare-fun res!720202 () Bool)

(assert (=> b!1081220 (=> (not res!720202) (not e!618224))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081220 (= res!720202 (and (= (size!33945 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33944 _keys!1070) (size!33945 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081221 () Bool)

(declare-fun res!720207 () Bool)

(assert (=> b!1081221 (=> (not res!720207) (not e!618222))))

(declare-datatypes ((List!23277 0))(
  ( (Nil!23274) (Cons!23273 (h!24491 (_ BitVec 64)) (t!32628 List!23277)) )
))
(declare-fun arrayNoDuplicates!0 (array!69479 (_ BitVec 32) List!23277) Bool)

(assert (=> b!1081221 (= res!720207 (arrayNoDuplicates!0 lt!479403 #b00000000000000000000000000000000 Nil!23274))))

(declare-fun b!1081222 () Bool)

(declare-fun e!618221 () Bool)

(declare-fun tp_is_empty!26245 () Bool)

(assert (=> b!1081222 (= e!618221 tp_is_empty!26245)))

(declare-fun mapNonEmpty!41122 () Bool)

(declare-fun tp!78584 () Bool)

(declare-fun e!618220 () Bool)

(assert (=> mapNonEmpty!41122 (= mapRes!41122 (and tp!78584 e!618220))))

(declare-fun mapRest!41122 () (Array (_ BitVec 32) ValueCell!12413))

(declare-fun mapKey!41122 () (_ BitVec 32))

(declare-fun mapValue!41122 () ValueCell!12413)

(assert (=> mapNonEmpty!41122 (= (arr!33408 _values!874) (store mapRest!41122 mapKey!41122 mapValue!41122))))

(declare-fun b!1081223 () Bool)

(declare-fun res!720203 () Bool)

(assert (=> b!1081223 (=> (not res!720203) (not e!618224))))

(assert (=> b!1081223 (= res!720203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081224 () Bool)

(assert (=> b!1081224 (= e!618220 tp_is_empty!26245)))

(declare-fun b!1081225 () Bool)

(assert (=> b!1081225 (= e!618223 (and e!618221 mapRes!41122))))

(declare-fun condMapEmpty!41122 () Bool)

(declare-fun mapDefault!41122 () ValueCell!12413)

(assert (=> b!1081225 (= condMapEmpty!41122 (= (arr!33408 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12413)) mapDefault!41122)))))

(declare-fun b!1081226 () Bool)

(assert (=> b!1081226 (= e!618222 (not (bvsle #b00000000000000000000000000000000 (size!33944 _keys!1070))))))

(declare-fun arrayContainsKey!0 (array!69479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081226 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35481 0))(
  ( (Unit!35482) )
))
(declare-fun lt!479402 () Unit!35481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69479 (_ BitVec 64) (_ BitVec 32)) Unit!35481)

(assert (=> b!1081226 (= lt!479402 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081227 () Bool)

(declare-fun res!720206 () Bool)

(assert (=> b!1081227 (=> (not res!720206) (not e!618224))))

(assert (=> b!1081227 (= res!720206 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23274))))

(assert (= (and start!95826 res!720200) b!1081220))

(assert (= (and b!1081220 res!720202) b!1081223))

(assert (= (and b!1081223 res!720203) b!1081227))

(assert (= (and b!1081227 res!720206) b!1081219))

(assert (= (and b!1081219 res!720199) b!1081218))

(assert (= (and b!1081218 res!720205) b!1081216))

(assert (= (and b!1081216 res!720204) b!1081217))

(assert (= (and b!1081217 res!720201) b!1081221))

(assert (= (and b!1081221 res!720207) b!1081226))

(assert (= (and b!1081225 condMapEmpty!41122) mapIsEmpty!41122))

(assert (= (and b!1081225 (not condMapEmpty!41122)) mapNonEmpty!41122))

(get-info :version)

(assert (= (and mapNonEmpty!41122 ((_ is ValueCellFull!12413) mapValue!41122)) b!1081224))

(assert (= (and b!1081225 ((_ is ValueCellFull!12413) mapDefault!41122)) b!1081222))

(assert (= start!95826 b!1081225))

(declare-fun m!999647 () Bool)

(assert (=> b!1081216 m!999647))

(declare-fun m!999649 () Bool)

(assert (=> b!1081221 m!999649))

(declare-fun m!999651 () Bool)

(assert (=> start!95826 m!999651))

(declare-fun m!999653 () Bool)

(assert (=> start!95826 m!999653))

(declare-fun m!999655 () Bool)

(assert (=> start!95826 m!999655))

(declare-fun m!999657 () Bool)

(assert (=> b!1081227 m!999657))

(declare-fun m!999659 () Bool)

(assert (=> b!1081223 m!999659))

(declare-fun m!999661 () Bool)

(assert (=> b!1081217 m!999661))

(declare-fun m!999663 () Bool)

(assert (=> b!1081217 m!999663))

(declare-fun m!999665 () Bool)

(assert (=> b!1081218 m!999665))

(declare-fun m!999667 () Bool)

(assert (=> mapNonEmpty!41122 m!999667))

(declare-fun m!999669 () Bool)

(assert (=> b!1081226 m!999669))

(declare-fun m!999671 () Bool)

(assert (=> b!1081226 m!999671))

(check-sat (not b!1081218) (not mapNonEmpty!41122) (not b!1081227) (not b!1081221) (not b!1081223) (not b!1081217) (not b!1081226) tp_is_empty!26245 (not start!95826))
(check-sat)
