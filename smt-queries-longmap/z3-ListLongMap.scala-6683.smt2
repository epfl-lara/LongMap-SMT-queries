; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84052 () Bool)

(assert start!84052)

(declare-fun b_free!19825 () Bool)

(declare-fun b_next!19825 () Bool)

(assert (=> start!84052 (= b_free!19825 (not b_next!19825))))

(declare-fun tp!68998 () Bool)

(declare-fun b_and!31707 () Bool)

(assert (=> start!84052 (= tp!68998 b_and!31707)))

(declare-fun b!982740 () Bool)

(declare-fun res!657708 () Bool)

(declare-fun e!553924 () Bool)

(assert (=> b!982740 (=> (not res!657708) (not e!553924))))

(declare-datatypes ((array!61670 0))(
  ( (array!61671 (arr!29693 (Array (_ BitVec 32) (_ BitVec 64))) (size!30174 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61670)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982740 (= res!657708 (validKeyInArray!0 (select (arr!29693 _keys!1544) from!1932)))))

(declare-fun b!982741 () Bool)

(declare-fun res!657706 () Bool)

(assert (=> b!982741 (=> (not res!657706) (not e!553924))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982741 (= res!657706 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982742 () Bool)

(declare-fun res!657702 () Bool)

(assert (=> b!982742 (=> (not res!657702) (not e!553924))))

(assert (=> b!982742 (= res!657702 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30174 _keys!1544))))))

(declare-fun b!982743 () Bool)

(declare-fun e!553928 () Bool)

(assert (=> b!982743 (= e!553924 e!553928)))

(declare-fun res!657703 () Bool)

(assert (=> b!982743 (=> (not res!657703) (not e!553928))))

(assert (=> b!982743 (= res!657703 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29693 _keys!1544) from!1932))))))

