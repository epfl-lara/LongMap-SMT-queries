; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84076 () Bool)

(assert start!84076)

(declare-fun b_free!19717 () Bool)

(declare-fun b_next!19717 () Bool)

(assert (=> start!84076 (= b_free!19717 (not b_next!19717))))

(declare-fun tp!68594 () Bool)

(declare-fun b_and!31533 () Bool)

(assert (=> start!84076 (= tp!68594 b_and!31533)))

(declare-fun b!981494 () Bool)

(declare-fun e!553285 () Bool)

(assert (=> b!981494 (= e!553285 true)))

(declare-datatypes ((V!35265 0))(
  ( (V!35266 (val!11406 Int)) )
))
(declare-datatypes ((tuple2!14646 0))(
  ( (tuple2!14647 (_1!7334 (_ BitVec 64)) (_2!7334 V!35265)) )
))
(declare-datatypes ((List!20506 0))(
  ( (Nil!20503) (Cons!20502 (h!21670 tuple2!14646) (t!29171 List!20506)) )
))
(declare-datatypes ((ListLongMap!13345 0))(
  ( (ListLongMap!13346 (toList!6688 List!20506)) )
))
(declare-fun lt!435806 () ListLongMap!13345)

(declare-fun lt!435809 () tuple2!14646)

(declare-fun lt!435808 () ListLongMap!13345)

(declare-fun lt!435802 () tuple2!14646)

(declare-fun +!3003 (ListLongMap!13345 tuple2!14646) ListLongMap!13345)

(assert (=> b!981494 (= lt!435808 (+!3003 (+!3003 lt!435806 lt!435802) lt!435809))))

(declare-datatypes ((Unit!32586 0))(
  ( (Unit!32587) )
))
(declare-fun lt!435801 () Unit!32586)

