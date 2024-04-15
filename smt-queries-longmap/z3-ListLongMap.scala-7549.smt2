; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95608 () Bool)

(assert start!95608)

(declare-fun b_free!22267 () Bool)

(declare-fun b_next!22267 () Bool)

(assert (=> start!95608 (= b_free!22267 (not b_next!22267))))

(declare-fun tp!78650 () Bool)

(declare-fun b_and!35219 () Bool)

(assert (=> start!95608 (= tp!78650 b_and!35219)))

(declare-fun res!719938 () Bool)

(declare-fun e!617489 () Bool)

(assert (=> start!95608 (=> (not res!719938) (not e!617489))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95608 (= res!719938 (validMask!0 mask!1414))))

(assert (=> start!95608 e!617489))

(assert (=> start!95608 tp!78650))

(assert (=> start!95608 true))

(declare-fun tp_is_empty!26269 () Bool)

(assert (=> start!95608 tp_is_empty!26269))

(declare-datatypes ((array!69420 0))(
  ( (array!69421 (arr!33384 (Array (_ BitVec 32) (_ BitVec 64))) (size!33922 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69420)

(declare-fun array_inv!25810 (array!69420) Bool)

(assert (=> start!95608 (array_inv!25810 _keys!1070)))

(declare-datatypes ((V!40153 0))(
  ( (V!40154 (val!13191 Int)) )
))
(declare-datatypes ((ValueCell!12425 0))(
  ( (ValueCellFull!12425 (v!15811 V!40153)) (EmptyCell!12425) )
))
(declare-datatypes ((array!69422 0))(
  ( (array!69423 (arr!33385 (Array (_ BitVec 32) ValueCell!12425)) (size!33923 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69422)

(declare-fun e!617488 () Bool)

(declare-fun array_inv!25811 (array!69422) Bool)

(assert (=> start!95608 (and (array_inv!25811 _values!874) e!617488)))

(declare-fun b!1080168 () Bool)

(declare-fun res!719934 () Bool)

(assert (=> b!1080168 (=> (not res!719934) (not e!617489))))

(declare-datatypes ((List!23338 0))(
  ( (Nil!23335) (Cons!23334 (h!24543 (_ BitVec 64)) (t!32688 List!23338)) )
))
(declare-fun arrayNoDuplicates!0 (array!69420 (_ BitVec 32) List!23338) Bool)

(assert (=> b!1080168 (= res!719934 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23335))))

(declare-fun b!1080169 () Bool)

(declare-fun res!719937 () Bool)

(assert (=> b!1080169 (=> (not res!719937) (not e!617489))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080169 (= res!719937 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33922 _keys!1070))))))

(declare-fun b!1080170 () Bool)

(declare-fun res!719933 () Bool)

(assert (=> b!1080170 (=> (not res!719933) (not e!617489))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080170 (= res!719933 (validKeyInArray!0 k0!904))))

(declare-fun b!1080171 () Bool)

(declare-fun e!617487 () Bool)

(declare-fun mapRes!41158 () Bool)

(assert (=> b!1080171 (= e!617488 (and e!617487 mapRes!41158))))

(declare-fun condMapEmpty!41158 () Bool)

(declare-fun mapDefault!41158 () ValueCell!12425)

(assert (=> b!1080171 (= condMapEmpty!41158 (= (arr!33385 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12425)) mapDefault!41158)))))

(declare-fun mapNonEmpty!41158 () Bool)

(declare-fun tp!78649 () Bool)

(declare-fun e!617490 () Bool)

(assert (=> mapNonEmpty!41158 (= mapRes!41158 (and tp!78649 e!617490))))

(declare-fun mapRest!41158 () (Array (_ BitVec 32) ValueCell!12425))

(declare-fun mapValue!41158 () ValueCell!12425)

(declare-fun mapKey!41158 () (_ BitVec 32))

(assert (=> mapNonEmpty!41158 (= (arr!33385 _values!874) (store mapRest!41158 mapKey!41158 mapValue!41158))))

(declare-fun b!1080172 () Bool)

(declare-fun e!617492 () Bool)

(assert (=> b!1080172 (= e!617489 e!617492)))

(declare-fun res!719939 () Bool)

(assert (=> b!1080172 (=> (not res!719939) (not e!617492))))

(declare-fun lt!478789 () array!69420)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69420 (_ BitVec 32)) Bool)

(assert (=> b!1080172 (= res!719939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478789 mask!1414))))

