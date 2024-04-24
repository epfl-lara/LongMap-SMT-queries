; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95636 () Bool)

(assert start!95636)

(declare-fun b!1078791 () Bool)

(declare-fun e!616937 () Bool)

(declare-fun e!616936 () Bool)

(declare-fun mapRes!40912 () Bool)

(assert (=> b!1078791 (= e!616937 (and e!616936 mapRes!40912))))

(declare-fun condMapEmpty!40912 () Bool)

(declare-datatypes ((V!39945 0))(
  ( (V!39946 (val!13113 Int)) )
))
(declare-datatypes ((ValueCell!12347 0))(
  ( (ValueCellFull!12347 (v!15729 V!39945)) (EmptyCell!12347) )
))
(declare-datatypes ((array!69215 0))(
  ( (array!69216 (arr!33279 (Array (_ BitVec 32) ValueCell!12347)) (size!33816 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69215)

(declare-fun mapDefault!40912 () ValueCell!12347)

(assert (=> b!1078791 (= condMapEmpty!40912 (= (arr!33279 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12347)) mapDefault!40912)))))

(declare-fun b!1078792 () Bool)

(declare-fun res!718460 () Bool)

(declare-fun e!616935 () Bool)

(assert (=> b!1078792 (=> (not res!718460) (not e!616935))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69217 0))(
  ( (array!69218 (arr!33280 (Array (_ BitVec 32) (_ BitVec 64))) (size!33817 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69217)

(assert (=> b!1078792 (= res!718460 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33817 _keys!1070))))))

(declare-fun mapNonEmpty!40912 () Bool)

(declare-fun tp!78374 () Bool)

(declare-fun e!616933 () Bool)

(assert (=> mapNonEmpty!40912 (= mapRes!40912 (and tp!78374 e!616933))))

(declare-fun mapKey!40912 () (_ BitVec 32))

(declare-fun mapRest!40912 () (Array (_ BitVec 32) ValueCell!12347))

(declare-fun mapValue!40912 () ValueCell!12347)

(assert (=> mapNonEmpty!40912 (= (arr!33279 _values!874) (store mapRest!40912 mapKey!40912 mapValue!40912))))

(declare-fun b!1078793 () Bool)

(declare-fun res!718461 () Bool)

(assert (=> b!1078793 (=> (not res!718461) (not e!616935))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078793 (= res!718461 (validKeyInArray!0 k0!904))))

(declare-fun b!1078794 () Bool)

(declare-fun tp_is_empty!26113 () Bool)

(assert (=> b!1078794 (= e!616933 tp_is_empty!26113)))

(declare-fun res!718462 () Bool)

(assert (=> start!95636 (=> (not res!718462) (not e!616935))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95636 (= res!718462 (validMask!0 mask!1414))))

(assert (=> start!95636 e!616935))

(assert (=> start!95636 true))

(declare-fun array_inv!25752 (array!69217) Bool)

(assert (=> start!95636 (array_inv!25752 _keys!1070)))

(declare-fun array_inv!25753 (array!69215) Bool)

(assert (=> start!95636 (and (array_inv!25753 _values!874) e!616937)))

(declare-fun mapIsEmpty!40912 () Bool)

(assert (=> mapIsEmpty!40912 mapRes!40912))

(declare-fun b!1078795 () Bool)

(assert (=> b!1078795 (= e!616936 tp_is_empty!26113)))

(declare-fun b!1078796 () Bool)

(declare-fun res!718458 () Bool)

(assert (=> b!1078796 (=> (not res!718458) (not e!616935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69217 (_ BitVec 32)) Bool)

(assert (=> b!1078796 (= res!718458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078797 () Bool)

(assert (=> b!1078797 (= e!616935 (and (= (select (arr!33280 _keys!1070) i!650) k0!904) (not (= (size!33817 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun b!1078798 () Bool)

(declare-fun res!718463 () Bool)

(assert (=> b!1078798 (=> (not res!718463) (not e!616935))))

(declare-datatypes ((List!23230 0))(
  ( (Nil!23227) (Cons!23226 (h!24444 (_ BitVec 64)) (t!32581 List!23230)) )
))
(declare-fun arrayNoDuplicates!0 (array!69217 (_ BitVec 32) List!23230) Bool)

(assert (=> b!1078798 (= res!718463 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23227))))

(declare-fun b!1078799 () Bool)

(declare-fun res!718459 () Bool)

(assert (=> b!1078799 (=> (not res!718459) (not e!616935))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078799 (= res!718459 (and (= (size!33816 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33817 _keys!1070) (size!33816 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95636 res!718462) b!1078799))

(assert (= (and b!1078799 res!718459) b!1078796))

(assert (= (and b!1078796 res!718458) b!1078798))

(assert (= (and b!1078798 res!718463) b!1078792))

(assert (= (and b!1078792 res!718460) b!1078793))

(assert (= (and b!1078793 res!718461) b!1078797))

(assert (= (and b!1078791 condMapEmpty!40912) mapIsEmpty!40912))

(assert (= (and b!1078791 (not condMapEmpty!40912)) mapNonEmpty!40912))

(get-info :version)

(assert (= (and mapNonEmpty!40912 ((_ is ValueCellFull!12347) mapValue!40912)) b!1078794))

(assert (= (and b!1078791 ((_ is ValueCellFull!12347) mapDefault!40912)) b!1078795))

(assert (= start!95636 b!1078791))

(declare-fun m!997983 () Bool)

(assert (=> b!1078793 m!997983))

(declare-fun m!997985 () Bool)

(assert (=> b!1078798 m!997985))

(declare-fun m!997987 () Bool)

(assert (=> b!1078796 m!997987))

(declare-fun m!997989 () Bool)

(assert (=> start!95636 m!997989))

(declare-fun m!997991 () Bool)

(assert (=> start!95636 m!997991))

(declare-fun m!997993 () Bool)

(assert (=> start!95636 m!997993))

(declare-fun m!997995 () Bool)

(assert (=> mapNonEmpty!40912 m!997995))

(declare-fun m!997997 () Bool)

(assert (=> b!1078797 m!997997))

(check-sat (not b!1078796) tp_is_empty!26113 (not b!1078798) (not mapNonEmpty!40912) (not b!1078793) (not start!95636))
(check-sat)