(declare-fun zeroValue!1220 () V!35265)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61464 0))(
  ( (array!61465 (arr!29585 (Array (_ BitVec 32) (_ BitVec 64))) (size!30065 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61464)

(declare-fun lt!435807 () V!35265)

(declare-fun addCommutativeForDiffKeys!610 (ListLongMap!13345 (_ BitVec 64) V!35265 (_ BitVec 64) V!35265) Unit!32586)

(assert (=> b!981494 (= lt!435801 (addCommutativeForDiffKeys!610 lt!435806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29585 _keys!1544) from!1932) lt!435807))))

(declare-fun b!981496 () Bool)

(declare-fun e!553289 () Bool)

(declare-fun e!553287 () Bool)

(declare-fun mapRes!36095 () Bool)

(assert (=> b!981496 (= e!553289 (and e!553287 mapRes!36095))))

(declare-fun condMapEmpty!36095 () Bool)

(declare-datatypes ((ValueCell!10874 0))(
  ( (ValueCellFull!10874 (v!13965 V!35265)) (EmptyCell!10874) )
))
(declare-datatypes ((array!61466 0))(
  ( (array!61467 (arr!29586 (Array (_ BitVec 32) ValueCell!10874)) (size!30066 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61466)

(declare-fun mapDefault!36095 () ValueCell!10874)

(assert (=> b!981496 (= condMapEmpty!36095 (= (arr!29586 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10874)) mapDefault!36095)))))

(declare-fun b!981497 () Bool)

(declare-fun res!656605 () Bool)

(declare-fun e!553290 () Bool)

(assert (=> b!981497 (=> (not res!656605) (not e!553290))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981497 (= res!656605 (and (= (size!30066 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30065 _keys!1544) (size!30066 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36095 () Bool)

(assert (=> mapIsEmpty!36095 mapRes!36095))

(declare-fun b!981498 () Bool)

(declare-fun res!656600 () Bool)

(assert (=> b!981498 (=> (not res!656600) (not e!553290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981498 (= res!656600 (validKeyInArray!0 (select (arr!29585 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36095 () Bool)

(declare-fun tp!68593 () Bool)

(declare-fun e!553286 () Bool)

(assert (=> mapNonEmpty!36095 (= mapRes!36095 (and tp!68593 e!553286))))

(declare-fun mapKey!36095 () (_ BitVec 32))

(declare-fun mapRest!36095 () (Array (_ BitVec 32) ValueCell!10874))

(declare-fun mapValue!36095 () ValueCell!10874)

(assert (=> mapNonEmpty!36095 (= (arr!29586 _values!1278) (store mapRest!36095 mapKey!36095 mapValue!36095))))

(declare-fun b!981499 () Bool)

(declare-fun tp_is_empty!22711 () Bool)

(assert (=> b!981499 (= e!553287 tp_is_empty!22711)))

(declare-fun b!981500 () Bool)

(declare-fun res!656602 () Bool)

(assert (=> b!981500 (=> (not res!656602) (not e!553290))))

(assert (=> b!981500 (= res!656602 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30065 _keys!1544))))))

(declare-fun b!981495 () Bool)

(assert (=> b!981495 (= e!553290 (not e!553285))))

(declare-fun res!656599 () Bool)

(assert (=> b!981495 (=> res!656599 e!553285)))

(assert (=> b!981495 (= res!656599 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29585 _keys!1544) from!1932)))))

(declare-fun lt!435803 () tuple2!14646)

(declare-fun lt!435805 () ListLongMap!13345)

(assert (=> b!981495 (= (+!3003 lt!435805 lt!435802) (+!3003 lt!435808 lt!435803))))

(declare-fun lt!435810 () ListLongMap!13345)

(assert (=> b!981495 (= lt!435808 (+!3003 lt!435810 lt!435802))))

(assert (=> b!981495 (= lt!435802 (tuple2!14647 (select (arr!29585 _keys!1544) from!1932) lt!435807))))

(assert (=> b!981495 (= lt!435805 (+!3003 lt!435810 lt!435803))))

(declare-fun minValue!1220 () V!35265)

(assert (=> b!981495 (= lt!435803 (tuple2!14647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435804 () Unit!32586)

(assert (=> b!981495 (= lt!435804 (addCommutativeForDiffKeys!610 lt!435810 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29585 _keys!1544) from!1932) lt!435807))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15365 (ValueCell!10874 V!35265) V!35265)

(declare-fun dynLambda!1796 (Int (_ BitVec 64)) V!35265)

(assert (=> b!981495 (= lt!435807 (get!15365 (select (arr!29586 _values!1278) from!1932) (dynLambda!1796 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!981495 (= lt!435810 (+!3003 lt!435806 lt!435809))))

(assert (=> b!981495 (= lt!435809 (tuple2!14647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3434 (array!61464 array!61466 (_ BitVec 32) (_ BitVec 32) V!35265 V!35265 (_ BitVec 32) Int) ListLongMap!13345)

(assert (=> b!981495 (= lt!435806 (getCurrentListMapNoExtraKeys!3434 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!656603 () Bool)

(assert (=> start!84076 (=> (not res!656603) (not e!553290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84076 (= res!656603 (validMask!0 mask!1948))))

(assert (=> start!84076 e!553290))

(assert (=> start!84076 true))

(assert (=> start!84076 tp_is_empty!22711))

(declare-fun array_inv!22903 (array!61466) Bool)

(assert (=> start!84076 (and (array_inv!22903 _values!1278) e!553289)))

(assert (=> start!84076 tp!68594))

(declare-fun array_inv!22904 (array!61464) Bool)

(assert (=> start!84076 (array_inv!22904 _keys!1544)))

(declare-fun b!981501 () Bool)

(declare-fun res!656598 () Bool)

(assert (=> b!981501 (=> (not res!656598) (not e!553290))))

(assert (=> b!981501 (= res!656598 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!981502 () Bool)

(declare-fun res!656604 () Bool)

(assert (=> b!981502 (=> (not res!656604) (not e!553290))))

(declare-datatypes ((List!20507 0))(
  ( (Nil!20504) (Cons!20503 (h!21671 (_ BitVec 64)) (t!29172 List!20507)) )
))
(declare-fun arrayNoDuplicates!0 (array!61464 (_ BitVec 32) List!20507) Bool)

(assert (=> b!981502 (= res!656604 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20504))))

(declare-fun b!981503 () Bool)

(declare-fun res!656601 () Bool)

(assert (=> b!981503 (=> (not res!656601) (not e!553290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61464 (_ BitVec 32)) Bool)

(assert (=> b!981503 (= res!656601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981504 () Bool)

(assert (=> b!981504 (= e!553286 tp_is_empty!22711)))

(assert (= (and start!84076 res!656603) b!981497))

(assert (= (and b!981497 res!656605) b!981503))

(assert (= (and b!981503 res!656601) b!981502))

(assert (= (and b!981502 res!656604) b!981500))

(assert (= (and b!981500 res!656602) b!981498))

(assert (= (and b!981498 res!656600) b!981501))

(assert (= (and b!981501 res!656598) b!981495))

(assert (= (and b!981495 (not res!656599)) b!981494))

(assert (= (and b!981496 condMapEmpty!36095) mapIsEmpty!36095))

(assert (= (and b!981496 (not condMapEmpty!36095)) mapNonEmpty!36095))

(get-info :version)

(assert (= (and mapNonEmpty!36095 ((_ is ValueCellFull!10874) mapValue!36095)) b!981504))

(assert (= (and b!981496 ((_ is ValueCellFull!10874) mapDefault!36095)) b!981499))

(assert (= start!84076 b!981496))

(declare-fun b_lambda!14775 () Bool)

(assert (=> (not b_lambda!14775) (not b!981495)))

(declare-fun t!29170 () Bool)

(declare-fun tb!6515 () Bool)

(assert (=> (and start!84076 (= defaultEntry!1281 defaultEntry!1281) t!29170) tb!6515))

(declare-fun result!13027 () Bool)

(assert (=> tb!6515 (= result!13027 tp_is_empty!22711)))

(assert (=> b!981495 t!29170))

(declare-fun b_and!31535 () Bool)

(assert (= b_and!31533 (and (=> t!29170 result!13027) b_and!31535)))

(declare-fun m!909425 () Bool)

(assert (=> b!981503 m!909425))

(declare-fun m!909427 () Bool)

(assert (=> mapNonEmpty!36095 m!909427))

(declare-fun m!909429 () Bool)

(assert (=> start!84076 m!909429))

(declare-fun m!909431 () Bool)

(assert (=> start!84076 m!909431))

(declare-fun m!909433 () Bool)

(assert (=> start!84076 m!909433))

(declare-fun m!909435 () Bool)

(assert (=> b!981502 m!909435))

(declare-fun m!909437 () Bool)

(assert (=> b!981494 m!909437))

(assert (=> b!981494 m!909437))

(declare-fun m!909439 () Bool)

(assert (=> b!981494 m!909439))

(declare-fun m!909441 () Bool)

(assert (=> b!981494 m!909441))

(assert (=> b!981494 m!909441))

(declare-fun m!909443 () Bool)

(assert (=> b!981494 m!909443))

(declare-fun m!909445 () Bool)

(assert (=> b!981495 m!909445))

(assert (=> b!981495 m!909441))

(declare-fun m!909447 () Bool)

(assert (=> b!981495 m!909447))

(declare-fun m!909449 () Bool)

(assert (=> b!981495 m!909449))

(declare-fun m!909451 () Bool)

(assert (=> b!981495 m!909451))

(declare-fun m!909453 () Bool)

(assert (=> b!981495 m!909453))

(assert (=> b!981495 m!909441))

(declare-fun m!909455 () Bool)

(assert (=> b!981495 m!909455))

(declare-fun m!909457 () Bool)

(assert (=> b!981495 m!909457))

(declare-fun m!909459 () Bool)

(assert (=> b!981495 m!909459))

(declare-fun m!909461 () Bool)

(assert (=> b!981495 m!909461))

(assert (=> b!981495 m!909445))

(assert (=> b!981495 m!909461))

(declare-fun m!909463 () Bool)

(assert (=> b!981495 m!909463))

(assert (=> b!981498 m!909441))

(assert (=> b!981498 m!909441))

(declare-fun m!909465 () Bool)

(assert (=> b!981498 m!909465))

(check-sat (not b!981502) (not b!981494) tp_is_empty!22711 (not mapNonEmpty!36095) (not b!981498) (not b_lambda!14775) (not b!981495) b_and!31535 (not b_next!19717) (not start!84076) (not b!981503))
(check-sat b_and!31535 (not b_next!19717))
