; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84392 () Bool)

(assert start!84392)

(declare-fun b_free!19981 () Bool)

(declare-fun b_next!19981 () Bool)

(assert (=> start!84392 (= b_free!19981 (not b_next!19981))))

(declare-fun tp!69721 () Bool)

(declare-fun b_and!31999 () Bool)

(assert (=> start!84392 (= tp!69721 b_and!31999)))

(declare-fun b!987071 () Bool)

(declare-fun e!556595 () Bool)

(declare-fun tp_is_empty!23197 () Bool)

(assert (=> b!987071 (= e!556595 tp_is_empty!23197)))

(declare-fun b!987072 () Bool)

(declare-fun res!660399 () Bool)

(declare-fun e!556592 () Bool)

(assert (=> b!987072 (=> (not res!660399) (not e!556592))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987072 (= res!660399 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987073 () Bool)

(declare-fun e!556594 () Bool)

(assert (=> b!987073 (= e!556594 tp_is_empty!23197)))

(declare-fun b!987074 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!35913 0))(
  ( (V!35914 (val!11649 Int)) )
))
(declare-datatypes ((ValueCell!11117 0))(
  ( (ValueCellFull!11117 (v!14211 V!35913)) (EmptyCell!11117) )
))
(declare-datatypes ((array!62284 0))(
  ( (array!62285 (arr!29999 (Array (_ BitVec 32) ValueCell!11117)) (size!30480 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62284)

(assert (=> b!987074 (= e!556592 (not (bvslt from!1932 (size!30480 _values!1278))))))

(declare-datatypes ((tuple2!14920 0))(
  ( (tuple2!14921 (_1!7471 (_ BitVec 64)) (_2!7471 V!35913)) )
))
(declare-datatypes ((List!20807 0))(
  ( (Nil!20804) (Cons!20803 (h!21965 tuple2!14920) (t!29707 List!20807)) )
))
(declare-datatypes ((ListLongMap!13607 0))(
  ( (ListLongMap!13608 (toList!6819 List!20807)) )
))
(declare-fun lt!437444 () ListLongMap!13607)

(declare-fun lt!437443 () tuple2!14920)

(declare-fun lt!437441 () tuple2!14920)

(declare-fun +!3095 (ListLongMap!13607 tuple2!14920) ListLongMap!13607)

(assert (=> b!987074 (= (+!3095 (+!3095 lt!437444 lt!437443) lt!437441) (+!3095 (+!3095 lt!437444 lt!437441) lt!437443))))

(declare-fun lt!437442 () V!35913)

(declare-datatypes ((array!62286 0))(
  ( (array!62287 (arr!30000 (Array (_ BitVec 32) (_ BitVec 64))) (size!30481 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62286)

(assert (=> b!987074 (= lt!437441 (tuple2!14921 (select (arr!30000 _keys!1544) from!1932) lt!437442))))

(declare-fun minValue!1220 () V!35913)

(assert (=> b!987074 (= lt!437443 (tuple2!14921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32642 0))(
  ( (Unit!32643) )
))
(declare-fun lt!437445 () Unit!32642)

(declare-fun addCommutativeForDiffKeys!691 (ListLongMap!13607 (_ BitVec 64) V!35913 (_ BitVec 64) V!35913) Unit!32642)

(assert (=> b!987074 (= lt!437445 (addCommutativeForDiffKeys!691 lt!437444 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30000 _keys!1544) from!1932) lt!437442))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15576 (ValueCell!11117 V!35913) V!35913)

(declare-fun dynLambda!1844 (Int (_ BitVec 64)) V!35913)

(assert (=> b!987074 (= lt!437442 (get!15576 (select (arr!29999 _values!1278) from!1932) (dynLambda!1844 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35913)

(declare-fun getCurrentListMapNoExtraKeys!3523 (array!62286 array!62284 (_ BitVec 32) (_ BitVec 32) V!35913 V!35913 (_ BitVec 32) Int) ListLongMap!13607)

(assert (=> b!987074 (= lt!437444 (+!3095 (getCurrentListMapNoExtraKeys!3523 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!36827 () Bool)

(declare-fun mapRes!36827 () Bool)

(assert (=> mapIsEmpty!36827 mapRes!36827))

(declare-fun b!987076 () Bool)

(declare-fun res!660401 () Bool)

(assert (=> b!987076 (=> (not res!660401) (not e!556592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62286 (_ BitVec 32)) Bool)

(assert (=> b!987076 (= res!660401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987077 () Bool)

(declare-fun res!660400 () Bool)

(assert (=> b!987077 (=> (not res!660400) (not e!556592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987077 (= res!660400 (validKeyInArray!0 (select (arr!30000 _keys!1544) from!1932)))))

(declare-fun res!660398 () Bool)

(assert (=> start!84392 (=> (not res!660398) (not e!556592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84392 (= res!660398 (validMask!0 mask!1948))))

(assert (=> start!84392 e!556592))

(assert (=> start!84392 true))

(assert (=> start!84392 tp_is_empty!23197))

(declare-fun e!556591 () Bool)

(declare-fun array_inv!23187 (array!62284) Bool)

(assert (=> start!84392 (and (array_inv!23187 _values!1278) e!556591)))

(assert (=> start!84392 tp!69721))

(declare-fun array_inv!23188 (array!62286) Bool)

(assert (=> start!84392 (array_inv!23188 _keys!1544)))

(declare-fun b!987075 () Bool)

(declare-fun res!660402 () Bool)

(assert (=> b!987075 (=> (not res!660402) (not e!556592))))

(declare-datatypes ((List!20808 0))(
  ( (Nil!20805) (Cons!20804 (h!21966 (_ BitVec 64)) (t!29708 List!20808)) )
))
(declare-fun arrayNoDuplicates!0 (array!62286 (_ BitVec 32) List!20808) Bool)

(assert (=> b!987075 (= res!660402 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20805))))

(declare-fun b!987078 () Bool)

(declare-fun res!660397 () Bool)

(assert (=> b!987078 (=> (not res!660397) (not e!556592))))

(assert (=> b!987078 (= res!660397 (and (= (size!30480 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30481 _keys!1544) (size!30480 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36827 () Bool)

(declare-fun tp!69722 () Bool)

(assert (=> mapNonEmpty!36827 (= mapRes!36827 (and tp!69722 e!556594))))

(declare-fun mapKey!36827 () (_ BitVec 32))

(declare-fun mapValue!36827 () ValueCell!11117)

(declare-fun mapRest!36827 () (Array (_ BitVec 32) ValueCell!11117))

(assert (=> mapNonEmpty!36827 (= (arr!29999 _values!1278) (store mapRest!36827 mapKey!36827 mapValue!36827))))

(declare-fun b!987079 () Bool)

(declare-fun res!660396 () Bool)

(assert (=> b!987079 (=> (not res!660396) (not e!556592))))

(assert (=> b!987079 (= res!660396 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30481 _keys!1544))))))

(declare-fun b!987080 () Bool)

(assert (=> b!987080 (= e!556591 (and e!556595 mapRes!36827))))

(declare-fun condMapEmpty!36827 () Bool)

(declare-fun mapDefault!36827 () ValueCell!11117)

(assert (=> b!987080 (= condMapEmpty!36827 (= (arr!29999 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11117)) mapDefault!36827)))))

(assert (= (and start!84392 res!660398) b!987078))

(assert (= (and b!987078 res!660397) b!987076))

(assert (= (and b!987076 res!660401) b!987075))

(assert (= (and b!987075 res!660402) b!987079))

(assert (= (and b!987079 res!660396) b!987077))

(assert (= (and b!987077 res!660400) b!987072))

(assert (= (and b!987072 res!660399) b!987074))

(assert (= (and b!987080 condMapEmpty!36827) mapIsEmpty!36827))

(assert (= (and b!987080 (not condMapEmpty!36827)) mapNonEmpty!36827))

(get-info :version)

(assert (= (and mapNonEmpty!36827 ((_ is ValueCellFull!11117) mapValue!36827)) b!987073))

(assert (= (and b!987080 ((_ is ValueCellFull!11117) mapDefault!36827)) b!987071))

(assert (= start!84392 b!987080))

(declare-fun b_lambda!14985 () Bool)

(assert (=> (not b_lambda!14985) (not b!987074)))

(declare-fun t!29706 () Bool)

(declare-fun tb!6751 () Bool)

(assert (=> (and start!84392 (= defaultEntry!1281 defaultEntry!1281) t!29706) tb!6751))

(declare-fun result!13501 () Bool)

(assert (=> tb!6751 (= result!13501 tp_is_empty!23197)))

(assert (=> b!987074 t!29706))

(declare-fun b_and!32001 () Bool)

(assert (= b_and!31999 (and (=> t!29706 result!13501) b_and!32001)))

(declare-fun m!913133 () Bool)

(assert (=> start!84392 m!913133))

(declare-fun m!913135 () Bool)

(assert (=> start!84392 m!913135))

(declare-fun m!913137 () Bool)

(assert (=> start!84392 m!913137))

(declare-fun m!913139 () Bool)

(assert (=> b!987077 m!913139))

(assert (=> b!987077 m!913139))

(declare-fun m!913141 () Bool)

(assert (=> b!987077 m!913141))

(assert (=> b!987074 m!913139))

(declare-fun m!913143 () Bool)

(assert (=> b!987074 m!913143))

(declare-fun m!913145 () Bool)

(assert (=> b!987074 m!913145))

(declare-fun m!913147 () Bool)

(assert (=> b!987074 m!913147))

(declare-fun m!913149 () Bool)

(assert (=> b!987074 m!913149))

(assert (=> b!987074 m!913139))

(declare-fun m!913151 () Bool)

(assert (=> b!987074 m!913151))

(declare-fun m!913153 () Bool)

(assert (=> b!987074 m!913153))

(assert (=> b!987074 m!913153))

(declare-fun m!913155 () Bool)

(assert (=> b!987074 m!913155))

(assert (=> b!987074 m!913147))

(assert (=> b!987074 m!913145))

(declare-fun m!913157 () Bool)

(assert (=> b!987074 m!913157))

(declare-fun m!913159 () Bool)

(assert (=> b!987074 m!913159))

(assert (=> b!987074 m!913143))

(assert (=> b!987074 m!913159))

(declare-fun m!913161 () Bool)

(assert (=> b!987074 m!913161))

(declare-fun m!913163 () Bool)

(assert (=> b!987075 m!913163))

(declare-fun m!913165 () Bool)

(assert (=> b!987076 m!913165))

(declare-fun m!913167 () Bool)

(assert (=> mapNonEmpty!36827 m!913167))

(check-sat (not start!84392) b_and!32001 (not b!987074) (not b!987075) (not b_lambda!14985) (not b!987076) (not b_next!19981) (not mapNonEmpty!36827) tp_is_empty!23197 (not b!987077))
(check-sat b_and!32001 (not b_next!19981))
