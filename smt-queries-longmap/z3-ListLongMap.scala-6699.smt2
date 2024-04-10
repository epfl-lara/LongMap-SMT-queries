; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84168 () Bool)

(assert start!84168)

(declare-fun b_free!19869 () Bool)

(declare-fun b_next!19869 () Bool)

(assert (=> start!84168 (= b_free!19869 (not b_next!19869))))

(declare-fun tp!69211 () Bool)

(declare-fun b_and!31815 () Bool)

(assert (=> start!84168 (= tp!69211 b_and!31815)))

(declare-fun mapNonEmpty!36485 () Bool)

(declare-fun mapRes!36485 () Bool)

(declare-fun tp!69210 () Bool)

(declare-fun e!554865 () Bool)

(assert (=> mapNonEmpty!36485 (= mapRes!36485 (and tp!69210 e!554865))))

(declare-datatypes ((V!35611 0))(
  ( (V!35612 (val!11536 Int)) )
))
(declare-datatypes ((ValueCell!11004 0))(
  ( (ValueCellFull!11004 (v!14098 V!35611)) (EmptyCell!11004) )
))
(declare-datatypes ((array!61923 0))(
  ( (array!61924 (arr!29819 (Array (_ BitVec 32) ValueCell!11004)) (size!30298 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61923)

(declare-fun mapRest!36485 () (Array (_ BitVec 32) ValueCell!11004))

(declare-fun mapKey!36485 () (_ BitVec 32))

(declare-fun mapValue!36485 () ValueCell!11004)

(assert (=> mapNonEmpty!36485 (= (arr!29819 _values!1278) (store mapRest!36485 mapKey!36485 mapValue!36485))))

(declare-fun b!984248 () Bool)

(declare-fun res!658602 () Bool)

(declare-fun e!554867 () Bool)

(assert (=> b!984248 (=> (not res!658602) (not e!554867))))

(declare-datatypes ((array!61925 0))(
  ( (array!61926 (arr!29820 (Array (_ BitVec 32) (_ BitVec 64))) (size!30299 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61925)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61925 (_ BitVec 32)) Bool)

(assert (=> b!984248 (= res!658602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984249 () Bool)

(declare-fun res!658600 () Bool)

(assert (=> b!984249 (=> (not res!658600) (not e!554867))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984249 (= res!658600 (validKeyInArray!0 (select (arr!29820 _keys!1544) from!1932)))))

(declare-fun b!984250 () Bool)

(declare-fun e!554863 () Bool)

(declare-fun tp_is_empty!22971 () Bool)

(assert (=> b!984250 (= e!554863 tp_is_empty!22971)))

(declare-fun b!984251 () Bool)

(declare-fun res!658606 () Bool)

(assert (=> b!984251 (=> (not res!658606) (not e!554867))))

(assert (=> b!984251 (= res!658606 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30299 _keys!1544))))))

(declare-fun b!984252 () Bool)

(declare-fun res!658607 () Bool)

(assert (=> b!984252 (=> (not res!658607) (not e!554867))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984252 (= res!658607 (and (= (size!30298 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30299 _keys!1544) (size!30298 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984253 () Bool)

(declare-fun e!554866 () Bool)

(assert (=> b!984253 (= e!554866 (and e!554863 mapRes!36485))))

(declare-fun condMapEmpty!36485 () Bool)

(declare-fun mapDefault!36485 () ValueCell!11004)

(assert (=> b!984253 (= condMapEmpty!36485 (= (arr!29819 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11004)) mapDefault!36485)))))

(declare-fun b!984254 () Bool)

(declare-fun e!554864 () Bool)

(assert (=> b!984254 (= e!554864 (not true))))

(declare-datatypes ((tuple2!14750 0))(
  ( (tuple2!14751 (_1!7386 (_ BitVec 64)) (_2!7386 V!35611)) )
))
(declare-datatypes ((List!20643 0))(
  ( (Nil!20640) (Cons!20639 (h!21801 tuple2!14750) (t!29456 List!20643)) )
))
(declare-datatypes ((ListLongMap!13447 0))(
  ( (ListLongMap!13448 (toList!6739 List!20643)) )
))
(declare-fun lt!436735 () ListLongMap!13447)

(declare-fun lt!436732 () tuple2!14750)

(declare-fun lt!436736 () tuple2!14750)

(declare-fun +!3032 (ListLongMap!13447 tuple2!14750) ListLongMap!13447)

(assert (=> b!984254 (= (+!3032 (+!3032 lt!436735 lt!436732) lt!436736) (+!3032 (+!3032 lt!436735 lt!436736) lt!436732))))

(declare-fun lt!436734 () V!35611)

(assert (=> b!984254 (= lt!436736 (tuple2!14751 (select (arr!29820 _keys!1544) from!1932) lt!436734))))

(declare-fun minValue!1220 () V!35611)

(assert (=> b!984254 (= lt!436732 (tuple2!14751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32703 0))(
  ( (Unit!32704) )
))
(declare-fun lt!436733 () Unit!32703)

(declare-fun addCommutativeForDiffKeys!660 (ListLongMap!13447 (_ BitVec 64) V!35611 (_ BitVec 64) V!35611) Unit!32703)

(assert (=> b!984254 (= lt!436733 (addCommutativeForDiffKeys!660 lt!436735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29820 _keys!1544) from!1932) lt!436734))))

(declare-fun b!984255 () Bool)

(declare-fun res!658601 () Bool)

(assert (=> b!984255 (=> (not res!658601) (not e!554867))))

(assert (=> b!984255 (= res!658601 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984256 () Bool)

(assert (=> b!984256 (= e!554865 tp_is_empty!22971)))

(declare-fun b!984247 () Bool)

(declare-fun res!658604 () Bool)

(assert (=> b!984247 (=> (not res!658604) (not e!554867))))

(declare-datatypes ((List!20644 0))(
  ( (Nil!20641) (Cons!20640 (h!21802 (_ BitVec 64)) (t!29457 List!20644)) )
))
(declare-fun arrayNoDuplicates!0 (array!61925 (_ BitVec 32) List!20644) Bool)

(assert (=> b!984247 (= res!658604 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20641))))

(declare-fun res!658605 () Bool)

(assert (=> start!84168 (=> (not res!658605) (not e!554867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84168 (= res!658605 (validMask!0 mask!1948))))

(assert (=> start!84168 e!554867))

(assert (=> start!84168 true))

(assert (=> start!84168 tp_is_empty!22971))

(declare-fun array_inv!23059 (array!61923) Bool)

(assert (=> start!84168 (and (array_inv!23059 _values!1278) e!554866)))

(assert (=> start!84168 tp!69211))

(declare-fun array_inv!23060 (array!61925) Bool)

(assert (=> start!84168 (array_inv!23060 _keys!1544)))

(declare-fun b!984257 () Bool)

(assert (=> b!984257 (= e!554867 e!554864)))

(declare-fun res!658603 () Bool)

(assert (=> b!984257 (=> (not res!658603) (not e!554864))))

(assert (=> b!984257 (= res!658603 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29820 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15464 (ValueCell!11004 V!35611) V!35611)

(declare-fun dynLambda!1813 (Int (_ BitVec 64)) V!35611)

(assert (=> b!984257 (= lt!436734 (get!15464 (select (arr!29819 _values!1278) from!1932) (dynLambda!1813 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35611)

(declare-fun getCurrentListMapNoExtraKeys!3433 (array!61925 array!61923 (_ BitVec 32) (_ BitVec 32) V!35611 V!35611 (_ BitVec 32) Int) ListLongMap!13447)

(assert (=> b!984257 (= lt!436735 (getCurrentListMapNoExtraKeys!3433 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36485 () Bool)

(assert (=> mapIsEmpty!36485 mapRes!36485))

(assert (= (and start!84168 res!658605) b!984252))

(assert (= (and b!984252 res!658607) b!984248))

(assert (= (and b!984248 res!658602) b!984247))

(assert (= (and b!984247 res!658604) b!984251))

(assert (= (and b!984251 res!658606) b!984249))

(assert (= (and b!984249 res!658600) b!984255))

(assert (= (and b!984255 res!658601) b!984257))

(assert (= (and b!984257 res!658603) b!984254))

(assert (= (and b!984253 condMapEmpty!36485) mapIsEmpty!36485))

(assert (= (and b!984253 (not condMapEmpty!36485)) mapNonEmpty!36485))

(get-info :version)

(assert (= (and mapNonEmpty!36485 ((_ is ValueCellFull!11004) mapValue!36485)) b!984256))

(assert (= (and b!984253 ((_ is ValueCellFull!11004) mapDefault!36485)) b!984250))

(assert (= start!84168 b!984253))

(declare-fun b_lambda!14901 () Bool)

(assert (=> (not b_lambda!14901) (not b!984257)))

(declare-fun t!29455 () Bool)

(declare-fun tb!6663 () Bool)

(assert (=> (and start!84168 (= defaultEntry!1281 defaultEntry!1281) t!29455) tb!6663))

(declare-fun result!13315 () Bool)

(assert (=> tb!6663 (= result!13315 tp_is_empty!22971)))

(assert (=> b!984257 t!29455))

(declare-fun b_and!31817 () Bool)

(assert (= b_and!31815 (and (=> t!29455 result!13315) b_and!31817)))

(declare-fun m!911339 () Bool)

(assert (=> b!984257 m!911339))

(declare-fun m!911341 () Bool)

(assert (=> b!984257 m!911341))

(declare-fun m!911343 () Bool)

(assert (=> b!984257 m!911343))

(declare-fun m!911345 () Bool)

(assert (=> b!984257 m!911345))

(assert (=> b!984257 m!911341))

(assert (=> b!984257 m!911345))

(declare-fun m!911347 () Bool)

(assert (=> b!984257 m!911347))

(assert (=> b!984254 m!911339))

(declare-fun m!911349 () Bool)

(assert (=> b!984254 m!911349))

(declare-fun m!911351 () Bool)

(assert (=> b!984254 m!911351))

(declare-fun m!911353 () Bool)

(assert (=> b!984254 m!911353))

(assert (=> b!984254 m!911339))

(declare-fun m!911355 () Bool)

(assert (=> b!984254 m!911355))

(assert (=> b!984254 m!911349))

(assert (=> b!984254 m!911353))

(declare-fun m!911357 () Bool)

(assert (=> b!984254 m!911357))

(declare-fun m!911359 () Bool)

(assert (=> b!984247 m!911359))

(declare-fun m!911361 () Bool)

(assert (=> start!84168 m!911361))

(declare-fun m!911363 () Bool)

(assert (=> start!84168 m!911363))

(declare-fun m!911365 () Bool)

(assert (=> start!84168 m!911365))

(declare-fun m!911367 () Bool)

(assert (=> b!984248 m!911367))

(assert (=> b!984249 m!911339))

(assert (=> b!984249 m!911339))

(declare-fun m!911369 () Bool)

(assert (=> b!984249 m!911369))

(declare-fun m!911371 () Bool)

(assert (=> mapNonEmpty!36485 m!911371))

(check-sat (not b!984254) (not b_next!19869) (not b!984248) (not start!84168) (not b_lambda!14901) tp_is_empty!22971 (not b!984249) (not b!984247) (not mapNonEmpty!36485) b_and!31817 (not b!984257))
(check-sat b_and!31817 (not b_next!19869))
