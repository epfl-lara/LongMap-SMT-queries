; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95498 () Bool)

(assert start!95498)

(declare-fun b!1078484 () Bool)

(declare-fun e!616643 () Bool)

(assert (=> b!1078484 (= e!616643 false)))

(declare-fun lt!478645 () Bool)

(declare-datatypes ((array!69293 0))(
  ( (array!69294 (arr!33321 (Array (_ BitVec 32) (_ BitVec 64))) (size!33857 (_ BitVec 32))) )
))
(declare-fun lt!478644 () array!69293)

(declare-datatypes ((List!23240 0))(
  ( (Nil!23237) (Cons!23236 (h!24445 (_ BitVec 64)) (t!32599 List!23240)) )
))
(declare-fun arrayNoDuplicates!0 (array!69293 (_ BitVec 32) List!23240) Bool)

(assert (=> b!1078484 (= lt!478645 (arrayNoDuplicates!0 lt!478644 #b00000000000000000000000000000000 Nil!23237))))

(declare-fun b!1078485 () Bool)

(declare-fun e!616644 () Bool)

(assert (=> b!1078485 (= e!616644 e!616643)))

(declare-fun res!718640 () Bool)

(assert (=> b!1078485 (=> (not res!718640) (not e!616643))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69293 (_ BitVec 32)) Bool)

(assert (=> b!1078485 (= res!718640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478644 mask!1414))))

(declare-fun _keys!1070 () array!69293)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078485 (= lt!478644 (array!69294 (store (arr!33321 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33857 _keys!1070)))))

(declare-fun b!1078486 () Bool)

(declare-fun res!718644 () Bool)

(assert (=> b!1078486 (=> (not res!718644) (not e!616644))))

(declare-datatypes ((V!40019 0))(
  ( (V!40020 (val!13141 Int)) )
))
(declare-datatypes ((ValueCell!12375 0))(
  ( (ValueCellFull!12375 (v!15762 V!40019)) (EmptyCell!12375) )
))
(declare-datatypes ((array!69295 0))(
  ( (array!69296 (arr!33322 (Array (_ BitVec 32) ValueCell!12375)) (size!33858 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69295)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078486 (= res!718644 (and (= (size!33858 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33857 _keys!1070) (size!33858 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41005 () Bool)

(declare-fun mapRes!41005 () Bool)

(assert (=> mapIsEmpty!41005 mapRes!41005))

(declare-fun b!1078487 () Bool)

(declare-fun res!718643 () Bool)

(assert (=> b!1078487 (=> (not res!718643) (not e!616644))))

(assert (=> b!1078487 (= res!718643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078489 () Bool)

(declare-fun res!718645 () Bool)

(assert (=> b!1078489 (=> (not res!718645) (not e!616644))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078489 (= res!718645 (validKeyInArray!0 k0!904))))

(declare-fun b!1078490 () Bool)

(declare-fun res!718639 () Bool)

(assert (=> b!1078490 (=> (not res!718639) (not e!616644))))

(assert (=> b!1078490 (= res!718639 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33857 _keys!1070))))))

(declare-fun b!1078491 () Bool)

(declare-fun e!616641 () Bool)

(declare-fun e!616642 () Bool)

(assert (=> b!1078491 (= e!616641 (and e!616642 mapRes!41005))))

(declare-fun condMapEmpty!41005 () Bool)

(declare-fun mapDefault!41005 () ValueCell!12375)

(assert (=> b!1078491 (= condMapEmpty!41005 (= (arr!33322 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12375)) mapDefault!41005)))))

(declare-fun b!1078492 () Bool)

(declare-fun tp_is_empty!26169 () Bool)

(assert (=> b!1078492 (= e!616642 tp_is_empty!26169)))

(declare-fun mapNonEmpty!41005 () Bool)

(declare-fun tp!78467 () Bool)

(declare-fun e!616645 () Bool)

(assert (=> mapNonEmpty!41005 (= mapRes!41005 (and tp!78467 e!616645))))

(declare-fun mapKey!41005 () (_ BitVec 32))

(declare-fun mapValue!41005 () ValueCell!12375)

(declare-fun mapRest!41005 () (Array (_ BitVec 32) ValueCell!12375))

(assert (=> mapNonEmpty!41005 (= (arr!33322 _values!874) (store mapRest!41005 mapKey!41005 mapValue!41005))))

(declare-fun res!718641 () Bool)

(assert (=> start!95498 (=> (not res!718641) (not e!616644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95498 (= res!718641 (validMask!0 mask!1414))))

(assert (=> start!95498 e!616644))

(assert (=> start!95498 true))

(declare-fun array_inv!25738 (array!69293) Bool)

(assert (=> start!95498 (array_inv!25738 _keys!1070)))

(declare-fun array_inv!25739 (array!69295) Bool)

(assert (=> start!95498 (and (array_inv!25739 _values!874) e!616641)))

(declare-fun b!1078488 () Bool)

(assert (=> b!1078488 (= e!616645 tp_is_empty!26169)))

(declare-fun b!1078493 () Bool)

(declare-fun res!718638 () Bool)

(assert (=> b!1078493 (=> (not res!718638) (not e!616644))))

(assert (=> b!1078493 (= res!718638 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23237))))

(declare-fun b!1078494 () Bool)

(declare-fun res!718642 () Bool)

(assert (=> b!1078494 (=> (not res!718642) (not e!616644))))

(assert (=> b!1078494 (= res!718642 (= (select (arr!33321 _keys!1070) i!650) k0!904))))

(assert (= (and start!95498 res!718641) b!1078486))

(assert (= (and b!1078486 res!718644) b!1078487))

(assert (= (and b!1078487 res!718643) b!1078493))

(assert (= (and b!1078493 res!718638) b!1078490))

(assert (= (and b!1078490 res!718639) b!1078489))

(assert (= (and b!1078489 res!718645) b!1078494))

(assert (= (and b!1078494 res!718642) b!1078485))

(assert (= (and b!1078485 res!718640) b!1078484))

(assert (= (and b!1078491 condMapEmpty!41005) mapIsEmpty!41005))

(assert (= (and b!1078491 (not condMapEmpty!41005)) mapNonEmpty!41005))

(get-info :version)

(assert (= (and mapNonEmpty!41005 ((_ is ValueCellFull!12375) mapValue!41005)) b!1078488))

(assert (= (and b!1078491 ((_ is ValueCellFull!12375) mapDefault!41005)) b!1078492))

(assert (= start!95498 b!1078491))

(declare-fun m!996969 () Bool)

(assert (=> mapNonEmpty!41005 m!996969))

(declare-fun m!996971 () Bool)

(assert (=> b!1078493 m!996971))

(declare-fun m!996973 () Bool)

(assert (=> b!1078487 m!996973))

(declare-fun m!996975 () Bool)

(assert (=> b!1078484 m!996975))

(declare-fun m!996977 () Bool)

(assert (=> b!1078489 m!996977))

(declare-fun m!996979 () Bool)

(assert (=> b!1078485 m!996979))

(declare-fun m!996981 () Bool)

(assert (=> b!1078485 m!996981))

(declare-fun m!996983 () Bool)

(assert (=> b!1078494 m!996983))

(declare-fun m!996985 () Bool)

(assert (=> start!95498 m!996985))

(declare-fun m!996987 () Bool)

(assert (=> start!95498 m!996987))

(declare-fun m!996989 () Bool)

(assert (=> start!95498 m!996989))

(check-sat (not mapNonEmpty!41005) (not start!95498) (not b!1078489) (not b!1078493) (not b!1078485) (not b!1078487) (not b!1078484) tp_is_empty!26169)
(check-sat)
