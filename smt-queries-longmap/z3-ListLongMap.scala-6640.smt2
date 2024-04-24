; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83980 () Bool)

(assert start!83980)

(declare-fun b_free!19621 () Bool)

(declare-fun b_next!19621 () Bool)

(assert (=> start!83980 (= b_free!19621 (not b_next!19621))))

(declare-fun tp!68305 () Bool)

(declare-fun b_and!31341 () Bool)

(assert (=> start!83980 (= tp!68305 b_and!31341)))

(declare-fun b!979814 () Bool)

(declare-fun e!552422 () Bool)

(declare-fun e!552423 () Bool)

(assert (=> b!979814 (= e!552422 (not e!552423))))

(declare-fun res!655450 () Bool)

(assert (=> b!979814 (=> res!655450 e!552423)))

(declare-datatypes ((array!61278 0))(
  ( (array!61279 (arr!29492 (Array (_ BitVec 32) (_ BitVec 64))) (size!29972 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61278)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979814 (= res!655450 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29492 _keys!1544) from!1932)))))

(declare-datatypes ((V!35137 0))(
  ( (V!35138 (val!11358 Int)) )
))
(declare-datatypes ((tuple2!14574 0))(
  ( (tuple2!14575 (_1!7298 (_ BitVec 64)) (_2!7298 V!35137)) )
))
(declare-datatypes ((List!20434 0))(
  ( (Nil!20431) (Cons!20430 (h!21598 tuple2!14574) (t!29003 List!20434)) )
))
(declare-datatypes ((ListLongMap!13273 0))(
  ( (ListLongMap!13274 (toList!6652 List!20434)) )
))
(declare-fun lt!434362 () ListLongMap!13273)

(declare-fun lt!434368 () tuple2!14574)

(declare-fun lt!434367 () ListLongMap!13273)

(declare-fun lt!434369 () tuple2!14574)

(declare-fun +!2967 (ListLongMap!13273 tuple2!14574) ListLongMap!13273)

(assert (=> b!979814 (= (+!2967 lt!434362 lt!434369) (+!2967 lt!434367 lt!434368))))

(declare-fun lt!434365 () ListLongMap!13273)

(assert (=> b!979814 (= lt!434367 (+!2967 lt!434365 lt!434369))))

(declare-fun lt!434361 () V!35137)

(assert (=> b!979814 (= lt!434369 (tuple2!14575 (select (arr!29492 _keys!1544) from!1932) lt!434361))))

(assert (=> b!979814 (= lt!434362 (+!2967 lt!434365 lt!434368))))

(declare-fun minValue!1220 () V!35137)

(assert (=> b!979814 (= lt!434368 (tuple2!14575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32514 0))(
  ( (Unit!32515) )
))
(declare-fun lt!434364 () Unit!32514)

(declare-fun addCommutativeForDiffKeys!574 (ListLongMap!13273 (_ BitVec 64) V!35137 (_ BitVec 64) V!35137) Unit!32514)

(assert (=> b!979814 (= lt!434364 (addCommutativeForDiffKeys!574 lt!434365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29492 _keys!1544) from!1932) lt!434361))))

