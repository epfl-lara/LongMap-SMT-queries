; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84424 () Bool)

(assert start!84424)

(declare-fun b_free!19993 () Bool)

(declare-fun b_next!19993 () Bool)

(assert (=> start!84424 (= b_free!19993 (not b_next!19993))))

(declare-fun tp!69761 () Bool)

(declare-fun b_and!32027 () Bool)

(assert (=> start!84424 (= tp!69761 b_and!32027)))

(declare-fun b!987356 () Bool)

(declare-fun e!556744 () Bool)

(assert (=> b!987356 (= e!556744 true)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35929 0))(
  ( (V!35930 (val!11655 Int)) )
))
(declare-fun minValue!1220 () V!35929)

(declare-datatypes ((ValueCell!11123 0))(
  ( (ValueCellFull!11123 (v!14218 V!35929)) (EmptyCell!11123) )
))
(declare-datatypes ((array!62310 0))(
  ( (array!62311 (arr!30011 (Array (_ BitVec 32) ValueCell!11123)) (size!30492 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62310)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35929)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14924 0))(
  ( (tuple2!14925 (_1!7473 (_ BitVec 64)) (_2!7473 V!35929)) )
))
(declare-datatypes ((List!20812 0))(
  ( (Nil!20809) (Cons!20808 (h!21970 tuple2!14924) (t!29724 List!20812)) )
))
(declare-datatypes ((ListLongMap!13611 0))(
  ( (ListLongMap!13612 (toList!6821 List!20812)) )
))
(declare-fun lt!437606 () ListLongMap!13611)

