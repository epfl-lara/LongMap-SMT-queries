; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95396 () Bool)

(assert start!95396)

(declare-fun res!717912 () Bool)

(declare-fun e!616048 () Bool)

(assert (=> start!95396 (=> (not res!717912) (not e!616048))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95396 (= res!717912 (validMask!0 mask!1414))))

(assert (=> start!95396 e!616048))

(assert (=> start!95396 true))

(declare-datatypes ((V!39939 0))(
  ( (V!39940 (val!13111 Int)) )
))
(declare-datatypes ((ValueCell!12345 0))(
  ( (ValueCellFull!12345 (v!15731 V!39939)) (EmptyCell!12345) )
))
(declare-datatypes ((array!69171 0))(
  ( (array!69172 (arr!33263 (Array (_ BitVec 32) ValueCell!12345)) (size!33799 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69171)

(declare-fun e!616052 () Bool)

(declare-fun array_inv!25698 (array!69171) Bool)

(assert (=> start!95396 (and (array_inv!25698 _values!874) e!616052)))

(declare-datatypes ((array!69173 0))(
  ( (array!69174 (arr!33264 (Array (_ BitVec 32) (_ BitVec 64))) (size!33800 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69173)

(declare-fun array_inv!25699 (array!69173) Bool)

(assert (=> start!95396 (array_inv!25699 _keys!1070)))

(declare-fun b!1077422 () Bool)

(declare-fun e!616051 () Bool)

(declare-fun tp_is_empty!26109 () Bool)

(assert (=> b!1077422 (= e!616051 tp_is_empty!26109)))

(declare-fun b!1077423 () Bool)

(assert (=> b!1077423 (= e!616048 false)))

(declare-fun lt!478545 () Bool)

(declare-datatypes ((List!23218 0))(
  ( (Nil!23215) (Cons!23214 (h!24423 (_ BitVec 64)) (t!32577 List!23218)) )
))
(declare-fun arrayNoDuplicates!0 (array!69173 (_ BitVec 32) List!23218) Bool)

(assert (=> b!1077423 (= lt!478545 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23215))))

(declare-fun mapIsEmpty!40906 () Bool)

(declare-fun mapRes!40906 () Bool)

(assert (=> mapIsEmpty!40906 mapRes!40906))

(declare-fun b!1077424 () Bool)

(declare-fun e!616050 () Bool)

(assert (=> b!1077424 (= e!616052 (and e!616050 mapRes!40906))))

(declare-fun condMapEmpty!40906 () Bool)

(declare-fun mapDefault!40906 () ValueCell!12345)

(assert (=> b!1077424 (= condMapEmpty!40906 (= (arr!33263 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12345)) mapDefault!40906)))))

(declare-fun b!1077425 () Bool)

(declare-fun res!717914 () Bool)

(assert (=> b!1077425 (=> (not res!717914) (not e!616048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69173 (_ BitVec 32)) Bool)

(assert (=> b!1077425 (= res!717914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077426 () Bool)

(assert (=> b!1077426 (= e!616050 tp_is_empty!26109)))

(declare-fun mapNonEmpty!40906 () Bool)

(declare-fun tp!78368 () Bool)

(assert (=> mapNonEmpty!40906 (= mapRes!40906 (and tp!78368 e!616051))))

(declare-fun mapKey!40906 () (_ BitVec 32))

(declare-fun mapRest!40906 () (Array (_ BitVec 32) ValueCell!12345))

(declare-fun mapValue!40906 () ValueCell!12345)

(assert (=> mapNonEmpty!40906 (= (arr!33263 _values!874) (store mapRest!40906 mapKey!40906 mapValue!40906))))

(declare-fun b!1077427 () Bool)

(declare-fun res!717913 () Bool)

(assert (=> b!1077427 (=> (not res!717913) (not e!616048))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077427 (= res!717913 (and (= (size!33799 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33800 _keys!1070) (size!33799 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95396 res!717912) b!1077427))

(assert (= (and b!1077427 res!717913) b!1077425))

(assert (= (and b!1077425 res!717914) b!1077423))

(assert (= (and b!1077424 condMapEmpty!40906) mapIsEmpty!40906))

(assert (= (and b!1077424 (not condMapEmpty!40906)) mapNonEmpty!40906))

(get-info :version)

(assert (= (and mapNonEmpty!40906 ((_ is ValueCellFull!12345) mapValue!40906)) b!1077422))

(assert (= (and b!1077424 ((_ is ValueCellFull!12345) mapDefault!40906)) b!1077426))

(assert (= start!95396 b!1077424))

(declare-fun m!996287 () Bool)

(assert (=> start!95396 m!996287))

(declare-fun m!996289 () Bool)

(assert (=> start!95396 m!996289))

(declare-fun m!996291 () Bool)

(assert (=> start!95396 m!996291))

(declare-fun m!996293 () Bool)

(assert (=> b!1077423 m!996293))

(declare-fun m!996295 () Bool)

(assert (=> b!1077425 m!996295))

(declare-fun m!996297 () Bool)

(assert (=> mapNonEmpty!40906 m!996297))

(check-sat (not b!1077423) tp_is_empty!26109 (not b!1077425) (not mapNonEmpty!40906) (not start!95396))
(check-sat)
