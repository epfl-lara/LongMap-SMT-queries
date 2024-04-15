; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83340 () Bool)

(assert start!83340)

(declare-fun b_free!19351 () Bool)

(declare-fun b_next!19351 () Bool)

(assert (=> start!83340 (= b_free!19351 (not b_next!19351))))

(declare-fun tp!67332 () Bool)

(declare-fun b_and!30897 () Bool)

(assert (=> start!83340 (= tp!67332 b_and!30897)))

(declare-fun mapIsEmpty!35383 () Bool)

(declare-fun mapRes!35383 () Bool)

(assert (=> mapIsEmpty!35383 mapRes!35383))

(declare-fun b!973042 () Bool)

(declare-fun e!548449 () Bool)

(declare-fun e!548452 () Bool)

(assert (=> b!973042 (= e!548449 (and e!548452 mapRes!35383))))

(declare-fun condMapEmpty!35383 () Bool)

(declare-datatypes ((V!34649 0))(
  ( (V!34650 (val!11175 Int)) )
))
(declare-datatypes ((ValueCell!10643 0))(
  ( (ValueCellFull!10643 (v!13733 V!34649)) (EmptyCell!10643) )
))
(declare-datatypes ((array!60468 0))(
  ( (array!60469 (arr!29098 (Array (_ BitVec 32) ValueCell!10643)) (size!29579 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60468)

(declare-fun mapDefault!35383 () ValueCell!10643)

(assert (=> b!973042 (= condMapEmpty!35383 (= (arr!29098 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10643)) mapDefault!35383)))))

(declare-fun mapNonEmpty!35383 () Bool)

(declare-fun tp!67333 () Bool)

(declare-fun e!548454 () Bool)

(assert (=> mapNonEmpty!35383 (= mapRes!35383 (and tp!67333 e!548454))))

(declare-fun mapRest!35383 () (Array (_ BitVec 32) ValueCell!10643))

(declare-fun mapValue!35383 () ValueCell!10643)

(declare-fun mapKey!35383 () (_ BitVec 32))

(assert (=> mapNonEmpty!35383 (= (arr!29098 _values!1425) (store mapRest!35383 mapKey!35383 mapValue!35383))))

(declare-fun b!973043 () Bool)

(declare-fun e!548453 () Bool)

(declare-fun e!548450 () Bool)

(assert (=> b!973043 (= e!548453 e!548450)))

(declare-fun res!651378 () Bool)

(assert (=> b!973043 (=> (not res!651378) (not e!548450))))

(declare-fun lt!432173 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973043 (= res!651378 (validKeyInArray!0 lt!432173))))

(declare-datatypes ((array!60470 0))(
  ( (array!60471 (arr!29099 (Array (_ BitVec 32) (_ BitVec 64))) (size!29580 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60470)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973043 (= lt!432173 (select (arr!29099 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14416 0))(
  ( (tuple2!14417 (_1!7219 (_ BitVec 64)) (_2!7219 V!34649)) )
))
(declare-datatypes ((List!20226 0))(
  ( (Nil!20223) (Cons!20222 (h!21384 tuple2!14416) (t!28666 List!20226)) )
))
(declare-datatypes ((ListLongMap!13103 0))(
  ( (ListLongMap!13104 (toList!6567 List!20226)) )
))
(declare-fun lt!432168 () ListLongMap!13103)

(declare-fun zeroValue!1367 () V!34649)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34649)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3729 (array!60470 array!60468 (_ BitVec 32) (_ BitVec 32) V!34649 V!34649 (_ BitVec 32) Int) ListLongMap!13103)

(assert (=> b!973043 (= lt!432168 (getCurrentListMap!3729 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973044 () Bool)

(declare-fun res!651376 () Bool)

(declare-fun e!548448 () Bool)

(assert (=> b!973044 (=> (not res!651376) (not e!548448))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973044 (= res!651376 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29580 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29580 _keys!1717))))))

(declare-fun b!973045 () Bool)

(declare-fun tp_is_empty!22249 () Bool)

(assert (=> b!973045 (= e!548452 tp_is_empty!22249)))

(declare-fun b!973046 () Bool)

(declare-fun res!651380 () Bool)

(assert (=> b!973046 (=> (not res!651380) (not e!548448))))

(assert (=> b!973046 (= res!651380 (and (= (size!29579 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29580 _keys!1717) (size!29579 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973047 () Bool)

(declare-fun res!651377 () Bool)

(assert (=> b!973047 (=> (not res!651377) (not e!548448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60470 (_ BitVec 32)) Bool)

(assert (=> b!973047 (= res!651377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973048 () Bool)

(declare-fun res!651381 () Bool)

(assert (=> b!973048 (=> (not res!651381) (not e!548448))))

(declare-datatypes ((List!20227 0))(
  ( (Nil!20224) (Cons!20223 (h!21385 (_ BitVec 64)) (t!28667 List!20227)) )
))
(declare-fun arrayNoDuplicates!0 (array!60470 (_ BitVec 32) List!20227) Bool)

(assert (=> b!973048 (= res!651381 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20224))))

(declare-fun b!973049 () Bool)

(assert (=> b!973049 (= e!548448 e!548453)))

(declare-fun res!651382 () Bool)

(assert (=> b!973049 (=> (not res!651382) (not e!548453))))

(declare-fun lt!432171 () ListLongMap!13103)

(declare-fun contains!5608 (ListLongMap!13103 (_ BitVec 64)) Bool)

(assert (=> b!973049 (= res!651382 (contains!5608 lt!432171 (select (arr!29099 _keys!1717) i!822)))))

(assert (=> b!973049 (= lt!432171 (getCurrentListMap!3729 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973050 () Bool)

(declare-fun res!651379 () Bool)

(assert (=> b!973050 (=> (not res!651379) (not e!548448))))

(assert (=> b!973050 (= res!651379 (validKeyInArray!0 (select (arr!29099 _keys!1717) i!822)))))

(declare-fun res!651375 () Bool)

(assert (=> start!83340 (=> (not res!651375) (not e!548448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83340 (= res!651375 (validMask!0 mask!2147))))

(assert (=> start!83340 e!548448))

(assert (=> start!83340 true))

(declare-fun array_inv!22565 (array!60468) Bool)

(assert (=> start!83340 (and (array_inv!22565 _values!1425) e!548449)))

(assert (=> start!83340 tp_is_empty!22249))

(assert (=> start!83340 tp!67332))

(declare-fun array_inv!22566 (array!60470) Bool)

(assert (=> start!83340 (array_inv!22566 _keys!1717)))

(declare-fun b!973051 () Bool)

(assert (=> b!973051 (= e!548450 (not true))))

(declare-fun lt!432172 () tuple2!14416)

(declare-fun +!2920 (ListLongMap!13103 tuple2!14416) ListLongMap!13103)

(assert (=> b!973051 (contains!5608 (+!2920 lt!432171 lt!432172) (select (arr!29099 _keys!1717) i!822))))

(declare-fun lt!432169 () V!34649)

(declare-datatypes ((Unit!32292 0))(
  ( (Unit!32293) )
))
(declare-fun lt!432174 () Unit!32292)

(declare-fun addStillContains!590 (ListLongMap!13103 (_ BitVec 64) V!34649 (_ BitVec 64)) Unit!32292)

(assert (=> b!973051 (= lt!432174 (addStillContains!590 lt!432171 lt!432173 lt!432169 (select (arr!29099 _keys!1717) i!822)))))

(assert (=> b!973051 (= lt!432168 (+!2920 (getCurrentListMap!3729 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432172))))

(assert (=> b!973051 (= lt!432172 (tuple2!14417 lt!432173 lt!432169))))

(declare-fun get!15089 (ValueCell!10643 V!34649) V!34649)

(declare-fun dynLambda!1676 (Int (_ BitVec 64)) V!34649)

(assert (=> b!973051 (= lt!432169 (get!15089 (select (arr!29098 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1676 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432170 () Unit!32292)

(declare-fun lemmaListMapRecursiveValidKeyArray!260 (array!60470 array!60468 (_ BitVec 32) (_ BitVec 32) V!34649 V!34649 (_ BitVec 32) Int) Unit!32292)

(assert (=> b!973051 (= lt!432170 (lemmaListMapRecursiveValidKeyArray!260 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973052 () Bool)

(assert (=> b!973052 (= e!548454 tp_is_empty!22249)))

(assert (= (and start!83340 res!651375) b!973046))

(assert (= (and b!973046 res!651380) b!973047))

(assert (= (and b!973047 res!651377) b!973048))

(assert (= (and b!973048 res!651381) b!973044))

(assert (= (and b!973044 res!651376) b!973050))

(assert (= (and b!973050 res!651379) b!973049))

(assert (= (and b!973049 res!651382) b!973043))

(assert (= (and b!973043 res!651378) b!973051))

(assert (= (and b!973042 condMapEmpty!35383) mapIsEmpty!35383))

(assert (= (and b!973042 (not condMapEmpty!35383)) mapNonEmpty!35383))

(get-info :version)

(assert (= (and mapNonEmpty!35383 ((_ is ValueCellFull!10643) mapValue!35383)) b!973052))

(assert (= (and b!973042 ((_ is ValueCellFull!10643) mapDefault!35383)) b!973045))

(assert (= start!83340 b!973042))

(declare-fun b_lambda!14497 () Bool)

(assert (=> (not b_lambda!14497) (not b!973051)))

(declare-fun t!28665 () Bool)

(declare-fun tb!6291 () Bool)

(assert (=> (and start!83340 (= defaultEntry!1428 defaultEntry!1428) t!28665) tb!6291))

(declare-fun result!12567 () Bool)

(assert (=> tb!6291 (= result!12567 tp_is_empty!22249)))

(assert (=> b!973051 t!28665))

(declare-fun b_and!30899 () Bool)

(assert (= b_and!30897 (and (=> t!28665 result!12567) b_and!30899)))

(declare-fun m!900077 () Bool)

(assert (=> b!973043 m!900077))

(declare-fun m!900079 () Bool)

(assert (=> b!973043 m!900079))

(declare-fun m!900081 () Bool)

(assert (=> b!973043 m!900081))

(declare-fun m!900083 () Bool)

(assert (=> b!973047 m!900083))

(declare-fun m!900085 () Bool)

(assert (=> b!973050 m!900085))

(assert (=> b!973050 m!900085))

(declare-fun m!900087 () Bool)

(assert (=> b!973050 m!900087))

(assert (=> b!973049 m!900085))

(assert (=> b!973049 m!900085))

(declare-fun m!900089 () Bool)

(assert (=> b!973049 m!900089))

(declare-fun m!900091 () Bool)

(assert (=> b!973049 m!900091))

(declare-fun m!900093 () Bool)

(assert (=> b!973051 m!900093))

(declare-fun m!900095 () Bool)

(assert (=> b!973051 m!900095))

(assert (=> b!973051 m!900093))

(declare-fun m!900097 () Bool)

(assert (=> b!973051 m!900097))

(declare-fun m!900099 () Bool)

(assert (=> b!973051 m!900099))

(assert (=> b!973051 m!900085))

(declare-fun m!900101 () Bool)

(assert (=> b!973051 m!900101))

(assert (=> b!973051 m!900095))

(declare-fun m!900103 () Bool)

(assert (=> b!973051 m!900103))

(assert (=> b!973051 m!900085))

(declare-fun m!900105 () Bool)

(assert (=> b!973051 m!900105))

(declare-fun m!900107 () Bool)

(assert (=> b!973051 m!900107))

(assert (=> b!973051 m!900101))

(assert (=> b!973051 m!900099))

(assert (=> b!973051 m!900085))

(declare-fun m!900109 () Bool)

(assert (=> b!973051 m!900109))

(declare-fun m!900111 () Bool)

(assert (=> mapNonEmpty!35383 m!900111))

(declare-fun m!900113 () Bool)

(assert (=> b!973048 m!900113))

(declare-fun m!900115 () Bool)

(assert (=> start!83340 m!900115))

(declare-fun m!900117 () Bool)

(assert (=> start!83340 m!900117))

(declare-fun m!900119 () Bool)

(assert (=> start!83340 m!900119))

(check-sat (not b_lambda!14497) b_and!30899 (not b!973049) (not b_next!19351) (not b!973048) (not b!973043) (not b!973051) (not b!973047) tp_is_empty!22249 (not start!83340) (not b!973050) (not mapNonEmpty!35383))
(check-sat b_and!30899 (not b_next!19351))