(declare-datatypes ((array!62312 0))(
  ( (array!62313 (arr!30012 (Array (_ BitVec 32) (_ BitVec 64))) (size!30493 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62312)

(declare-fun getCurrentListMap!3808 (array!62312 array!62310 (_ BitVec 32) (_ BitVec 32) V!35929 V!35929 (_ BitVec 32) Int) ListLongMap!13611)

(assert (=> b!987356 (= lt!437606 (getCurrentListMap!3808 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437609 () ListLongMap!13611)

(declare-fun lt!437605 () ListLongMap!13611)

(declare-fun lt!437610 () tuple2!14924)

(declare-fun lt!437614 () tuple2!14924)

(declare-fun +!3097 (ListLongMap!13611 tuple2!14924) ListLongMap!13611)

(assert (=> b!987356 (= lt!437609 (+!3097 (+!3097 lt!437605 lt!437610) lt!437614))))

(declare-datatypes ((Unit!32646 0))(
  ( (Unit!32647) )
))
(declare-fun lt!437607 () Unit!32646)

(declare-fun lt!437611 () V!35929)

(declare-fun addCommutativeForDiffKeys!693 (ListLongMap!13611 (_ BitVec 64) V!35929 (_ BitVec 64) V!35929) Unit!32646)

(assert (=> b!987356 (= lt!437607 (addCommutativeForDiffKeys!693 lt!437605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30012 _keys!1544) from!1932) lt!437611))))

(declare-fun b!987357 () Bool)

(declare-fun res!660571 () Bool)

(declare-fun e!556743 () Bool)

(assert (=> b!987357 (=> (not res!660571) (not e!556743))))

(declare-datatypes ((List!20813 0))(
  ( (Nil!20810) (Cons!20809 (h!21971 (_ BitVec 64)) (t!29725 List!20813)) )
))
(declare-fun arrayNoDuplicates!0 (array!62312 (_ BitVec 32) List!20813) Bool)

(assert (=> b!987357 (= res!660571 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20810))))

(declare-fun b!987358 () Bool)

(declare-fun res!660567 () Bool)

(assert (=> b!987358 (=> (not res!660567) (not e!556743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987358 (= res!660567 (validKeyInArray!0 (select (arr!30012 _keys!1544) from!1932)))))

(declare-fun b!987359 () Bool)

(declare-fun res!660569 () Bool)

(assert (=> b!987359 (=> (not res!660569) (not e!556743))))

(assert (=> b!987359 (= res!660569 (and (= (size!30492 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30493 _keys!1544) (size!30492 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987360 () Bool)

(declare-fun res!660570 () Bool)

(assert (=> b!987360 (=> (not res!660570) (not e!556743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62312 (_ BitVec 32)) Bool)

(assert (=> b!987360 (= res!660570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660572 () Bool)

(assert (=> start!84424 (=> (not res!660572) (not e!556743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84424 (= res!660572 (validMask!0 mask!1948))))

(assert (=> start!84424 e!556743))

(assert (=> start!84424 true))

(declare-fun tp_is_empty!23209 () Bool)

(assert (=> start!84424 tp_is_empty!23209))

(declare-fun e!556745 () Bool)

(declare-fun array_inv!23195 (array!62310) Bool)

(assert (=> start!84424 (and (array_inv!23195 _values!1278) e!556745)))

(assert (=> start!84424 tp!69761))

(declare-fun array_inv!23196 (array!62312) Bool)

(assert (=> start!84424 (array_inv!23196 _keys!1544)))

(declare-fun b!987361 () Bool)

(declare-fun res!660566 () Bool)

(assert (=> b!987361 (=> (not res!660566) (not e!556743))))

(assert (=> b!987361 (= res!660566 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36848 () Bool)

(declare-fun mapRes!36848 () Bool)

(declare-fun tp!69760 () Bool)

(declare-fun e!556742 () Bool)

(assert (=> mapNonEmpty!36848 (= mapRes!36848 (and tp!69760 e!556742))))

(declare-fun mapValue!36848 () ValueCell!11123)

(declare-fun mapKey!36848 () (_ BitVec 32))

(declare-fun mapRest!36848 () (Array (_ BitVec 32) ValueCell!11123))

(assert (=> mapNonEmpty!36848 (= (arr!30011 _values!1278) (store mapRest!36848 mapKey!36848 mapValue!36848))))

(declare-fun mapIsEmpty!36848 () Bool)

(assert (=> mapIsEmpty!36848 mapRes!36848))

(declare-fun b!987362 () Bool)

(declare-fun e!556741 () Bool)

(assert (=> b!987362 (= e!556741 tp_is_empty!23209)))

(declare-fun b!987363 () Bool)

(assert (=> b!987363 (= e!556742 tp_is_empty!23209)))

(declare-fun b!987364 () Bool)

(declare-fun res!660568 () Bool)

(assert (=> b!987364 (=> (not res!660568) (not e!556743))))

(assert (=> b!987364 (= res!660568 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30493 _keys!1544))))))

(declare-fun b!987365 () Bool)

(assert (=> b!987365 (= e!556745 (and e!556741 mapRes!36848))))

(declare-fun condMapEmpty!36848 () Bool)

(declare-fun mapDefault!36848 () ValueCell!11123)

(assert (=> b!987365 (= condMapEmpty!36848 (= (arr!30011 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11123)) mapDefault!36848)))))

(declare-fun b!987366 () Bool)

(assert (=> b!987366 (= e!556743 (not e!556744))))

(declare-fun res!660565 () Bool)

(assert (=> b!987366 (=> res!660565 e!556744)))

(assert (=> b!987366 (= res!660565 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30012 _keys!1544) from!1932)))))

(declare-fun lt!437604 () ListLongMap!13611)

(declare-fun lt!437613 () tuple2!14924)

(assert (=> b!987366 (= (+!3097 lt!437604 lt!437610) (+!3097 lt!437609 lt!437613))))

(declare-fun lt!437608 () ListLongMap!13611)

(assert (=> b!987366 (= lt!437609 (+!3097 lt!437608 lt!437610))))

(assert (=> b!987366 (= lt!437610 (tuple2!14925 (select (arr!30012 _keys!1544) from!1932) lt!437611))))

(assert (=> b!987366 (= lt!437604 (+!3097 lt!437608 lt!437613))))

(assert (=> b!987366 (= lt!437613 (tuple2!14925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!437612 () Unit!32646)

(assert (=> b!987366 (= lt!437612 (addCommutativeForDiffKeys!693 lt!437608 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30012 _keys!1544) from!1932) lt!437611))))

(declare-fun get!15584 (ValueCell!11123 V!35929) V!35929)

(declare-fun dynLambda!1846 (Int (_ BitVec 64)) V!35929)

(assert (=> b!987366 (= lt!437611 (get!15584 (select (arr!30011 _values!1278) from!1932) (dynLambda!1846 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987366 (= lt!437608 (+!3097 lt!437605 lt!437614))))

(assert (=> b!987366 (= lt!437614 (tuple2!14925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3525 (array!62312 array!62310 (_ BitVec 32) (_ BitVec 32) V!35929 V!35929 (_ BitVec 32) Int) ListLongMap!13611)

(assert (=> b!987366 (= lt!437605 (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84424 res!660572) b!987359))

(assert (= (and b!987359 res!660569) b!987360))

(assert (= (and b!987360 res!660570) b!987357))

(assert (= (and b!987357 res!660571) b!987364))

(assert (= (and b!987364 res!660568) b!987358))

(assert (= (and b!987358 res!660567) b!987361))

(assert (= (and b!987361 res!660566) b!987366))

(assert (= (and b!987366 (not res!660565)) b!987356))

(assert (= (and b!987365 condMapEmpty!36848) mapIsEmpty!36848))

(assert (= (and b!987365 (not condMapEmpty!36848)) mapNonEmpty!36848))

(get-info :version)

(assert (= (and mapNonEmpty!36848 ((_ is ValueCellFull!11123) mapValue!36848)) b!987363))

(assert (= (and b!987365 ((_ is ValueCellFull!11123) mapDefault!36848)) b!987362))

(assert (= start!84424 b!987365))

(declare-fun b_lambda!15007 () Bool)

(assert (=> (not b_lambda!15007) (not b!987366)))

(declare-fun t!29723 () Bool)

(declare-fun tb!6763 () Bool)

(assert (=> (and start!84424 (= defaultEntry!1281 defaultEntry!1281) t!29723) tb!6763))

(declare-fun result!13527 () Bool)

(assert (=> tb!6763 (= result!13527 tp_is_empty!23209)))

(assert (=> b!987366 t!29723))

(declare-fun b_and!32029 () Bool)

(assert (= b_and!32027 (and (=> t!29723 result!13527) b_and!32029)))

(declare-fun m!913469 () Bool)

(assert (=> start!84424 m!913469))

(declare-fun m!913471 () Bool)

(assert (=> start!84424 m!913471))

(declare-fun m!913473 () Bool)

(assert (=> start!84424 m!913473))

(declare-fun m!913475 () Bool)

(assert (=> b!987357 m!913475))

(declare-fun m!913477 () Bool)

(assert (=> b!987358 m!913477))

(assert (=> b!987358 m!913477))

(declare-fun m!913479 () Bool)

(assert (=> b!987358 m!913479))

(declare-fun m!913481 () Bool)

(assert (=> b!987360 m!913481))

(assert (=> b!987366 m!913477))

(declare-fun m!913483 () Bool)

(assert (=> b!987366 m!913483))

(assert (=> b!987366 m!913477))

(declare-fun m!913485 () Bool)

(assert (=> b!987366 m!913485))

(declare-fun m!913487 () Bool)

(assert (=> b!987366 m!913487))

(declare-fun m!913489 () Bool)

(assert (=> b!987366 m!913489))

(declare-fun m!913491 () Bool)

(assert (=> b!987366 m!913491))

(declare-fun m!913493 () Bool)

(assert (=> b!987366 m!913493))

(declare-fun m!913495 () Bool)

(assert (=> b!987366 m!913495))

(declare-fun m!913497 () Bool)

(assert (=> b!987366 m!913497))

(declare-fun m!913499 () Bool)

(assert (=> b!987366 m!913499))

(assert (=> b!987366 m!913483))

(assert (=> b!987366 m!913499))

(declare-fun m!913501 () Bool)

(assert (=> b!987366 m!913501))

(declare-fun m!913503 () Bool)

(assert (=> mapNonEmpty!36848 m!913503))

(assert (=> b!987356 m!913477))

(declare-fun m!913505 () Bool)

(assert (=> b!987356 m!913505))

(declare-fun m!913507 () Bool)

(assert (=> b!987356 m!913507))

(declare-fun m!913509 () Bool)

(assert (=> b!987356 m!913509))

(assert (=> b!987356 m!913505))

(assert (=> b!987356 m!913477))

(declare-fun m!913511 () Bool)

(assert (=> b!987356 m!913511))

(check-sat (not b!987360) (not b!987357) (not b!987356) (not b!987358) tp_is_empty!23209 b_and!32029 (not b_next!19993) (not b!987366) (not b_lambda!15007) (not start!84424) (not mapNonEmpty!36848))
(check-sat b_and!32029 (not b_next!19993))
