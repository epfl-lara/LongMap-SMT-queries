; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84220 () Bool)

(assert start!84220)

(declare-fun b_free!19807 () Bool)

(declare-fun b_next!19807 () Bool)

(assert (=> start!84220 (= b_free!19807 (not b_next!19807))))

(declare-fun tp!68944 () Bool)

(declare-fun b_and!31707 () Bool)

(assert (=> start!84220 (= tp!68944 b_and!31707)))

(declare-fun b!983567 () Bool)

(declare-fun e!554494 () Bool)

(declare-fun tp_is_empty!22855 () Bool)

(assert (=> b!983567 (= e!554494 tp_is_empty!22855)))

(declare-fun b!983568 () Bool)

(declare-fun res!657942 () Bool)

(declare-fun e!554496 () Bool)

(assert (=> b!983568 (=> (not res!657942) (not e!554496))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61738 0))(
  ( (array!61739 (arr!29722 (Array (_ BitVec 32) (_ BitVec 64))) (size!30202 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61738)

(assert (=> b!983568 (= res!657942 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30202 _keys!1544))))))

(declare-fun b!983569 () Bool)

(declare-fun res!657946 () Bool)

(assert (=> b!983569 (=> (not res!657946) (not e!554496))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983569 (= res!657946 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983570 () Bool)

(declare-fun res!657945 () Bool)

(assert (=> b!983570 (=> (not res!657945) (not e!554496))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35457 0))(
  ( (V!35458 (val!11478 Int)) )
))
(declare-datatypes ((ValueCell!10946 0))(
  ( (ValueCellFull!10946 (v!14037 V!35457)) (EmptyCell!10946) )
))
(declare-datatypes ((array!61740 0))(
  ( (array!61741 (arr!29723 (Array (_ BitVec 32) ValueCell!10946)) (size!30203 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61740)

(assert (=> b!983570 (= res!657945 (and (= (size!30203 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30202 _keys!1544) (size!30203 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983571 () Bool)

(declare-fun e!554493 () Bool)

(assert (=> b!983571 (= e!554493 (not true))))

(declare-datatypes ((tuple2!14720 0))(
  ( (tuple2!14721 (_1!7371 (_ BitVec 64)) (_2!7371 V!35457)) )
))
(declare-datatypes ((List!20595 0))(
  ( (Nil!20592) (Cons!20591 (h!21759 tuple2!14720) (t!29344 List!20595)) )
))
(declare-datatypes ((ListLongMap!13419 0))(
  ( (ListLongMap!13420 (toList!6725 List!20595)) )
))
(declare-fun lt!436596 () ListLongMap!13419)

(declare-fun lt!436594 () tuple2!14720)

(declare-fun lt!436595 () tuple2!14720)

(declare-fun +!3031 (ListLongMap!13419 tuple2!14720) ListLongMap!13419)

(assert (=> b!983571 (= (+!3031 (+!3031 lt!436596 lt!436594) lt!436595) (+!3031 (+!3031 lt!436596 lt!436595) lt!436594))))

(declare-fun lt!436593 () V!35457)

(assert (=> b!983571 (= lt!436595 (tuple2!14721 (select (arr!29722 _keys!1544) from!1932) lt!436593))))

(declare-fun zeroValue!1220 () V!35457)

(assert (=> b!983571 (= lt!436594 (tuple2!14721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32642 0))(
  ( (Unit!32643) )
))
(declare-fun lt!436592 () Unit!32642)

(declare-fun addCommutativeForDiffKeys!638 (ListLongMap!13419 (_ BitVec 64) V!35457 (_ BitVec 64) V!35457) Unit!32642)

(assert (=> b!983571 (= lt!436592 (addCommutativeForDiffKeys!638 lt!436596 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29722 _keys!1544) from!1932) lt!436593))))

(declare-fun b!983572 () Bool)

(declare-fun res!657944 () Bool)

(assert (=> b!983572 (=> (not res!657944) (not e!554496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61738 (_ BitVec 32)) Bool)

(assert (=> b!983572 (= res!657944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36311 () Bool)

(declare-fun mapRes!36311 () Bool)

(declare-fun tp!68945 () Bool)

(declare-fun e!554492 () Bool)

(assert (=> mapNonEmpty!36311 (= mapRes!36311 (and tp!68945 e!554492))))

(declare-fun mapValue!36311 () ValueCell!10946)

(declare-fun mapKey!36311 () (_ BitVec 32))

(declare-fun mapRest!36311 () (Array (_ BitVec 32) ValueCell!10946))

(assert (=> mapNonEmpty!36311 (= (arr!29723 _values!1278) (store mapRest!36311 mapKey!36311 mapValue!36311))))

(declare-fun b!983574 () Bool)

(assert (=> b!983574 (= e!554496 e!554493)))

(declare-fun res!657939 () Bool)

(assert (=> b!983574 (=> (not res!657939) (not e!554493))))

(assert (=> b!983574 (= res!657939 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29722 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15444 (ValueCell!10946 V!35457) V!35457)

(declare-fun dynLambda!1827 (Int (_ BitVec 64)) V!35457)

(assert (=> b!983574 (= lt!436593 (get!15444 (select (arr!29723 _values!1278) from!1932) (dynLambda!1827 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35457)

(declare-fun getCurrentListMapNoExtraKeys!3468 (array!61738 array!61740 (_ BitVec 32) (_ BitVec 32) V!35457 V!35457 (_ BitVec 32) Int) ListLongMap!13419)

(assert (=> b!983574 (= lt!436596 (getCurrentListMapNoExtraKeys!3468 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983575 () Bool)

(declare-fun e!554495 () Bool)

(assert (=> b!983575 (= e!554495 (and e!554494 mapRes!36311))))

(declare-fun condMapEmpty!36311 () Bool)

(declare-fun mapDefault!36311 () ValueCell!10946)

(assert (=> b!983575 (= condMapEmpty!36311 (= (arr!29723 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10946)) mapDefault!36311)))))

(declare-fun b!983576 () Bool)

(declare-fun res!657940 () Bool)

(assert (=> b!983576 (=> (not res!657940) (not e!554496))))

(declare-datatypes ((List!20596 0))(
  ( (Nil!20593) (Cons!20592 (h!21760 (_ BitVec 64)) (t!29345 List!20596)) )
))
(declare-fun arrayNoDuplicates!0 (array!61738 (_ BitVec 32) List!20596) Bool)

(assert (=> b!983576 (= res!657940 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20593))))

(declare-fun b!983577 () Bool)

(declare-fun res!657941 () Bool)

(assert (=> b!983577 (=> (not res!657941) (not e!554496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983577 (= res!657941 (validKeyInArray!0 (select (arr!29722 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36311 () Bool)

(assert (=> mapIsEmpty!36311 mapRes!36311))

(declare-fun b!983573 () Bool)

(assert (=> b!983573 (= e!554492 tp_is_empty!22855)))

(declare-fun res!657943 () Bool)

(assert (=> start!84220 (=> (not res!657943) (not e!554496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84220 (= res!657943 (validMask!0 mask!1948))))

(assert (=> start!84220 e!554496))

(assert (=> start!84220 true))

(assert (=> start!84220 tp_is_empty!22855))

(declare-fun array_inv!22999 (array!61740) Bool)

(assert (=> start!84220 (and (array_inv!22999 _values!1278) e!554495)))

(assert (=> start!84220 tp!68944))

(declare-fun array_inv!23000 (array!61738) Bool)

(assert (=> start!84220 (array_inv!23000 _keys!1544)))

(assert (= (and start!84220 res!657943) b!983570))

(assert (= (and b!983570 res!657945) b!983572))

(assert (= (and b!983572 res!657944) b!983576))

(assert (= (and b!983576 res!657940) b!983568))

(assert (= (and b!983568 res!657942) b!983577))

(assert (= (and b!983577 res!657941) b!983569))

(assert (= (and b!983569 res!657946) b!983574))

(assert (= (and b!983574 res!657939) b!983571))

(assert (= (and b!983575 condMapEmpty!36311) mapIsEmpty!36311))

(assert (= (and b!983575 (not condMapEmpty!36311)) mapNonEmpty!36311))

(get-info :version)

(assert (= (and mapNonEmpty!36311 ((_ is ValueCellFull!10946) mapValue!36311)) b!983573))

(assert (= (and b!983575 ((_ is ValueCellFull!10946) mapDefault!36311)) b!983567))

(assert (= start!84220 b!983575))

(declare-fun b_lambda!14859 () Bool)

(assert (=> (not b_lambda!14859) (not b!983574)))

(declare-fun t!29343 () Bool)

(declare-fun tb!6599 () Bool)

(assert (=> (and start!84220 (= defaultEntry!1281 defaultEntry!1281) t!29343) tb!6599))

(declare-fun result!13195 () Bool)

(assert (=> tb!6599 (= result!13195 tp_is_empty!22855)))

(assert (=> b!983574 t!29343))

(declare-fun b_and!31709 () Bool)

(assert (= b_and!31707 (and (=> t!29343 result!13195) b_and!31709)))

(declare-fun m!911291 () Bool)

(assert (=> b!983576 m!911291))

(declare-fun m!911293 () Bool)

(assert (=> start!84220 m!911293))

(declare-fun m!911295 () Bool)

(assert (=> start!84220 m!911295))

(declare-fun m!911297 () Bool)

(assert (=> start!84220 m!911297))

(declare-fun m!911299 () Bool)

(assert (=> mapNonEmpty!36311 m!911299))

(declare-fun m!911301 () Bool)

(assert (=> b!983574 m!911301))

(declare-fun m!911303 () Bool)

(assert (=> b!983574 m!911303))

(declare-fun m!911305 () Bool)

(assert (=> b!983574 m!911305))

(declare-fun m!911307 () Bool)

(assert (=> b!983574 m!911307))

(assert (=> b!983574 m!911303))

(assert (=> b!983574 m!911307))

(declare-fun m!911309 () Bool)

(assert (=> b!983574 m!911309))

(assert (=> b!983577 m!911301))

(assert (=> b!983577 m!911301))

(declare-fun m!911311 () Bool)

(assert (=> b!983577 m!911311))

(assert (=> b!983571 m!911301))

(assert (=> b!983571 m!911301))

(declare-fun m!911313 () Bool)

(assert (=> b!983571 m!911313))

(declare-fun m!911315 () Bool)

(assert (=> b!983571 m!911315))

(assert (=> b!983571 m!911315))

(declare-fun m!911317 () Bool)

(assert (=> b!983571 m!911317))

(declare-fun m!911319 () Bool)

(assert (=> b!983571 m!911319))

(declare-fun m!911321 () Bool)

(assert (=> b!983571 m!911321))

(assert (=> b!983571 m!911319))

(declare-fun m!911323 () Bool)

(assert (=> b!983572 m!911323))

(check-sat (not start!84220) (not b_next!19807) (not mapNonEmpty!36311) (not b_lambda!14859) (not b!983574) (not b!983572) b_and!31709 (not b!983576) (not b!983577) tp_is_empty!22855 (not b!983571))
(check-sat b_and!31709 (not b_next!19807))
