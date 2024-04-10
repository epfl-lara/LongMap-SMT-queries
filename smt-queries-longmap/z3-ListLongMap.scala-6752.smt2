; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84662 () Bool)

(assert start!84662)

(declare-fun b_free!20073 () Bool)

(declare-fun b_next!20073 () Bool)

(assert (=> start!84662 (= b_free!20073 (not b_next!20073))))

(declare-fun tp!70013 () Bool)

(declare-fun b_and!32217 () Bool)

(assert (=> start!84662 (= tp!70013 b_and!32217)))

(declare-fun b!990130 () Bool)

(declare-fun res!662092 () Bool)

(declare-fun e!558308 () Bool)

(assert (=> b!990130 (=> (not res!662092) (not e!558308))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990130 (= res!662092 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990131 () Bool)

(declare-fun e!558305 () Bool)

(declare-fun tp_is_empty!23289 () Bool)

(assert (=> b!990131 (= e!558305 tp_is_empty!23289)))

(declare-fun b!990132 () Bool)

(declare-fun res!662097 () Bool)

(assert (=> b!990132 (=> (not res!662097) (not e!558308))))

(declare-datatypes ((array!62539 0))(
  ( (array!62540 (arr!30121 (Array (_ BitVec 32) (_ BitVec 64))) (size!30600 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62539)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62539 (_ BitVec 32)) Bool)

(assert (=> b!990132 (= res!662097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36982 () Bool)

(declare-fun mapRes!36982 () Bool)

(declare-fun tp!70014 () Bool)

(declare-fun e!558304 () Bool)

(assert (=> mapNonEmpty!36982 (= mapRes!36982 (and tp!70014 e!558304))))

(declare-fun mapKey!36982 () (_ BitVec 32))

(declare-datatypes ((V!36035 0))(
  ( (V!36036 (val!11695 Int)) )
))
(declare-datatypes ((ValueCell!11163 0))(
  ( (ValueCellFull!11163 (v!14265 V!36035)) (EmptyCell!11163) )
))
(declare-fun mapValue!36982 () ValueCell!11163)

(declare-datatypes ((array!62541 0))(
  ( (array!62542 (arr!30122 (Array (_ BitVec 32) ValueCell!11163)) (size!30601 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62541)

(declare-fun mapRest!36982 () (Array (_ BitVec 32) ValueCell!11163))

(assert (=> mapNonEmpty!36982 (= (arr!30122 _values!1278) (store mapRest!36982 mapKey!36982 mapValue!36982))))

(declare-fun b!990133 () Bool)

(declare-fun res!662090 () Bool)

(assert (=> b!990133 (=> (not res!662090) (not e!558308))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990133 (= res!662090 (validKeyInArray!0 (select (arr!30121 _keys!1544) from!1932)))))

(declare-fun b!990134 () Bool)

(declare-fun e!558309 () Bool)

(assert (=> b!990134 (= e!558309 (not (bvslt from!1932 (size!30601 _values!1278))))))

(declare-fun minValue!1220 () V!36035)

(declare-fun zeroValue!1220 () V!36035)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14912 0))(
  ( (tuple2!14913 (_1!7467 (_ BitVec 64)) (_2!7467 V!36035)) )
))
(declare-datatypes ((List!20841 0))(
  ( (Nil!20838) (Cons!20837 (h!21999 tuple2!14912) (t!29810 List!20841)) )
))
(declare-datatypes ((ListLongMap!13609 0))(
  ( (ListLongMap!13610 (toList!6820 List!20841)) )
))
(declare-fun lt!439241 () ListLongMap!13609)

(declare-fun getCurrentListMap!3870 (array!62539 array!62541 (_ BitVec 32) (_ BitVec 32) V!36035 V!36035 (_ BitVec 32) Int) ListLongMap!13609)

(assert (=> b!990134 (= lt!439241 (getCurrentListMap!3870 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439240 () ListLongMap!13609)

(declare-fun lt!439242 () tuple2!14912)

(declare-fun lt!439239 () tuple2!14912)

(declare-fun +!3090 (ListLongMap!13609 tuple2!14912) ListLongMap!13609)

(assert (=> b!990134 (= (+!3090 (+!3090 lt!439240 lt!439242) lt!439239) (+!3090 (+!3090 lt!439240 lt!439239) lt!439242))))

(declare-fun lt!439237 () V!36035)

(assert (=> b!990134 (= lt!439239 (tuple2!14913 (select (arr!30121 _keys!1544) from!1932) lt!439237))))

(assert (=> b!990134 (= lt!439242 (tuple2!14913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32854 0))(
  ( (Unit!32855) )
))
(declare-fun lt!439238 () Unit!32854)

(declare-fun addCommutativeForDiffKeys!712 (ListLongMap!13609 (_ BitVec 64) V!36035 (_ BitVec 64) V!36035) Unit!32854)

(assert (=> b!990134 (= lt!439238 (addCommutativeForDiffKeys!712 lt!439240 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30121 _keys!1544) from!1932) lt!439237))))

(declare-fun b!990135 () Bool)

(declare-fun res!662091 () Bool)

(assert (=> b!990135 (=> (not res!662091) (not e!558308))))

(assert (=> b!990135 (= res!662091 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30600 _keys!1544))))))

(declare-fun b!990137 () Bool)

(declare-fun res!662096 () Bool)

(assert (=> b!990137 (=> (not res!662096) (not e!558308))))

(assert (=> b!990137 (= res!662096 (and (= (size!30601 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30600 _keys!1544) (size!30601 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990138 () Bool)

(assert (=> b!990138 (= e!558308 e!558309)))

(declare-fun res!662093 () Bool)

(assert (=> b!990138 (=> (not res!662093) (not e!558309))))

(assert (=> b!990138 (= res!662093 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30121 _keys!1544) from!1932))))))

(declare-fun get!15636 (ValueCell!11163 V!36035) V!36035)

(declare-fun dynLambda!1871 (Int (_ BitVec 64)) V!36035)

(assert (=> b!990138 (= lt!439237 (get!15636 (select (arr!30122 _values!1278) from!1932) (dynLambda!1871 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3508 (array!62539 array!62541 (_ BitVec 32) (_ BitVec 32) V!36035 V!36035 (_ BitVec 32) Int) ListLongMap!13609)

(assert (=> b!990138 (= lt!439240 (getCurrentListMapNoExtraKeys!3508 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990139 () Bool)

(declare-fun e!558307 () Bool)

(assert (=> b!990139 (= e!558307 (and e!558305 mapRes!36982))))

(declare-fun condMapEmpty!36982 () Bool)

(declare-fun mapDefault!36982 () ValueCell!11163)

(assert (=> b!990139 (= condMapEmpty!36982 (= (arr!30122 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11163)) mapDefault!36982)))))

(declare-fun mapIsEmpty!36982 () Bool)

(assert (=> mapIsEmpty!36982 mapRes!36982))

(declare-fun b!990140 () Bool)

(declare-fun res!662094 () Bool)

(assert (=> b!990140 (=> (not res!662094) (not e!558308))))

(declare-datatypes ((List!20842 0))(
  ( (Nil!20839) (Cons!20838 (h!22000 (_ BitVec 64)) (t!29811 List!20842)) )
))
(declare-fun arrayNoDuplicates!0 (array!62539 (_ BitVec 32) List!20842) Bool)

(assert (=> b!990140 (= res!662094 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20839))))

(declare-fun res!662095 () Bool)

(assert (=> start!84662 (=> (not res!662095) (not e!558308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84662 (= res!662095 (validMask!0 mask!1948))))

(assert (=> start!84662 e!558308))

(assert (=> start!84662 true))

(assert (=> start!84662 tp_is_empty!23289))

(declare-fun array_inv!23263 (array!62541) Bool)

(assert (=> start!84662 (and (array_inv!23263 _values!1278) e!558307)))

(assert (=> start!84662 tp!70013))

(declare-fun array_inv!23264 (array!62539) Bool)

(assert (=> start!84662 (array_inv!23264 _keys!1544)))

(declare-fun b!990136 () Bool)

(assert (=> b!990136 (= e!558304 tp_is_empty!23289)))

(assert (= (and start!84662 res!662095) b!990137))

(assert (= (and b!990137 res!662096) b!990132))

(assert (= (and b!990132 res!662097) b!990140))

(assert (= (and b!990140 res!662094) b!990135))

(assert (= (and b!990135 res!662091) b!990133))

(assert (= (and b!990133 res!662090) b!990130))

(assert (= (and b!990130 res!662092) b!990138))

(assert (= (and b!990138 res!662093) b!990134))

(assert (= (and b!990139 condMapEmpty!36982) mapIsEmpty!36982))

(assert (= (and b!990139 (not condMapEmpty!36982)) mapNonEmpty!36982))

(get-info :version)

(assert (= (and mapNonEmpty!36982 ((_ is ValueCellFull!11163) mapValue!36982)) b!990136))

(assert (= (and b!990139 ((_ is ValueCellFull!11163) mapDefault!36982)) b!990131))

(assert (= start!84662 b!990139))

(declare-fun b_lambda!15153 () Bool)

(assert (=> (not b_lambda!15153) (not b!990138)))

(declare-fun t!29809 () Bool)

(declare-fun tb!6819 () Bool)

(assert (=> (and start!84662 (= defaultEntry!1281 defaultEntry!1281) t!29809) tb!6819))

(declare-fun result!13639 () Bool)

(assert (=> tb!6819 (= result!13639 tp_is_empty!23289)))

(assert (=> b!990138 t!29809))

(declare-fun b_and!32219 () Bool)

(assert (= b_and!32217 (and (=> t!29809 result!13639) b_and!32219)))

(declare-fun m!917531 () Bool)

(assert (=> mapNonEmpty!36982 m!917531))

(declare-fun m!917533 () Bool)

(assert (=> b!990133 m!917533))

(assert (=> b!990133 m!917533))

(declare-fun m!917535 () Bool)

(assert (=> b!990133 m!917535))

(declare-fun m!917537 () Bool)

(assert (=> start!84662 m!917537))

(declare-fun m!917539 () Bool)

(assert (=> start!84662 m!917539))

(declare-fun m!917541 () Bool)

(assert (=> start!84662 m!917541))

(assert (=> b!990138 m!917533))

(declare-fun m!917543 () Bool)

(assert (=> b!990138 m!917543))

(declare-fun m!917545 () Bool)

(assert (=> b!990138 m!917545))

(declare-fun m!917547 () Bool)

(assert (=> b!990138 m!917547))

(assert (=> b!990138 m!917543))

(assert (=> b!990138 m!917547))

(declare-fun m!917549 () Bool)

(assert (=> b!990138 m!917549))

(declare-fun m!917551 () Bool)

(assert (=> b!990132 m!917551))

(declare-fun m!917553 () Bool)

(assert (=> b!990140 m!917553))

(assert (=> b!990134 m!917533))

(assert (=> b!990134 m!917533))

(declare-fun m!917555 () Bool)

(assert (=> b!990134 m!917555))

(declare-fun m!917557 () Bool)

(assert (=> b!990134 m!917557))

(declare-fun m!917559 () Bool)

(assert (=> b!990134 m!917559))

(assert (=> b!990134 m!917557))

(declare-fun m!917561 () Bool)

(assert (=> b!990134 m!917561))

(declare-fun m!917563 () Bool)

(assert (=> b!990134 m!917563))

(declare-fun m!917565 () Bool)

(assert (=> b!990134 m!917565))

(assert (=> b!990134 m!917561))

(check-sat (not start!84662) (not b!990138) (not b_lambda!15153) (not b!990134) (not mapNonEmpty!36982) (not b!990132) tp_is_empty!23289 b_and!32219 (not b_next!20073) (not b!990133) (not b!990140))
(check-sat b_and!32219 (not b_next!20073))
