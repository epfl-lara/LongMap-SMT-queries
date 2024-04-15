; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95536 () Bool)

(assert start!95536)

(declare-fun mapNonEmpty!41050 () Bool)

(declare-fun mapRes!41050 () Bool)

(declare-fun tp!78512 () Bool)

(declare-fun e!616843 () Bool)

(assert (=> mapNonEmpty!41050 (= mapRes!41050 (and tp!78512 e!616843))))

(declare-datatypes ((V!40057 0))(
  ( (V!40058 (val!13155 Int)) )
))
(declare-datatypes ((ValueCell!12389 0))(
  ( (ValueCellFull!12389 (v!15775 V!40057)) (EmptyCell!12389) )
))
(declare-datatypes ((array!69278 0))(
  ( (array!69279 (arr!33313 (Array (_ BitVec 32) ValueCell!12389)) (size!33851 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69278)

(declare-fun mapKey!41050 () (_ BitVec 32))

(declare-fun mapValue!41050 () ValueCell!12389)

(declare-fun mapRest!41050 () (Array (_ BitVec 32) ValueCell!12389))

(assert (=> mapNonEmpty!41050 (= (arr!33313 _values!874) (store mapRest!41050 mapKey!41050 mapValue!41050))))

(declare-fun b!1078872 () Bool)

(declare-fun e!616840 () Bool)

(declare-fun e!616841 () Bool)

(assert (=> b!1078872 (= e!616840 (and e!616841 mapRes!41050))))

(declare-fun condMapEmpty!41050 () Bool)

(declare-fun mapDefault!41050 () ValueCell!12389)

(assert (=> b!1078872 (= condMapEmpty!41050 (= (arr!33313 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12389)) mapDefault!41050)))))

(declare-fun b!1078873 () Bool)

(declare-fun res!718965 () Bool)

(declare-fun e!616844 () Bool)

(assert (=> b!1078873 (=> (not res!718965) (not e!616844))))

(declare-datatypes ((array!69280 0))(
  ( (array!69281 (arr!33314 (Array (_ BitVec 32) (_ BitVec 64))) (size!33852 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69280)

(declare-datatypes ((List!23302 0))(
  ( (Nil!23299) (Cons!23298 (h!24507 (_ BitVec 64)) (t!32652 List!23302)) )
))
(declare-fun arrayNoDuplicates!0 (array!69280 (_ BitVec 32) List!23302) Bool)

(assert (=> b!1078873 (= res!718965 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23299))))

(declare-fun b!1078874 () Bool)

(declare-fun res!718964 () Bool)

(declare-fun e!616839 () Bool)

(assert (=> b!1078874 (=> (not res!718964) (not e!616839))))

(declare-fun lt!478544 () array!69280)

(assert (=> b!1078874 (= res!718964 (arrayNoDuplicates!0 lt!478544 #b00000000000000000000000000000000 Nil!23299))))

(declare-fun res!718968 () Bool)

(assert (=> start!95536 (=> (not res!718968) (not e!616844))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95536 (= res!718968 (validMask!0 mask!1414))))

(assert (=> start!95536 e!616844))

(assert (=> start!95536 true))

(declare-fun array_inv!25760 (array!69280) Bool)

(assert (=> start!95536 (array_inv!25760 _keys!1070)))

(declare-fun array_inv!25761 (array!69278) Bool)

(assert (=> start!95536 (and (array_inv!25761 _values!874) e!616840)))

(declare-fun b!1078875 () Bool)

(declare-fun res!718960 () Bool)

(assert (=> b!1078875 (=> (not res!718960) (not e!616844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69280 (_ BitVec 32)) Bool)

(assert (=> b!1078875 (= res!718960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078876 () Bool)

(declare-fun tp_is_empty!26197 () Bool)

(assert (=> b!1078876 (= e!616841 tp_is_empty!26197)))

(declare-fun b!1078877 () Bool)

(declare-fun res!718966 () Bool)

(assert (=> b!1078877 (=> (not res!718966) (not e!616844))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078877 (= res!718966 (validKeyInArray!0 k0!904))))

(declare-fun b!1078878 () Bool)

(assert (=> b!1078878 (= e!616844 e!616839)))

(declare-fun res!718967 () Bool)

(assert (=> b!1078878 (=> (not res!718967) (not e!616839))))

(assert (=> b!1078878 (= res!718967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478544 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078878 (= lt!478544 (array!69281 (store (arr!33314 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)))))

(declare-fun b!1078879 () Bool)

(declare-fun res!718962 () Bool)

(assert (=> b!1078879 (=> (not res!718962) (not e!616844))))

(assert (=> b!1078879 (= res!718962 (= (select (arr!33314 _keys!1070) i!650) k0!904))))

(declare-fun b!1078880 () Bool)

(assert (=> b!1078880 (= e!616839 (not true))))

(declare-fun arrayContainsKey!0 (array!69280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078880 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35321 0))(
  ( (Unit!35322) )
))
(declare-fun lt!478543 () Unit!35321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69280 (_ BitVec 64) (_ BitVec 32)) Unit!35321)

(assert (=> b!1078880 (= lt!478543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078881 () Bool)

(assert (=> b!1078881 (= e!616843 tp_is_empty!26197)))

(declare-fun b!1078882 () Bool)

(declare-fun res!718963 () Bool)

(assert (=> b!1078882 (=> (not res!718963) (not e!616844))))

(assert (=> b!1078882 (= res!718963 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33852 _keys!1070))))))

(declare-fun mapIsEmpty!41050 () Bool)

(assert (=> mapIsEmpty!41050 mapRes!41050))

(declare-fun b!1078883 () Bool)

(declare-fun res!718961 () Bool)

(assert (=> b!1078883 (=> (not res!718961) (not e!616844))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078883 (= res!718961 (and (= (size!33851 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33852 _keys!1070) (size!33851 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95536 res!718968) b!1078883))

(assert (= (and b!1078883 res!718961) b!1078875))

(assert (= (and b!1078875 res!718960) b!1078873))

(assert (= (and b!1078873 res!718965) b!1078882))

(assert (= (and b!1078882 res!718963) b!1078877))

(assert (= (and b!1078877 res!718966) b!1078879))

(assert (= (and b!1078879 res!718962) b!1078878))

(assert (= (and b!1078878 res!718967) b!1078874))

(assert (= (and b!1078874 res!718964) b!1078880))

(assert (= (and b!1078872 condMapEmpty!41050) mapIsEmpty!41050))

(assert (= (and b!1078872 (not condMapEmpty!41050)) mapNonEmpty!41050))

(get-info :version)

(assert (= (and mapNonEmpty!41050 ((_ is ValueCellFull!12389) mapValue!41050)) b!1078881))

(assert (= (and b!1078872 ((_ is ValueCellFull!12389) mapDefault!41050)) b!1078876))

(assert (= start!95536 b!1078872))

(declare-fun m!996725 () Bool)

(assert (=> b!1078879 m!996725))

(declare-fun m!996727 () Bool)

(assert (=> b!1078874 m!996727))

(declare-fun m!996729 () Bool)

(assert (=> start!95536 m!996729))

(declare-fun m!996731 () Bool)

(assert (=> start!95536 m!996731))

(declare-fun m!996733 () Bool)

(assert (=> start!95536 m!996733))

(declare-fun m!996735 () Bool)

(assert (=> b!1078878 m!996735))

(declare-fun m!996737 () Bool)

(assert (=> b!1078878 m!996737))

(declare-fun m!996739 () Bool)

(assert (=> b!1078875 m!996739))

(declare-fun m!996741 () Bool)

(assert (=> b!1078877 m!996741))

(declare-fun m!996743 () Bool)

(assert (=> b!1078873 m!996743))

(declare-fun m!996745 () Bool)

(assert (=> b!1078880 m!996745))

(declare-fun m!996747 () Bool)

(assert (=> b!1078880 m!996747))

(declare-fun m!996749 () Bool)

(assert (=> mapNonEmpty!41050 m!996749))

(check-sat tp_is_empty!26197 (not b!1078875) (not b!1078873) (not mapNonEmpty!41050) (not b!1078877) (not b!1078878) (not b!1078880) (not start!95536) (not b!1078874))
(check-sat)
