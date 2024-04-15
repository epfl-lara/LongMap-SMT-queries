; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95406 () Bool)

(assert start!95406)

(declare-datatypes ((array!69132 0))(
  ( (array!69133 (arr!33244 (Array (_ BitVec 32) (_ BitVec 64))) (size!33782 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69132)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun e!616079 () Bool)

(declare-fun b!1077446 () Bool)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1077446 (= e!616079 (and (= (select (arr!33244 _keys!1070) i!650) k0!904) (= (size!33782 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33782 _keys!1070))))))

(declare-fun b!1077447 () Bool)

(declare-fun e!616078 () Bool)

(declare-fun tp_is_empty!26125 () Bool)

(assert (=> b!1077447 (= e!616078 tp_is_empty!26125)))

(declare-fun b!1077448 () Bool)

(declare-fun e!616075 () Bool)

(declare-fun e!616077 () Bool)

(declare-fun mapRes!40930 () Bool)

(assert (=> b!1077448 (= e!616075 (and e!616077 mapRes!40930))))

(declare-fun condMapEmpty!40930 () Bool)

(declare-datatypes ((V!39961 0))(
  ( (V!39962 (val!13119 Int)) )
))
(declare-datatypes ((ValueCell!12353 0))(
  ( (ValueCellFull!12353 (v!15738 V!39961)) (EmptyCell!12353) )
))
(declare-datatypes ((array!69134 0))(
  ( (array!69135 (arr!33245 (Array (_ BitVec 32) ValueCell!12353)) (size!33783 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69134)

(declare-fun mapDefault!40930 () ValueCell!12353)

(assert (=> b!1077448 (= condMapEmpty!40930 (= (arr!33245 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12353)) mapDefault!40930)))))

(declare-fun mapIsEmpty!40930 () Bool)

(assert (=> mapIsEmpty!40930 mapRes!40930))

(declare-fun mapNonEmpty!40930 () Bool)

(declare-fun tp!78392 () Bool)

(assert (=> mapNonEmpty!40930 (= mapRes!40930 (and tp!78392 e!616078))))

(declare-fun mapRest!40930 () (Array (_ BitVec 32) ValueCell!12353))

(declare-fun mapValue!40930 () ValueCell!12353)

(declare-fun mapKey!40930 () (_ BitVec 32))

(assert (=> mapNonEmpty!40930 (= (arr!33245 _values!874) (store mapRest!40930 mapKey!40930 mapValue!40930))))

(declare-fun res!717952 () Bool)

(assert (=> start!95406 (=> (not res!717952) (not e!616079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95406 (= res!717952 (validMask!0 mask!1414))))

(assert (=> start!95406 e!616079))

(assert (=> start!95406 true))

(declare-fun array_inv!25710 (array!69132) Bool)

(assert (=> start!95406 (array_inv!25710 _keys!1070)))

(declare-fun array_inv!25711 (array!69134) Bool)

(assert (=> start!95406 (and (array_inv!25711 _values!874) e!616075)))

(declare-fun b!1077449 () Bool)

(declare-fun res!717948 () Bool)

(assert (=> b!1077449 (=> (not res!717948) (not e!616079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077449 (= res!717948 (validKeyInArray!0 k0!904))))

(declare-fun b!1077450 () Bool)

(declare-fun res!717951 () Bool)

(assert (=> b!1077450 (=> (not res!717951) (not e!616079))))

(declare-datatypes ((List!23275 0))(
  ( (Nil!23272) (Cons!23271 (h!24480 (_ BitVec 64)) (t!32625 List!23275)) )
))
(declare-fun arrayNoDuplicates!0 (array!69132 (_ BitVec 32) List!23275) Bool)

(assert (=> b!1077450 (= res!717951 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23272))))

(declare-fun b!1077451 () Bool)

(assert (=> b!1077451 (= e!616077 tp_is_empty!26125)))

(declare-fun b!1077452 () Bool)

(declare-fun res!717953 () Bool)

(assert (=> b!1077452 (=> (not res!717953) (not e!616079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69132 (_ BitVec 32)) Bool)

(assert (=> b!1077452 (= res!717953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077453 () Bool)

(declare-fun res!717950 () Bool)

(assert (=> b!1077453 (=> (not res!717950) (not e!616079))))

(assert (=> b!1077453 (= res!717950 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33782 _keys!1070))))))

(declare-fun b!1077454 () Bool)

(declare-fun res!717949 () Bool)

(assert (=> b!1077454 (=> (not res!717949) (not e!616079))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077454 (= res!717949 (and (= (size!33783 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33782 _keys!1070) (size!33783 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95406 res!717952) b!1077454))

(assert (= (and b!1077454 res!717949) b!1077452))

(assert (= (and b!1077452 res!717953) b!1077450))

(assert (= (and b!1077450 res!717951) b!1077453))

(assert (= (and b!1077453 res!717950) b!1077449))

(assert (= (and b!1077449 res!717948) b!1077446))

(assert (= (and b!1077448 condMapEmpty!40930) mapIsEmpty!40930))

(assert (= (and b!1077448 (not condMapEmpty!40930)) mapNonEmpty!40930))

(get-info :version)

(assert (= (and mapNonEmpty!40930 ((_ is ValueCellFull!12353) mapValue!40930)) b!1077447))

(assert (= (and b!1077448 ((_ is ValueCellFull!12353) mapDefault!40930)) b!1077451))

(assert (= start!95406 b!1077448))

(declare-fun m!995769 () Bool)

(assert (=> b!1077450 m!995769))

(declare-fun m!995771 () Bool)

(assert (=> b!1077452 m!995771))

(declare-fun m!995773 () Bool)

(assert (=> start!95406 m!995773))

(declare-fun m!995775 () Bool)

(assert (=> start!95406 m!995775))

(declare-fun m!995777 () Bool)

(assert (=> start!95406 m!995777))

(declare-fun m!995779 () Bool)

(assert (=> b!1077449 m!995779))

(declare-fun m!995781 () Bool)

(assert (=> mapNonEmpty!40930 m!995781))

(declare-fun m!995783 () Bool)

(assert (=> b!1077446 m!995783))

(check-sat tp_is_empty!26125 (not start!95406) (not b!1077452) (not b!1077450) (not b!1077449) (not mapNonEmpty!40930))
(check-sat)
