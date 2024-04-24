; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84578 () Bool)

(assert start!84578)

(declare-fun b_free!19981 () Bool)

(declare-fun b_next!19981 () Bool)

(assert (=> start!84578 (= b_free!19981 (not b_next!19981))))

(declare-fun tp!69722 () Bool)

(declare-fun b_and!32035 () Bool)

(assert (=> start!84578 (= tp!69722 b_and!32035)))

(declare-fun res!660853 () Bool)

(declare-fun e!557322 () Bool)

(assert (=> start!84578 (=> (not res!660853) (not e!557322))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84578 (= res!660853 (validMask!0 mask!1948))))

(assert (=> start!84578 e!557322))

(assert (=> start!84578 true))

(declare-fun tp_is_empty!23197 () Bool)

(assert (=> start!84578 tp_is_empty!23197))

(declare-datatypes ((V!35913 0))(
  ( (V!35914 (val!11649 Int)) )
))
(declare-datatypes ((ValueCell!11117 0))(
  ( (ValueCellFull!11117 (v!14209 V!35913)) (EmptyCell!11117) )
))
(declare-datatypes ((array!62396 0))(
  ( (array!62397 (arr!30050 (Array (_ BitVec 32) ValueCell!11117)) (size!30530 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62396)

(declare-fun e!557323 () Bool)

(declare-fun array_inv!23239 (array!62396) Bool)

(assert (=> start!84578 (and (array_inv!23239 _values!1278) e!557323)))

(assert (=> start!84578 tp!69722))

(declare-datatypes ((array!62398 0))(
  ( (array!62399 (arr!30051 (Array (_ BitVec 32) (_ BitVec 64))) (size!30531 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62398)

(declare-fun array_inv!23240 (array!62398) Bool)

(assert (=> start!84578 (array_inv!23240 _keys!1544)))

(declare-fun b!988213 () Bool)

(declare-fun res!660850 () Bool)

(assert (=> b!988213 (=> (not res!660850) (not e!557322))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988213 (= res!660850 (validKeyInArray!0 (select (arr!30051 _keys!1544) from!1932)))))

(declare-fun b!988214 () Bool)

(declare-fun e!557321 () Bool)

(assert (=> b!988214 (= e!557321 tp_is_empty!23197)))

(declare-fun b!988215 () Bool)

(declare-fun res!660855 () Bool)

(assert (=> b!988215 (=> (not res!660855) (not e!557322))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988215 (= res!660855 (and (= (size!30530 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30531 _keys!1544) (size!30530 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988216 () Bool)

(declare-fun e!557324 () Bool)

(assert (=> b!988216 (= e!557324 tp_is_empty!23197)))

(declare-fun b!988217 () Bool)

(declare-fun res!660851 () Bool)

(assert (=> b!988217 (=> (not res!660851) (not e!557322))))

(declare-datatypes ((List!20765 0))(
  ( (Nil!20762) (Cons!20761 (h!21929 (_ BitVec 64)) (t!29666 List!20765)) )
))
(declare-fun arrayNoDuplicates!0 (array!62398 (_ BitVec 32) List!20765) Bool)

(assert (=> b!988217 (= res!660851 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20762))))

(declare-fun b!988218 () Bool)

(declare-fun res!660854 () Bool)

(assert (=> b!988218 (=> (not res!660854) (not e!557322))))

(assert (=> b!988218 (= res!660854 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36827 () Bool)

(declare-fun mapRes!36827 () Bool)

(declare-fun tp!69721 () Bool)

(assert (=> mapNonEmpty!36827 (= mapRes!36827 (and tp!69721 e!557321))))

(declare-fun mapKey!36827 () (_ BitVec 32))

(declare-fun mapRest!36827 () (Array (_ BitVec 32) ValueCell!11117))

(declare-fun mapValue!36827 () ValueCell!11117)

(assert (=> mapNonEmpty!36827 (= (arr!30050 _values!1278) (store mapRest!36827 mapKey!36827 mapValue!36827))))

(declare-fun b!988219 () Bool)

(assert (=> b!988219 (= e!557323 (and e!557324 mapRes!36827))))

(declare-fun condMapEmpty!36827 () Bool)

(declare-fun mapDefault!36827 () ValueCell!11117)

(assert (=> b!988219 (= condMapEmpty!36827 (= (arr!30050 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11117)) mapDefault!36827)))))

(declare-fun b!988220 () Bool)

(declare-fun res!660852 () Bool)

(assert (=> b!988220 (=> (not res!660852) (not e!557322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62398 (_ BitVec 32)) Bool)

(assert (=> b!988220 (= res!660852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988221 () Bool)

(assert (=> b!988221 (= e!557322 (not (bvslt from!1932 (size!30530 _values!1278))))))

(declare-datatypes ((tuple2!14856 0))(
  ( (tuple2!14857 (_1!7439 (_ BitVec 64)) (_2!7439 V!35913)) )
))
(declare-datatypes ((List!20766 0))(
  ( (Nil!20763) (Cons!20762 (h!21930 tuple2!14856) (t!29667 List!20766)) )
))
(declare-datatypes ((ListLongMap!13555 0))(
  ( (ListLongMap!13556 (toList!6793 List!20766)) )
))
(declare-fun lt!438040 () ListLongMap!13555)

(declare-fun lt!438039 () tuple2!14856)

(declare-fun lt!438041 () tuple2!14856)

(declare-fun +!3092 (ListLongMap!13555 tuple2!14856) ListLongMap!13555)

(assert (=> b!988221 (= (+!3092 (+!3092 lt!438040 lt!438039) lt!438041) (+!3092 (+!3092 lt!438040 lt!438041) lt!438039))))

(declare-fun lt!438038 () V!35913)

(assert (=> b!988221 (= lt!438041 (tuple2!14857 (select (arr!30051 _keys!1544) from!1932) lt!438038))))

(declare-fun minValue!1220 () V!35913)

(assert (=> b!988221 (= lt!438039 (tuple2!14857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32758 0))(
  ( (Unit!32759) )
))
(declare-fun lt!438042 () Unit!32758)

(declare-fun addCommutativeForDiffKeys!695 (ListLongMap!13555 (_ BitVec 64) V!35913 (_ BitVec 64) V!35913) Unit!32758)

(assert (=> b!988221 (= lt!438042 (addCommutativeForDiffKeys!695 lt!438040 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30051 _keys!1544) from!1932) lt!438038))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15607 (ValueCell!11117 V!35913) V!35913)

(declare-fun dynLambda!1876 (Int (_ BitVec 64)) V!35913)

(assert (=> b!988221 (= lt!438038 (get!15607 (select (arr!30050 _values!1278) from!1932) (dynLambda!1876 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35913)

(declare-fun getCurrentListMapNoExtraKeys!3522 (array!62398 array!62396 (_ BitVec 32) (_ BitVec 32) V!35913 V!35913 (_ BitVec 32) Int) ListLongMap!13555)

(assert (=> b!988221 (= lt!438040 (+!3092 (getCurrentListMapNoExtraKeys!3522 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!36827 () Bool)

(assert (=> mapIsEmpty!36827 mapRes!36827))

(declare-fun b!988222 () Bool)

(declare-fun res!660856 () Bool)

(assert (=> b!988222 (=> (not res!660856) (not e!557322))))

(assert (=> b!988222 (= res!660856 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30531 _keys!1544))))))

(assert (= (and start!84578 res!660853) b!988215))

(assert (= (and b!988215 res!660855) b!988220))

(assert (= (and b!988220 res!660852) b!988217))

(assert (= (and b!988217 res!660851) b!988222))

(assert (= (and b!988222 res!660856) b!988213))

(assert (= (and b!988213 res!660850) b!988218))

(assert (= (and b!988218 res!660854) b!988221))

(assert (= (and b!988219 condMapEmpty!36827) mapIsEmpty!36827))

(assert (= (and b!988219 (not condMapEmpty!36827)) mapNonEmpty!36827))

(get-info :version)

(assert (= (and mapNonEmpty!36827 ((_ is ValueCellFull!11117) mapValue!36827)) b!988214))

(assert (= (and b!988219 ((_ is ValueCellFull!11117) mapDefault!36827)) b!988216))

(assert (= start!84578 b!988219))

(declare-fun b_lambda!15017 () Bool)

(assert (=> (not b_lambda!15017) (not b!988221)))

(declare-fun t!29665 () Bool)

(declare-fun tb!6751 () Bool)

(assert (=> (and start!84578 (= defaultEntry!1281 defaultEntry!1281) t!29665) tb!6751))

(declare-fun result!13501 () Bool)

(assert (=> tb!6751 (= result!13501 tp_is_empty!23197)))

(assert (=> b!988221 t!29665))

(declare-fun b_and!32037 () Bool)

(assert (= b_and!32035 (and (=> t!29665 result!13501) b_and!32037)))

(declare-fun m!915185 () Bool)

(assert (=> b!988217 m!915185))

(declare-fun m!915187 () Bool)

(assert (=> b!988221 m!915187))

(declare-fun m!915189 () Bool)

(assert (=> b!988221 m!915189))

(declare-fun m!915191 () Bool)

(assert (=> b!988221 m!915191))

(declare-fun m!915193 () Bool)

(assert (=> b!988221 m!915193))

(declare-fun m!915195 () Bool)

(assert (=> b!988221 m!915195))

(declare-fun m!915197 () Bool)

(assert (=> b!988221 m!915197))

(assert (=> b!988221 m!915187))

(assert (=> b!988221 m!915197))

(declare-fun m!915199 () Bool)

(assert (=> b!988221 m!915199))

(assert (=> b!988221 m!915195))

(declare-fun m!915201 () Bool)

(assert (=> b!988221 m!915201))

(assert (=> b!988221 m!915191))

(declare-fun m!915203 () Bool)

(assert (=> b!988221 m!915203))

(declare-fun m!915205 () Bool)

(assert (=> b!988221 m!915205))

(assert (=> b!988221 m!915193))

(assert (=> b!988221 m!915205))

(declare-fun m!915207 () Bool)

(assert (=> b!988221 m!915207))

(declare-fun m!915209 () Bool)

(assert (=> mapNonEmpty!36827 m!915209))

(declare-fun m!915211 () Bool)

(assert (=> b!988220 m!915211))

(assert (=> b!988213 m!915191))

(assert (=> b!988213 m!915191))

(declare-fun m!915213 () Bool)

(assert (=> b!988213 m!915213))

(declare-fun m!915215 () Bool)

(assert (=> start!84578 m!915215))

(declare-fun m!915217 () Bool)

(assert (=> start!84578 m!915217))

(declare-fun m!915219 () Bool)

(assert (=> start!84578 m!915219))

(check-sat b_and!32037 (not b!988220) tp_is_empty!23197 (not start!84578) (not b!988221) (not b!988213) (not b_lambda!15017) (not b!988217) (not b_next!19981) (not mapNonEmpty!36827))
(check-sat b_and!32037 (not b_next!19981))
