; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84174 () Bool)

(assert start!84174)

(declare-fun b_free!19875 () Bool)

(declare-fun b_next!19875 () Bool)

(assert (=> start!84174 (= b_free!19875 (not b_next!19875))))

(declare-fun tp!69228 () Bool)

(declare-fun b_and!31827 () Bool)

(assert (=> start!84174 (= tp!69228 b_and!31827)))

(declare-fun b!984352 () Bool)

(declare-fun res!658677 () Bool)

(declare-fun e!554918 () Bool)

(assert (=> b!984352 (=> (not res!658677) (not e!554918))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35619 0))(
  ( (V!35620 (val!11539 Int)) )
))
(declare-datatypes ((ValueCell!11007 0))(
  ( (ValueCellFull!11007 (v!14101 V!35619)) (EmptyCell!11007) )
))
(declare-datatypes ((array!61935 0))(
  ( (array!61936 (arr!29825 (Array (_ BitVec 32) ValueCell!11007)) (size!30304 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61935)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61937 0))(
  ( (array!61938 (arr!29826 (Array (_ BitVec 32) (_ BitVec 64))) (size!30305 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61937)

(assert (=> b!984352 (= res!658677 (and (= (size!30304 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30305 _keys!1544) (size!30304 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36494 () Bool)

(declare-fun mapRes!36494 () Bool)

(declare-fun tp!69229 () Bool)

(declare-fun e!554919 () Bool)

(assert (=> mapNonEmpty!36494 (= mapRes!36494 (and tp!69229 e!554919))))

(declare-fun mapKey!36494 () (_ BitVec 32))

(declare-fun mapValue!36494 () ValueCell!11007)

(declare-fun mapRest!36494 () (Array (_ BitVec 32) ValueCell!11007))

(assert (=> mapNonEmpty!36494 (= (arr!29825 _values!1278) (store mapRest!36494 mapKey!36494 mapValue!36494))))

(declare-fun b!984353 () Bool)

(declare-fun e!554920 () Bool)

(declare-fun e!554922 () Bool)

(assert (=> b!984353 (= e!554920 (and e!554922 mapRes!36494))))

(declare-fun condMapEmpty!36494 () Bool)

(declare-fun mapDefault!36494 () ValueCell!11007)

(assert (=> b!984353 (= condMapEmpty!36494 (= (arr!29825 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11007)) mapDefault!36494)))))

(declare-fun res!658676 () Bool)

(assert (=> start!84174 (=> (not res!658676) (not e!554918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84174 (= res!658676 (validMask!0 mask!1948))))

(assert (=> start!84174 e!554918))

(assert (=> start!84174 true))

(declare-fun tp_is_empty!22977 () Bool)

(assert (=> start!84174 tp_is_empty!22977))

(declare-fun array_inv!23063 (array!61935) Bool)

(assert (=> start!84174 (and (array_inv!23063 _values!1278) e!554920)))

(assert (=> start!84174 tp!69228))

(declare-fun array_inv!23064 (array!61937) Bool)

(assert (=> start!84174 (array_inv!23064 _keys!1544)))

(declare-fun b!984354 () Bool)

(declare-fun e!554921 () Bool)

(assert (=> b!984354 (= e!554921 (not true))))

(declare-datatypes ((tuple2!14756 0))(
  ( (tuple2!14757 (_1!7389 (_ BitVec 64)) (_2!7389 V!35619)) )
))
(declare-datatypes ((List!20649 0))(
  ( (Nil!20646) (Cons!20645 (h!21807 tuple2!14756) (t!29468 List!20649)) )
))
(declare-datatypes ((ListLongMap!13453 0))(
  ( (ListLongMap!13454 (toList!6742 List!20649)) )
))
(declare-fun lt!436781 () ListLongMap!13453)

(declare-fun lt!436779 () tuple2!14756)

(declare-fun lt!436777 () tuple2!14756)

(declare-fun +!3035 (ListLongMap!13453 tuple2!14756) ListLongMap!13453)

(assert (=> b!984354 (= (+!3035 (+!3035 lt!436781 lt!436779) lt!436777) (+!3035 (+!3035 lt!436781 lt!436777) lt!436779))))

(declare-fun lt!436780 () V!35619)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984354 (= lt!436777 (tuple2!14757 (select (arr!29826 _keys!1544) from!1932) lt!436780))))

(declare-fun minValue!1220 () V!35619)

(assert (=> b!984354 (= lt!436779 (tuple2!14757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32709 0))(
  ( (Unit!32710) )
))
(declare-fun lt!436778 () Unit!32709)

(declare-fun addCommutativeForDiffKeys!663 (ListLongMap!13453 (_ BitVec 64) V!35619 (_ BitVec 64) V!35619) Unit!32709)

(assert (=> b!984354 (= lt!436778 (addCommutativeForDiffKeys!663 lt!436781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29826 _keys!1544) from!1932) lt!436780))))

(declare-fun mapIsEmpty!36494 () Bool)

(assert (=> mapIsEmpty!36494 mapRes!36494))

(declare-fun b!984355 () Bool)

(declare-fun res!658673 () Bool)

(assert (=> b!984355 (=> (not res!658673) (not e!554918))))

(assert (=> b!984355 (= res!658673 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30305 _keys!1544))))))

(declare-fun b!984356 () Bool)

(declare-fun res!658672 () Bool)

(assert (=> b!984356 (=> (not res!658672) (not e!554918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61937 (_ BitVec 32)) Bool)

(assert (=> b!984356 (= res!658672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984357 () Bool)

(assert (=> b!984357 (= e!554918 e!554921)))

(declare-fun res!658675 () Bool)

(assert (=> b!984357 (=> (not res!658675) (not e!554921))))

(assert (=> b!984357 (= res!658675 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29826 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15468 (ValueCell!11007 V!35619) V!35619)

(declare-fun dynLambda!1815 (Int (_ BitVec 64)) V!35619)

(assert (=> b!984357 (= lt!436780 (get!15468 (select (arr!29825 _values!1278) from!1932) (dynLambda!1815 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35619)

(declare-fun getCurrentListMapNoExtraKeys!3435 (array!61937 array!61935 (_ BitVec 32) (_ BitVec 32) V!35619 V!35619 (_ BitVec 32) Int) ListLongMap!13453)

(assert (=> b!984357 (= lt!436781 (getCurrentListMapNoExtraKeys!3435 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984358 () Bool)

(declare-fun res!658679 () Bool)

(assert (=> b!984358 (=> (not res!658679) (not e!554918))))

(assert (=> b!984358 (= res!658679 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984359 () Bool)

(declare-fun res!658674 () Bool)

(assert (=> b!984359 (=> (not res!658674) (not e!554918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984359 (= res!658674 (validKeyInArray!0 (select (arr!29826 _keys!1544) from!1932)))))

(declare-fun b!984360 () Bool)

(assert (=> b!984360 (= e!554922 tp_is_empty!22977)))

(declare-fun b!984361 () Bool)

(assert (=> b!984361 (= e!554919 tp_is_empty!22977)))

(declare-fun b!984362 () Bool)

(declare-fun res!658678 () Bool)

(assert (=> b!984362 (=> (not res!658678) (not e!554918))))

(declare-datatypes ((List!20650 0))(
  ( (Nil!20647) (Cons!20646 (h!21808 (_ BitVec 64)) (t!29469 List!20650)) )
))
(declare-fun arrayNoDuplicates!0 (array!61937 (_ BitVec 32) List!20650) Bool)

(assert (=> b!984362 (= res!658678 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20647))))

(assert (= (and start!84174 res!658676) b!984352))

(assert (= (and b!984352 res!658677) b!984356))

(assert (= (and b!984356 res!658672) b!984362))

(assert (= (and b!984362 res!658678) b!984355))

(assert (= (and b!984355 res!658673) b!984359))

(assert (= (and b!984359 res!658674) b!984358))

(assert (= (and b!984358 res!658679) b!984357))

(assert (= (and b!984357 res!658675) b!984354))

(assert (= (and b!984353 condMapEmpty!36494) mapIsEmpty!36494))

(assert (= (and b!984353 (not condMapEmpty!36494)) mapNonEmpty!36494))

(get-info :version)

(assert (= (and mapNonEmpty!36494 ((_ is ValueCellFull!11007) mapValue!36494)) b!984361))

(assert (= (and b!984353 ((_ is ValueCellFull!11007) mapDefault!36494)) b!984360))

(assert (= start!84174 b!984353))

(declare-fun b_lambda!14907 () Bool)

(assert (=> (not b_lambda!14907) (not b!984357)))

(declare-fun t!29467 () Bool)

(declare-fun tb!6669 () Bool)

(assert (=> (and start!84174 (= defaultEntry!1281 defaultEntry!1281) t!29467) tb!6669))

(declare-fun result!13327 () Bool)

(assert (=> tb!6669 (= result!13327 tp_is_empty!22977)))

(assert (=> b!984357 t!29467))

(declare-fun b_and!31829 () Bool)

(assert (= b_and!31827 (and (=> t!29467 result!13327) b_and!31829)))

(declare-fun m!911441 () Bool)

(assert (=> mapNonEmpty!36494 m!911441))

(declare-fun m!911443 () Bool)

(assert (=> b!984362 m!911443))

(declare-fun m!911445 () Bool)

(assert (=> b!984356 m!911445))

(declare-fun m!911447 () Bool)

(assert (=> start!84174 m!911447))

(declare-fun m!911449 () Bool)

(assert (=> start!84174 m!911449))

(declare-fun m!911451 () Bool)

(assert (=> start!84174 m!911451))

(declare-fun m!911453 () Bool)

(assert (=> b!984359 m!911453))

(assert (=> b!984359 m!911453))

(declare-fun m!911455 () Bool)

(assert (=> b!984359 m!911455))

(assert (=> b!984357 m!911453))

(declare-fun m!911457 () Bool)

(assert (=> b!984357 m!911457))

(declare-fun m!911459 () Bool)

(assert (=> b!984357 m!911459))

(declare-fun m!911461 () Bool)

(assert (=> b!984357 m!911461))

(assert (=> b!984357 m!911457))

(assert (=> b!984357 m!911461))

(declare-fun m!911463 () Bool)

(assert (=> b!984357 m!911463))

(assert (=> b!984354 m!911453))

(declare-fun m!911465 () Bool)

(assert (=> b!984354 m!911465))

(assert (=> b!984354 m!911465))

(declare-fun m!911467 () Bool)

(assert (=> b!984354 m!911467))

(declare-fun m!911469 () Bool)

(assert (=> b!984354 m!911469))

(assert (=> b!984354 m!911469))

(declare-fun m!911471 () Bool)

(assert (=> b!984354 m!911471))

(assert (=> b!984354 m!911453))

(declare-fun m!911473 () Bool)

(assert (=> b!984354 m!911473))

(check-sat (not b!984354) (not b_next!19875) (not start!84174) (not b!984357) (not mapNonEmpty!36494) (not b_lambda!14907) (not b!984356) (not b!984359) tp_is_empty!22977 (not b!984362) b_and!31829)
(check-sat b_and!31829 (not b_next!19875))
