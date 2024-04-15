; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95554 () Bool)

(assert start!95554)

(declare-fun b!1079196 () Bool)

(declare-fun res!719208 () Bool)

(declare-fun e!617003 () Bool)

(assert (=> b!1079196 (=> (not res!719208) (not e!617003))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69314 0))(
  ( (array!69315 (arr!33331 (Array (_ BitVec 32) (_ BitVec 64))) (size!33869 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69314)

(assert (=> b!1079196 (= res!719208 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33869 _keys!1070))))))

(declare-fun b!1079197 () Bool)

(declare-fun res!719211 () Bool)

(assert (=> b!1079197 (=> (not res!719211) (not e!617003))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079197 (= res!719211 (= (select (arr!33331 _keys!1070) i!650) k0!904))))

(declare-fun b!1079198 () Bool)

(declare-fun e!617005 () Bool)

(assert (=> b!1079198 (= e!617003 e!617005)))

(declare-fun res!719210 () Bool)

(assert (=> b!1079198 (=> (not res!719210) (not e!617005))))

(declare-fun lt!478597 () array!69314)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69314 (_ BitVec 32)) Bool)

(assert (=> b!1079198 (= res!719210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478597 mask!1414))))

(assert (=> b!1079198 (= lt!478597 (array!69315 (store (arr!33331 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33869 _keys!1070)))))

(declare-fun res!719209 () Bool)

(assert (=> start!95554 (=> (not res!719209) (not e!617003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95554 (= res!719209 (validMask!0 mask!1414))))

(assert (=> start!95554 e!617003))

(assert (=> start!95554 true))

(declare-fun array_inv!25774 (array!69314) Bool)

(assert (=> start!95554 (array_inv!25774 _keys!1070)))

(declare-datatypes ((V!40081 0))(
  ( (V!40082 (val!13164 Int)) )
))
(declare-datatypes ((ValueCell!12398 0))(
  ( (ValueCellFull!12398 (v!15784 V!40081)) (EmptyCell!12398) )
))
(declare-datatypes ((array!69316 0))(
  ( (array!69317 (arr!33332 (Array (_ BitVec 32) ValueCell!12398)) (size!33870 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69316)

(declare-fun e!617006 () Bool)

(declare-fun array_inv!25775 (array!69316) Bool)

(assert (=> start!95554 (and (array_inv!25775 _values!874) e!617006)))

(declare-fun b!1079199 () Bool)

(assert (=> b!1079199 (= e!617005 (not true))))

(declare-fun arrayContainsKey!0 (array!69314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079199 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35335 0))(
  ( (Unit!35336) )
))
(declare-fun lt!478598 () Unit!35335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69314 (_ BitVec 64) (_ BitVec 32)) Unit!35335)

(assert (=> b!1079199 (= lt!478598 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079200 () Bool)

(declare-fun res!719203 () Bool)

(assert (=> b!1079200 (=> (not res!719203) (not e!617003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079200 (= res!719203 (validKeyInArray!0 k0!904))))

(declare-fun b!1079201 () Bool)

(declare-fun res!719206 () Bool)

(assert (=> b!1079201 (=> (not res!719206) (not e!617005))))

(declare-datatypes ((List!23309 0))(
  ( (Nil!23306) (Cons!23305 (h!24514 (_ BitVec 64)) (t!32659 List!23309)) )
))
(declare-fun arrayNoDuplicates!0 (array!69314 (_ BitVec 32) List!23309) Bool)

(assert (=> b!1079201 (= res!719206 (arrayNoDuplicates!0 lt!478597 #b00000000000000000000000000000000 Nil!23306))))

(declare-fun b!1079202 () Bool)

(declare-fun res!719204 () Bool)

(assert (=> b!1079202 (=> (not res!719204) (not e!617003))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079202 (= res!719204 (and (= (size!33870 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33869 _keys!1070) (size!33870 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41077 () Bool)

(declare-fun mapRes!41077 () Bool)

(declare-fun tp!78539 () Bool)

(declare-fun e!617004 () Bool)

(assert (=> mapNonEmpty!41077 (= mapRes!41077 (and tp!78539 e!617004))))

(declare-fun mapRest!41077 () (Array (_ BitVec 32) ValueCell!12398))

(declare-fun mapValue!41077 () ValueCell!12398)

(declare-fun mapKey!41077 () (_ BitVec 32))

(assert (=> mapNonEmpty!41077 (= (arr!33332 _values!874) (store mapRest!41077 mapKey!41077 mapValue!41077))))

(declare-fun b!1079203 () Bool)

(declare-fun res!719207 () Bool)

(assert (=> b!1079203 (=> (not res!719207) (not e!617003))))

(assert (=> b!1079203 (= res!719207 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23306))))

(declare-fun b!1079204 () Bool)

(declare-fun tp_is_empty!26215 () Bool)

(assert (=> b!1079204 (= e!617004 tp_is_empty!26215)))

(declare-fun b!1079205 () Bool)

(declare-fun e!617002 () Bool)

(assert (=> b!1079205 (= e!617002 tp_is_empty!26215)))

(declare-fun b!1079206 () Bool)

(assert (=> b!1079206 (= e!617006 (and e!617002 mapRes!41077))))

(declare-fun condMapEmpty!41077 () Bool)

(declare-fun mapDefault!41077 () ValueCell!12398)

(assert (=> b!1079206 (= condMapEmpty!41077 (= (arr!33332 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12398)) mapDefault!41077)))))

(declare-fun mapIsEmpty!41077 () Bool)

(assert (=> mapIsEmpty!41077 mapRes!41077))

(declare-fun b!1079207 () Bool)

(declare-fun res!719205 () Bool)

(assert (=> b!1079207 (=> (not res!719205) (not e!617003))))

(assert (=> b!1079207 (= res!719205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95554 res!719209) b!1079202))

(assert (= (and b!1079202 res!719204) b!1079207))

(assert (= (and b!1079207 res!719205) b!1079203))

(assert (= (and b!1079203 res!719207) b!1079196))

(assert (= (and b!1079196 res!719208) b!1079200))

(assert (= (and b!1079200 res!719203) b!1079197))

(assert (= (and b!1079197 res!719211) b!1079198))

(assert (= (and b!1079198 res!719210) b!1079201))

(assert (= (and b!1079201 res!719206) b!1079199))

(assert (= (and b!1079206 condMapEmpty!41077) mapIsEmpty!41077))

(assert (= (and b!1079206 (not condMapEmpty!41077)) mapNonEmpty!41077))

(get-info :version)

(assert (= (and mapNonEmpty!41077 ((_ is ValueCellFull!12398) mapValue!41077)) b!1079204))

(assert (= (and b!1079206 ((_ is ValueCellFull!12398) mapDefault!41077)) b!1079205))

(assert (= start!95554 b!1079206))

(declare-fun m!996959 () Bool)

(assert (=> b!1079203 m!996959))

(declare-fun m!996961 () Bool)

(assert (=> mapNonEmpty!41077 m!996961))

(declare-fun m!996963 () Bool)

(assert (=> b!1079198 m!996963))

(declare-fun m!996965 () Bool)

(assert (=> b!1079198 m!996965))

(declare-fun m!996967 () Bool)

(assert (=> b!1079200 m!996967))

(declare-fun m!996969 () Bool)

(assert (=> b!1079197 m!996969))

(declare-fun m!996971 () Bool)

(assert (=> start!95554 m!996971))

(declare-fun m!996973 () Bool)

(assert (=> start!95554 m!996973))

(declare-fun m!996975 () Bool)

(assert (=> start!95554 m!996975))

(declare-fun m!996977 () Bool)

(assert (=> b!1079199 m!996977))

(declare-fun m!996979 () Bool)

(assert (=> b!1079199 m!996979))

(declare-fun m!996981 () Bool)

(assert (=> b!1079207 m!996981))

(declare-fun m!996983 () Bool)

(assert (=> b!1079201 m!996983))

(check-sat (not b!1079198) (not b!1079207) (not b!1079203) (not b!1079200) (not mapNonEmpty!41077) (not start!95554) (not b!1079201) (not b!1079199) tp_is_empty!26215)
(check-sat)
