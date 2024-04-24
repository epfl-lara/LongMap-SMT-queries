; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95808 () Bool)

(assert start!95808)

(declare-fun b!1080892 () Bool)

(declare-fun res!719964 () Bool)

(declare-fun e!618058 () Bool)

(assert (=> b!1080892 (=> (not res!719964) (not e!618058))))

(declare-datatypes ((array!69443 0))(
  ( (array!69444 (arr!33389 (Array (_ BitVec 32) (_ BitVec 64))) (size!33926 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69443)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69443 (_ BitVec 32)) Bool)

(assert (=> b!1080892 (= res!719964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080893 () Bool)

(declare-fun e!618062 () Bool)

(declare-fun tp_is_empty!26227 () Bool)

(assert (=> b!1080893 (= e!618062 tp_is_empty!26227)))

(declare-fun b!1080894 () Bool)

(declare-fun res!719959 () Bool)

(assert (=> b!1080894 (=> (not res!719959) (not e!618058))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080894 (= res!719959 (= (select (arr!33389 _keys!1070) i!650) k0!904))))

(declare-fun b!1080895 () Bool)

(declare-fun res!719961 () Bool)

(assert (=> b!1080895 (=> (not res!719961) (not e!618058))))

(assert (=> b!1080895 (= res!719961 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33926 _keys!1070))))))

(declare-fun b!1080896 () Bool)

(declare-fun e!618061 () Bool)

(assert (=> b!1080896 (= e!618058 e!618061)))

(declare-fun res!719957 () Bool)

(assert (=> b!1080896 (=> (not res!719957) (not e!618061))))

(declare-fun lt!479348 () array!69443)

(assert (=> b!1080896 (= res!719957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479348 mask!1414))))

(assert (=> b!1080896 (= lt!479348 (array!69444 (store (arr!33389 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33926 _keys!1070)))))

(declare-fun b!1080897 () Bool)

(assert (=> b!1080897 (= e!618061 (not true))))

(declare-fun arrayContainsKey!0 (array!69443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080897 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35471 0))(
  ( (Unit!35472) )
))
(declare-fun lt!479349 () Unit!35471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69443 (_ BitVec 64) (_ BitVec 32)) Unit!35471)

