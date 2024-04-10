; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95586 () Bool)

(assert start!95586)

(declare-fun b!1079817 () Bool)

(declare-fun e!617328 () Bool)

(declare-fun e!617330 () Bool)

(declare-fun mapRes!41116 () Bool)

(assert (=> b!1079817 (= e!617328 (and e!617330 mapRes!41116))))

(declare-fun condMapEmpty!41116 () Bool)

(declare-datatypes ((V!40115 0))(
  ( (V!40116 (val!13177 Int)) )
))
(declare-datatypes ((ValueCell!12411 0))(
  ( (ValueCellFull!12411 (v!15798 V!40115)) (EmptyCell!12411) )
))
(declare-datatypes ((array!69435 0))(
  ( (array!69436 (arr!33391 (Array (_ BitVec 32) ValueCell!12411)) (size!33927 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69435)

(declare-fun mapDefault!41116 () ValueCell!12411)

(assert (=> b!1079817 (= condMapEmpty!41116 (= (arr!33391 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12411)) mapDefault!41116)))))

(declare-fun mapIsEmpty!41116 () Bool)

(assert (=> mapIsEmpty!41116 mapRes!41116))

(declare-fun b!1079818 () Bool)

(declare-fun e!617331 () Bool)

(declare-fun e!617332 () Bool)

(assert (=> b!1079818 (= e!617331 e!617332)))

(declare-fun res!719627 () Bool)

(assert (=> b!1079818 (=> (not res!719627) (not e!617332))))

(declare-datatypes ((array!69437 0))(
  ( (array!69438 (arr!33392 (Array (_ BitVec 32) (_ BitVec 64))) (size!33928 (_ BitVec 32))) )
))
(declare-fun lt!478876 () array!69437)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69437 (_ BitVec 32)) Bool)

(assert (=> b!1079818 (= res!719627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478876 mask!1414))))

(declare-fun _keys!1070 () array!69437)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079818 (= lt!478876 (array!69438 (store (arr!33392 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33928 _keys!1070)))))

(declare-fun b!1079819 () Bool)

(declare-fun res!719628 () Bool)

