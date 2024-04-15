; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20320 () Bool)

(assert start!20320)

(declare-fun b_free!4975 () Bool)

(declare-fun b_next!4975 () Bool)

(assert (=> start!20320 (= b_free!4975 (not b_next!4975))))

(declare-fun tp!17957 () Bool)

(declare-fun b_and!11695 () Bool)

(assert (=> start!20320 (= tp!17957 b_and!11695)))

(declare-fun b!200034 () Bool)

(declare-fun res!95214 () Bool)

(declare-fun e!131199 () Bool)

(assert (=> b!200034 (=> (not res!95214) (not e!131199))))

(declare-datatypes ((array!8879 0))(
  ( (array!8880 (arr!4189 (Array (_ BitVec 32) (_ BitVec 64))) (size!4515 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8879)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8879 (_ BitVec 32)) Bool)

(assert (=> b!200034 (= res!95214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200035 () Bool)

(declare-fun e!131196 () Bool)

(declare-fun e!131194 () Bool)

(declare-fun mapRes!8315 () Bool)

(assert (=> b!200035 (= e!131196 (and e!131194 mapRes!8315))))

(declare-fun condMapEmpty!8315 () Bool)

(declare-datatypes ((V!6089 0))(
  ( (V!6090 (val!2460 Int)) )
))
(declare-datatypes ((ValueCell!2072 0))(
  ( (ValueCellFull!2072 (v!4424 V!6089)) (EmptyCell!2072) )
))
(declare-datatypes ((array!8881 0))(
  ( (array!8882 (arr!4190 (Array (_ BitVec 32) ValueCell!2072)) (size!4516 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8881)

(declare-fun mapDefault!8315 () ValueCell!2072)

(assert (=> b!200035 (= condMapEmpty!8315 (= (arr!4190 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2072)) mapDefault!8315)))))

(declare-fun b!200036 () Bool)

(declare-fun res!95217 () Bool)

(assert (=> b!200036 (=> (not res!95217) (not e!131199))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200036 (= res!95217 (validKeyInArray!0 k0!843))))

(declare-fun b!200037 () Bool)

(declare-fun res!95216 () Bool)

(assert (=> b!200037 (=> (not res!95216) (not e!131199))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200037 (= res!95216 (= (select (arr!4189 _keys!825) i!601) k0!843))))

(declare-fun b!200038 () Bool)

(declare-fun e!131198 () Bool)

(assert (=> b!200038 (= e!131199 (not e!131198))))

(declare-fun res!95215 () Bool)

(assert (=> b!200038 (=> res!95215 e!131198)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200038 (= res!95215 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3688 0))(
  ( (tuple2!3689 (_1!1855 (_ BitVec 64)) (_2!1855 V!6089)) )
))
(declare-datatypes ((List!2615 0))(
  ( (Nil!2612) (Cons!2611 (h!3253 tuple2!3688) (t!7537 List!2615)) )
))
(declare-datatypes ((ListLongMap!2591 0))(
  ( (ListLongMap!2592 (toList!1311 List!2615)) )
))
(declare-fun lt!98586 () ListLongMap!2591)

(declare-fun zeroValue!615 () V!6089)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6089)

(declare-fun getCurrentListMap!881 (array!8879 array!8881 (_ BitVec 32) (_ BitVec 32) V!6089 V!6089 (_ BitVec 32) Int) ListLongMap!2591)

(assert (=> b!200038 (= lt!98586 (getCurrentListMap!881 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98584 () ListLongMap!2591)

(declare-fun lt!98591 () array!8881)

(assert (=> b!200038 (= lt!98584 (getCurrentListMap!881 _keys!825 lt!98591 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98587 () ListLongMap!2591)

(declare-fun lt!98588 () ListLongMap!2591)

(assert (=> b!200038 (and (= lt!98587 lt!98588) (= lt!98588 lt!98587))))

(declare-fun lt!98585 () ListLongMap!2591)

(declare-fun v!520 () V!6089)

(declare-fun +!360 (ListLongMap!2591 tuple2!3688) ListLongMap!2591)

(assert (=> b!200038 (= lt!98588 (+!360 lt!98585 (tuple2!3689 k0!843 v!520)))))

(declare-datatypes ((Unit!5972 0))(
  ( (Unit!5973) )
))
(declare-fun lt!98583 () Unit!5972)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!40 (array!8879 array!8881 (_ BitVec 32) (_ BitVec 32) V!6089 V!6089 (_ BitVec 32) (_ BitVec 64) V!6089 (_ BitVec 32) Int) Unit!5972)

(assert (=> b!200038 (= lt!98583 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!40 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!291 (array!8879 array!8881 (_ BitVec 32) (_ BitVec 32) V!6089 V!6089 (_ BitVec 32) Int) ListLongMap!2591)

(assert (=> b!200038 (= lt!98587 (getCurrentListMapNoExtraKeys!291 _keys!825 lt!98591 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200038 (= lt!98591 (array!8882 (store (arr!4190 _values!649) i!601 (ValueCellFull!2072 v!520)) (size!4516 _values!649)))))

(assert (=> b!200038 (= lt!98585 (getCurrentListMapNoExtraKeys!291 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200039 () Bool)

(declare-fun res!95222 () Bool)

(declare-fun e!131195 () Bool)

(assert (=> b!200039 (=> (not res!95222) (not e!131195))))

(declare-fun lt!98590 () tuple2!3688)

(declare-fun lt!98589 () tuple2!3688)

(assert (=> b!200039 (= res!95222 (= lt!98586 (+!360 (+!360 lt!98585 lt!98589) lt!98590)))))

(declare-fun b!200040 () Bool)

(declare-fun res!95213 () Bool)

(assert (=> b!200040 (=> (not res!95213) (not e!131199))))

(declare-datatypes ((List!2616 0))(
  ( (Nil!2613) (Cons!2612 (h!3254 (_ BitVec 64)) (t!7538 List!2616)) )
))
(declare-fun arrayNoDuplicates!0 (array!8879 (_ BitVec 32) List!2616) Bool)

(assert (=> b!200040 (= res!95213 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2613))))

(declare-fun b!200041 () Bool)

(declare-fun res!95218 () Bool)

(assert (=> b!200041 (=> (not res!95218) (not e!131199))))

(assert (=> b!200041 (= res!95218 (and (= (size!4516 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4515 _keys!825) (size!4516 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200042 () Bool)

(assert (=> b!200042 (= e!131195 (= lt!98584 (+!360 (+!360 lt!98588 lt!98589) lt!98590)))))

(declare-fun res!95221 () Bool)

(assert (=> start!20320 (=> (not res!95221) (not e!131199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20320 (= res!95221 (validMask!0 mask!1149))))

(assert (=> start!20320 e!131199))

(declare-fun array_inv!2733 (array!8881) Bool)

(assert (=> start!20320 (and (array_inv!2733 _values!649) e!131196)))

(assert (=> start!20320 true))

(declare-fun tp_is_empty!4831 () Bool)

(assert (=> start!20320 tp_is_empty!4831))

(declare-fun array_inv!2734 (array!8879) Bool)

(assert (=> start!20320 (array_inv!2734 _keys!825)))

(assert (=> start!20320 tp!17957))

(declare-fun b!200033 () Bool)

(declare-fun res!95220 () Bool)

(assert (=> b!200033 (=> (not res!95220) (not e!131199))))

(assert (=> b!200033 (= res!95220 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4515 _keys!825))))))

(declare-fun b!200043 () Bool)

(assert (=> b!200043 (= e!131198 true)))

(assert (=> b!200043 e!131195))

(declare-fun res!95219 () Bool)

(assert (=> b!200043 (=> (not res!95219) (not e!131195))))

(assert (=> b!200043 (= res!95219 (= lt!98584 (+!360 (+!360 lt!98587 lt!98589) lt!98590)))))

(assert (=> b!200043 (= lt!98590 (tuple2!3689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200043 (= lt!98589 (tuple2!3689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8315 () Bool)

(assert (=> mapIsEmpty!8315 mapRes!8315))

(declare-fun mapNonEmpty!8315 () Bool)

(declare-fun tp!17956 () Bool)

(declare-fun e!131197 () Bool)

(assert (=> mapNonEmpty!8315 (= mapRes!8315 (and tp!17956 e!131197))))

(declare-fun mapKey!8315 () (_ BitVec 32))

(declare-fun mapValue!8315 () ValueCell!2072)

(declare-fun mapRest!8315 () (Array (_ BitVec 32) ValueCell!2072))

(assert (=> mapNonEmpty!8315 (= (arr!4190 _values!649) (store mapRest!8315 mapKey!8315 mapValue!8315))))

(declare-fun b!200044 () Bool)

(assert (=> b!200044 (= e!131197 tp_is_empty!4831)))

(declare-fun b!200045 () Bool)

(assert (=> b!200045 (= e!131194 tp_is_empty!4831)))

(assert (= (and start!20320 res!95221) b!200041))

(assert (= (and b!200041 res!95218) b!200034))

(assert (= (and b!200034 res!95214) b!200040))

(assert (= (and b!200040 res!95213) b!200033))

(assert (= (and b!200033 res!95220) b!200036))

(assert (= (and b!200036 res!95217) b!200037))

(assert (= (and b!200037 res!95216) b!200038))

(assert (= (and b!200038 (not res!95215)) b!200043))

(assert (= (and b!200043 res!95219) b!200039))

(assert (= (and b!200039 res!95222) b!200042))

(assert (= (and b!200035 condMapEmpty!8315) mapIsEmpty!8315))

(assert (= (and b!200035 (not condMapEmpty!8315)) mapNonEmpty!8315))

(get-info :version)

(assert (= (and mapNonEmpty!8315 ((_ is ValueCellFull!2072) mapValue!8315)) b!200044))

(assert (= (and b!200035 ((_ is ValueCellFull!2072) mapDefault!8315)) b!200045))

(assert (= start!20320 b!200035))

(declare-fun m!225975 () Bool)

(assert (=> b!200037 m!225975))

(declare-fun m!225977 () Bool)

(assert (=> b!200042 m!225977))

(assert (=> b!200042 m!225977))

(declare-fun m!225979 () Bool)

(assert (=> b!200042 m!225979))

(declare-fun m!225981 () Bool)

(assert (=> b!200040 m!225981))

(declare-fun m!225983 () Bool)

(assert (=> b!200036 m!225983))

(declare-fun m!225985 () Bool)

(assert (=> mapNonEmpty!8315 m!225985))

(declare-fun m!225987 () Bool)

(assert (=> start!20320 m!225987))

(declare-fun m!225989 () Bool)

(assert (=> start!20320 m!225989))

(declare-fun m!225991 () Bool)

(assert (=> start!20320 m!225991))

(declare-fun m!225993 () Bool)

(assert (=> b!200038 m!225993))

(declare-fun m!225995 () Bool)

(assert (=> b!200038 m!225995))

(declare-fun m!225997 () Bool)

(assert (=> b!200038 m!225997))

(declare-fun m!225999 () Bool)

(assert (=> b!200038 m!225999))

(declare-fun m!226001 () Bool)

(assert (=> b!200038 m!226001))

(declare-fun m!226003 () Bool)

(assert (=> b!200038 m!226003))

(declare-fun m!226005 () Bool)

(assert (=> b!200038 m!226005))

(declare-fun m!226007 () Bool)

(assert (=> b!200039 m!226007))

(assert (=> b!200039 m!226007))

(declare-fun m!226009 () Bool)

(assert (=> b!200039 m!226009))

(declare-fun m!226011 () Bool)

(assert (=> b!200043 m!226011))

(assert (=> b!200043 m!226011))

(declare-fun m!226013 () Bool)

(assert (=> b!200043 m!226013))

(declare-fun m!226015 () Bool)

(assert (=> b!200034 m!226015))

(check-sat b_and!11695 (not b!200040) (not mapNonEmpty!8315) (not b!200038) (not b!200039) (not b_next!4975) (not b!200042) (not b!200034) tp_is_empty!4831 (not b!200036) (not start!20320) (not b!200043))
(check-sat b_and!11695 (not b_next!4975))
