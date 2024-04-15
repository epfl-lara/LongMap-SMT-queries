; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95542 () Bool)

(assert start!95542)

(declare-fun b!1078980 () Bool)

(declare-fun e!616897 () Bool)

(declare-fun e!616894 () Bool)

(assert (=> b!1078980 (= e!616897 e!616894)))

(declare-fun res!719042 () Bool)

(assert (=> b!1078980 (=> (not res!719042) (not e!616894))))

(declare-datatypes ((array!69290 0))(
  ( (array!69291 (arr!33319 (Array (_ BitVec 32) (_ BitVec 64))) (size!33857 (_ BitVec 32))) )
))
(declare-fun lt!478562 () array!69290)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69290 (_ BitVec 32)) Bool)

(assert (=> b!1078980 (= res!719042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478562 mask!1414))))

(declare-fun _keys!1070 () array!69290)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078980 (= lt!478562 (array!69291 (store (arr!33319 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33857 _keys!1070)))))

(declare-fun mapIsEmpty!41059 () Bool)

(declare-fun mapRes!41059 () Bool)

(assert (=> mapIsEmpty!41059 mapRes!41059))

(declare-fun b!1078981 () Bool)

(declare-fun e!616898 () Bool)

(declare-fun tp_is_empty!26203 () Bool)

(assert (=> b!1078981 (= e!616898 tp_is_empty!26203)))

(declare-fun b!1078982 () Bool)

(declare-fun res!719044 () Bool)

(assert (=> b!1078982 (=> (not res!719044) (not e!616897))))

(declare-datatypes ((List!23304 0))(
  ( (Nil!23301) (Cons!23300 (h!24509 (_ BitVec 64)) (t!32654 List!23304)) )
))
(declare-fun arrayNoDuplicates!0 (array!69290 (_ BitVec 32) List!23304) Bool)

(assert (=> b!1078982 (= res!719044 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23301))))

(declare-fun b!1078983 () Bool)

(declare-fun e!616893 () Bool)

(assert (=> b!1078983 (= e!616893 (and e!616898 mapRes!41059))))

(declare-fun condMapEmpty!41059 () Bool)