(assert (=> b!1080897 (= lt!479349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41095 () Bool)

(declare-fun mapRes!41095 () Bool)

(assert (=> mapIsEmpty!41095 mapRes!41095))

(declare-fun b!1080898 () Bool)

(declare-fun res!719956 () Bool)

(assert (=> b!1080898 (=> (not res!719956) (not e!618058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080898 (= res!719956 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41095 () Bool)

(declare-fun tp!78557 () Bool)

(declare-fun e!618060 () Bool)

(assert (=> mapNonEmpty!41095 (= mapRes!41095 (and tp!78557 e!618060))))

(declare-datatypes ((V!40097 0))(
  ( (V!40098 (val!13170 Int)) )
))
(declare-datatypes ((ValueCell!12404 0))(
  ( (ValueCellFull!12404 (v!15787 V!40097)) (EmptyCell!12404) )
))
(declare-fun mapRest!41095 () (Array (_ BitVec 32) ValueCell!12404))

(declare-datatypes ((array!69445 0))(
  ( (array!69446 (arr!33390 (Array (_ BitVec 32) ValueCell!12404)) (size!33927 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69445)

(declare-fun mapKey!41095 () (_ BitVec 32))

(declare-fun mapValue!41095 () ValueCell!12404)

(assert (=> mapNonEmpty!41095 (= (arr!33390 _values!874) (store mapRest!41095 mapKey!41095 mapValue!41095))))

(declare-fun b!1080899 () Bool)

(assert (=> b!1080899 (= e!618060 tp_is_empty!26227)))

(declare-fun b!1080900 () Bool)

(declare-fun res!719963 () Bool)

(assert (=> b!1080900 (=> (not res!719963) (not e!618061))))

(declare-datatypes ((List!23269 0))(
  ( (Nil!23266) (Cons!23265 (h!24483 (_ BitVec 64)) (t!32620 List!23269)) )
))
(declare-fun arrayNoDuplicates!0 (array!69443 (_ BitVec 32) List!23269) Bool)

(assert (=> b!1080900 (= res!719963 (arrayNoDuplicates!0 lt!479348 #b00000000000000000000000000000000 Nil!23266))))

(declare-fun b!1080901 () Bool)

(declare-fun res!719958 () Bool)

(assert (=> b!1080901 (=> (not res!719958) (not e!618058))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080901 (= res!719958 (and (= (size!33927 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33926 _keys!1070) (size!33927 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!719962 () Bool)

(assert (=> start!95808 (=> (not res!719962) (not e!618058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95808 (= res!719962 (validMask!0 mask!1414))))

(assert (=> start!95808 e!618058))

(assert (=> start!95808 true))

(declare-fun array_inv!25820 (array!69443) Bool)

(assert (=> start!95808 (array_inv!25820 _keys!1070)))

(declare-fun e!618057 () Bool)

(declare-fun array_inv!25821 (array!69445) Bool)

(assert (=> start!95808 (and (array_inv!25821 _values!874) e!618057)))

(declare-fun b!1080902 () Bool)

(declare-fun res!719960 () Bool)

(assert (=> b!1080902 (=> (not res!719960) (not e!618058))))

(assert (=> b!1080902 (= res!719960 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23266))))

(declare-fun b!1080903 () Bool)

(assert (=> b!1080903 (= e!618057 (and e!618062 mapRes!41095))))

(declare-fun condMapEmpty!41095 () Bool)

(declare-fun mapDefault!41095 () ValueCell!12404)

(assert (=> b!1080903 (= condMapEmpty!41095 (= (arr!33390 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12404)) mapDefault!41095)))))

(assert (= (and start!95808 res!719962) b!1080901))

(assert (= (and b!1080901 res!719958) b!1080892))

(assert (= (and b!1080892 res!719964) b!1080902))

(assert (= (and b!1080902 res!719960) b!1080895))

(assert (= (and b!1080895 res!719961) b!1080898))

(assert (= (and b!1080898 res!719956) b!1080894))

(assert (= (and b!1080894 res!719959) b!1080896))

(assert (= (and b!1080896 res!719957) b!1080900))

(assert (= (and b!1080900 res!719963) b!1080897))

(assert (= (and b!1080903 condMapEmpty!41095) mapIsEmpty!41095))

(assert (= (and b!1080903 (not condMapEmpty!41095)) mapNonEmpty!41095))

(get-info :version)

(assert (= (and mapNonEmpty!41095 ((_ is ValueCellFull!12404) mapValue!41095)) b!1080899))

(assert (= (and b!1080903 ((_ is ValueCellFull!12404) mapDefault!41095)) b!1080893))

(assert (= start!95808 b!1080903))

(declare-fun m!999413 () Bool)

(assert (=> b!1080896 m!999413))

(declare-fun m!999415 () Bool)

(assert (=> b!1080896 m!999415))

(declare-fun m!999417 () Bool)

(assert (=> b!1080894 m!999417))

(declare-fun m!999419 () Bool)

(assert (=> start!95808 m!999419))

(declare-fun m!999421 () Bool)

(assert (=> start!95808 m!999421))

(declare-fun m!999423 () Bool)

(assert (=> start!95808 m!999423))

(declare-fun m!999425 () Bool)

(assert (=> b!1080892 m!999425))

(declare-fun m!999427 () Bool)

(assert (=> b!1080897 m!999427))

(declare-fun m!999429 () Bool)

(assert (=> b!1080897 m!999429))

(declare-fun m!999431 () Bool)

(assert (=> b!1080898 m!999431))

(declare-fun m!999433 () Bool)

(assert (=> b!1080902 m!999433))

(declare-fun m!999435 () Bool)

(assert (=> b!1080900 m!999435))

(declare-fun m!999437 () Bool)

(assert (=> mapNonEmpty!41095 m!999437))

(check-sat (not b!1080897) (not b!1080898) (not start!95808) tp_is_empty!26227 (not b!1080902) (not b!1080892) (not mapNonEmpty!41095) (not b!1080896) (not b!1080900))
(check-sat)
