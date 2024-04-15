; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84536 () Bool)

(assert start!84536)

(declare-fun b_free!20035 () Bool)

(declare-fun b_next!20035 () Bool)

(assert (=> start!84536 (= b_free!20035 (not b_next!20035))))

(declare-fun tp!69894 () Bool)

(declare-fun b_and!32113 () Bool)

(assert (=> start!84536 (= tp!69894 b_and!32113)))

(declare-fun b!988703 () Bool)

(declare-fun res!661321 () Bool)

(declare-fun e!557492 () Bool)

(assert (=> b!988703 (=> (not res!661321) (not e!557492))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62396 0))(
  ( (array!62397 (arr!30052 (Array (_ BitVec 32) (_ BitVec 64))) (size!30533 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62396)

(assert (=> b!988703 (= res!661321 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30533 _keys!1544))))))

(declare-fun b!988704 () Bool)

(declare-fun e!557495 () Bool)

(declare-datatypes ((V!35985 0))(
  ( (V!35986 (val!11676 Int)) )
))
(declare-datatypes ((ValueCell!11144 0))(
  ( (ValueCellFull!11144 (v!14242 V!35985)) (EmptyCell!11144) )
))
(declare-datatypes ((array!62398 0))(
  ( (array!62399 (arr!30053 (Array (_ BitVec 32) ValueCell!11144)) (size!30534 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62398)

(assert (=> b!988704 (= e!557495 (not (bvslt from!1932 (size!30534 _values!1278))))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35985)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14960 0))(
  ( (tuple2!14961 (_1!7491 (_ BitVec 64)) (_2!7491 V!35985)) )
))
(declare-datatypes ((List!20846 0))(
  ( (Nil!20843) (Cons!20842 (h!22004 tuple2!14960) (t!29784 List!20846)) )
))
(declare-datatypes ((ListLongMap!13647 0))(
  ( (ListLongMap!13648 (toList!6839 List!20846)) )
))
(declare-fun lt!438409 () ListLongMap!13647)

(declare-fun zeroValue!1220 () V!35985)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3816 (array!62396 array!62398 (_ BitVec 32) (_ BitVec 32) V!35985 V!35985 (_ BitVec 32) Int) ListLongMap!13647)

(assert (=> b!988704 (= lt!438409 (getCurrentListMap!3816 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438413 () ListLongMap!13647)

(declare-fun lt!438412 () tuple2!14960)

(declare-fun lt!438410 () tuple2!14960)

(declare-fun +!3108 (ListLongMap!13647 tuple2!14960) ListLongMap!13647)

(assert (=> b!988704 (= (+!3108 (+!3108 lt!438413 lt!438412) lt!438410) (+!3108 (+!3108 lt!438413 lt!438410) lt!438412))))

(declare-fun lt!438411 () V!35985)

(assert (=> b!988704 (= lt!438410 (tuple2!14961 (select (arr!30052 _keys!1544) from!1932) lt!438411))))

(assert (=> b!988704 (= lt!438412 (tuple2!14961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32690 0))(
  ( (Unit!32691) )
))
(declare-fun lt!438408 () Unit!32690)

(declare-fun addCommutativeForDiffKeys!703 (ListLongMap!13647 (_ BitVec 64) V!35985 (_ BitVec 64) V!35985) Unit!32690)

(assert (=> b!988704 (= lt!438408 (addCommutativeForDiffKeys!703 lt!438413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30052 _keys!1544) from!1932) lt!438411))))

(declare-fun b!988705 () Bool)

(declare-fun e!557493 () Bool)

(declare-fun tp_is_empty!23251 () Bool)

(assert (=> b!988705 (= e!557493 tp_is_empty!23251)))

(declare-fun b!988706 () Bool)

(declare-fun res!661316 () Bool)

(assert (=> b!988706 (=> (not res!661316) (not e!557492))))

(declare-datatypes ((List!20847 0))(
  ( (Nil!20844) (Cons!20843 (h!22005 (_ BitVec 64)) (t!29785 List!20847)) )
))
(declare-fun arrayNoDuplicates!0 (array!62396 (_ BitVec 32) List!20847) Bool)

(assert (=> b!988706 (= res!661316 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20844))))

(declare-fun res!661315 () Bool)

(assert (=> start!84536 (=> (not res!661315) (not e!557492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84536 (= res!661315 (validMask!0 mask!1948))))

(assert (=> start!84536 e!557492))

(assert (=> start!84536 true))

(assert (=> start!84536 tp_is_empty!23251))

(declare-fun e!557494 () Bool)

(declare-fun array_inv!23225 (array!62398) Bool)

(assert (=> start!84536 (and (array_inv!23225 _values!1278) e!557494)))

(assert (=> start!84536 tp!69894))

(declare-fun array_inv!23226 (array!62396) Bool)

(assert (=> start!84536 (array_inv!23226 _keys!1544)))

(declare-fun b!988707 () Bool)

(assert (=> b!988707 (= e!557492 e!557495)))

(declare-fun res!661314 () Bool)

(assert (=> b!988707 (=> (not res!661314) (not e!557495))))

(assert (=> b!988707 (= res!661314 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30052 _keys!1544) from!1932))))))

