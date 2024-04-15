; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95548 () Bool)

(assert start!95548)

(declare-fun b!1079088 () Bool)

(declare-fun res!719129 () Bool)

(declare-fun e!616952 () Bool)

(assert (=> b!1079088 (=> (not res!719129) (not e!616952))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079088 (= res!719129 (validKeyInArray!0 k0!904))))

(declare-fun b!1079090 () Bool)

(declare-fun e!616949 () Bool)

(declare-fun tp_is_empty!26209 () Bool)

(assert (=> b!1079090 (= e!616949 tp_is_empty!26209)))

(declare-fun b!1079091 () Bool)

(declare-fun e!616947 () Bool)

(assert (=> b!1079091 (= e!616947 tp_is_empty!26209)))

(declare-fun b!1079092 () Bool)

(declare-fun res!719126 () Bool)

(assert (=> b!1079092 (=> (not res!719126) (not e!616952))))

(declare-datatypes ((array!69302 0))(
  ( (array!69303 (arr!33325 (Array (_ BitVec 32) (_ BitVec 64))) (size!33863 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69302)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69302 (_ BitVec 32)) Bool)

(assert (=> b!1079092 (= res!719126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079093 () Bool)

(declare-fun e!616948 () Bool)

(assert (=> b!1079093 (= e!616948 (not true))))

(declare-fun arrayContainsKey!0 (array!69302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079093 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35331 0))(
  ( (Unit!35332) )
))
(declare-fun lt!478579 () Unit!35331)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69302 (_ BitVec 64) (_ BitVec 32)) Unit!35331)

(assert (=> b!1079093 (= lt!478579 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079094 () Bool)

(declare-fun res!719128 () Bool)

(assert (=> b!1079094 (=> (not res!719128) (not e!616952))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40073 0))(
  ( (V!40074 (val!13161 Int)) )
))
(declare-datatypes ((ValueCell!12395 0))(
  ( (ValueCellFull!12395 (v!15781 V!40073)) (EmptyCell!12395) )
))
(declare-datatypes ((array!69304 0))(
  ( (array!69305 (arr!33326 (Array (_ BitVec 32) ValueCell!12395)) (size!33864 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69304)

(assert (=> b!1079094 (= res!719128 (and (= (size!33864 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33863 _keys!1070) (size!33864 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079095 () Bool)

(declare-fun res!719122 () Bool)

(assert (=> b!1079095 (=> (not res!719122) (not e!616952))))

(assert (=> b!1079095 (= res!719122 (= (select (arr!33325 _keys!1070) i!650) k0!904))))

(declare-fun b!1079096 () Bool)

(assert (=> b!1079096 (= e!616952 e!616948)))

(declare-fun res!719130 () Bool)

(assert (=> b!1079096 (=> (not res!719130) (not e!616948))))

(declare-fun lt!478580 () array!69302)

(assert (=> b!1079096 (= res!719130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478580 mask!1414))))

(assert (=> b!1079096 (= lt!478580 (array!69303 (store (arr!33325 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33863 _keys!1070)))))

(declare-fun mapIsEmpty!41068 () Bool)

(declare-fun mapRes!41068 () Bool)

(assert (=> mapIsEmpty!41068 mapRes!41068))

(declare-fun b!1079097 () Bool)

(declare-fun res!719123 () Bool)

(assert (=> b!1079097 (=> (not res!719123) (not e!616952))))

(declare-datatypes ((List!23307 0))(
  ( (Nil!23304) (Cons!23303 (h!24512 (_ BitVec 64)) (t!32657 List!23307)) )
))
(declare-fun arrayNoDuplicates!0 (array!69302 (_ BitVec 32) List!23307) Bool)

(assert (=> b!1079097 (= res!719123 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23304))))

(declare-fun mapNonEmpty!41068 () Bool)

(declare-fun tp!78530 () Bool)

(assert (=> mapNonEmpty!41068 (= mapRes!41068 (and tp!78530 e!616947))))

(declare-fun mapValue!41068 () ValueCell!12395)

(declare-fun mapRest!41068 () (Array (_ BitVec 32) ValueCell!12395))

(declare-fun mapKey!41068 () (_ BitVec 32))

(assert (=> mapNonEmpty!41068 (= (arr!33326 _values!874) (store mapRest!41068 mapKey!41068 mapValue!41068))))

(declare-fun res!719125 () Bool)

(assert (=> start!95548 (=> (not res!719125) (not e!616952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95548 (= res!719125 (validMask!0 mask!1414))))

(assert (=> start!95548 e!616952))

(assert (=> start!95548 true))

(declare-fun array_inv!25768 (array!69302) Bool)

(assert (=> start!95548 (array_inv!25768 _keys!1070)))

(declare-fun e!616951 () Bool)

(declare-fun array_inv!25769 (array!69304) Bool)

(assert (=> start!95548 (and (array_inv!25769 _values!874) e!616951)))

(declare-fun b!1079089 () Bool)

(declare-fun res!719127 () Bool)

(assert (=> b!1079089 (=> (not res!719127) (not e!616952))))

(assert (=> b!1079089 (= res!719127 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33863 _keys!1070))))))

(declare-fun b!1079098 () Bool)

(declare-fun res!719124 () Bool)

(assert (=> b!1079098 (=> (not res!719124) (not e!616948))))

(assert (=> b!1079098 (= res!719124 (arrayNoDuplicates!0 lt!478580 #b00000000000000000000000000000000 Nil!23304))))

(declare-fun b!1079099 () Bool)

(assert (=> b!1079099 (= e!616951 (and e!616949 mapRes!41068))))

(declare-fun condMapEmpty!41068 () Bool)

(declare-fun mapDefault!41068 () ValueCell!12395)

(assert (=> b!1079099 (= condMapEmpty!41068 (= (arr!33326 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12395)) mapDefault!41068)))))

(assert (= (and start!95548 res!719125) b!1079094))

(assert (= (and b!1079094 res!719128) b!1079092))

(assert (= (and b!1079092 res!719126) b!1079097))

(assert (= (and b!1079097 res!719123) b!1079089))

(assert (= (and b!1079089 res!719127) b!1079088))

(assert (= (and b!1079088 res!719129) b!1079095))

(assert (= (and b!1079095 res!719122) b!1079096))

(assert (= (and b!1079096 res!719130) b!1079098))

(assert (= (and b!1079098 res!719124) b!1079093))

(assert (= (and b!1079099 condMapEmpty!41068) mapIsEmpty!41068))

(assert (= (and b!1079099 (not condMapEmpty!41068)) mapNonEmpty!41068))

(get-info :version)

(assert (= (and mapNonEmpty!41068 ((_ is ValueCellFull!12395) mapValue!41068)) b!1079091))

(assert (= (and b!1079099 ((_ is ValueCellFull!12395) mapDefault!41068)) b!1079090))

(assert (= start!95548 b!1079099))

(declare-fun m!996881 () Bool)

(assert (=> b!1079098 m!996881))

(declare-fun m!996883 () Bool)

(assert (=> b!1079093 m!996883))

(declare-fun m!996885 () Bool)

(assert (=> b!1079093 m!996885))

(declare-fun m!996887 () Bool)

(assert (=> b!1079097 m!996887))

(declare-fun m!996889 () Bool)

(assert (=> b!1079096 m!996889))

(declare-fun m!996891 () Bool)

(assert (=> b!1079096 m!996891))

(declare-fun m!996893 () Bool)

(assert (=> start!95548 m!996893))

(declare-fun m!996895 () Bool)

(assert (=> start!95548 m!996895))

(declare-fun m!996897 () Bool)

(assert (=> start!95548 m!996897))

(declare-fun m!996899 () Bool)

(assert (=> b!1079095 m!996899))

(declare-fun m!996901 () Bool)

(assert (=> b!1079092 m!996901))

(declare-fun m!996903 () Bool)

(assert (=> b!1079088 m!996903))

(declare-fun m!996905 () Bool)

(assert (=> mapNonEmpty!41068 m!996905))

(check-sat (not b!1079098) (not b!1079092) (not b!1079088) (not start!95548) (not b!1079096) tp_is_empty!26209 (not mapNonEmpty!41068) (not b!1079097) (not b!1079093))
(check-sat)