(declare-datatypes ((V!35481 0))(
  ( (V!35482 (val!11487 Int)) )
))
(declare-datatypes ((ValueCell!10955 0))(
  ( (ValueCellFull!10955 (v!14048 V!35481)) (EmptyCell!10955) )
))
(declare-datatypes ((array!61672 0))(
  ( (array!61673 (arr!29694 (Array (_ BitVec 32) ValueCell!10955)) (size!30175 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61672)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436131 () V!35481)

(declare-fun get!15418 (ValueCell!10955 V!35481) V!35481)

(declare-fun dynLambda!1794 (Int (_ BitVec 64)) V!35481)

(assert (=> b!982743 (= lt!436131 (get!15418 (select (arr!29694 _values!1278) from!1932) (dynLambda!1794 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35481)

(declare-fun zeroValue!1220 () V!35481)

(declare-datatypes ((tuple2!14792 0))(
  ( (tuple2!14793 (_1!7407 (_ BitVec 64)) (_2!7407 V!35481)) )
))
(declare-datatypes ((List!20630 0))(
  ( (Nil!20627) (Cons!20626 (h!21788 tuple2!14792) (t!29396 List!20630)) )
))
(declare-datatypes ((ListLongMap!13479 0))(
  ( (ListLongMap!13480 (toList!6755 List!20630)) )
))
(declare-fun lt!436134 () ListLongMap!13479)

(declare-fun getCurrentListMapNoExtraKeys!3464 (array!61670 array!61672 (_ BitVec 32) (_ BitVec 32) V!35481 V!35481 (_ BitVec 32) Int) ListLongMap!13479)

(assert (=> b!982743 (= lt!436134 (getCurrentListMapNoExtraKeys!3464 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982744 () Bool)

(declare-fun res!657707 () Bool)

(assert (=> b!982744 (=> (not res!657707) (not e!553924))))

(assert (=> b!982744 (= res!657707 (and (= (size!30175 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30174 _keys!1544) (size!30175 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982745 () Bool)

(declare-fun res!657701 () Bool)

(assert (=> b!982745 (=> (not res!657701) (not e!553924))))

(declare-datatypes ((List!20631 0))(
  ( (Nil!20628) (Cons!20627 (h!21789 (_ BitVec 64)) (t!29397 List!20631)) )
))
(declare-fun arrayNoDuplicates!0 (array!61670 (_ BitVec 32) List!20631) Bool)

(assert (=> b!982745 (= res!657701 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20628))))

(declare-fun b!982746 () Bool)

(declare-fun e!553925 () Bool)

(declare-fun e!553923 () Bool)

(declare-fun mapRes!36338 () Bool)

(assert (=> b!982746 (= e!553925 (and e!553923 mapRes!36338))))

(declare-fun condMapEmpty!36338 () Bool)

(declare-fun mapDefault!36338 () ValueCell!10955)

(assert (=> b!982746 (= condMapEmpty!36338 (= (arr!29694 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10955)) mapDefault!36338)))))

(declare-fun b!982747 () Bool)

(declare-fun res!657705 () Bool)

(assert (=> b!982747 (=> (not res!657705) (not e!553924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61670 (_ BitVec 32)) Bool)

(assert (=> b!982747 (= res!657705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!657704 () Bool)

(assert (=> start!84052 (=> (not res!657704) (not e!553924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84052 (= res!657704 (validMask!0 mask!1948))))

(assert (=> start!84052 e!553924))

(assert (=> start!84052 true))

(declare-fun tp_is_empty!22873 () Bool)

(assert (=> start!84052 tp_is_empty!22873))

(declare-fun array_inv!22973 (array!61672) Bool)

(assert (=> start!84052 (and (array_inv!22973 _values!1278) e!553925)))

(assert (=> start!84052 tp!68998))

(declare-fun array_inv!22974 (array!61670) Bool)

(assert (=> start!84052 (array_inv!22974 _keys!1544)))

(declare-fun b!982748 () Bool)

(declare-fun e!553927 () Bool)

(assert (=> b!982748 (= e!553927 tp_is_empty!22873)))

(declare-fun b!982749 () Bool)

(assert (=> b!982749 (= e!553928 (not true))))

(declare-fun lt!436133 () tuple2!14792)

(declare-fun lt!436132 () tuple2!14792)

(declare-fun +!3045 (ListLongMap!13479 tuple2!14792) ListLongMap!13479)

(assert (=> b!982749 (= (+!3045 (+!3045 lt!436134 lt!436133) lt!436132) (+!3045 (+!3045 lt!436134 lt!436132) lt!436133))))

(assert (=> b!982749 (= lt!436132 (tuple2!14793 (select (arr!29693 _keys!1544) from!1932) lt!436131))))

(assert (=> b!982749 (= lt!436133 (tuple2!14793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32556 0))(
  ( (Unit!32557) )
))
(declare-fun lt!436130 () Unit!32556)

(declare-fun addCommutativeForDiffKeys!649 (ListLongMap!13479 (_ BitVec 64) V!35481 (_ BitVec 64) V!35481) Unit!32556)

(assert (=> b!982749 (= lt!436130 (addCommutativeForDiffKeys!649 lt!436134 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29693 _keys!1544) from!1932) lt!436131))))

(declare-fun mapIsEmpty!36338 () Bool)

(assert (=> mapIsEmpty!36338 mapRes!36338))

(declare-fun mapNonEmpty!36338 () Bool)

(declare-fun tp!68999 () Bool)

(assert (=> mapNonEmpty!36338 (= mapRes!36338 (and tp!68999 e!553927))))

(declare-fun mapRest!36338 () (Array (_ BitVec 32) ValueCell!10955))

(declare-fun mapKey!36338 () (_ BitVec 32))

(declare-fun mapValue!36338 () ValueCell!10955)

(assert (=> mapNonEmpty!36338 (= (arr!29694 _values!1278) (store mapRest!36338 mapKey!36338 mapValue!36338))))

(declare-fun b!982750 () Bool)

(assert (=> b!982750 (= e!553923 tp_is_empty!22873)))

(assert (= (and start!84052 res!657704) b!982744))

(assert (= (and b!982744 res!657707) b!982747))

(assert (= (and b!982747 res!657705) b!982745))

(assert (= (and b!982745 res!657701) b!982742))

(assert (= (and b!982742 res!657702) b!982740))

(assert (= (and b!982740 res!657708) b!982741))

(assert (= (and b!982741 res!657706) b!982743))

(assert (= (and b!982743 res!657703) b!982749))

(assert (= (and b!982746 condMapEmpty!36338) mapIsEmpty!36338))

(assert (= (and b!982746 (not condMapEmpty!36338)) mapNonEmpty!36338))

(get-info :version)

(assert (= (and mapNonEmpty!36338 ((_ is ValueCellFull!10955) mapValue!36338)) b!982748))

(assert (= (and b!982746 ((_ is ValueCellFull!10955) mapDefault!36338)) b!982750))

(assert (= start!84052 b!982746))

(declare-fun b_lambda!14845 () Bool)

(assert (=> (not b_lambda!14845) (not b!982743)))

(declare-fun t!29395 () Bool)

(declare-fun tb!6617 () Bool)

(assert (=> (and start!84052 (= defaultEntry!1281 defaultEntry!1281) t!29395) tb!6617))

(declare-fun result!13231 () Bool)

(assert (=> tb!6617 (= result!13231 tp_is_empty!22873)))

(assert (=> b!982743 t!29395))

(declare-fun b_and!31709 () Bool)

(assert (= b_and!31707 (and (=> t!29395 result!13231) b_and!31709)))

(declare-fun m!909545 () Bool)

(assert (=> mapNonEmpty!36338 m!909545))

(declare-fun m!909547 () Bool)

(assert (=> b!982740 m!909547))

(assert (=> b!982740 m!909547))

(declare-fun m!909549 () Bool)

(assert (=> b!982740 m!909549))

(assert (=> b!982749 m!909547))

(declare-fun m!909551 () Bool)

(assert (=> b!982749 m!909551))

(assert (=> b!982749 m!909547))

(declare-fun m!909553 () Bool)

(assert (=> b!982749 m!909553))

(declare-fun m!909555 () Bool)

(assert (=> b!982749 m!909555))

(declare-fun m!909557 () Bool)

(assert (=> b!982749 m!909557))

(assert (=> b!982749 m!909553))

(declare-fun m!909559 () Bool)

(assert (=> b!982749 m!909559))

(assert (=> b!982749 m!909555))

(declare-fun m!909561 () Bool)

(assert (=> b!982747 m!909561))

(declare-fun m!909563 () Bool)

(assert (=> b!982745 m!909563))

(declare-fun m!909565 () Bool)

(assert (=> start!84052 m!909565))

(declare-fun m!909567 () Bool)

(assert (=> start!84052 m!909567))

(declare-fun m!909569 () Bool)

(assert (=> start!84052 m!909569))

(assert (=> b!982743 m!909547))

(declare-fun m!909571 () Bool)

(assert (=> b!982743 m!909571))

(declare-fun m!909573 () Bool)

(assert (=> b!982743 m!909573))

(declare-fun m!909575 () Bool)

(assert (=> b!982743 m!909575))

(assert (=> b!982743 m!909571))

(assert (=> b!982743 m!909575))

(declare-fun m!909577 () Bool)

(assert (=> b!982743 m!909577))

(check-sat (not mapNonEmpty!36338) b_and!31709 (not start!84052) (not b!982745) (not b_lambda!14845) (not b!982749) (not b!982743) (not b_next!19825) tp_is_empty!22873 (not b!982747) (not b!982740))
(check-sat b_and!31709 (not b_next!19825))
