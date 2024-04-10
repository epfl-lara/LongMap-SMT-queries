; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83988 () Bool)

(assert start!83988)

(declare-fun b_free!19743 () Bool)

(declare-fun b_next!19743 () Bool)

(assert (=> start!83988 (= b_free!19743 (not b_next!19743))))

(declare-fun tp!68752 () Bool)

(declare-fun b_and!31569 () Bool)

(assert (=> start!83988 (= tp!68752 b_and!31569)))

(declare-fun b!981544 () Bool)

(declare-fun res!656833 () Bool)

(declare-fun e!553333 () Bool)

(assert (=> b!981544 (=> (not res!656833) (not e!553333))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61577 0))(
  ( (array!61578 (arr!29646 (Array (_ BitVec 32) (_ BitVec 64))) (size!30125 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61577)

(assert (=> b!981544 (= res!656833 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30125 _keys!1544))))))

(declare-fun b!981545 () Bool)

(declare-fun res!656829 () Bool)

(assert (=> b!981545 (=> (not res!656829) (not e!553333))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61577 (_ BitVec 32)) Bool)

(assert (=> b!981545 (= res!656829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981546 () Bool)

(declare-fun res!656827 () Bool)

(assert (=> b!981546 (=> (not res!656827) (not e!553333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981546 (= res!656827 (validKeyInArray!0 (select (arr!29646 _keys!1544) from!1932)))))

(declare-fun b!981547 () Bool)

(declare-fun res!656831 () Bool)

(assert (=> b!981547 (=> (not res!656831) (not e!553333))))

(declare-datatypes ((List!20532 0))(
  ( (Nil!20529) (Cons!20528 (h!21690 (_ BitVec 64)) (t!29225 List!20532)) )
))
(declare-fun arrayNoDuplicates!0 (array!61577 (_ BitVec 32) List!20532) Bool)

(assert (=> b!981547 (= res!656831 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20529))))

(declare-fun b!981548 () Bool)

(declare-fun e!553334 () Bool)

(assert (=> b!981548 (= e!553333 e!553334)))

(declare-fun res!656832 () Bool)

(assert (=> b!981548 (=> (not res!656832) (not e!553334))))

(assert (=> b!981548 (= res!656832 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29646 _keys!1544) from!1932))))))

(declare-datatypes ((V!35371 0))(
  ( (V!35372 (val!11446 Int)) )
))
(declare-fun lt!435754 () V!35371)