(declare-fun get!15610 (ValueCell!11144 V!35985) V!35985)

(declare-fun dynLambda!1855 (Int (_ BitVec 64)) V!35985)

(assert (=> b!988707 (= lt!438411 (get!15610 (select (arr!30053 _values!1278) from!1932) (dynLambda!1855 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3541 (array!62396 array!62398 (_ BitVec 32) (_ BitVec 32) V!35985 V!35985 (_ BitVec 32) Int) ListLongMap!13647)

(assert (=> b!988707 (= lt!438413 (getCurrentListMapNoExtraKeys!3541 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988708 () Bool)

(declare-fun res!661320 () Bool)

(assert (=> b!988708 (=> (not res!661320) (not e!557492))))

(assert (=> b!988708 (= res!661320 (and (= (size!30534 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30533 _keys!1544) (size!30534 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36918 () Bool)

(declare-fun mapRes!36918 () Bool)

(declare-fun tp!69893 () Bool)

(assert (=> mapNonEmpty!36918 (= mapRes!36918 (and tp!69893 e!557493))))

(declare-fun mapValue!36918 () ValueCell!11144)

(declare-fun mapRest!36918 () (Array (_ BitVec 32) ValueCell!11144))

(declare-fun mapKey!36918 () (_ BitVec 32))

(assert (=> mapNonEmpty!36918 (= (arr!30053 _values!1278) (store mapRest!36918 mapKey!36918 mapValue!36918))))

(declare-fun b!988709 () Bool)

(declare-fun res!661319 () Bool)

(assert (=> b!988709 (=> (not res!661319) (not e!557492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62396 (_ BitVec 32)) Bool)

(assert (=> b!988709 (= res!661319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988710 () Bool)

(declare-fun res!661317 () Bool)

(assert (=> b!988710 (=> (not res!661317) (not e!557492))))

(assert (=> b!988710 (= res!661317 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36918 () Bool)

(assert (=> mapIsEmpty!36918 mapRes!36918))

(declare-fun b!988711 () Bool)

(declare-fun e!557491 () Bool)

(assert (=> b!988711 (= e!557491 tp_is_empty!23251)))

(declare-fun b!988712 () Bool)

(declare-fun res!661318 () Bool)

(assert (=> b!988712 (=> (not res!661318) (not e!557492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988712 (= res!661318 (validKeyInArray!0 (select (arr!30052 _keys!1544) from!1932)))))

(declare-fun b!988713 () Bool)

(assert (=> b!988713 (= e!557494 (and e!557491 mapRes!36918))))

(declare-fun condMapEmpty!36918 () Bool)

(declare-fun mapDefault!36918 () ValueCell!11144)

(assert (=> b!988713 (= condMapEmpty!36918 (= (arr!30053 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11144)) mapDefault!36918)))))

(assert (= (and start!84536 res!661315) b!988708))

(assert (= (and b!988708 res!661320) b!988709))

(assert (= (and b!988709 res!661319) b!988706))

(assert (= (and b!988706 res!661316) b!988703))

(assert (= (and b!988703 res!661321) b!988712))

(assert (= (and b!988712 res!661318) b!988710))

(assert (= (and b!988710 res!661317) b!988707))

(assert (= (and b!988707 res!661314) b!988704))

(assert (= (and b!988713 condMapEmpty!36918) mapIsEmpty!36918))

(assert (= (and b!988713 (not condMapEmpty!36918)) mapNonEmpty!36918))

(get-info :version)

(assert (= (and mapNonEmpty!36918 ((_ is ValueCellFull!11144) mapValue!36918)) b!988705))

(assert (= (and b!988713 ((_ is ValueCellFull!11144) mapDefault!36918)) b!988711))

(assert (= start!84536 b!988713))

(declare-fun b_lambda!15073 () Bool)

(assert (=> (not b_lambda!15073) (not b!988707)))

(declare-fun t!29783 () Bool)

(declare-fun tb!6789 () Bool)

(assert (=> (and start!84536 (= defaultEntry!1281 defaultEntry!1281) t!29783) tb!6789))

(declare-fun result!13583 () Bool)

(assert (=> tb!6789 (= result!13583 tp_is_empty!23251)))

(assert (=> b!988707 t!29783))

(declare-fun b_and!32115 () Bool)

(assert (= b_and!32113 (and (=> t!29783 result!13583) b_and!32115)))

(declare-fun m!915293 () Bool)

(assert (=> mapNonEmpty!36918 m!915293))

(declare-fun m!915295 () Bool)

(assert (=> b!988707 m!915295))

(declare-fun m!915297 () Bool)

(assert (=> b!988707 m!915297))

(declare-fun m!915299 () Bool)

(assert (=> b!988707 m!915299))

(declare-fun m!915301 () Bool)

(assert (=> b!988707 m!915301))

(assert (=> b!988707 m!915297))

(assert (=> b!988707 m!915301))

(declare-fun m!915303 () Bool)

(assert (=> b!988707 m!915303))

(declare-fun m!915305 () Bool)

(assert (=> b!988704 m!915305))

(declare-fun m!915307 () Bool)

(assert (=> b!988704 m!915307))

(assert (=> b!988704 m!915295))

(declare-fun m!915309 () Bool)

(assert (=> b!988704 m!915309))

(declare-fun m!915311 () Bool)

(assert (=> b!988704 m!915311))

(declare-fun m!915313 () Bool)

(assert (=> b!988704 m!915313))

(assert (=> b!988704 m!915313))

(declare-fun m!915315 () Bool)

(assert (=> b!988704 m!915315))

(assert (=> b!988704 m!915295))

(assert (=> b!988704 m!915305))

(assert (=> b!988712 m!915295))

(assert (=> b!988712 m!915295))

(declare-fun m!915317 () Bool)

(assert (=> b!988712 m!915317))

(declare-fun m!915319 () Bool)

(assert (=> b!988706 m!915319))

(declare-fun m!915321 () Bool)

(assert (=> start!84536 m!915321))

(declare-fun m!915323 () Bool)

(assert (=> start!84536 m!915323))

(declare-fun m!915325 () Bool)

(assert (=> start!84536 m!915325))

(declare-fun m!915327 () Bool)

(assert (=> b!988709 m!915327))

(check-sat (not b!988704) (not mapNonEmpty!36918) (not start!84536) (not b!988709) (not b!988707) b_and!32115 tp_is_empty!23251 (not b_next!20035) (not b_lambda!15073) (not b!988712) (not b!988706))
(check-sat b_and!32115 (not b_next!20035))
