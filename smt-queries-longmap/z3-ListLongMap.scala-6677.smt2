; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84036 () Bool)

(assert start!84036)

(declare-fun b_free!19791 () Bool)

(declare-fun b_next!19791 () Bool)

(assert (=> start!84036 (= b_free!19791 (not b_next!19791))))

(declare-fun tp!68895 () Bool)

(declare-fun b_and!31665 () Bool)

(assert (=> start!84036 (= tp!68895 b_and!31665)))

(declare-fun res!657410 () Bool)

(declare-fun e!553767 () Bool)

(assert (=> start!84036 (=> (not res!657410) (not e!553767))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84036 (= res!657410 (validMask!0 mask!1948))))

(assert (=> start!84036 e!553767))

(assert (=> start!84036 true))

(declare-fun tp_is_empty!22839 () Bool)

(assert (=> start!84036 tp_is_empty!22839))

(declare-datatypes ((V!35435 0))(
  ( (V!35436 (val!11470 Int)) )
))
(declare-datatypes ((ValueCell!10938 0))(
  ( (ValueCellFull!10938 (v!14032 V!35435)) (EmptyCell!10938) )
))
(declare-datatypes ((array!61671 0))(
  ( (array!61672 (arr!29693 (Array (_ BitVec 32) ValueCell!10938)) (size!30172 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61671)

(declare-fun e!553768 () Bool)

(declare-fun array_inv!22961 (array!61671) Bool)

(assert (=> start!84036 (and (array_inv!22961 _values!1278) e!553768)))

(assert (=> start!84036 tp!68895))

(declare-datatypes ((array!61673 0))(
  ( (array!61674 (arr!29694 (Array (_ BitVec 32) (_ BitVec 64))) (size!30173 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61673)

(declare-fun array_inv!22962 (array!61673) Bool)

(assert (=> start!84036 (array_inv!22962 _keys!1544)))

(declare-fun b!982384 () Bool)

(declare-fun e!553765 () Bool)

(assert (=> b!982384 (= e!553765 tp_is_empty!22839)))

(declare-fun b!982385 () Bool)

(declare-fun res!657405 () Bool)

(assert (=> b!982385 (=> (not res!657405) (not e!553767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61673 (_ BitVec 32)) Bool)

(assert (=> b!982385 (= res!657405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982386 () Bool)

(declare-fun e!553770 () Bool)

(assert (=> b!982386 (= e!553770 (not true))))

(declare-datatypes ((tuple2!14692 0))(
  ( (tuple2!14693 (_1!7357 (_ BitVec 64)) (_2!7357 V!35435)) )
))
(declare-datatypes ((List!20573 0))(
  ( (Nil!20570) (Cons!20569 (h!21731 tuple2!14692) (t!29314 List!20573)) )
))
(declare-datatypes ((ListLongMap!13389 0))(
  ( (ListLongMap!13390 (toList!6710 List!20573)) )
))
(declare-fun lt!436113 () ListLongMap!13389)

(declare-fun lt!436112 () tuple2!14692)

(declare-fun lt!436111 () tuple2!14692)

(declare-fun +!3008 (ListLongMap!13389 tuple2!14692) ListLongMap!13389)

(assert (=> b!982386 (= (+!3008 (+!3008 lt!436113 lt!436112) lt!436111) (+!3008 (+!3008 lt!436113 lt!436111) lt!436112))))

(declare-fun lt!436115 () V!35435)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982386 (= lt!436111 (tuple2!14693 (select (arr!29694 _keys!1544) from!1932) lt!436115))))

(declare-fun zeroValue!1220 () V!35435)

(assert (=> b!982386 (= lt!436112 (tuple2!14693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32655 0))(
  ( (Unit!32656) )
))
(declare-fun lt!436114 () Unit!32655)

(declare-fun addCommutativeForDiffKeys!636 (ListLongMap!13389 (_ BitVec 64) V!35435 (_ BitVec 64) V!35435) Unit!32655)

(assert (=> b!982386 (= lt!436114 (addCommutativeForDiffKeys!636 lt!436113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29694 _keys!1544) from!1932) lt!436115))))

(declare-fun b!982387 () Bool)

(declare-fun mapRes!36287 () Bool)

(assert (=> b!982387 (= e!553768 (and e!553765 mapRes!36287))))

(declare-fun condMapEmpty!36287 () Bool)

(declare-fun mapDefault!36287 () ValueCell!10938)

(assert (=> b!982387 (= condMapEmpty!36287 (= (arr!29693 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10938)) mapDefault!36287)))))

(declare-fun b!982388 () Bool)

(declare-fun res!657407 () Bool)

(assert (=> b!982388 (=> (not res!657407) (not e!553767))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982388 (= res!657407 (and (= (size!30172 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30173 _keys!1544) (size!30172 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982389 () Bool)

(assert (=> b!982389 (= e!553767 e!553770)))

(declare-fun res!657403 () Bool)

(assert (=> b!982389 (=> (not res!657403) (not e!553770))))

(assert (=> b!982389 (= res!657403 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29694 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15400 (ValueCell!10938 V!35435) V!35435)

(declare-fun dynLambda!1793 (Int (_ BitVec 64)) V!35435)

(assert (=> b!982389 (= lt!436115 (get!15400 (select (arr!29693 _values!1278) from!1932) (dynLambda!1793 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35435)

(declare-fun getCurrentListMapNoExtraKeys!3410 (array!61673 array!61671 (_ BitVec 32) (_ BitVec 32) V!35435 V!35435 (_ BitVec 32) Int) ListLongMap!13389)

(assert (=> b!982389 (= lt!436113 (getCurrentListMapNoExtraKeys!3410 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982390 () Bool)

(declare-fun e!553769 () Bool)

(assert (=> b!982390 (= e!553769 tp_is_empty!22839)))

(declare-fun mapNonEmpty!36287 () Bool)

(declare-fun tp!68896 () Bool)

(assert (=> mapNonEmpty!36287 (= mapRes!36287 (and tp!68896 e!553769))))

(declare-fun mapRest!36287 () (Array (_ BitVec 32) ValueCell!10938))

(declare-fun mapValue!36287 () ValueCell!10938)

(declare-fun mapKey!36287 () (_ BitVec 32))

(assert (=> mapNonEmpty!36287 (= (arr!29693 _values!1278) (store mapRest!36287 mapKey!36287 mapValue!36287))))

(declare-fun b!982391 () Bool)

(declare-fun res!657409 () Bool)

(assert (=> b!982391 (=> (not res!657409) (not e!553767))))

(declare-datatypes ((List!20574 0))(
  ( (Nil!20571) (Cons!20570 (h!21732 (_ BitVec 64)) (t!29315 List!20574)) )
))
(declare-fun arrayNoDuplicates!0 (array!61673 (_ BitVec 32) List!20574) Bool)

(assert (=> b!982391 (= res!657409 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20571))))

(declare-fun b!982392 () Bool)

(declare-fun res!657408 () Bool)

(assert (=> b!982392 (=> (not res!657408) (not e!553767))))

(assert (=> b!982392 (= res!657408 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30173 _keys!1544))))))

(declare-fun b!982393 () Bool)

(declare-fun res!657404 () Bool)

(assert (=> b!982393 (=> (not res!657404) (not e!553767))))

(assert (=> b!982393 (= res!657404 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982394 () Bool)

(declare-fun res!657406 () Bool)

(assert (=> b!982394 (=> (not res!657406) (not e!553767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982394 (= res!657406 (validKeyInArray!0 (select (arr!29694 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36287 () Bool)

(assert (=> mapIsEmpty!36287 mapRes!36287))

(assert (= (and start!84036 res!657410) b!982388))

(assert (= (and b!982388 res!657407) b!982385))

(assert (= (and b!982385 res!657405) b!982391))

(assert (= (and b!982391 res!657409) b!982392))

(assert (= (and b!982392 res!657408) b!982394))

(assert (= (and b!982394 res!657406) b!982393))

(assert (= (and b!982393 res!657404) b!982389))

(assert (= (and b!982389 res!657403) b!982386))

(assert (= (and b!982387 condMapEmpty!36287) mapIsEmpty!36287))

(assert (= (and b!982387 (not condMapEmpty!36287)) mapNonEmpty!36287))

(get-info :version)

(assert (= (and mapNonEmpty!36287 ((_ is ValueCellFull!10938) mapValue!36287)) b!982390))

(assert (= (and b!982387 ((_ is ValueCellFull!10938) mapDefault!36287)) b!982384))

(assert (= start!84036 b!982387))

(declare-fun b_lambda!14829 () Bool)

(assert (=> (not b_lambda!14829) (not b!982389)))

(declare-fun t!29313 () Bool)

(declare-fun tb!6591 () Bool)

(assert (=> (and start!84036 (= defaultEntry!1281 defaultEntry!1281) t!29313) tb!6591))

(declare-fun result!13171 () Bool)

(assert (=> tb!6591 (= result!13171 tp_is_empty!22839)))

(assert (=> b!982389 t!29313))

(declare-fun b_and!31667 () Bool)

(assert (= b_and!31665 (and (=> t!29313 result!13171) b_and!31667)))

(declare-fun m!909725 () Bool)

(assert (=> b!982385 m!909725))

(declare-fun m!909727 () Bool)

(assert (=> b!982389 m!909727))

(declare-fun m!909729 () Bool)

(assert (=> b!982389 m!909729))

(declare-fun m!909731 () Bool)

(assert (=> b!982389 m!909731))

(declare-fun m!909733 () Bool)

(assert (=> b!982389 m!909733))

(assert (=> b!982389 m!909729))

(assert (=> b!982389 m!909733))

(declare-fun m!909735 () Bool)

(assert (=> b!982389 m!909735))

(declare-fun m!909737 () Bool)

(assert (=> start!84036 m!909737))

(declare-fun m!909739 () Bool)

(assert (=> start!84036 m!909739))

(declare-fun m!909741 () Bool)

(assert (=> start!84036 m!909741))

(declare-fun m!909743 () Bool)

(assert (=> b!982386 m!909743))

(assert (=> b!982386 m!909727))

(assert (=> b!982386 m!909743))

(declare-fun m!909745 () Bool)

(assert (=> b!982386 m!909745))

(declare-fun m!909747 () Bool)

(assert (=> b!982386 m!909747))

(declare-fun m!909749 () Bool)

(assert (=> b!982386 m!909749))

(assert (=> b!982386 m!909727))

(declare-fun m!909751 () Bool)

(assert (=> b!982386 m!909751))

(assert (=> b!982386 m!909747))

(declare-fun m!909753 () Bool)

(assert (=> mapNonEmpty!36287 m!909753))

(assert (=> b!982394 m!909727))

(assert (=> b!982394 m!909727))

(declare-fun m!909755 () Bool)

(assert (=> b!982394 m!909755))

(declare-fun m!909757 () Bool)

(assert (=> b!982391 m!909757))

(check-sat (not b_next!19791) b_and!31667 (not b!982394) (not b!982386) (not start!84036) (not b!982391) (not mapNonEmpty!36287) (not b!982389) tp_is_empty!22839 (not b!982385) (not b_lambda!14829))
(check-sat b_and!31667 (not b_next!19791))
