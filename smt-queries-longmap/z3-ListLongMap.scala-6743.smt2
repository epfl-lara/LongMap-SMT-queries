; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84504 () Bool)

(assert start!84504)

(declare-fun b_free!20017 () Bool)

(declare-fun b_next!20017 () Bool)

(assert (=> start!84504 (= b_free!20017 (not b_next!20017))))

(declare-fun tp!69837 () Bool)

(declare-fun b_and!32085 () Bool)

(assert (=> start!84504 (= tp!69837 b_and!32085)))

(declare-fun b!988343 () Bool)

(declare-fun e!557299 () Bool)

(declare-fun tp_is_empty!23233 () Bool)

(assert (=> b!988343 (= e!557299 tp_is_empty!23233)))

(declare-fun b!988344 () Bool)

(declare-fun res!661091 () Bool)

(declare-fun e!557298 () Bool)

(assert (=> b!988344 (=> (not res!661091) (not e!557298))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62358 0))(
  ( (array!62359 (arr!30034 (Array (_ BitVec 32) (_ BitVec 64))) (size!30515 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62358)

(assert (=> b!988344 (= res!661091 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30515 _keys!1544))))))

(declare-fun b!988345 () Bool)

(declare-fun e!557301 () Bool)

(assert (=> b!988345 (= e!557301 tp_is_empty!23233)))

(declare-fun b!988346 () Bool)

(declare-fun e!557297 () Bool)

(declare-fun mapRes!36888 () Bool)

(assert (=> b!988346 (= e!557297 (and e!557301 mapRes!36888))))

(declare-fun condMapEmpty!36888 () Bool)