(assert (=> b!1079819 (=> (not res!719628) (not e!617331))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079819 (= res!719628 (and (= (size!33927 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33928 _keys!1070) (size!33927 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079820 () Bool)

(declare-fun res!719625 () Bool)

(assert (=> b!1079820 (=> (not res!719625) (not e!617331))))

(assert (=> b!1079820 (= res!719625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079821 () Bool)

(declare-fun res!719624 () Bool)

(assert (=> b!1079821 (=> (not res!719624) (not e!617332))))

(declare-datatypes ((List!23269 0))(
  ( (Nil!23266) (Cons!23265 (h!24474 (_ BitVec 64)) (t!32628 List!23269)) )
))
(declare-fun arrayNoDuplicates!0 (array!69437 (_ BitVec 32) List!23269) Bool)

(assert (=> b!1079821 (= res!719624 (arrayNoDuplicates!0 lt!478876 #b00000000000000000000000000000000 Nil!23266))))

(declare-fun b!1079822 () Bool)

(declare-fun res!719626 () Bool)

(assert (=> b!1079822 (=> (not res!719626) (not e!617331))))

(assert (=> b!1079822 (= res!719626 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33928 _keys!1070))))))

(declare-fun b!1079823 () Bool)

(assert (=> b!1079823 (= e!617332 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079823 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35504 0))(
  ( (Unit!35505) )
))
(declare-fun lt!478875 () Unit!35504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69437 (_ BitVec 64) (_ BitVec 32)) Unit!35504)

(assert (=> b!1079823 (= lt!478875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079824 () Bool)

(declare-fun res!719631 () Bool)

(assert (=> b!1079824 (=> (not res!719631) (not e!617331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079824 (= res!719631 (validKeyInArray!0 k0!904))))

(declare-fun b!1079825 () Bool)

(declare-fun res!719630 () Bool)

(assert (=> b!1079825 (=> (not res!719630) (not e!617331))))

(assert (=> b!1079825 (= res!719630 (= (select (arr!33392 _keys!1070) i!650) k0!904))))

(declare-fun b!1079826 () Bool)

(declare-fun res!719623 () Bool)

(assert (=> b!1079826 (=> (not res!719623) (not e!617331))))

(assert (=> b!1079826 (= res!719623 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23266))))

(declare-fun b!1079827 () Bool)

(declare-fun tp_is_empty!26241 () Bool)

(assert (=> b!1079827 (= e!617330 tp_is_empty!26241)))

(declare-fun b!1079828 () Bool)

(declare-fun e!617329 () Bool)

(assert (=> b!1079828 (= e!617329 tp_is_empty!26241)))

(declare-fun res!719629 () Bool)

(assert (=> start!95586 (=> (not res!719629) (not e!617331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95586 (= res!719629 (validMask!0 mask!1414))))

(assert (=> start!95586 e!617331))

(assert (=> start!95586 true))

(declare-fun array_inv!25784 (array!69437) Bool)

(assert (=> start!95586 (array_inv!25784 _keys!1070)))

(declare-fun array_inv!25785 (array!69435) Bool)

(assert (=> start!95586 (and (array_inv!25785 _values!874) e!617328)))

(declare-fun mapNonEmpty!41116 () Bool)

(declare-fun tp!78578 () Bool)

(assert (=> mapNonEmpty!41116 (= mapRes!41116 (and tp!78578 e!617329))))

(declare-fun mapValue!41116 () ValueCell!12411)

(declare-fun mapRest!41116 () (Array (_ BitVec 32) ValueCell!12411))

(declare-fun mapKey!41116 () (_ BitVec 32))

(assert (=> mapNonEmpty!41116 (= (arr!33391 _values!874) (store mapRest!41116 mapKey!41116 mapValue!41116))))

(assert (= (and start!95586 res!719629) b!1079819))

(assert (= (and b!1079819 res!719628) b!1079820))

(assert (= (and b!1079820 res!719625) b!1079826))

(assert (= (and b!1079826 res!719623) b!1079822))

(assert (= (and b!1079822 res!719626) b!1079824))

(assert (= (and b!1079824 res!719631) b!1079825))

(assert (= (and b!1079825 res!719630) b!1079818))

(assert (= (and b!1079818 res!719627) b!1079821))

(assert (= (and b!1079821 res!719624) b!1079823))

(assert (= (and b!1079817 condMapEmpty!41116) mapIsEmpty!41116))

(assert (= (and b!1079817 (not condMapEmpty!41116)) mapNonEmpty!41116))

(get-info :version)

(assert (= (and mapNonEmpty!41116 ((_ is ValueCellFull!12411) mapValue!41116)) b!1079828))

(assert (= (and b!1079817 ((_ is ValueCellFull!12411) mapDefault!41116)) b!1079827))

(assert (= start!95586 b!1079817))

(declare-fun m!997923 () Bool)

(assert (=> b!1079826 m!997923))

(declare-fun m!997925 () Bool)

(assert (=> b!1079823 m!997925))

(declare-fun m!997927 () Bool)

(assert (=> b!1079823 m!997927))

(declare-fun m!997929 () Bool)

(assert (=> b!1079820 m!997929))

(declare-fun m!997931 () Bool)

(assert (=> mapNonEmpty!41116 m!997931))

(declare-fun m!997933 () Bool)

(assert (=> b!1079818 m!997933))

(declare-fun m!997935 () Bool)

(assert (=> b!1079818 m!997935))

(declare-fun m!997937 () Bool)

(assert (=> b!1079821 m!997937))

(declare-fun m!997939 () Bool)

(assert (=> b!1079825 m!997939))

(declare-fun m!997941 () Bool)

(assert (=> start!95586 m!997941))

(declare-fun m!997943 () Bool)

(assert (=> start!95586 m!997943))

(declare-fun m!997945 () Bool)

(assert (=> start!95586 m!997945))

(declare-fun m!997947 () Bool)

(assert (=> b!1079824 m!997947))

(check-sat (not b!1079820) (not b!1079821) (not b!1079818) (not mapNonEmpty!41116) (not start!95586) (not b!1079823) tp_is_empty!26241 (not b!1079826) (not b!1079824))
(check-sat)