(assert (=> b!1080172 (= lt!478789 (array!69421 (store (arr!33384 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33922 _keys!1070)))))

(declare-fun b!1080173 () Bool)

(declare-fun res!719932 () Bool)

(assert (=> b!1080173 (=> (not res!719932) (not e!617492))))

(assert (=> b!1080173 (= res!719932 (arrayNoDuplicates!0 lt!478789 #b00000000000000000000000000000000 Nil!23335))))

(declare-fun b!1080174 () Bool)

(assert (=> b!1080174 (= e!617492 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16778 0))(
  ( (tuple2!16779 (_1!8400 (_ BitVec 64)) (_2!8400 V!40153)) )
))
(declare-datatypes ((List!23339 0))(
  ( (Nil!23336) (Cons!23335 (h!24544 tuple2!16778) (t!32689 List!23339)) )
))
(declare-datatypes ((ListLongMap!14747 0))(
  ( (ListLongMap!14748 (toList!7389 List!23339)) )
))
(declare-fun lt!478788 () ListLongMap!14747)

(declare-fun zeroValue!831 () V!40153)

(declare-fun minValue!831 () V!40153)

(declare-fun getCurrentListMapNoExtraKeys!3952 (array!69420 array!69422 (_ BitVec 32) (_ BitVec 32) V!40153 V!40153 (_ BitVec 32) Int) ListLongMap!14747)

(assert (=> b!1080174 (= lt!478788 (getCurrentListMapNoExtraKeys!3952 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080174 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35371 0))(
  ( (Unit!35372) )
))
(declare-fun lt!478790 () Unit!35371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69420 (_ BitVec 64) (_ BitVec 32)) Unit!35371)

(assert (=> b!1080174 (= lt!478790 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080175 () Bool)

(declare-fun res!719935 () Bool)

(assert (=> b!1080175 (=> (not res!719935) (not e!617489))))

(assert (=> b!1080175 (= res!719935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080176 () Bool)

(declare-fun res!719940 () Bool)

(assert (=> b!1080176 (=> (not res!719940) (not e!617489))))

(assert (=> b!1080176 (= res!719940 (and (= (size!33923 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33922 _keys!1070) (size!33923 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41158 () Bool)

(assert (=> mapIsEmpty!41158 mapRes!41158))

(declare-fun b!1080177 () Bool)

(assert (=> b!1080177 (= e!617487 tp_is_empty!26269)))

(declare-fun b!1080178 () Bool)

(assert (=> b!1080178 (= e!617490 tp_is_empty!26269)))

(declare-fun b!1080179 () Bool)

(declare-fun res!719936 () Bool)

(assert (=> b!1080179 (=> (not res!719936) (not e!617489))))

(assert (=> b!1080179 (= res!719936 (= (select (arr!33384 _keys!1070) i!650) k0!904))))

(assert (= (and start!95608 res!719938) b!1080176))

(assert (= (and b!1080176 res!719940) b!1080175))

(assert (= (and b!1080175 res!719935) b!1080168))

(assert (= (and b!1080168 res!719934) b!1080169))

(assert (= (and b!1080169 res!719937) b!1080170))

(assert (= (and b!1080170 res!719933) b!1080179))

(assert (= (and b!1080179 res!719936) b!1080172))

(assert (= (and b!1080172 res!719939) b!1080173))

(assert (= (and b!1080173 res!719932) b!1080174))

(assert (= (and b!1080171 condMapEmpty!41158) mapIsEmpty!41158))

(assert (= (and b!1080171 (not condMapEmpty!41158)) mapNonEmpty!41158))

(get-info :version)

(assert (= (and mapNonEmpty!41158 ((_ is ValueCellFull!12425) mapValue!41158)) b!1080178))

(assert (= (and b!1080171 ((_ is ValueCellFull!12425) mapDefault!41158)) b!1080177))

(assert (= start!95608 b!1080171))

(declare-fun m!997679 () Bool)

(assert (=> start!95608 m!997679))

(declare-fun m!997681 () Bool)

(assert (=> start!95608 m!997681))

(declare-fun m!997683 () Bool)

(assert (=> start!95608 m!997683))

(declare-fun m!997685 () Bool)

(assert (=> b!1080173 m!997685))

(declare-fun m!997687 () Bool)

(assert (=> b!1080170 m!997687))

(declare-fun m!997689 () Bool)

(assert (=> b!1080172 m!997689))

(declare-fun m!997691 () Bool)

(assert (=> b!1080172 m!997691))

(declare-fun m!997693 () Bool)

(assert (=> b!1080168 m!997693))

(declare-fun m!997695 () Bool)

(assert (=> b!1080175 m!997695))

(declare-fun m!997697 () Bool)

(assert (=> mapNonEmpty!41158 m!997697))

(declare-fun m!997699 () Bool)

(assert (=> b!1080174 m!997699))

(declare-fun m!997701 () Bool)

(assert (=> b!1080174 m!997701))

(declare-fun m!997703 () Bool)

(assert (=> b!1080174 m!997703))

(declare-fun m!997705 () Bool)

(assert (=> b!1080179 m!997705))

(check-sat (not b!1080173) (not b!1080168) tp_is_empty!26269 (not b!1080174) (not b!1080170) (not b_next!22267) (not mapNonEmpty!41158) (not b!1080175) (not start!95608) (not b!1080172) b_and!35219)
(check-sat b_and!35219 (not b_next!22267))
