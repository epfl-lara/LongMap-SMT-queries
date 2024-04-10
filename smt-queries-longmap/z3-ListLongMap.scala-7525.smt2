; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95414 () Bool)

(assert start!95414)

(declare-fun b!1077626 () Bool)

(declare-fun e!616183 () Bool)

(declare-fun tp_is_empty!26127 () Bool)

(assert (=> b!1077626 (= e!616183 tp_is_empty!26127)))

(declare-fun b!1077627 () Bool)

(declare-fun e!616186 () Bool)

(declare-fun e!616184 () Bool)

(declare-fun mapRes!40933 () Bool)

(assert (=> b!1077627 (= e!616186 (and e!616184 mapRes!40933))))

(declare-fun condMapEmpty!40933 () Bool)

(declare-datatypes ((V!39963 0))(
  ( (V!39964 (val!13120 Int)) )
))
(declare-datatypes ((ValueCell!12354 0))(
  ( (ValueCellFull!12354 (v!15740 V!39963)) (EmptyCell!12354) )
))
(declare-datatypes ((array!69203 0))(
  ( (array!69204 (arr!33279 (Array (_ BitVec 32) ValueCell!12354)) (size!33815 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69203)

(declare-fun mapDefault!40933 () ValueCell!12354)

(assert (=> b!1077627 (= condMapEmpty!40933 (= (arr!33279 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12354)) mapDefault!40933)))))

(declare-fun res!718039 () Bool)

(declare-fun e!616185 () Bool)

(assert (=> start!95414 (=> (not res!718039) (not e!616185))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95414 (= res!718039 (validMask!0 mask!1414))))

(assert (=> start!95414 e!616185))

(assert (=> start!95414 true))

(declare-datatypes ((array!69205 0))(
  ( (array!69206 (arr!33280 (Array (_ BitVec 32) (_ BitVec 64))) (size!33816 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69205)

(declare-fun array_inv!25710 (array!69205) Bool)

(assert (=> start!95414 (array_inv!25710 _keys!1070)))

(declare-fun array_inv!25711 (array!69203) Bool)

(assert (=> start!95414 (and (array_inv!25711 _values!874) e!616186)))

(declare-fun mapIsEmpty!40933 () Bool)

(assert (=> mapIsEmpty!40933 mapRes!40933))

(declare-fun mapNonEmpty!40933 () Bool)

(declare-fun tp!78395 () Bool)

(assert (=> mapNonEmpty!40933 (= mapRes!40933 (and tp!78395 e!616183))))

(declare-fun mapRest!40933 () (Array (_ BitVec 32) ValueCell!12354))

(declare-fun mapKey!40933 () (_ BitVec 32))

(declare-fun mapValue!40933 () ValueCell!12354)

(assert (=> mapNonEmpty!40933 (= (arr!33279 _values!874) (store mapRest!40933 mapKey!40933 mapValue!40933))))

(declare-fun b!1077628 () Bool)

(declare-fun res!718035 () Bool)

(assert (=> b!1077628 (=> (not res!718035) (not e!616185))))

(declare-datatypes ((List!23224 0))(
  ( (Nil!23221) (Cons!23220 (h!24429 (_ BitVec 64)) (t!32583 List!23224)) )
))
(declare-fun arrayNoDuplicates!0 (array!69205 (_ BitVec 32) List!23224) Bool)

(assert (=> b!1077628 (= res!718035 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23221))))

(declare-fun b!1077629 () Bool)

(declare-fun res!718038 () Bool)

(assert (=> b!1077629 (=> (not res!718038) (not e!616185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69205 (_ BitVec 32)) Bool)

(assert (=> b!1077629 (= res!718038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077630 () Bool)

(declare-fun res!718036 () Bool)

(assert (=> b!1077630 (=> (not res!718036) (not e!616185))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077630 (= res!718036 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33816 _keys!1070))))))

(declare-fun b!1077631 () Bool)

(declare-fun res!718040 () Bool)

(assert (=> b!1077631 (=> (not res!718040) (not e!616185))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077631 (= res!718040 (validKeyInArray!0 k0!904))))

(declare-fun b!1077632 () Bool)

(assert (=> b!1077632 (= e!616185 (and (= (select (arr!33280 _keys!1070) i!650) k0!904) (= (size!33816 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33816 _keys!1070))))))

(declare-fun b!1077633 () Bool)

(declare-fun res!718037 () Bool)

(assert (=> b!1077633 (=> (not res!718037) (not e!616185))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077633 (= res!718037 (and (= (size!33815 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33816 _keys!1070) (size!33815 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077634 () Bool)

(assert (=> b!1077634 (= e!616184 tp_is_empty!26127)))

(assert (= (and start!95414 res!718039) b!1077633))

(assert (= (and b!1077633 res!718037) b!1077629))

(assert (= (and b!1077629 res!718038) b!1077628))

(assert (= (and b!1077628 res!718035) b!1077630))

(assert (= (and b!1077630 res!718036) b!1077631))

(assert (= (and b!1077631 res!718040) b!1077632))

(assert (= (and b!1077627 condMapEmpty!40933) mapIsEmpty!40933))

(assert (= (and b!1077627 (not condMapEmpty!40933)) mapNonEmpty!40933))

(get-info :version)

(assert (= (and mapNonEmpty!40933 ((_ is ValueCellFull!12354) mapValue!40933)) b!1077626))

(assert (= (and b!1077627 ((_ is ValueCellFull!12354) mapDefault!40933)) b!1077634))

(assert (= start!95414 b!1077627))

(declare-fun m!996411 () Bool)

(assert (=> b!1077629 m!996411))

(declare-fun m!996413 () Bool)

(assert (=> start!95414 m!996413))

(declare-fun m!996415 () Bool)

(assert (=> start!95414 m!996415))

(declare-fun m!996417 () Bool)

(assert (=> start!95414 m!996417))

(declare-fun m!996419 () Bool)

(assert (=> b!1077632 m!996419))

(declare-fun m!996421 () Bool)

(assert (=> b!1077631 m!996421))

(declare-fun m!996423 () Bool)

(assert (=> mapNonEmpty!40933 m!996423))

(declare-fun m!996425 () Bool)

(assert (=> b!1077628 m!996425))

(check-sat (not b!1077631) (not start!95414) (not b!1077629) (not mapNonEmpty!40933) (not b!1077628) tp_is_empty!26127)
(check-sat)
