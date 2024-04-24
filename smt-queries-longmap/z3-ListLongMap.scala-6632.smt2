; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83932 () Bool)

(assert start!83932)

(declare-fun b_free!19573 () Bool)

(declare-fun b_next!19573 () Bool)

(assert (=> start!83932 (= b_free!19573 (not b_next!19573))))

(declare-fun tp!68162 () Bool)

(declare-fun b_and!31245 () Bool)

(assert (=> start!83932 (= tp!68162 b_and!31245)))

(declare-fun res!654944 () Bool)

(declare-fun e!552063 () Bool)

(assert (=> start!83932 (=> (not res!654944) (not e!552063))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83932 (= res!654944 (validMask!0 mask!1948))))

(assert (=> start!83932 e!552063))

(assert (=> start!83932 true))

(declare-fun tp_is_empty!22567 () Bool)

(assert (=> start!83932 tp_is_empty!22567))

(declare-datatypes ((V!35073 0))(
  ( (V!35074 (val!11334 Int)) )
))
(declare-datatypes ((ValueCell!10802 0))(
  ( (ValueCellFull!10802 (v!13893 V!35073)) (EmptyCell!10802) )
))
(declare-datatypes ((array!61184 0))(
  ( (array!61185 (arr!29445 (Array (_ BitVec 32) ValueCell!10802)) (size!29925 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61184)

(declare-fun e!552059 () Bool)

(declare-fun array_inv!22809 (array!61184) Bool)

(assert (=> start!83932 (and (array_inv!22809 _values!1278) e!552059)))

(assert (=> start!83932 tp!68162))

(declare-datatypes ((array!61186 0))(
  ( (array!61187 (arr!29446 (Array (_ BitVec 32) (_ BitVec 64))) (size!29926 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61186)

(declare-fun array_inv!22810 (array!61186) Bool)

(assert (=> start!83932 (array_inv!22810 _keys!1544)))

(declare-fun b!979044 () Bool)

(declare-fun e!552062 () Bool)

(assert (=> b!979044 (= e!552062 tp_is_empty!22567)))

(declare-fun b!979045 () Bool)

(declare-fun res!654941 () Bool)

(assert (=> b!979045 (=> (not res!654941) (not e!552063))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979045 (= res!654941 (validKeyInArray!0 (select (arr!29446 _keys!1544) from!1932)))))

(declare-fun b!979046 () Bool)

(declare-fun res!654943 () Bool)

(assert (=> b!979046 (=> (not res!654943) (not e!552063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61186 (_ BitVec 32)) Bool)

(assert (=> b!979046 (= res!654943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979047 () Bool)

(declare-fun res!654945 () Bool)

(assert (=> b!979047 (=> (not res!654945) (not e!552063))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979047 (= res!654945 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979048 () Bool)

(assert (=> b!979048 (= e!552063 (not true))))

(declare-datatypes ((tuple2!14532 0))(
  ( (tuple2!14533 (_1!7277 (_ BitVec 64)) (_2!7277 V!35073)) )
))
(declare-datatypes ((List!20396 0))(
  ( (Nil!20393) (Cons!20392 (h!21560 tuple2!14532) (t!28917 List!20396)) )
))
(declare-datatypes ((ListLongMap!13231 0))(
  ( (ListLongMap!13232 (toList!6631 List!20396)) )
))
(declare-fun lt!433991 () ListLongMap!13231)

(declare-fun lt!433995 () tuple2!14532)

(declare-fun lt!433994 () tuple2!14532)

(declare-fun +!2946 (ListLongMap!13231 tuple2!14532) ListLongMap!13231)

(assert (=> b!979048 (= (+!2946 (+!2946 lt!433991 lt!433995) lt!433994) (+!2946 (+!2946 lt!433991 lt!433994) lt!433995))))

(declare-fun lt!433992 () V!35073)

(assert (=> b!979048 (= lt!433994 (tuple2!14533 (select (arr!29446 _keys!1544) from!1932) lt!433992))))

(declare-fun minValue!1220 () V!35073)

(assert (=> b!979048 (= lt!433995 (tuple2!14533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32472 0))(
  ( (Unit!32473) )
))
(declare-fun lt!433993 () Unit!32472)

(declare-fun addCommutativeForDiffKeys!553 (ListLongMap!13231 (_ BitVec 64) V!35073 (_ BitVec 64) V!35073) Unit!32472)

(assert (=> b!979048 (= lt!433993 (addCommutativeForDiffKeys!553 lt!433991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29446 _keys!1544) from!1932) lt!433992))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15262 (ValueCell!10802 V!35073) V!35073)

(declare-fun dynLambda!1741 (Int (_ BitVec 64)) V!35073)

(assert (=> b!979048 (= lt!433992 (get!15262 (select (arr!29445 _values!1278) from!1932) (dynLambda!1741 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35073)

(declare-fun getCurrentListMapNoExtraKeys!3379 (array!61186 array!61184 (_ BitVec 32) (_ BitVec 32) V!35073 V!35073 (_ BitVec 32) Int) ListLongMap!13231)

(assert (=> b!979048 (= lt!433991 (+!2946 (getCurrentListMapNoExtraKeys!3379 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979049 () Bool)

(declare-fun e!552060 () Bool)

(assert (=> b!979049 (= e!552060 tp_is_empty!22567)))

(declare-fun mapNonEmpty!35879 () Bool)

(declare-fun mapRes!35879 () Bool)

(declare-fun tp!68161 () Bool)

(assert (=> mapNonEmpty!35879 (= mapRes!35879 (and tp!68161 e!552060))))

(declare-fun mapValue!35879 () ValueCell!10802)

(declare-fun mapRest!35879 () (Array (_ BitVec 32) ValueCell!10802))

(declare-fun mapKey!35879 () (_ BitVec 32))

(assert (=> mapNonEmpty!35879 (= (arr!29445 _values!1278) (store mapRest!35879 mapKey!35879 mapValue!35879))))

(declare-fun b!979050 () Bool)

(assert (=> b!979050 (= e!552059 (and e!552062 mapRes!35879))))

(declare-fun condMapEmpty!35879 () Bool)

(declare-fun mapDefault!35879 () ValueCell!10802)

(assert (=> b!979050 (= condMapEmpty!35879 (= (arr!29445 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10802)) mapDefault!35879)))))

(declare-fun mapIsEmpty!35879 () Bool)

(assert (=> mapIsEmpty!35879 mapRes!35879))

(declare-fun b!979051 () Bool)

(declare-fun res!654942 () Bool)

(assert (=> b!979051 (=> (not res!654942) (not e!552063))))

(assert (=> b!979051 (= res!654942 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29926 _keys!1544))))))

(declare-fun b!979052 () Bool)

(declare-fun res!654940 () Bool)

(assert (=> b!979052 (=> (not res!654940) (not e!552063))))

(assert (=> b!979052 (= res!654940 (and (= (size!29925 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29926 _keys!1544) (size!29925 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979053 () Bool)

(declare-fun res!654946 () Bool)

(assert (=> b!979053 (=> (not res!654946) (not e!552063))))

(declare-datatypes ((List!20397 0))(
  ( (Nil!20394) (Cons!20393 (h!21561 (_ BitVec 64)) (t!28918 List!20397)) )
))
(declare-fun arrayNoDuplicates!0 (array!61186 (_ BitVec 32) List!20397) Bool)

(assert (=> b!979053 (= res!654946 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20394))))

(assert (= (and start!83932 res!654944) b!979052))

(assert (= (and b!979052 res!654940) b!979046))

(assert (= (and b!979046 res!654943) b!979053))

(assert (= (and b!979053 res!654946) b!979051))

(assert (= (and b!979051 res!654942) b!979045))

(assert (= (and b!979045 res!654941) b!979047))

(assert (= (and b!979047 res!654945) b!979048))

(assert (= (and b!979050 condMapEmpty!35879) mapIsEmpty!35879))

(assert (= (and b!979050 (not condMapEmpty!35879)) mapNonEmpty!35879))

(get-info :version)

(assert (= (and mapNonEmpty!35879 ((_ is ValueCellFull!10802) mapValue!35879)) b!979049))

(assert (= (and b!979050 ((_ is ValueCellFull!10802) mapDefault!35879)) b!979044))

(assert (= start!83932 b!979050))

(declare-fun b_lambda!14631 () Bool)

(assert (=> (not b_lambda!14631) (not b!979048)))

(declare-fun t!28916 () Bool)

(declare-fun tb!6371 () Bool)

(assert (=> (and start!83932 (= defaultEntry!1281 defaultEntry!1281) t!28916) tb!6371))

(declare-fun result!12739 () Bool)

(assert (=> tb!6371 (= result!12739 tp_is_empty!22567)))

(assert (=> b!979048 t!28916))

(declare-fun b_and!31247 () Bool)

(assert (= b_and!31245 (and (=> t!28916 result!12739) b_and!31247)))

(declare-fun m!906545 () Bool)

(assert (=> b!979046 m!906545))

(declare-fun m!906547 () Bool)

(assert (=> b!979048 m!906547))

(declare-fun m!906549 () Bool)

(assert (=> b!979048 m!906549))

(declare-fun m!906551 () Bool)

(assert (=> b!979048 m!906551))

(declare-fun m!906553 () Bool)

(assert (=> b!979048 m!906553))

(assert (=> b!979048 m!906551))

(assert (=> b!979048 m!906547))

(declare-fun m!906555 () Bool)

(assert (=> b!979048 m!906555))

(declare-fun m!906557 () Bool)

(assert (=> b!979048 m!906557))

(declare-fun m!906559 () Bool)

(assert (=> b!979048 m!906559))

(declare-fun m!906561 () Bool)

(assert (=> b!979048 m!906561))

(declare-fun m!906563 () Bool)

(assert (=> b!979048 m!906563))

(assert (=> b!979048 m!906549))

(assert (=> b!979048 m!906563))

(declare-fun m!906565 () Bool)

(assert (=> b!979048 m!906565))

(assert (=> b!979048 m!906559))

(assert (=> b!979048 m!906557))

(declare-fun m!906567 () Bool)

(assert (=> b!979048 m!906567))

(assert (=> b!979045 m!906547))

(assert (=> b!979045 m!906547))

(declare-fun m!906569 () Bool)

(assert (=> b!979045 m!906569))

(declare-fun m!906571 () Bool)

(assert (=> mapNonEmpty!35879 m!906571))

(declare-fun m!906573 () Bool)

(assert (=> start!83932 m!906573))

(declare-fun m!906575 () Bool)

(assert (=> start!83932 m!906575))

(declare-fun m!906577 () Bool)

(assert (=> start!83932 m!906577))

(declare-fun m!906579 () Bool)

(assert (=> b!979053 m!906579))

(check-sat (not b!979048) b_and!31247 tp_is_empty!22567 (not start!83932) (not b_lambda!14631) (not b_next!19573) (not b!979046) (not b!979045) (not mapNonEmpty!35879) (not b!979053))
(check-sat b_and!31247 (not b_next!19573))
