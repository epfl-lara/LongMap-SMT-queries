; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84048 () Bool)

(assert start!84048)

(declare-fun b_free!19803 () Bool)

(declare-fun b_next!19803 () Bool)

(assert (=> start!84048 (= b_free!19803 (not b_next!19803))))

(declare-fun tp!68931 () Bool)

(declare-fun b_and!31689 () Bool)

(assert (=> start!84048 (= tp!68931 b_and!31689)))

(declare-fun mapNonEmpty!36305 () Bool)

(declare-fun mapRes!36305 () Bool)

(declare-fun tp!68932 () Bool)

(declare-fun e!553874 () Bool)

(assert (=> mapNonEmpty!36305 (= mapRes!36305 (and tp!68932 e!553874))))

(declare-datatypes ((V!35451 0))(
  ( (V!35452 (val!11476 Int)) )
))
(declare-datatypes ((ValueCell!10944 0))(
  ( (ValueCellFull!10944 (v!14038 V!35451)) (EmptyCell!10944) )
))
(declare-datatypes ((array!61693 0))(
  ( (array!61694 (arr!29704 (Array (_ BitVec 32) ValueCell!10944)) (size!30183 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61693)

(declare-fun mapKey!36305 () (_ BitVec 32))

(declare-fun mapRest!36305 () (Array (_ BitVec 32) ValueCell!10944))

(declare-fun mapValue!36305 () ValueCell!10944)

(assert (=> mapNonEmpty!36305 (= (arr!29704 _values!1278) (store mapRest!36305 mapKey!36305 mapValue!36305))))

(declare-fun mapIsEmpty!36305 () Bool)

(assert (=> mapIsEmpty!36305 mapRes!36305))

(declare-fun b!982594 () Bool)

(declare-fun tp_is_empty!22851 () Bool)

(assert (=> b!982594 (= e!553874 tp_is_empty!22851)))

(declare-fun b!982595 () Bool)

(declare-fun res!657551 () Bool)

(declare-fun e!553873 () Bool)

(assert (=> b!982595 (=> (not res!657551) (not e!553873))))

(declare-datatypes ((array!61695 0))(
  ( (array!61696 (arr!29705 (Array (_ BitVec 32) (_ BitVec 64))) (size!30184 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61695)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61695 (_ BitVec 32)) Bool)

(assert (=> b!982595 (= res!657551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982596 () Bool)

(declare-fun res!657553 () Bool)

(assert (=> b!982596 (=> (not res!657553) (not e!553873))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982596 (= res!657553 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30184 _keys!1544))))))

(declare-fun b!982597 () Bool)

(declare-fun res!657547 () Bool)

(assert (=> b!982597 (=> (not res!657547) (not e!553873))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982597 (= res!657547 (and (= (size!30183 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30184 _keys!1544) (size!30183 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982598 () Bool)

(declare-fun res!657552 () Bool)

(assert (=> b!982598 (=> (not res!657552) (not e!553873))))

(assert (=> b!982598 (= res!657552 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982599 () Bool)

(declare-fun res!657548 () Bool)

(assert (=> b!982599 (=> (not res!657548) (not e!553873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982599 (= res!657548 (validKeyInArray!0 (select (arr!29705 _keys!1544) from!1932)))))

(declare-fun res!657554 () Bool)

(assert (=> start!84048 (=> (not res!657554) (not e!553873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84048 (= res!657554 (validMask!0 mask!1948))))

(assert (=> start!84048 e!553873))

(assert (=> start!84048 true))

(assert (=> start!84048 tp_is_empty!22851))

(declare-fun e!553877 () Bool)

(declare-fun array_inv!22971 (array!61693) Bool)

(assert (=> start!84048 (and (array_inv!22971 _values!1278) e!553877)))

(assert (=> start!84048 tp!68931))

(declare-fun array_inv!22972 (array!61695) Bool)

(assert (=> start!84048 (array_inv!22972 _keys!1544)))

(declare-fun b!982600 () Bool)

(declare-fun e!553875 () Bool)

(assert (=> b!982600 (= e!553875 (not true))))

(declare-datatypes ((tuple2!14702 0))(
  ( (tuple2!14703 (_1!7362 (_ BitVec 64)) (_2!7362 V!35451)) )
))
(declare-datatypes ((List!20582 0))(
  ( (Nil!20579) (Cons!20578 (h!21740 tuple2!14702) (t!29335 List!20582)) )
))
(declare-datatypes ((ListLongMap!13399 0))(
  ( (ListLongMap!13400 (toList!6715 List!20582)) )
))
(declare-fun lt!436205 () ListLongMap!13399)

(declare-fun lt!436202 () tuple2!14702)

(declare-fun lt!436204 () tuple2!14702)

(declare-fun +!3013 (ListLongMap!13399 tuple2!14702) ListLongMap!13399)

(assert (=> b!982600 (= (+!3013 (+!3013 lt!436205 lt!436202) lt!436204) (+!3013 (+!3013 lt!436205 lt!436204) lt!436202))))

(declare-fun lt!436201 () V!35451)

(assert (=> b!982600 (= lt!436204 (tuple2!14703 (select (arr!29705 _keys!1544) from!1932) lt!436201))))

(declare-fun zeroValue!1220 () V!35451)

(assert (=> b!982600 (= lt!436202 (tuple2!14703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32665 0))(
  ( (Unit!32666) )
))
(declare-fun lt!436203 () Unit!32665)

(declare-fun addCommutativeForDiffKeys!641 (ListLongMap!13399 (_ BitVec 64) V!35451 (_ BitVec 64) V!35451) Unit!32665)

(assert (=> b!982600 (= lt!436203 (addCommutativeForDiffKeys!641 lt!436205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29705 _keys!1544) from!1932) lt!436201))))

(declare-fun b!982601 () Bool)

(declare-fun e!553878 () Bool)

(assert (=> b!982601 (= e!553877 (and e!553878 mapRes!36305))))

(declare-fun condMapEmpty!36305 () Bool)

(declare-fun mapDefault!36305 () ValueCell!10944)

(assert (=> b!982601 (= condMapEmpty!36305 (= (arr!29704 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10944)) mapDefault!36305)))))

(declare-fun b!982602 () Bool)

(assert (=> b!982602 (= e!553878 tp_is_empty!22851)))

(declare-fun b!982603 () Bool)

(assert (=> b!982603 (= e!553873 e!553875)))

(declare-fun res!657550 () Bool)

(assert (=> b!982603 (=> (not res!657550) (not e!553875))))

(assert (=> b!982603 (= res!657550 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29705 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15408 (ValueCell!10944 V!35451) V!35451)

(declare-fun dynLambda!1797 (Int (_ BitVec 64)) V!35451)

(assert (=> b!982603 (= lt!436201 (get!15408 (select (arr!29704 _values!1278) from!1932) (dynLambda!1797 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35451)

(declare-fun getCurrentListMapNoExtraKeys!3414 (array!61695 array!61693 (_ BitVec 32) (_ BitVec 32) V!35451 V!35451 (_ BitVec 32) Int) ListLongMap!13399)

(assert (=> b!982603 (= lt!436205 (getCurrentListMapNoExtraKeys!3414 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982604 () Bool)

(declare-fun res!657549 () Bool)

(assert (=> b!982604 (=> (not res!657549) (not e!553873))))

(declare-datatypes ((List!20583 0))(
  ( (Nil!20580) (Cons!20579 (h!21741 (_ BitVec 64)) (t!29336 List!20583)) )
))
(declare-fun arrayNoDuplicates!0 (array!61695 (_ BitVec 32) List!20583) Bool)

(assert (=> b!982604 (= res!657549 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20580))))

(assert (= (and start!84048 res!657554) b!982597))

(assert (= (and b!982597 res!657547) b!982595))

(assert (= (and b!982595 res!657551) b!982604))

(assert (= (and b!982604 res!657549) b!982596))

(assert (= (and b!982596 res!657553) b!982599))

(assert (= (and b!982599 res!657548) b!982598))

(assert (= (and b!982598 res!657552) b!982603))

(assert (= (and b!982603 res!657550) b!982600))

(assert (= (and b!982601 condMapEmpty!36305) mapIsEmpty!36305))

(assert (= (and b!982601 (not condMapEmpty!36305)) mapNonEmpty!36305))

(get-info :version)

(assert (= (and mapNonEmpty!36305 ((_ is ValueCellFull!10944) mapValue!36305)) b!982594))

(assert (= (and b!982601 ((_ is ValueCellFull!10944) mapDefault!36305)) b!982602))

(assert (= start!84048 b!982601))

(declare-fun b_lambda!14841 () Bool)

(assert (=> (not b_lambda!14841) (not b!982603)))

(declare-fun t!29334 () Bool)

(declare-fun tb!6603 () Bool)

(assert (=> (and start!84048 (= defaultEntry!1281 defaultEntry!1281) t!29334) tb!6603))

(declare-fun result!13195 () Bool)

(assert (=> tb!6603 (= result!13195 tp_is_empty!22851)))

(assert (=> b!982603 t!29334))

(declare-fun b_and!31691 () Bool)

(assert (= b_and!31689 (and (=> t!29334 result!13195) b_and!31691)))

(declare-fun m!909929 () Bool)

(assert (=> b!982604 m!909929))

(declare-fun m!909931 () Bool)

(assert (=> b!982600 m!909931))

(declare-fun m!909933 () Bool)

(assert (=> b!982600 m!909933))

(declare-fun m!909935 () Bool)

(assert (=> b!982600 m!909935))

(assert (=> b!982600 m!909935))

(declare-fun m!909937 () Bool)

(assert (=> b!982600 m!909937))

(assert (=> b!982600 m!909931))

(declare-fun m!909939 () Bool)

(assert (=> b!982600 m!909939))

(assert (=> b!982600 m!909939))

(declare-fun m!909941 () Bool)

(assert (=> b!982600 m!909941))

(assert (=> b!982599 m!909935))

(assert (=> b!982599 m!909935))

(declare-fun m!909943 () Bool)

(assert (=> b!982599 m!909943))

(declare-fun m!909945 () Bool)

(assert (=> start!84048 m!909945))

(declare-fun m!909947 () Bool)

(assert (=> start!84048 m!909947))

(declare-fun m!909949 () Bool)

(assert (=> start!84048 m!909949))

(declare-fun m!909951 () Bool)

(assert (=> b!982595 m!909951))

(declare-fun m!909953 () Bool)

(assert (=> mapNonEmpty!36305 m!909953))

(assert (=> b!982603 m!909935))

(declare-fun m!909955 () Bool)

(assert (=> b!982603 m!909955))

(declare-fun m!909957 () Bool)

(assert (=> b!982603 m!909957))

(declare-fun m!909959 () Bool)

(assert (=> b!982603 m!909959))

(assert (=> b!982603 m!909955))

(assert (=> b!982603 m!909959))

(declare-fun m!909961 () Bool)

(assert (=> b!982603 m!909961))

(check-sat (not mapNonEmpty!36305) (not start!84048) tp_is_empty!22851 (not b!982603) (not b!982599) (not b_next!19803) (not b!982600) (not b!982604) (not b_lambda!14841) b_and!31691 (not b!982595))
(check-sat b_and!31691 (not b_next!19803))
