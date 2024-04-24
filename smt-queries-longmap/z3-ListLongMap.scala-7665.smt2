; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96546 () Bool)

(assert start!96546)

(declare-fun mapNonEmpty!42202 () Bool)

(declare-fun mapRes!42202 () Bool)

(declare-fun tp!80717 () Bool)

(declare-fun e!625724 () Bool)

(assert (=> mapNonEmpty!42202 (= mapRes!42202 (and tp!80717 e!625724))))

(declare-datatypes ((V!41081 0))(
  ( (V!41082 (val!13539 Int)) )
))
(declare-datatypes ((ValueCell!12773 0))(
  ( (ValueCellFull!12773 (v!16156 V!41081)) (EmptyCell!12773) )
))
(declare-fun mapRest!42202 () (Array (_ BitVec 32) ValueCell!12773))

(declare-datatypes ((array!70875 0))(
  ( (array!70876 (arr!34105 (Array (_ BitVec 32) ValueCell!12773)) (size!34642 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70875)

(declare-fun mapKey!42202 () (_ BitVec 32))

(declare-fun mapValue!42202 () ValueCell!12773)

(assert (=> mapNonEmpty!42202 (= (arr!34105 _values!874) (store mapRest!42202 mapKey!42202 mapValue!42202))))

(declare-fun mapIsEmpty!42202 () Bool)

(assert (=> mapIsEmpty!42202 mapRes!42202))

(declare-fun b!1095820 () Bool)

(declare-fun e!625723 () Bool)

(declare-fun e!625725 () Bool)

(assert (=> b!1095820 (= e!625723 (and e!625725 mapRes!42202))))

(declare-fun condMapEmpty!42202 () Bool)

(declare-fun mapDefault!42202 () ValueCell!12773)

(assert (=> b!1095820 (= condMapEmpty!42202 (= (arr!34105 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12773)) mapDefault!42202)))))

(declare-fun b!1095821 () Bool)

(declare-fun tp_is_empty!26965 () Bool)

(assert (=> b!1095821 (= e!625725 tp_is_empty!26965)))

(declare-fun res!730915 () Bool)

(declare-fun e!625726 () Bool)

(assert (=> start!96546 (=> (not res!730915) (not e!625726))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96546 (= res!730915 (validMask!0 mask!1414))))

(assert (=> start!96546 e!625726))

(assert (=> start!96546 true))

(declare-fun array_inv!26322 (array!70875) Bool)

(assert (=> start!96546 (and (array_inv!26322 _values!874) e!625723)))

(declare-datatypes ((array!70877 0))(
  ( (array!70878 (arr!34106 (Array (_ BitVec 32) (_ BitVec 64))) (size!34643 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70877)

(declare-fun array_inv!26323 (array!70877) Bool)

(assert (=> start!96546 (array_inv!26323 _keys!1070)))

(declare-fun b!1095822 () Bool)

(assert (=> b!1095822 (= e!625724 tp_is_empty!26965)))

(declare-fun b!1095823 () Bool)

(declare-fun res!730916 () Bool)

(assert (=> b!1095823 (=> (not res!730916) (not e!625726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70877 (_ BitVec 32)) Bool)

(assert (=> b!1095823 (= res!730916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095824 () Bool)

(declare-fun res!730917 () Bool)

(assert (=> b!1095824 (=> (not res!730917) (not e!625726))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095824 (= res!730917 (and (= (size!34642 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34643 _keys!1070) (size!34642 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095825 () Bool)

(assert (=> b!1095825 (= e!625726 false)))

(declare-fun lt!490173 () Bool)

(declare-datatypes ((List!23832 0))(
  ( (Nil!23829) (Cons!23828 (h!25046 (_ BitVec 64)) (t!33831 List!23832)) )
))
(declare-fun arrayNoDuplicates!0 (array!70877 (_ BitVec 32) List!23832) Bool)

(assert (=> b!1095825 (= lt!490173 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23829))))

(assert (= (and start!96546 res!730915) b!1095824))

(assert (= (and b!1095824 res!730917) b!1095823))

(assert (= (and b!1095823 res!730916) b!1095825))

(assert (= (and b!1095820 condMapEmpty!42202) mapIsEmpty!42202))

(assert (= (and b!1095820 (not condMapEmpty!42202)) mapNonEmpty!42202))

(get-info :version)

(assert (= (and mapNonEmpty!42202 ((_ is ValueCellFull!12773) mapValue!42202)) b!1095822))

(assert (= (and b!1095820 ((_ is ValueCellFull!12773) mapDefault!42202)) b!1095821))

(assert (= start!96546 b!1095820))

(declare-fun m!1016093 () Bool)

(assert (=> mapNonEmpty!42202 m!1016093))

(declare-fun m!1016095 () Bool)

(assert (=> start!96546 m!1016095))

(declare-fun m!1016097 () Bool)

(assert (=> start!96546 m!1016097))

(declare-fun m!1016099 () Bool)

(assert (=> start!96546 m!1016099))

(declare-fun m!1016101 () Bool)

(assert (=> b!1095823 m!1016101))

(declare-fun m!1016103 () Bool)

(assert (=> b!1095825 m!1016103))

(check-sat (not b!1095825) (not start!96546) tp_is_empty!26965 (not b!1095823) (not mapNonEmpty!42202))
(check-sat)
