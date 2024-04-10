; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95408 () Bool)

(assert start!95408)

(declare-fun b!1077557 () Bool)

(declare-fun e!616140 () Bool)

(assert (=> b!1077557 (= e!616140 false)))

(declare-fun lt!478554 () Bool)

(declare-datatypes ((array!69193 0))(
  ( (array!69194 (arr!33274 (Array (_ BitVec 32) (_ BitVec 64))) (size!33810 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69193)

(declare-datatypes ((List!23222 0))(
  ( (Nil!23219) (Cons!23218 (h!24427 (_ BitVec 64)) (t!32581 List!23222)) )
))
(declare-fun arrayNoDuplicates!0 (array!69193 (_ BitVec 32) List!23222) Bool)

(assert (=> b!1077557 (= lt!478554 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23219))))

(declare-fun mapNonEmpty!40924 () Bool)

(declare-fun mapRes!40924 () Bool)

(declare-fun tp!78386 () Bool)

(declare-fun e!616139 () Bool)

(assert (=> mapNonEmpty!40924 (= mapRes!40924 (and tp!78386 e!616139))))

(declare-datatypes ((V!39955 0))(
  ( (V!39956 (val!13117 Int)) )
))
(declare-datatypes ((ValueCell!12351 0))(
  ( (ValueCellFull!12351 (v!15737 V!39955)) (EmptyCell!12351) )
))
(declare-datatypes ((array!69195 0))(
  ( (array!69196 (arr!33275 (Array (_ BitVec 32) ValueCell!12351)) (size!33811 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69195)

(declare-fun mapRest!40924 () (Array (_ BitVec 32) ValueCell!12351))

(declare-fun mapKey!40924 () (_ BitVec 32))

(declare-fun mapValue!40924 () ValueCell!12351)

(assert (=> mapNonEmpty!40924 (= (arr!33275 _values!874) (store mapRest!40924 mapKey!40924 mapValue!40924))))

(declare-fun b!1077558 () Bool)

(declare-fun res!717994 () Bool)

(assert (=> b!1077558 (=> (not res!717994) (not e!616140))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69193 (_ BitVec 32)) Bool)

(assert (=> b!1077558 (= res!717994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077559 () Bool)

(declare-fun tp_is_empty!26121 () Bool)

(assert (=> b!1077559 (= e!616139 tp_is_empty!26121)))

(declare-fun mapIsEmpty!40924 () Bool)

(assert (=> mapIsEmpty!40924 mapRes!40924))

(declare-fun b!1077560 () Bool)

(declare-fun res!717995 () Bool)

(assert (=> b!1077560 (=> (not res!717995) (not e!616140))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077560 (= res!717995 (and (= (size!33811 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33810 _keys!1070) (size!33811 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077561 () Bool)

(declare-fun e!616138 () Bool)

(assert (=> b!1077561 (= e!616138 tp_is_empty!26121)))

(declare-fun b!1077562 () Bool)

(declare-fun e!616142 () Bool)

(assert (=> b!1077562 (= e!616142 (and e!616138 mapRes!40924))))

(declare-fun condMapEmpty!40924 () Bool)

(declare-fun mapDefault!40924 () ValueCell!12351)

(assert (=> b!1077562 (= condMapEmpty!40924 (= (arr!33275 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12351)) mapDefault!40924)))))

(declare-fun res!717993 () Bool)

(assert (=> start!95408 (=> (not res!717993) (not e!616140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95408 (= res!717993 (validMask!0 mask!1414))))

(assert (=> start!95408 e!616140))

(assert (=> start!95408 true))

(declare-fun array_inv!25706 (array!69195) Bool)

(assert (=> start!95408 (and (array_inv!25706 _values!874) e!616142)))

(declare-fun array_inv!25707 (array!69193) Bool)

(assert (=> start!95408 (array_inv!25707 _keys!1070)))

(assert (= (and start!95408 res!717993) b!1077560))

(assert (= (and b!1077560 res!717995) b!1077558))

(assert (= (and b!1077558 res!717994) b!1077557))

(assert (= (and b!1077562 condMapEmpty!40924) mapIsEmpty!40924))

(assert (= (and b!1077562 (not condMapEmpty!40924)) mapNonEmpty!40924))

(get-info :version)

(assert (= (and mapNonEmpty!40924 ((_ is ValueCellFull!12351) mapValue!40924)) b!1077559))

(assert (= (and b!1077562 ((_ is ValueCellFull!12351) mapDefault!40924)) b!1077561))

(assert (= start!95408 b!1077562))

(declare-fun m!996371 () Bool)

(assert (=> b!1077557 m!996371))

(declare-fun m!996373 () Bool)

(assert (=> mapNonEmpty!40924 m!996373))

(declare-fun m!996375 () Bool)

(assert (=> b!1077558 m!996375))

(declare-fun m!996377 () Bool)

(assert (=> start!95408 m!996377))

(declare-fun m!996379 () Bool)

(assert (=> start!95408 m!996379))

(declare-fun m!996381 () Bool)

(assert (=> start!95408 m!996381))

(check-sat (not b!1077557) (not mapNonEmpty!40924) (not b!1077558) tp_is_empty!26121 (not start!95408))
(check-sat)