(declare-datatypes ((ValueCell!10826 0))(
  ( (ValueCellFull!10826 (v!13917 V!35137)) (EmptyCell!10826) )
))
(declare-datatypes ((array!61280 0))(
  ( (array!61281 (arr!29493 (Array (_ BitVec 32) ValueCell!10826)) (size!29973 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61280)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15299 (ValueCell!10826 V!35137) V!35137)

(declare-fun dynLambda!1762 (Int (_ BitVec 64)) V!35137)

(assert (=> b!979814 (= lt!434361 (get!15299 (select (arr!29493 _values!1278) from!1932) (dynLambda!1762 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434363 () ListLongMap!13273)

(declare-fun lt!434366 () tuple2!14574)

(assert (=> b!979814 (= lt!434365 (+!2967 lt!434363 lt!434366))))

(declare-fun zeroValue!1220 () V!35137)

(assert (=> b!979814 (= lt!434366 (tuple2!14575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3400 (array!61278 array!61280 (_ BitVec 32) (_ BitVec 32) V!35137 V!35137 (_ BitVec 32) Int) ListLongMap!13273)

(assert (=> b!979814 (= lt!434363 (getCurrentListMapNoExtraKeys!3400 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979815 () Bool)

(declare-fun res!655452 () Bool)

(assert (=> b!979815 (=> (not res!655452) (not e!552422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61278 (_ BitVec 32)) Bool)

(assert (=> b!979815 (= res!655452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35951 () Bool)

(declare-fun mapRes!35951 () Bool)

(declare-fun tp!68306 () Bool)

(declare-fun e!552424 () Bool)

(assert (=> mapNonEmpty!35951 (= mapRes!35951 (and tp!68306 e!552424))))

(declare-fun mapValue!35951 () ValueCell!10826)

(declare-fun mapRest!35951 () (Array (_ BitVec 32) ValueCell!10826))

(declare-fun mapKey!35951 () (_ BitVec 32))

(assert (=> mapNonEmpty!35951 (= (arr!29493 _values!1278) (store mapRest!35951 mapKey!35951 mapValue!35951))))

(declare-fun mapIsEmpty!35951 () Bool)

(assert (=> mapIsEmpty!35951 mapRes!35951))

(declare-fun b!979816 () Bool)

(declare-fun res!655451 () Bool)

(assert (=> b!979816 (=> (not res!655451) (not e!552422))))

(assert (=> b!979816 (= res!655451 (and (= (size!29973 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29972 _keys!1544) (size!29973 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979817 () Bool)

(declare-fun e!552426 () Bool)

(declare-fun tp_is_empty!22615 () Bool)

(assert (=> b!979817 (= e!552426 tp_is_empty!22615)))

(declare-fun b!979818 () Bool)

(assert (=> b!979818 (= e!552423 true)))

(assert (=> b!979818 (= lt!434367 (+!2967 (+!2967 lt!434363 lt!434369) lt!434366))))

(declare-fun lt!434370 () Unit!32514)

(assert (=> b!979818 (= lt!434370 (addCommutativeForDiffKeys!574 lt!434363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29492 _keys!1544) from!1932) lt!434361))))

(declare-fun b!979819 () Bool)

(assert (=> b!979819 (= e!552424 tp_is_empty!22615)))

(declare-fun b!979820 () Bool)

(declare-fun res!655448 () Bool)

(assert (=> b!979820 (=> (not res!655448) (not e!552422))))

(declare-datatypes ((List!20435 0))(
  ( (Nil!20432) (Cons!20431 (h!21599 (_ BitVec 64)) (t!29004 List!20435)) )
))
(declare-fun arrayNoDuplicates!0 (array!61278 (_ BitVec 32) List!20435) Bool)

(assert (=> b!979820 (= res!655448 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20432))))

(declare-fun res!655447 () Bool)

(assert (=> start!83980 (=> (not res!655447) (not e!552422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83980 (= res!655447 (validMask!0 mask!1948))))

(assert (=> start!83980 e!552422))

(assert (=> start!83980 true))

(assert (=> start!83980 tp_is_empty!22615))

(declare-fun e!552421 () Bool)

(declare-fun array_inv!22841 (array!61280) Bool)

(assert (=> start!83980 (and (array_inv!22841 _values!1278) e!552421)))

(assert (=> start!83980 tp!68305))

(declare-fun array_inv!22842 (array!61278) Bool)

(assert (=> start!83980 (array_inv!22842 _keys!1544)))

(declare-fun b!979821 () Bool)

(declare-fun res!655449 () Bool)

(assert (=> b!979821 (=> (not res!655449) (not e!552422))))

(assert (=> b!979821 (= res!655449 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979822 () Bool)

(assert (=> b!979822 (= e!552421 (and e!552426 mapRes!35951))))

(declare-fun condMapEmpty!35951 () Bool)

(declare-fun mapDefault!35951 () ValueCell!10826)

(assert (=> b!979822 (= condMapEmpty!35951 (= (arr!29493 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10826)) mapDefault!35951)))))

(declare-fun b!979823 () Bool)

(declare-fun res!655446 () Bool)

(assert (=> b!979823 (=> (not res!655446) (not e!552422))))

(assert (=> b!979823 (= res!655446 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29972 _keys!1544))))))

(declare-fun b!979824 () Bool)

(declare-fun res!655453 () Bool)

(assert (=> b!979824 (=> (not res!655453) (not e!552422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979824 (= res!655453 (validKeyInArray!0 (select (arr!29492 _keys!1544) from!1932)))))

(assert (= (and start!83980 res!655447) b!979816))

(assert (= (and b!979816 res!655451) b!979815))

(assert (= (and b!979815 res!655452) b!979820))

(assert (= (and b!979820 res!655448) b!979823))

(assert (= (and b!979823 res!655446) b!979824))

(assert (= (and b!979824 res!655453) b!979821))

(assert (= (and b!979821 res!655449) b!979814))

(assert (= (and b!979814 (not res!655450)) b!979818))

(assert (= (and b!979822 condMapEmpty!35951) mapIsEmpty!35951))

(assert (= (and b!979822 (not condMapEmpty!35951)) mapNonEmpty!35951))

(get-info :version)

(assert (= (and mapNonEmpty!35951 ((_ is ValueCellFull!10826) mapValue!35951)) b!979819))

(assert (= (and b!979822 ((_ is ValueCellFull!10826) mapDefault!35951)) b!979817))

(assert (= start!83980 b!979822))

(declare-fun b_lambda!14679 () Bool)

(assert (=> (not b_lambda!14679) (not b!979814)))

(declare-fun t!29002 () Bool)

(declare-fun tb!6419 () Bool)

(assert (=> (and start!83980 (= defaultEntry!1281 defaultEntry!1281) t!29002) tb!6419))

(declare-fun result!12835 () Bool)

(assert (=> tb!6419 (= result!12835 tp_is_empty!22615)))

(assert (=> b!979814 t!29002))

(declare-fun b_and!31343 () Bool)

(assert (= b_and!31341 (and (=> t!29002 result!12835) b_and!31343)))

(declare-fun m!907409 () Bool)

(assert (=> b!979815 m!907409))

(declare-fun m!907411 () Bool)

(assert (=> start!83980 m!907411))

(declare-fun m!907413 () Bool)

(assert (=> start!83980 m!907413))

(declare-fun m!907415 () Bool)

(assert (=> start!83980 m!907415))

(declare-fun m!907417 () Bool)

(assert (=> b!979818 m!907417))

(assert (=> b!979818 m!907417))

(declare-fun m!907419 () Bool)

(assert (=> b!979818 m!907419))

(declare-fun m!907421 () Bool)

(assert (=> b!979818 m!907421))

(assert (=> b!979818 m!907421))

(declare-fun m!907423 () Bool)

(assert (=> b!979818 m!907423))

(assert (=> b!979824 m!907421))

(assert (=> b!979824 m!907421))

(declare-fun m!907425 () Bool)

(assert (=> b!979824 m!907425))

(declare-fun m!907427 () Bool)

(assert (=> b!979814 m!907427))

(assert (=> b!979814 m!907421))

(declare-fun m!907429 () Bool)

(assert (=> b!979814 m!907429))

(assert (=> b!979814 m!907421))

(declare-fun m!907431 () Bool)

(assert (=> b!979814 m!907431))

(declare-fun m!907433 () Bool)

(assert (=> b!979814 m!907433))

(declare-fun m!907435 () Bool)

(assert (=> b!979814 m!907435))

(declare-fun m!907437 () Bool)

(assert (=> b!979814 m!907437))

(declare-fun m!907439 () Bool)

(assert (=> b!979814 m!907439))

(declare-fun m!907441 () Bool)

(assert (=> b!979814 m!907441))

(declare-fun m!907443 () Bool)

(assert (=> b!979814 m!907443))

(assert (=> b!979814 m!907429))

(assert (=> b!979814 m!907443))

(declare-fun m!907445 () Bool)

(assert (=> b!979814 m!907445))

(declare-fun m!907447 () Bool)

(assert (=> mapNonEmpty!35951 m!907447))

(declare-fun m!907449 () Bool)

(assert (=> b!979820 m!907449))

(check-sat b_and!31343 (not b!979818) (not start!83980) (not b_next!19621) (not b!979814) (not b_lambda!14679) (not b!979820) (not b!979815) (not mapNonEmpty!35951) (not b!979824) tp_is_empty!22615)
(check-sat b_and!31343 (not b_next!19621))
