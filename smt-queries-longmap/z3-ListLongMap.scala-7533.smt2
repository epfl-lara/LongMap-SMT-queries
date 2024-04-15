; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95496 () Bool)

(assert start!95496)

(declare-fun b!1078398 () Bool)

(declare-fun res!718620 () Bool)

(declare-fun e!616584 () Bool)

(assert (=> b!1078398 (=> (not res!718620) (not e!616584))))

(declare-datatypes ((array!69230 0))(
  ( (array!69231 (arr!33290 (Array (_ BitVec 32) (_ BitVec 64))) (size!33828 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69230)

(declare-datatypes ((List!23292 0))(
  ( (Nil!23289) (Cons!23288 (h!24497 (_ BitVec 64)) (t!32642 List!23292)) )
))
(declare-fun arrayNoDuplicates!0 (array!69230 (_ BitVec 32) List!23292) Bool)

(assert (=> b!1078398 (= res!718620 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23289))))

(declare-fun b!1078399 () Bool)

(declare-fun e!616586 () Bool)

(assert (=> b!1078399 (= e!616584 e!616586)))

(declare-fun res!718623 () Bool)

(assert (=> b!1078399 (=> (not res!718623) (not e!616586))))

(declare-fun lt!478457 () array!69230)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69230 (_ BitVec 32)) Bool)

(assert (=> b!1078399 (= res!718623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478457 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078399 (= lt!478457 (array!69231 (store (arr!33290 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33828 _keys!1070)))))

(declare-fun b!1078400 () Bool)

(declare-fun e!616583 () Bool)

(declare-fun e!616585 () Bool)

(declare-fun mapRes!41011 () Bool)

(assert (=> b!1078400 (= e!616583 (and e!616585 mapRes!41011))))

(declare-fun condMapEmpty!41011 () Bool)

(declare-datatypes ((V!40025 0))(
  ( (V!40026 (val!13143 Int)) )
))
(declare-datatypes ((ValueCell!12377 0))(
  ( (ValueCellFull!12377 (v!15763 V!40025)) (EmptyCell!12377) )
))
(declare-datatypes ((array!69232 0))(
  ( (array!69233 (arr!33291 (Array (_ BitVec 32) ValueCell!12377)) (size!33829 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69232)

(declare-fun mapDefault!41011 () ValueCell!12377)

(assert (=> b!1078400 (= condMapEmpty!41011 (= (arr!33291 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12377)) mapDefault!41011)))))

(declare-fun mapNonEmpty!41011 () Bool)

(declare-fun tp!78473 () Bool)

(declare-fun e!616587 () Bool)

(assert (=> mapNonEmpty!41011 (= mapRes!41011 (and tp!78473 e!616587))))

(declare-fun mapKey!41011 () (_ BitVec 32))

(declare-fun mapValue!41011 () ValueCell!12377)

(declare-fun mapRest!41011 () (Array (_ BitVec 32) ValueCell!12377))

(assert (=> mapNonEmpty!41011 (= (arr!33291 _values!874) (store mapRest!41011 mapKey!41011 mapValue!41011))))

(declare-fun b!1078401 () Bool)

(declare-fun res!718617 () Bool)

(assert (=> b!1078401 (=> (not res!718617) (not e!616584))))

(assert (=> b!1078401 (= res!718617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41011 () Bool)

(assert (=> mapIsEmpty!41011 mapRes!41011))

(declare-fun b!1078397 () Bool)

(declare-fun tp_is_empty!26173 () Bool)

(assert (=> b!1078397 (= e!616587 tp_is_empty!26173)))

(declare-fun res!718622 () Bool)

(assert (=> start!95496 (=> (not res!718622) (not e!616584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95496 (= res!718622 (validMask!0 mask!1414))))

(assert (=> start!95496 e!616584))

(assert (=> start!95496 true))

(declare-fun array_inv!25740 (array!69230) Bool)

(assert (=> start!95496 (array_inv!25740 _keys!1070)))

(declare-fun array_inv!25741 (array!69232) Bool)

(assert (=> start!95496 (and (array_inv!25741 _values!874) e!616583)))

(declare-fun b!1078402 () Bool)

(declare-fun res!718621 () Bool)

(assert (=> b!1078402 (=> (not res!718621) (not e!616584))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078402 (= res!718621 (validKeyInArray!0 k0!904))))

(declare-fun b!1078403 () Bool)

(declare-fun res!718618 () Bool)

(assert (=> b!1078403 (=> (not res!718618) (not e!616584))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078403 (= res!718618 (and (= (size!33829 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33828 _keys!1070) (size!33829 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078404 () Bool)

(declare-fun res!718619 () Bool)

(assert (=> b!1078404 (=> (not res!718619) (not e!616584))))

(assert (=> b!1078404 (= res!718619 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33828 _keys!1070))))))

(declare-fun b!1078405 () Bool)

(declare-fun res!718624 () Bool)

(assert (=> b!1078405 (=> (not res!718624) (not e!616584))))

(assert (=> b!1078405 (= res!718624 (= (select (arr!33290 _keys!1070) i!650) k0!904))))

(declare-fun b!1078406 () Bool)

(assert (=> b!1078406 (= e!616586 false)))

(declare-fun lt!478456 () Bool)

(assert (=> b!1078406 (= lt!478456 (arrayNoDuplicates!0 lt!478457 #b00000000000000000000000000000000 Nil!23289))))

(declare-fun b!1078407 () Bool)

(assert (=> b!1078407 (= e!616585 tp_is_empty!26173)))

(assert (= (and start!95496 res!718622) b!1078403))

(assert (= (and b!1078403 res!718618) b!1078401))

(assert (= (and b!1078401 res!718617) b!1078398))

(assert (= (and b!1078398 res!718620) b!1078404))

(assert (= (and b!1078404 res!718619) b!1078402))

(assert (= (and b!1078402 res!718621) b!1078405))

(assert (= (and b!1078405 res!718624) b!1078399))

(assert (= (and b!1078399 res!718623) b!1078406))

(assert (= (and b!1078400 condMapEmpty!41011) mapIsEmpty!41011))

(assert (= (and b!1078400 (not condMapEmpty!41011)) mapNonEmpty!41011))

(get-info :version)

(assert (= (and mapNonEmpty!41011 ((_ is ValueCellFull!12377) mapValue!41011)) b!1078397))

(assert (= (and b!1078400 ((_ is ValueCellFull!12377) mapDefault!41011)) b!1078407))

(assert (= start!95496 b!1078400))

(declare-fun m!996387 () Bool)

(assert (=> b!1078398 m!996387))

(declare-fun m!996389 () Bool)

(assert (=> b!1078399 m!996389))

(declare-fun m!996391 () Bool)

(assert (=> b!1078399 m!996391))

(declare-fun m!996393 () Bool)

(assert (=> b!1078401 m!996393))

(declare-fun m!996395 () Bool)

(assert (=> b!1078405 m!996395))

(declare-fun m!996397 () Bool)

(assert (=> b!1078402 m!996397))

(declare-fun m!996399 () Bool)

(assert (=> b!1078406 m!996399))

(declare-fun m!996401 () Bool)

(assert (=> start!95496 m!996401))

(declare-fun m!996403 () Bool)

(assert (=> start!95496 m!996403))

(declare-fun m!996405 () Bool)

(assert (=> start!95496 m!996405))

(declare-fun m!996407 () Bool)

(assert (=> mapNonEmpty!41011 m!996407))

(check-sat (not mapNonEmpty!41011) (not b!1078398) (not start!95496) (not b!1078399) (not b!1078401) (not b!1078402) tp_is_empty!26173 (not b!1078406))
(check-sat)
