; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95744 () Bool)

(assert start!95744)

(declare-fun b!1079978 () Bool)

(declare-fun res!719283 () Bool)

(declare-fun e!617590 () Bool)

(assert (=> b!1079978 (=> (not res!719283) (not e!617590))))

(declare-datatypes ((array!69349 0))(
  ( (array!69350 (arr!33343 (Array (_ BitVec 32) (_ BitVec 64))) (size!33880 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69349)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69349 (_ BitVec 32)) Bool)

(assert (=> b!1079978 (= res!719283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41020 () Bool)

(declare-fun mapRes!41020 () Bool)

(assert (=> mapIsEmpty!41020 mapRes!41020))

(declare-fun b!1079979 () Bool)

(declare-fun res!719282 () Bool)

(declare-fun e!617585 () Bool)

(assert (=> b!1079979 (=> (not res!719282) (not e!617585))))

(declare-fun lt!479190 () array!69349)

(declare-datatypes ((List!23253 0))(
  ( (Nil!23250) (Cons!23249 (h!24467 (_ BitVec 64)) (t!32604 List!23253)) )
))
(declare-fun arrayNoDuplicates!0 (array!69349 (_ BitVec 32) List!23253) Bool)

(assert (=> b!1079979 (= res!719282 (arrayNoDuplicates!0 lt!479190 #b00000000000000000000000000000000 Nil!23250))))

(declare-fun b!1079980 () Bool)

(declare-fun e!617587 () Bool)

(declare-fun tp_is_empty!26179 () Bool)

(assert (=> b!1079980 (= e!617587 tp_is_empty!26179)))

(declare-fun b!1079981 () Bool)

(declare-fun e!617589 () Bool)

(declare-fun e!617586 () Bool)

(assert (=> b!1079981 (= e!617589 (and e!617586 mapRes!41020))))

(declare-fun condMapEmpty!41020 () Bool)

(declare-datatypes ((V!40033 0))(
  ( (V!40034 (val!13146 Int)) )
))
(declare-datatypes ((ValueCell!12380 0))(
  ( (ValueCellFull!12380 (v!15763 V!40033)) (EmptyCell!12380) )
))
(declare-datatypes ((array!69351 0))(
  ( (array!69352 (arr!33344 (Array (_ BitVec 32) ValueCell!12380)) (size!33881 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69351)

(declare-fun mapDefault!41020 () ValueCell!12380)

(assert (=> b!1079981 (= condMapEmpty!41020 (= (arr!33344 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12380)) mapDefault!41020)))))

(declare-fun b!1079982 () Bool)

(declare-fun res!719288 () Bool)

(assert (=> b!1079982 (=> (not res!719288) (not e!617590))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079982 (= res!719288 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41020 () Bool)

(declare-fun tp!78482 () Bool)

(assert (=> mapNonEmpty!41020 (= mapRes!41020 (and tp!78482 e!617587))))

(declare-fun mapKey!41020 () (_ BitVec 32))

(declare-fun mapValue!41020 () ValueCell!12380)

(declare-fun mapRest!41020 () (Array (_ BitVec 32) ValueCell!12380))

(assert (=> mapNonEmpty!41020 (= (arr!33344 _values!874) (store mapRest!41020 mapKey!41020 mapValue!41020))))

(declare-fun res!719290 () Bool)

(assert (=> start!95744 (=> (not res!719290) (not e!617590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95744 (= res!719290 (validMask!0 mask!1414))))

(assert (=> start!95744 e!617590))

(assert (=> start!95744 true))

(declare-fun array_inv!25792 (array!69349) Bool)

(assert (=> start!95744 (array_inv!25792 _keys!1070)))

(declare-fun array_inv!25793 (array!69351) Bool)

(assert (=> start!95744 (and (array_inv!25793 _values!874) e!617589)))

(declare-fun b!1079983 () Bool)

(declare-fun res!719289 () Bool)

(assert (=> b!1079983 (=> (not res!719289) (not e!617590))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079983 (= res!719289 (and (= (size!33881 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33880 _keys!1070) (size!33881 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079984 () Bool)

(declare-fun res!719286 () Bool)

(assert (=> b!1079984 (=> (not res!719286) (not e!617590))))

(assert (=> b!1079984 (= res!719286 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23250))))

(declare-fun b!1079985 () Bool)

(assert (=> b!1079985 (= e!617585 (not true))))

(declare-fun arrayContainsKey!0 (array!69349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079985 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35439 0))(
  ( (Unit!35440) )
))
(declare-fun lt!479189 () Unit!35439)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69349 (_ BitVec 64) (_ BitVec 32)) Unit!35439)

(assert (=> b!1079985 (= lt!479189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079986 () Bool)

(declare-fun res!719285 () Bool)

(assert (=> b!1079986 (=> (not res!719285) (not e!617590))))

(assert (=> b!1079986 (= res!719285 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33880 _keys!1070))))))

(declare-fun b!1079987 () Bool)

(declare-fun res!719287 () Bool)

(assert (=> b!1079987 (=> (not res!719287) (not e!617590))))

(assert (=> b!1079987 (= res!719287 (= (select (arr!33343 _keys!1070) i!650) k0!904))))

(declare-fun b!1079988 () Bool)

(assert (=> b!1079988 (= e!617590 e!617585)))

(declare-fun res!719284 () Bool)

(assert (=> b!1079988 (=> (not res!719284) (not e!617585))))

(assert (=> b!1079988 (= res!719284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479190 mask!1414))))

(assert (=> b!1079988 (= lt!479190 (array!69350 (store (arr!33343 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33880 _keys!1070)))))

(declare-fun b!1079989 () Bool)

(assert (=> b!1079989 (= e!617586 tp_is_empty!26179)))

(assert (= (and start!95744 res!719290) b!1079983))

(assert (= (and b!1079983 res!719289) b!1079978))

(assert (= (and b!1079978 res!719283) b!1079984))

(assert (= (and b!1079984 res!719286) b!1079986))

(assert (= (and b!1079986 res!719285) b!1079982))

(assert (= (and b!1079982 res!719288) b!1079987))

(assert (= (and b!1079987 res!719287) b!1079988))

(assert (= (and b!1079988 res!719284) b!1079979))

(assert (= (and b!1079979 res!719282) b!1079985))

(assert (= (and b!1079981 condMapEmpty!41020) mapIsEmpty!41020))

(assert (= (and b!1079981 (not condMapEmpty!41020)) mapNonEmpty!41020))

(get-info :version)

(assert (= (and mapNonEmpty!41020 ((_ is ValueCellFull!12380) mapValue!41020)) b!1079980))

(assert (= (and b!1079981 ((_ is ValueCellFull!12380) mapDefault!41020)) b!1079989))

(assert (= start!95744 b!1079981))

(declare-fun m!998751 () Bool)

(assert (=> b!1079987 m!998751))

(declare-fun m!998753 () Bool)

(assert (=> b!1079988 m!998753))

(declare-fun m!998755 () Bool)

(assert (=> b!1079988 m!998755))

(declare-fun m!998757 () Bool)

(assert (=> b!1079978 m!998757))

(declare-fun m!998759 () Bool)

(assert (=> b!1079979 m!998759))

(declare-fun m!998761 () Bool)

(assert (=> b!1079985 m!998761))

(declare-fun m!998763 () Bool)

(assert (=> b!1079985 m!998763))

(declare-fun m!998765 () Bool)

(assert (=> b!1079984 m!998765))

(declare-fun m!998767 () Bool)

(assert (=> start!95744 m!998767))

(declare-fun m!998769 () Bool)

(assert (=> start!95744 m!998769))

(declare-fun m!998771 () Bool)

(assert (=> start!95744 m!998771))

(declare-fun m!998773 () Bool)

(assert (=> mapNonEmpty!41020 m!998773))

(declare-fun m!998775 () Bool)

(assert (=> b!1079982 m!998775))

(check-sat (not b!1079984) (not b!1079978) (not b!1079982) tp_is_empty!26179 (not b!1079985) (not b!1079988) (not start!95744) (not mapNonEmpty!41020) (not b!1079979))
(check-sat)
