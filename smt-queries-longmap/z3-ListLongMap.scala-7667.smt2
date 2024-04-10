; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96324 () Bool)

(assert start!96324)

(declare-fun b!1094680 () Bool)

(declare-fun res!730518 () Bool)

(declare-fun e!624979 () Bool)

(assert (=> b!1094680 (=> (not res!730518) (not e!624979))))

(declare-datatypes ((array!70871 0))(
  ( (array!70872 (arr!34109 (Array (_ BitVec 32) (_ BitVec 64))) (size!34645 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70871)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094680 (= res!730518 (= (select (arr!34109 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42223 () Bool)

(declare-fun mapRes!42223 () Bool)

(assert (=> mapIsEmpty!42223 mapRes!42223))

(declare-fun b!1094681 () Bool)

(declare-fun e!624981 () Bool)

(declare-fun tp_is_empty!26979 () Bool)

(assert (=> b!1094681 (= e!624981 tp_is_empty!26979)))

(declare-fun mapNonEmpty!42223 () Bool)

(declare-fun tp!80738 () Bool)

(assert (=> mapNonEmpty!42223 (= mapRes!42223 (and tp!80738 e!624981))))

(declare-datatypes ((V!41099 0))(
  ( (V!41100 (val!13546 Int)) )
))
(declare-datatypes ((ValueCell!12780 0))(
  ( (ValueCellFull!12780 (v!16167 V!41099)) (EmptyCell!12780) )
))
(declare-fun mapRest!42223 () (Array (_ BitVec 32) ValueCell!12780))

(declare-fun mapKey!42223 () (_ BitVec 32))

(declare-datatypes ((array!70873 0))(
  ( (array!70874 (arr!34110 (Array (_ BitVec 32) ValueCell!12780)) (size!34646 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70873)

(declare-fun mapValue!42223 () ValueCell!12780)

(assert (=> mapNonEmpty!42223 (= (arr!34110 _values!874) (store mapRest!42223 mapKey!42223 mapValue!42223))))

(declare-fun b!1094682 () Bool)

(declare-fun e!624983 () Bool)

(assert (=> b!1094682 (= e!624983 false)))

(declare-fun lt!489684 () Bool)

(declare-fun lt!489685 () array!70871)

(declare-datatypes ((List!23825 0))(
  ( (Nil!23822) (Cons!23821 (h!25030 (_ BitVec 64)) (t!33832 List!23825)) )
))
(declare-fun arrayNoDuplicates!0 (array!70871 (_ BitVec 32) List!23825) Bool)

(assert (=> b!1094682 (= lt!489684 (arrayNoDuplicates!0 lt!489685 #b00000000000000000000000000000000 Nil!23822))))

(declare-fun b!1094683 () Bool)

(declare-fun res!730519 () Bool)

(assert (=> b!1094683 (=> (not res!730519) (not e!624979))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094683 (= res!730519 (and (= (size!34646 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34645 _keys!1070) (size!34646 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094684 () Bool)

(declare-fun res!730521 () Bool)

(assert (=> b!1094684 (=> (not res!730521) (not e!624979))))

(assert (=> b!1094684 (= res!730521 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23822))))

(declare-fun res!730522 () Bool)

(assert (=> start!96324 (=> (not res!730522) (not e!624979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96324 (= res!730522 (validMask!0 mask!1414))))

(assert (=> start!96324 e!624979))

(assert (=> start!96324 true))

(declare-fun array_inv!26284 (array!70871) Bool)

(assert (=> start!96324 (array_inv!26284 _keys!1070)))

(declare-fun e!624978 () Bool)

(declare-fun array_inv!26285 (array!70873) Bool)

(assert (=> start!96324 (and (array_inv!26285 _values!874) e!624978)))

(declare-fun b!1094685 () Bool)

(declare-fun res!730517 () Bool)

(assert (=> b!1094685 (=> (not res!730517) (not e!624979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094685 (= res!730517 (validKeyInArray!0 k0!904))))

(declare-fun b!1094686 () Bool)

(declare-fun e!624980 () Bool)

(assert (=> b!1094686 (= e!624978 (and e!624980 mapRes!42223))))

(declare-fun condMapEmpty!42223 () Bool)

(declare-fun mapDefault!42223 () ValueCell!12780)

(assert (=> b!1094686 (= condMapEmpty!42223 (= (arr!34110 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12780)) mapDefault!42223)))))

(declare-fun b!1094687 () Bool)

(assert (=> b!1094687 (= e!624980 tp_is_empty!26979)))

(declare-fun b!1094688 () Bool)

(assert (=> b!1094688 (= e!624979 e!624983)))

(declare-fun res!730523 () Bool)

(assert (=> b!1094688 (=> (not res!730523) (not e!624983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70871 (_ BitVec 32)) Bool)

(assert (=> b!1094688 (= res!730523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489685 mask!1414))))

(assert (=> b!1094688 (= lt!489685 (array!70872 (store (arr!34109 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34645 _keys!1070)))))

(declare-fun b!1094689 () Bool)

(declare-fun res!730520 () Bool)

(assert (=> b!1094689 (=> (not res!730520) (not e!624979))))

(assert (=> b!1094689 (= res!730520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094690 () Bool)

(declare-fun res!730524 () Bool)

(assert (=> b!1094690 (=> (not res!730524) (not e!624979))))

(assert (=> b!1094690 (= res!730524 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34645 _keys!1070))))))

(assert (= (and start!96324 res!730522) b!1094683))

(assert (= (and b!1094683 res!730519) b!1094689))

(assert (= (and b!1094689 res!730520) b!1094684))

(assert (= (and b!1094684 res!730521) b!1094690))

(assert (= (and b!1094690 res!730524) b!1094685))

(assert (= (and b!1094685 res!730517) b!1094680))

(assert (= (and b!1094680 res!730518) b!1094688))

(assert (= (and b!1094688 res!730523) b!1094682))

(assert (= (and b!1094686 condMapEmpty!42223) mapIsEmpty!42223))

(assert (= (and b!1094686 (not condMapEmpty!42223)) mapNonEmpty!42223))

(get-info :version)

(assert (= (and mapNonEmpty!42223 ((_ is ValueCellFull!12780) mapValue!42223)) b!1094681))

(assert (= (and b!1094686 ((_ is ValueCellFull!12780) mapDefault!42223)) b!1094687))

(assert (= start!96324 b!1094686))

(declare-fun m!1014539 () Bool)

(assert (=> b!1094680 m!1014539))

(declare-fun m!1014541 () Bool)

(assert (=> start!96324 m!1014541))

(declare-fun m!1014543 () Bool)

(assert (=> start!96324 m!1014543))

(declare-fun m!1014545 () Bool)

(assert (=> start!96324 m!1014545))

(declare-fun m!1014547 () Bool)

(assert (=> b!1094682 m!1014547))

(declare-fun m!1014549 () Bool)

(assert (=> mapNonEmpty!42223 m!1014549))

(declare-fun m!1014551 () Bool)

(assert (=> b!1094689 m!1014551))

(declare-fun m!1014553 () Bool)

(assert (=> b!1094684 m!1014553))

(declare-fun m!1014555 () Bool)

(assert (=> b!1094688 m!1014555))

(declare-fun m!1014557 () Bool)

(assert (=> b!1094688 m!1014557))

(declare-fun m!1014559 () Bool)

(assert (=> b!1094685 m!1014559))

(check-sat (not mapNonEmpty!42223) (not b!1094688) (not b!1094682) tp_is_empty!26979 (not start!96324) (not b!1094684) (not b!1094685) (not b!1094689))
(check-sat)