(declare-datatypes ((ValueCell!10914 0))(
  ( (ValueCellFull!10914 (v!14008 V!35371)) (EmptyCell!10914) )
))
(declare-datatypes ((array!61579 0))(
  ( (array!61580 (arr!29647 (Array (_ BitVec 32) ValueCell!10914)) (size!30126 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61579)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15364 (ValueCell!10914 V!35371) V!35371)

(declare-fun dynLambda!1773 (Int (_ BitVec 64)) V!35371)

(assert (=> b!981548 (= lt!435754 (get!15364 (select (arr!29647 _values!1278) from!1932) (dynLambda!1773 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35371)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35371)

(declare-datatypes ((tuple2!14648 0))(
  ( (tuple2!14649 (_1!7335 (_ BitVec 64)) (_2!7335 V!35371)) )
))
(declare-datatypes ((List!20533 0))(
  ( (Nil!20530) (Cons!20529 (h!21691 tuple2!14648) (t!29226 List!20533)) )
))
(declare-datatypes ((ListLongMap!13345 0))(
  ( (ListLongMap!13346 (toList!6688 List!20533)) )
))
(declare-fun lt!435755 () ListLongMap!13345)

(declare-fun getCurrentListMapNoExtraKeys!3390 (array!61577 array!61579 (_ BitVec 32) (_ BitVec 32) V!35371 V!35371 (_ BitVec 32) Int) ListLongMap!13345)

(assert (=> b!981548 (= lt!435755 (getCurrentListMapNoExtraKeys!3390 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981549 () Bool)

(declare-fun e!553336 () Bool)

(declare-fun tp_is_empty!22791 () Bool)

(assert (=> b!981549 (= e!553336 tp_is_empty!22791)))

(declare-fun b!981550 () Bool)

(declare-fun e!553335 () Bool)

(assert (=> b!981550 (= e!553335 tp_is_empty!22791)))

(declare-fun res!656830 () Bool)

(assert (=> start!83988 (=> (not res!656830) (not e!553333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83988 (= res!656830 (validMask!0 mask!1948))))

(assert (=> start!83988 e!553333))

(assert (=> start!83988 true))

(assert (=> start!83988 tp_is_empty!22791))

(declare-fun e!553338 () Bool)

(declare-fun array_inv!22921 (array!61579) Bool)

(assert (=> start!83988 (and (array_inv!22921 _values!1278) e!553338)))

(assert (=> start!83988 tp!68752))

(declare-fun array_inv!22922 (array!61577) Bool)

(assert (=> start!83988 (array_inv!22922 _keys!1544)))

(declare-fun mapIsEmpty!36215 () Bool)

(declare-fun mapRes!36215 () Bool)

(assert (=> mapIsEmpty!36215 mapRes!36215))

(declare-fun b!981551 () Bool)

(declare-fun res!656834 () Bool)

(assert (=> b!981551 (=> (not res!656834) (not e!553333))))

(assert (=> b!981551 (= res!656834 (and (= (size!30126 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30125 _keys!1544) (size!30126 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36215 () Bool)

(declare-fun tp!68751 () Bool)

(assert (=> mapNonEmpty!36215 (= mapRes!36215 (and tp!68751 e!553336))))

(declare-fun mapKey!36215 () (_ BitVec 32))

(declare-fun mapValue!36215 () ValueCell!10914)

(declare-fun mapRest!36215 () (Array (_ BitVec 32) ValueCell!10914))

(assert (=> mapNonEmpty!36215 (= (arr!29647 _values!1278) (store mapRest!36215 mapKey!36215 mapValue!36215))))

(declare-fun b!981552 () Bool)

(assert (=> b!981552 (= e!553334 (not true))))

(declare-fun lt!435752 () tuple2!14648)

(declare-fun lt!435753 () tuple2!14648)

(declare-fun +!2989 (ListLongMap!13345 tuple2!14648) ListLongMap!13345)

(assert (=> b!981552 (= (+!2989 (+!2989 lt!435755 lt!435752) lt!435753) (+!2989 (+!2989 lt!435755 lt!435753) lt!435752))))

(assert (=> b!981552 (= lt!435753 (tuple2!14649 (select (arr!29646 _keys!1544) from!1932) lt!435754))))

(assert (=> b!981552 (= lt!435752 (tuple2!14649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32617 0))(
  ( (Unit!32618) )
))
(declare-fun lt!435751 () Unit!32617)

(declare-fun addCommutativeForDiffKeys!617 (ListLongMap!13345 (_ BitVec 64) V!35371 (_ BitVec 64) V!35371) Unit!32617)

(assert (=> b!981552 (= lt!435751 (addCommutativeForDiffKeys!617 lt!435755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29646 _keys!1544) from!1932) lt!435754))))

(declare-fun b!981553 () Bool)

(assert (=> b!981553 (= e!553338 (and e!553335 mapRes!36215))))

(declare-fun condMapEmpty!36215 () Bool)

(declare-fun mapDefault!36215 () ValueCell!10914)

(assert (=> b!981553 (= condMapEmpty!36215 (= (arr!29647 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10914)) mapDefault!36215)))))

(declare-fun b!981554 () Bool)

(declare-fun res!656828 () Bool)

(assert (=> b!981554 (=> (not res!656828) (not e!553333))))

(assert (=> b!981554 (= res!656828 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!83988 res!656830) b!981551))

(assert (= (and b!981551 res!656834) b!981545))

(assert (= (and b!981545 res!656829) b!981547))

(assert (= (and b!981547 res!656831) b!981544))

(assert (= (and b!981544 res!656833) b!981546))

(assert (= (and b!981546 res!656827) b!981554))

(assert (= (and b!981554 res!656828) b!981548))

(assert (= (and b!981548 res!656832) b!981552))

(assert (= (and b!981553 condMapEmpty!36215) mapIsEmpty!36215))

(assert (= (and b!981553 (not condMapEmpty!36215)) mapNonEmpty!36215))

(get-info :version)

(assert (= (and mapNonEmpty!36215 ((_ is ValueCellFull!10914) mapValue!36215)) b!981549))

(assert (= (and b!981553 ((_ is ValueCellFull!10914) mapDefault!36215)) b!981550))

(assert (= start!83988 b!981553))

(declare-fun b_lambda!14781 () Bool)

(assert (=> (not b_lambda!14781) (not b!981548)))

(declare-fun t!29224 () Bool)

(declare-fun tb!6543 () Bool)

(assert (=> (and start!83988 (= defaultEntry!1281 defaultEntry!1281) t!29224) tb!6543))

(declare-fun result!13075 () Bool)

(assert (=> tb!6543 (= result!13075 tp_is_empty!22791)))

(assert (=> b!981548 t!29224))

(declare-fun b_and!31571 () Bool)

(assert (= b_and!31569 (and (=> t!29224 result!13075) b_and!31571)))

(declare-fun m!908909 () Bool)

(assert (=> b!981547 m!908909))

(declare-fun m!908911 () Bool)

(assert (=> mapNonEmpty!36215 m!908911))

(declare-fun m!908913 () Bool)

(assert (=> b!981545 m!908913))

(declare-fun m!908915 () Bool)

(assert (=> start!83988 m!908915))

(declare-fun m!908917 () Bool)

(assert (=> start!83988 m!908917))

(declare-fun m!908919 () Bool)

(assert (=> start!83988 m!908919))

(declare-fun m!908921 () Bool)

(assert (=> b!981552 m!908921))

(declare-fun m!908923 () Bool)

(assert (=> b!981552 m!908923))

(declare-fun m!908925 () Bool)

(assert (=> b!981552 m!908925))

(declare-fun m!908927 () Bool)

(assert (=> b!981552 m!908927))

(declare-fun m!908929 () Bool)

(assert (=> b!981552 m!908929))

(assert (=> b!981552 m!908927))

(assert (=> b!981552 m!908921))

(declare-fun m!908931 () Bool)

(assert (=> b!981552 m!908931))

(assert (=> b!981552 m!908923))

(assert (=> b!981548 m!908921))

(declare-fun m!908933 () Bool)

(assert (=> b!981548 m!908933))

(declare-fun m!908935 () Bool)

(assert (=> b!981548 m!908935))

(declare-fun m!908937 () Bool)

(assert (=> b!981548 m!908937))

(assert (=> b!981548 m!908933))

(assert (=> b!981548 m!908937))

(declare-fun m!908939 () Bool)

(assert (=> b!981548 m!908939))

(assert (=> b!981546 m!908921))

(assert (=> b!981546 m!908921))

(declare-fun m!908941 () Bool)

(assert (=> b!981546 m!908941))

(check-sat (not b!981547) (not b!981546) (not b!981545) (not b!981548) b_and!31571 (not start!83988) (not b_next!19743) tp_is_empty!22791 (not mapNonEmpty!36215) (not b!981552) (not b_lambda!14781))
(check-sat b_and!31571 (not b_next!19743))