(declare-datatypes ((V!40065 0))(
  ( (V!40066 (val!13158 Int)) )
))
(declare-datatypes ((ValueCell!12392 0))(
  ( (ValueCellFull!12392 (v!15778 V!40065)) (EmptyCell!12392) )
))
(declare-datatypes ((array!69292 0))(
  ( (array!69293 (arr!33320 (Array (_ BitVec 32) ValueCell!12392)) (size!33858 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69292)

(declare-fun mapDefault!41059 () ValueCell!12392)

(assert (=> b!1078983 (= condMapEmpty!41059 (= (arr!33320 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12392)) mapDefault!41059)))))

(declare-fun mapNonEmpty!41059 () Bool)

(declare-fun tp!78521 () Bool)

(declare-fun e!616895 () Bool)

(assert (=> mapNonEmpty!41059 (= mapRes!41059 (and tp!78521 e!616895))))

(declare-fun mapValue!41059 () ValueCell!12392)

(declare-fun mapKey!41059 () (_ BitVec 32))

(declare-fun mapRest!41059 () (Array (_ BitVec 32) ValueCell!12392))

(assert (=> mapNonEmpty!41059 (= (arr!33320 _values!874) (store mapRest!41059 mapKey!41059 mapValue!41059))))

(declare-fun b!1078984 () Bool)

(assert (=> b!1078984 (= e!616895 tp_is_empty!26203)))

(declare-fun b!1078985 () Bool)

(assert (=> b!1078985 (= e!616894 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078985 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35327 0))(
  ( (Unit!35328) )
))
(declare-fun lt!478561 () Unit!35327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69290 (_ BitVec 64) (_ BitVec 32)) Unit!35327)

(assert (=> b!1078985 (= lt!478561 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078986 () Bool)

(declare-fun res!719041 () Bool)

(assert (=> b!1078986 (=> (not res!719041) (not e!616897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078986 (= res!719041 (validKeyInArray!0 k0!904))))

(declare-fun b!1078988 () Bool)

(declare-fun res!719049 () Bool)

(assert (=> b!1078988 (=> (not res!719049) (not e!616897))))

(assert (=> b!1078988 (= res!719049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078989 () Bool)

(declare-fun res!719048 () Bool)

(assert (=> b!1078989 (=> (not res!719048) (not e!616897))))

(assert (=> b!1078989 (= res!719048 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33857 _keys!1070))))))

(declare-fun b!1078990 () Bool)

(declare-fun res!719045 () Bool)

(assert (=> b!1078990 (=> (not res!719045) (not e!616894))))

(assert (=> b!1078990 (= res!719045 (arrayNoDuplicates!0 lt!478562 #b00000000000000000000000000000000 Nil!23301))))

(declare-fun b!1078991 () Bool)

(declare-fun res!719046 () Bool)

(assert (=> b!1078991 (=> (not res!719046) (not e!616897))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078991 (= res!719046 (and (= (size!33858 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33857 _keys!1070) (size!33858 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078987 () Bool)

(declare-fun res!719043 () Bool)

(assert (=> b!1078987 (=> (not res!719043) (not e!616897))))

(assert (=> b!1078987 (= res!719043 (= (select (arr!33319 _keys!1070) i!650) k0!904))))

(declare-fun res!719047 () Bool)

(assert (=> start!95542 (=> (not res!719047) (not e!616897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95542 (= res!719047 (validMask!0 mask!1414))))

(assert (=> start!95542 e!616897))

(assert (=> start!95542 true))

(declare-fun array_inv!25764 (array!69290) Bool)

(assert (=> start!95542 (array_inv!25764 _keys!1070)))

(declare-fun array_inv!25765 (array!69292) Bool)

(assert (=> start!95542 (and (array_inv!25765 _values!874) e!616893)))

(assert (= (and start!95542 res!719047) b!1078991))

(assert (= (and b!1078991 res!719046) b!1078988))

(assert (= (and b!1078988 res!719049) b!1078982))

(assert (= (and b!1078982 res!719044) b!1078989))

(assert (= (and b!1078989 res!719048) b!1078986))

(assert (= (and b!1078986 res!719041) b!1078987))

(assert (= (and b!1078987 res!719043) b!1078980))

(assert (= (and b!1078980 res!719042) b!1078990))

(assert (= (and b!1078990 res!719045) b!1078985))

(assert (= (and b!1078983 condMapEmpty!41059) mapIsEmpty!41059))

(assert (= (and b!1078983 (not condMapEmpty!41059)) mapNonEmpty!41059))

(get-info :version)

(assert (= (and mapNonEmpty!41059 ((_ is ValueCellFull!12392) mapValue!41059)) b!1078984))

(assert (= (and b!1078983 ((_ is ValueCellFull!12392) mapDefault!41059)) b!1078981))

(assert (= start!95542 b!1078983))

(declare-fun m!996803 () Bool)

(assert (=> b!1078990 m!996803))

(declare-fun m!996805 () Bool)

(assert (=> b!1078980 m!996805))

(declare-fun m!996807 () Bool)

(assert (=> b!1078980 m!996807))

(declare-fun m!996809 () Bool)

(assert (=> b!1078982 m!996809))

(declare-fun m!996811 () Bool)

(assert (=> b!1078986 m!996811))

(declare-fun m!996813 () Bool)

(assert (=> start!95542 m!996813))

(declare-fun m!996815 () Bool)

(assert (=> start!95542 m!996815))

(declare-fun m!996817 () Bool)

(assert (=> start!95542 m!996817))

(declare-fun m!996819 () Bool)

(assert (=> b!1078987 m!996819))

(declare-fun m!996821 () Bool)

(assert (=> b!1078985 m!996821))

(declare-fun m!996823 () Bool)

(assert (=> b!1078985 m!996823))

(declare-fun m!996825 () Bool)

(assert (=> mapNonEmpty!41059 m!996825))

(declare-fun m!996827 () Bool)

(assert (=> b!1078988 m!996827))

(check-sat tp_is_empty!26203 (not b!1078985) (not mapNonEmpty!41059) (not b!1078986) (not b!1078988) (not b!1078982) (not b!1078990) (not b!1078980) (not start!95542))
(check-sat)
