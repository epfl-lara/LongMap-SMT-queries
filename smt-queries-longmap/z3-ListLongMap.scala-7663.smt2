; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96292 () Bool)

(assert start!96292)

(declare-fun b!1094190 () Bool)

(declare-fun res!730228 () Bool)

(declare-fun e!624682 () Bool)

(assert (=> b!1094190 (=> (not res!730228) (not e!624682))))

(declare-datatypes ((array!70736 0))(
  ( (array!70737 (arr!34042 (Array (_ BitVec 32) (_ BitVec 64))) (size!34580 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70736)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70736 (_ BitVec 32)) Bool)

(assert (=> b!1094190 (= res!730228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094191 () Bool)

(declare-fun res!730233 () Bool)

(assert (=> b!1094191 (=> (not res!730233) (not e!624682))))

(declare-datatypes ((List!23847 0))(
  ( (Nil!23844) (Cons!23843 (h!25052 (_ BitVec 64)) (t!33845 List!23847)) )
))
(declare-fun arrayNoDuplicates!0 (array!70736 (_ BitVec 32) List!23847) Bool)

(assert (=> b!1094191 (= res!730233 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23844))))

(declare-fun b!1094192 () Bool)

(declare-fun res!730231 () Bool)

(assert (=> b!1094192 (=> (not res!730231) (not e!624682))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094192 (= res!730231 (= (select (arr!34042 _keys!1070) i!650) k0!904))))

(declare-fun b!1094193 () Bool)

(declare-fun res!730235 () Bool)

(declare-fun e!624681 () Bool)

(assert (=> b!1094193 (=> (not res!730235) (not e!624681))))

(declare-fun lt!489433 () array!70736)

(assert (=> b!1094193 (= res!730235 (arrayNoDuplicates!0 lt!489433 #b00000000000000000000000000000000 Nil!23844))))

(declare-fun b!1094194 () Bool)

(declare-fun res!730236 () Bool)

(assert (=> b!1094194 (=> (not res!730236) (not e!624682))))

(assert (=> b!1094194 (= res!730236 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34580 _keys!1070))))))

(declare-fun b!1094195 () Bool)

(assert (=> b!1094195 (= e!624682 e!624681)))

(declare-fun res!730232 () Bool)

(assert (=> b!1094195 (=> (not res!730232) (not e!624681))))

(assert (=> b!1094195 (= res!730232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489433 mask!1414))))

(assert (=> b!1094195 (= lt!489433 (array!70737 (store (arr!34042 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34580 _keys!1070)))))

(declare-fun b!1094196 () Bool)

(declare-fun res!730229 () Bool)

(assert (=> b!1094196 (=> (not res!730229) (not e!624682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094196 (= res!730229 (validKeyInArray!0 k0!904))))

(declare-fun b!1094197 () Bool)

(declare-fun res!730234 () Bool)

(assert (=> b!1094197 (=> (not res!730234) (not e!624682))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41065 0))(
  ( (V!41066 (val!13533 Int)) )
))
(declare-datatypes ((ValueCell!12767 0))(
  ( (ValueCellFull!12767 (v!16153 V!41065)) (EmptyCell!12767) )
))
(declare-datatypes ((array!70738 0))(
  ( (array!70739 (arr!34043 (Array (_ BitVec 32) ValueCell!12767)) (size!34581 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70738)

(assert (=> b!1094197 (= res!730234 (and (= (size!34581 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34580 _keys!1070) (size!34581 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42184 () Bool)

(declare-fun mapRes!42184 () Bool)

(declare-fun tp!80699 () Bool)

(declare-fun e!624679 () Bool)

(assert (=> mapNonEmpty!42184 (= mapRes!42184 (and tp!80699 e!624679))))

(declare-fun mapRest!42184 () (Array (_ BitVec 32) ValueCell!12767))

(declare-fun mapValue!42184 () ValueCell!12767)

(declare-fun mapKey!42184 () (_ BitVec 32))

(assert (=> mapNonEmpty!42184 (= (arr!34043 _values!874) (store mapRest!42184 mapKey!42184 mapValue!42184))))

(declare-fun mapIsEmpty!42184 () Bool)

(assert (=> mapIsEmpty!42184 mapRes!42184))

(declare-fun res!730230 () Bool)

(assert (=> start!96292 (=> (not res!730230) (not e!624682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96292 (= res!730230 (validMask!0 mask!1414))))

(assert (=> start!96292 e!624682))

(assert (=> start!96292 true))

(declare-fun array_inv!26274 (array!70736) Bool)

(assert (=> start!96292 (array_inv!26274 _keys!1070)))

(declare-fun e!624678 () Bool)

(declare-fun array_inv!26275 (array!70738) Bool)

(assert (=> start!96292 (and (array_inv!26275 _values!874) e!624678)))

(declare-fun b!1094198 () Bool)

(assert (=> b!1094198 (= e!624681 (not true))))

(declare-fun arrayContainsKey!0 (array!70736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094198 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35857 0))(
  ( (Unit!35858) )
))
(declare-fun lt!489434 () Unit!35857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70736 (_ BitVec 64) (_ BitVec 32)) Unit!35857)

(assert (=> b!1094198 (= lt!489434 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094199 () Bool)

(declare-fun e!624683 () Bool)

(declare-fun tp_is_empty!26953 () Bool)

(assert (=> b!1094199 (= e!624683 tp_is_empty!26953)))

(declare-fun b!1094200 () Bool)

(assert (=> b!1094200 (= e!624679 tp_is_empty!26953)))

(declare-fun b!1094201 () Bool)

(assert (=> b!1094201 (= e!624678 (and e!624683 mapRes!42184))))

(declare-fun condMapEmpty!42184 () Bool)

(declare-fun mapDefault!42184 () ValueCell!12767)

(assert (=> b!1094201 (= condMapEmpty!42184 (= (arr!34043 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12767)) mapDefault!42184)))))

(assert (= (and start!96292 res!730230) b!1094197))

(assert (= (and b!1094197 res!730234) b!1094190))

(assert (= (and b!1094190 res!730228) b!1094191))

(assert (= (and b!1094191 res!730233) b!1094194))

(assert (= (and b!1094194 res!730236) b!1094196))

(assert (= (and b!1094196 res!730229) b!1094192))

(assert (= (and b!1094192 res!730231) b!1094195))

(assert (= (and b!1094195 res!730232) b!1094193))

(assert (= (and b!1094193 res!730235) b!1094198))

(assert (= (and b!1094201 condMapEmpty!42184) mapIsEmpty!42184))

(assert (= (and b!1094201 (not condMapEmpty!42184)) mapNonEmpty!42184))

(get-info :version)

(assert (= (and mapNonEmpty!42184 ((_ is ValueCellFull!12767) mapValue!42184)) b!1094200))

(assert (= (and b!1094201 ((_ is ValueCellFull!12767) mapDefault!42184)) b!1094199))

(assert (= start!96292 b!1094201))

(declare-fun m!1013681 () Bool)

(assert (=> b!1094191 m!1013681))

(declare-fun m!1013683 () Bool)

(assert (=> b!1094196 m!1013683))

(declare-fun m!1013685 () Bool)

(assert (=> b!1094198 m!1013685))

(declare-fun m!1013687 () Bool)

(assert (=> b!1094198 m!1013687))

(declare-fun m!1013689 () Bool)

(assert (=> b!1094190 m!1013689))

(declare-fun m!1013691 () Bool)

(assert (=> b!1094192 m!1013691))

(declare-fun m!1013693 () Bool)

(assert (=> b!1094193 m!1013693))

(declare-fun m!1013695 () Bool)

(assert (=> mapNonEmpty!42184 m!1013695))

(declare-fun m!1013697 () Bool)

(assert (=> start!96292 m!1013697))

(declare-fun m!1013699 () Bool)

(assert (=> start!96292 m!1013699))

(declare-fun m!1013701 () Bool)

(assert (=> start!96292 m!1013701))

(declare-fun m!1013703 () Bool)

(assert (=> b!1094195 m!1013703))

(declare-fun m!1013705 () Bool)

(assert (=> b!1094195 m!1013705))

(check-sat (not b!1094190) (not b!1094195) (not mapNonEmpty!42184) (not start!96292) (not b!1094193) (not b!1094198) (not b!1094196) tp_is_empty!26953 (not b!1094191))
(check-sat)
