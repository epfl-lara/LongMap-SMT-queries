; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96322 () Bool)

(assert start!96322)

(declare-fun b!1094593 () Bool)

(declare-fun e!624925 () Bool)

(declare-fun tp_is_empty!26983 () Bool)

(assert (=> b!1094593 (= e!624925 tp_is_empty!26983)))

(declare-fun b!1094594 () Bool)

(declare-fun e!624924 () Bool)

(assert (=> b!1094594 (= e!624924 false)))

(declare-fun lt!489497 () Bool)

(declare-datatypes ((array!70792 0))(
  ( (array!70793 (arr!34070 (Array (_ BitVec 32) (_ BitVec 64))) (size!34608 (_ BitVec 32))) )
))
(declare-fun lt!489496 () array!70792)

(declare-datatypes ((List!23859 0))(
  ( (Nil!23856) (Cons!23855 (h!25064 (_ BitVec 64)) (t!33857 List!23859)) )
))
(declare-fun arrayNoDuplicates!0 (array!70792 (_ BitVec 32) List!23859) Bool)

(assert (=> b!1094594 (= lt!489497 (arrayNoDuplicates!0 lt!489496 #b00000000000000000000000000000000 Nil!23856))))

(declare-fun b!1094595 () Bool)

(declare-fun e!624922 () Bool)

(declare-fun mapRes!42229 () Bool)

(assert (=> b!1094595 (= e!624922 (and e!624925 mapRes!42229))))

(declare-fun condMapEmpty!42229 () Bool)

(declare-datatypes ((V!41105 0))(
  ( (V!41106 (val!13548 Int)) )
))
(declare-datatypes ((ValueCell!12782 0))(
  ( (ValueCellFull!12782 (v!16168 V!41105)) (EmptyCell!12782) )
))
(declare-datatypes ((array!70794 0))(
  ( (array!70795 (arr!34071 (Array (_ BitVec 32) ValueCell!12782)) (size!34609 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70794)

(declare-fun mapDefault!42229 () ValueCell!12782)

(assert (=> b!1094595 (= condMapEmpty!42229 (= (arr!34071 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12782)) mapDefault!42229)))))

(declare-fun mapNonEmpty!42229 () Bool)

(declare-fun tp!80744 () Bool)

(declare-fun e!624926 () Bool)

(assert (=> mapNonEmpty!42229 (= mapRes!42229 (and tp!80744 e!624926))))

(declare-fun mapRest!42229 () (Array (_ BitVec 32) ValueCell!12782))

(declare-fun mapValue!42229 () ValueCell!12782)

(declare-fun mapKey!42229 () (_ BitVec 32))

(assert (=> mapNonEmpty!42229 (= (arr!34071 _values!874) (store mapRest!42229 mapKey!42229 mapValue!42229))))

(declare-fun b!1094596 () Bool)

(declare-fun res!730501 () Bool)

(declare-fun e!624923 () Bool)

(assert (=> b!1094596 (=> (not res!730501) (not e!624923))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094596 (= res!730501 (validKeyInArray!0 k0!904))))

(declare-fun b!1094597 () Bool)

(declare-fun res!730496 () Bool)

(assert (=> b!1094597 (=> (not res!730496) (not e!624923))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70792)

(assert (=> b!1094597 (= res!730496 (and (= (size!34609 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34608 _keys!1070) (size!34609 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094598 () Bool)

(declare-fun res!730502 () Bool)

(assert (=> b!1094598 (=> (not res!730502) (not e!624923))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094598 (= res!730502 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34608 _keys!1070))))))

(declare-fun b!1094599 () Bool)

(assert (=> b!1094599 (= e!624923 e!624924)))

(declare-fun res!730498 () Bool)

(assert (=> b!1094599 (=> (not res!730498) (not e!624924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70792 (_ BitVec 32)) Bool)

(assert (=> b!1094599 (= res!730498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489496 mask!1414))))

(assert (=> b!1094599 (= lt!489496 (array!70793 (store (arr!34070 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34608 _keys!1070)))))

(declare-fun res!730499 () Bool)

(assert (=> start!96322 (=> (not res!730499) (not e!624923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96322 (= res!730499 (validMask!0 mask!1414))))

(assert (=> start!96322 e!624923))

(assert (=> start!96322 true))

(declare-fun array_inv!26288 (array!70792) Bool)

(assert (=> start!96322 (array_inv!26288 _keys!1070)))

(declare-fun array_inv!26289 (array!70794) Bool)

(assert (=> start!96322 (and (array_inv!26289 _values!874) e!624922)))

(declare-fun mapIsEmpty!42229 () Bool)

(assert (=> mapIsEmpty!42229 mapRes!42229))

(declare-fun b!1094600 () Bool)

(declare-fun res!730503 () Bool)

(assert (=> b!1094600 (=> (not res!730503) (not e!624923))))

(assert (=> b!1094600 (= res!730503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094601 () Bool)

(assert (=> b!1094601 (= e!624926 tp_is_empty!26983)))

(declare-fun b!1094602 () Bool)

(declare-fun res!730497 () Bool)

(assert (=> b!1094602 (=> (not res!730497) (not e!624923))))

(assert (=> b!1094602 (= res!730497 (= (select (arr!34070 _keys!1070) i!650) k0!904))))

(declare-fun b!1094603 () Bool)

(declare-fun res!730500 () Bool)

(assert (=> b!1094603 (=> (not res!730500) (not e!624923))))

(assert (=> b!1094603 (= res!730500 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23856))))

(assert (= (and start!96322 res!730499) b!1094597))

(assert (= (and b!1094597 res!730496) b!1094600))

(assert (= (and b!1094600 res!730503) b!1094603))

(assert (= (and b!1094603 res!730500) b!1094598))

(assert (= (and b!1094598 res!730502) b!1094596))

(assert (= (and b!1094596 res!730501) b!1094602))

(assert (= (and b!1094602 res!730497) b!1094599))

(assert (= (and b!1094599 res!730498) b!1094594))

(assert (= (and b!1094595 condMapEmpty!42229) mapIsEmpty!42229))

(assert (= (and b!1094595 (not condMapEmpty!42229)) mapNonEmpty!42229))

(get-info :version)

(assert (= (and mapNonEmpty!42229 ((_ is ValueCellFull!12782) mapValue!42229)) b!1094601))

(assert (= (and b!1094595 ((_ is ValueCellFull!12782) mapDefault!42229)) b!1094593))

(assert (= start!96322 b!1094595))

(declare-fun m!1013957 () Bool)

(assert (=> b!1094594 m!1013957))

(declare-fun m!1013959 () Bool)

(assert (=> b!1094596 m!1013959))

(declare-fun m!1013961 () Bool)

(assert (=> b!1094603 m!1013961))

(declare-fun m!1013963 () Bool)

(assert (=> start!96322 m!1013963))

(declare-fun m!1013965 () Bool)

(assert (=> start!96322 m!1013965))

(declare-fun m!1013967 () Bool)

(assert (=> start!96322 m!1013967))

(declare-fun m!1013969 () Bool)

(assert (=> mapNonEmpty!42229 m!1013969))

(declare-fun m!1013971 () Bool)

(assert (=> b!1094602 m!1013971))

(declare-fun m!1013973 () Bool)

(assert (=> b!1094600 m!1013973))

(declare-fun m!1013975 () Bool)

(assert (=> b!1094599 m!1013975))

(declare-fun m!1013977 () Bool)

(assert (=> b!1094599 m!1013977))

(check-sat (not start!96322) (not b!1094599) (not mapNonEmpty!42229) (not b!1094596) (not b!1094600) (not b!1094603) tp_is_empty!26983 (not b!1094594))
(check-sat)