(declare-datatypes ((V!35961 0))(
  ( (V!35962 (val!11667 Int)) )
))
(declare-datatypes ((ValueCell!11135 0))(
  ( (ValueCellFull!11135 (v!14233 V!35961)) (EmptyCell!11135) )
))
(declare-datatypes ((array!62360 0))(
  ( (array!62361 (arr!30035 (Array (_ BitVec 32) ValueCell!11135)) (size!30516 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62360)

(declare-fun mapDefault!36888 () ValueCell!11135)

(assert (=> b!988346 (= condMapEmpty!36888 (= (arr!30035 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11135)) mapDefault!36888)))))

(declare-fun b!988347 () Bool)

(declare-fun res!661088 () Bool)

(assert (=> b!988347 (=> (not res!661088) (not e!557298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988347 (= res!661088 (validKeyInArray!0 (select (arr!30034 _keys!1544) from!1932)))))

(declare-fun b!988348 () Bool)

(declare-fun res!661087 () Bool)

(assert (=> b!988348 (=> (not res!661087) (not e!557298))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62358 (_ BitVec 32)) Bool)

(assert (=> b!988348 (= res!661087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988349 () Bool)

(declare-fun res!661092 () Bool)

(assert (=> b!988349 (=> (not res!661092) (not e!557298))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988349 (= res!661092 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!661089 () Bool)

(assert (=> start!84504 (=> (not res!661089) (not e!557298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84504 (= res!661089 (validMask!0 mask!1948))))

(assert (=> start!84504 e!557298))

(assert (=> start!84504 true))

(assert (=> start!84504 tp_is_empty!23233))

(declare-fun array_inv!23211 (array!62360) Bool)

(assert (=> start!84504 (and (array_inv!23211 _values!1278) e!557297)))

(assert (=> start!84504 tp!69837))

(declare-fun array_inv!23212 (array!62358) Bool)

(assert (=> start!84504 (array_inv!23212 _keys!1544)))

(declare-fun b!988350 () Bool)

(assert (=> b!988350 (= e!557298 (bvsge from!1932 (size!30516 _values!1278)))))

(declare-fun minValue!1220 () V!35961)

(declare-fun zeroValue!1220 () V!35961)

(declare-datatypes ((tuple2!14942 0))(
  ( (tuple2!14943 (_1!7482 (_ BitVec 64)) (_2!7482 V!35961)) )
))
(declare-datatypes ((List!20831 0))(
  ( (Nil!20828) (Cons!20827 (h!21989 tuple2!14942) (t!29759 List!20831)) )
))
(declare-datatypes ((ListLongMap!13629 0))(
  ( (ListLongMap!13630 (toList!6830 List!20831)) )
))
(declare-fun lt!438296 () ListLongMap!13629)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3533 (array!62358 array!62360 (_ BitVec 32) (_ BitVec 32) V!35961 V!35961 (_ BitVec 32) Int) ListLongMap!13629)

(assert (=> b!988350 (= lt!438296 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988351 () Bool)

(declare-fun res!661093 () Bool)

(assert (=> b!988351 (=> (not res!661093) (not e!557298))))

(declare-datatypes ((List!20832 0))(
  ( (Nil!20829) (Cons!20828 (h!21990 (_ BitVec 64)) (t!29760 List!20832)) )
))
(declare-fun arrayNoDuplicates!0 (array!62358 (_ BitVec 32) List!20832) Bool)

(assert (=> b!988351 (= res!661093 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20829))))

(declare-fun mapIsEmpty!36888 () Bool)

(assert (=> mapIsEmpty!36888 mapRes!36888))

(declare-fun mapNonEmpty!36888 () Bool)

(declare-fun tp!69836 () Bool)

(assert (=> mapNonEmpty!36888 (= mapRes!36888 (and tp!69836 e!557299))))

(declare-fun mapValue!36888 () ValueCell!11135)

(declare-fun mapRest!36888 () (Array (_ BitVec 32) ValueCell!11135))

(declare-fun mapKey!36888 () (_ BitVec 32))

(assert (=> mapNonEmpty!36888 (= (arr!30035 _values!1278) (store mapRest!36888 mapKey!36888 mapValue!36888))))

(declare-fun b!988352 () Bool)

(declare-fun res!661090 () Bool)

(assert (=> b!988352 (=> (not res!661090) (not e!557298))))

(assert (=> b!988352 (= res!661090 (and (= (size!30516 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30515 _keys!1544) (size!30516 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84504 res!661089) b!988352))

(assert (= (and b!988352 res!661090) b!988348))

(assert (= (and b!988348 res!661087) b!988351))

(assert (= (and b!988351 res!661093) b!988344))

(assert (= (and b!988344 res!661091) b!988347))

(assert (= (and b!988347 res!661088) b!988349))

(assert (= (and b!988349 res!661092) b!988350))

(assert (= (and b!988346 condMapEmpty!36888) mapIsEmpty!36888))

(assert (= (and b!988346 (not condMapEmpty!36888)) mapNonEmpty!36888))

(get-info :version)

(assert (= (and mapNonEmpty!36888 ((_ is ValueCellFull!11135) mapValue!36888)) b!988343))

(assert (= (and b!988346 ((_ is ValueCellFull!11135) mapDefault!36888)) b!988345))

(assert (= start!84504 b!988346))

(declare-fun m!915029 () Bool)

(assert (=> b!988347 m!915029))

(assert (=> b!988347 m!915029))

(declare-fun m!915031 () Bool)

(assert (=> b!988347 m!915031))

(declare-fun m!915033 () Bool)

(assert (=> b!988351 m!915033))

(declare-fun m!915035 () Bool)

(assert (=> b!988348 m!915035))

(declare-fun m!915037 () Bool)

(assert (=> b!988350 m!915037))

(declare-fun m!915039 () Bool)

(assert (=> start!84504 m!915039))

(declare-fun m!915041 () Bool)

(assert (=> start!84504 m!915041))

(declare-fun m!915043 () Bool)

(assert (=> start!84504 m!915043))

(declare-fun m!915045 () Bool)

(assert (=> mapNonEmpty!36888 m!915045))

(check-sat b_and!32085 (not b!988351) (not b!988347) (not start!84504) (not b!988348) (not b!988350) (not mapNonEmpty!36888) tp_is_empty!23233 (not b_next!20017))
(check-sat b_and!32085 (not b_next!20017))
